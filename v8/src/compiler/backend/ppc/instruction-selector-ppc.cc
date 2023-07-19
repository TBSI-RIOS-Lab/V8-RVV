// Copyright 2014 the V8 project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "src/base/iterator.h"
#include "src/compiler/backend/instruction-selector-impl.h"
#include "src/compiler/node-matchers.h"
#include "src/compiler/node-properties.h"
#include "src/execution/ppc/frame-constants-ppc.h"

namespace v8 {
namespace internal {
namespace compiler {

enum ImmediateMode {
  kInt16Imm,
  kInt16Imm_Unsigned,
  kInt16Imm_Negate,
  kInt16Imm_4ByteAligned,
  kShift32Imm,
  kInt34Imm,
  kShift64Imm,
  kNoImmediate
};

// Adds PPC-specific methods for generating operands.
template <typename Adapter>
class PPCOperandGeneratorT final : public OperandGeneratorT<Adapter> {
 public:
  OPERAND_GENERATOR_T_BOILERPLATE(Adapter)

  explicit PPCOperandGeneratorT<Adapter>(
      InstructionSelectorT<Adapter>* selector)
      : super(selector) {}

  InstructionOperand UseOperand(Node* node, ImmediateMode mode) {
    if (CanBeImmediate(node, mode)) {
      return UseImmediate(node);
    }
    return UseRegister(node);
  }

  bool CanBeImmediate(Node* node, ImmediateMode mode) {
    int64_t value;
    if (node->opcode() == IrOpcode::kInt32Constant)
      value = OpParameter<int32_t>(node->op());
    else if (node->opcode() == IrOpcode::kInt64Constant)
      value = OpParameter<int64_t>(node->op());
    else
      return false;
    return CanBeImmediate(value, mode);
  }

  bool CanBeImmediate(int64_t value, ImmediateMode mode) {
    switch (mode) {
      case kInt16Imm:
        return is_int16(value);
      case kInt16Imm_Unsigned:
        return is_uint16(value);
      case kInt16Imm_Negate:
        return is_int16(-value);
      case kInt16Imm_4ByteAligned:
        return is_int16(value) && !(value & 3);
      case kShift32Imm:
        return 0 <= value && value < 32;
      case kInt34Imm:
        return is_int34(value);
      case kShift64Imm:
        return 0 <= value && value < 64;
      case kNoImmediate:
        return false;
    }
    return false;
  }
};

namespace {

template <typename Adapter>
void VisitRR(InstructionSelectorT<Adapter>* selector, InstructionCode opcode,
             Node* node) {
  PPCOperandGeneratorT<Adapter> g(selector);
  selector->Emit(opcode, g.DefineAsRegister(node),
                 g.UseRegister(node->InputAt(0)));
}

template <typename Adapter>
void VisitRRR(InstructionSelectorT<Adapter>* selector, InstructionCode opcode,
              Node* node) {
  PPCOperandGeneratorT<Adapter> g(selector);
  selector->Emit(opcode, g.DefineAsRegister(node),
                 g.UseRegister(node->InputAt(0)),
                 g.UseRegister(node->InputAt(1)));
}

template <typename Adapter>
void VisitRRO(InstructionSelectorT<Adapter>* selector, InstructionCode opcode,
              Node* node, ImmediateMode operand_mode) {
  PPCOperandGeneratorT<Adapter> g(selector);
  selector->Emit(opcode, g.DefineAsRegister(node),
                 g.UseRegister(node->InputAt(0)),
                 g.UseOperand(node->InputAt(1), operand_mode));
}

#if V8_TARGET_ARCH_PPC64
template <typename Adapter>
void VisitTryTruncateDouble(InstructionSelectorT<Adapter>* selector,
                            InstructionCode opcode, Node* node) {
  PPCOperandGeneratorT<Adapter> g(selector);
  InstructionOperand inputs[] = {g.UseRegister(node->InputAt(0))};
  InstructionOperand outputs[2];
  size_t output_count = 0;
  outputs[output_count++] = g.DefineAsRegister(node);

  Node* success_output = NodeProperties::FindProjection(node, 1);
  if (success_output) {
    outputs[output_count++] = g.DefineAsRegister(success_output);
  }

  selector->Emit(opcode, output_count, outputs, 1, inputs);
}
#endif

// Shared routine for multiple binary operations.
template <typename Adapter, typename Matcher>
void VisitBinop(InstructionSelectorT<Adapter>* selector, Node* node,
                InstructionCode opcode, ImmediateMode operand_mode,
                FlagsContinuationT<Adapter>* cont) {
  PPCOperandGeneratorT<Adapter> g(selector);
  Matcher m(node);
  InstructionOperand inputs[4];
  size_t input_count = 0;
  InstructionOperand outputs[2];
  size_t output_count = 0;

  inputs[input_count++] = g.UseRegister(m.left().node());
  inputs[input_count++] = g.UseOperand(m.right().node(), operand_mode);

  if (cont->IsDeoptimize()) {
    // If we can deoptimize as a result of the binop, we need to make sure that
    // the deopt inputs are not overwritten by the binop result. One way
    // to achieve that is to declare the output register as same-as-first.
    outputs[output_count++] = g.DefineSameAsFirst(node);
  } else {
    outputs[output_count++] = g.DefineAsRegister(node);
  }

  DCHECK_NE(0u, input_count);
  DCHECK_NE(0u, output_count);
  DCHECK_GE(arraysize(inputs), input_count);
  DCHECK_GE(arraysize(outputs), output_count);

  selector->EmitWithContinuation(opcode, output_count, outputs, input_count,
                                 inputs, cont);
}

// Shared routine for multiple binary operations.
template <typename Adapter, typename Matcher>
void VisitBinop(InstructionSelectorT<Adapter>* selector, Node* node,
                InstructionCode opcode, ImmediateMode operand_mode) {
  FlagsContinuationT<Adapter> cont;
  VisitBinop<Adapter, Matcher>(selector, node, opcode, operand_mode, &cont);
}

}  // namespace

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitStackSlot(Node* node) {
  StackSlotRepresentation rep = StackSlotRepresentationOf(node->op());
  int slot = frame_->AllocateSpillSlot(rep.size(), rep.alignment());
  OperandGenerator g(this);

  Emit(kArchStackSlot, g.DefineAsRegister(node),
       sequence()->AddImmediate(Constant(slot)), 0, nullptr);
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitAbortCSADcheck(Node* node) {
  PPCOperandGeneratorT<Adapter> g(this);
  Emit(kArchAbortCSADcheck, g.NoOutput(), g.UseFixed(node->InputAt(0), r4));
}

template <typename Adapter>
static void VisitLoadCommon(InstructionSelectorT<Adapter>* selector, Node* node,
                            LoadRepresentation load_rep) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    PPCOperandGeneratorT<Adapter> g(selector);
    Node* base = node->InputAt(0);
    Node* offset = node->InputAt(1);
    InstructionCode opcode = kArchNop;
    ImmediateMode mode;
    if (CpuFeatures::IsSupported(PPC_10_PLUS)) {
      mode = kInt34Imm;
    } else {
      mode = kInt16Imm;
    }
    switch (load_rep.representation()) {
      case MachineRepresentation::kFloat32:
        opcode = kPPC_LoadFloat32;
        break;
      case MachineRepresentation::kFloat64:
        opcode = kPPC_LoadDouble;
        break;
      case MachineRepresentation::kBit:  // Fall through.
      case MachineRepresentation::kWord8:
        opcode = load_rep.IsSigned() ? kPPC_LoadWordS8 : kPPC_LoadWordU8;
        break;
      case MachineRepresentation::kWord16:
        opcode = load_rep.IsSigned() ? kPPC_LoadWordS16 : kPPC_LoadWordU16;
        break;
      case MachineRepresentation::kWord32:
        opcode = kPPC_LoadWordU32;
        break;
      case MachineRepresentation::kCompressedPointer:  // Fall through.
      case MachineRepresentation::kCompressed:
      case MachineRepresentation::kSandboxedPointer:  // Fall through.
#ifdef V8_COMPRESS_POINTERS
      opcode = kPPC_LoadWordS32;
      if (mode != kInt34Imm) mode = kInt16Imm_4ByteAligned;
      break;
#else
      UNREACHABLE();
#endif
#ifdef V8_COMPRESS_POINTERS
    case MachineRepresentation::kTaggedSigned:
      opcode = kPPC_LoadDecompressTaggedSigned;
      break;
    case MachineRepresentation::kTaggedPointer:
      opcode = kPPC_LoadDecompressTagged;
      break;
    case MachineRepresentation::kTagged:
      opcode = kPPC_LoadDecompressTagged;
      break;
#else
    case MachineRepresentation::kTaggedSigned:   // Fall through.
    case MachineRepresentation::kTaggedPointer:  // Fall through.
    case MachineRepresentation::kTagged:         // Fall through.
#endif
    case MachineRepresentation::kWord64:
      opcode = kPPC_LoadWord64;
      if (mode != kInt34Imm) mode = kInt16Imm_4ByteAligned;
      break;
    case MachineRepresentation::kSimd128:
      opcode = kPPC_LoadSimd128;
      // Vectors do not support MRI mode, only MRR is available.
      mode = kNoImmediate;
      break;
    case MachineRepresentation::kSimd256:  // Fall through.
    case MachineRepresentation::kMapWord:  // Fall through.
    case MachineRepresentation::kNone:
      UNREACHABLE();
    }

  bool is_atomic = (node->opcode() == IrOpcode::kWord32AtomicLoad ||
                    node->opcode() == IrOpcode::kWord64AtomicLoad);

  if (base != nullptr && base->opcode() == IrOpcode::kLoadRootRegister) {
    selector->Emit(opcode |= AddressingModeField::encode(kMode_Root),
                   g.DefineAsRegister(node), g.UseRegister(offset),
                   g.UseImmediate(is_atomic));
  } else if (g.CanBeImmediate(offset, mode)) {
    selector->Emit(opcode | AddressingModeField::encode(kMode_MRI),
                   g.DefineAsRegister(node), g.UseRegister(base),
                   g.UseImmediate(offset), g.UseImmediate(is_atomic));
  } else if (g.CanBeImmediate(base, mode)) {
    selector->Emit(opcode | AddressingModeField::encode(kMode_MRI),
                   g.DefineAsRegister(node), g.UseRegister(offset),
                   g.UseImmediate(base), g.UseImmediate(is_atomic));
  } else {
    selector->Emit(opcode | AddressingModeField::encode(kMode_MRR),
                   g.DefineAsRegister(node), g.UseRegister(base),
                   g.UseRegister(offset), g.UseImmediate(is_atomic));
  }
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitLoad(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
  UNIMPLEMENTED();
  } else {
  typename Adapter::LoadView load = this->load_view(node);
  LoadRepresentation load_rep = load.loaded_rep();
  VisitLoadCommon(this, node, load_rep);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitProtectedLoad(Node* node) {
  // TODO(eholk)
  UNIMPLEMENTED();
}

template <typename Adapter>
void VisitStoreCommon(InstructionSelectorT<Adapter>* selector, Node* node,
                      StoreRepresentation store_rep,
                      base::Optional<AtomicMemoryOrder> atomic_order) {
  PPCOperandGeneratorT<Adapter> g(selector);
  Node* base = node->InputAt(0);
  Node* offset = node->InputAt(1);
  Node* value = node->InputAt(2);

  // TODO(miladfarca): maybe use atomic_order?
  bool is_atomic = (node->opcode() == IrOpcode::kWord32AtomicStore ||
                    node->opcode() == IrOpcode::kWord64AtomicStore);

  MachineRepresentation rep = store_rep.representation();
  WriteBarrierKind write_barrier_kind = kNoWriteBarrier;

  if (!is_atomic) {
    write_barrier_kind = store_rep.write_barrier_kind();
  }

  if (v8_flags.enable_unconditional_write_barriers &&
      CanBeTaggedOrCompressedPointer(rep)) {
    write_barrier_kind = kFullWriteBarrier;
  }

  if (write_barrier_kind != kNoWriteBarrier &&
      !v8_flags.disable_write_barriers) {
    DCHECK(CanBeTaggedOrCompressedPointer(rep));
    AddressingMode addressing_mode;
    InstructionOperand inputs[3];
    size_t input_count = 0;
    inputs[input_count++] = g.UseUniqueRegister(base);
    // OutOfLineRecordWrite uses the offset in an 'add' instruction as well as
    // for the store itself, so we must check compatibility with both.
    if (g.CanBeImmediate(offset, kInt16Imm)
#if V8_TARGET_ARCH_PPC64
        && g.CanBeImmediate(offset, kInt16Imm_4ByteAligned)
#endif
            ) {
      inputs[input_count++] = g.UseImmediate(offset);
      addressing_mode = kMode_MRI;
    } else {
      inputs[input_count++] = g.UseUniqueRegister(offset);
      addressing_mode = kMode_MRR;
    }
    inputs[input_count++] = g.UseUniqueRegister(value);
    RecordWriteMode record_write_mode =
        WriteBarrierKindToRecordWriteMode(write_barrier_kind);
    InstructionOperand temps[] = {g.TempRegister(), g.TempRegister()};
    size_t const temp_count = arraysize(temps);
    InstructionCode code = kArchStoreWithWriteBarrier;
    code |= AddressingModeField::encode(addressing_mode);
    code |= RecordWriteModeField::encode(record_write_mode);
    CHECK_EQ(is_atomic, false);
    selector->Emit(code, 0, nullptr, input_count, inputs, temp_count, temps);
  } else {
    ArchOpcode opcode;
    ImmediateMode mode;
    if (CpuFeatures::IsSupported(PPC_10_PLUS)) {
      mode = kInt34Imm;
    } else {
      mode = kInt16Imm;
    }
    NodeMatcher m(value);
    switch (rep) {
      case MachineRepresentation::kFloat32:
        opcode = kPPC_StoreFloat32;
        break;
      case MachineRepresentation::kFloat64:
        opcode = kPPC_StoreDouble;
        break;
      case MachineRepresentation::kBit:  // Fall through.
      case MachineRepresentation::kWord8:
        opcode = kPPC_StoreWord8;
        break;
      case MachineRepresentation::kWord16:
        opcode = kPPC_StoreWord16;
        break;
      case MachineRepresentation::kWord32:
        opcode = kPPC_StoreWord32;
        if (m.IsWord32ReverseBytes()) {
          opcode = kPPC_StoreByteRev32;
          value = value->InputAt(0);
          mode = kNoImmediate;
        }
        break;
      case MachineRepresentation::kCompressedPointer:  // Fall through.
      case MachineRepresentation::kCompressed:
      case MachineRepresentation::kSandboxedPointer:  // Fall through.
#ifdef V8_COMPRESS_POINTERS
        opcode = kPPC_StoreCompressTagged;
        break;
#else
        UNREACHABLE();
#endif
      case MachineRepresentation::kTaggedSigned:   // Fall through.
      case MachineRepresentation::kTaggedPointer:  // Fall through.
      case MachineRepresentation::kTagged:
        if (mode != kInt34Imm) mode = kInt16Imm_4ByteAligned;
        opcode = kPPC_StoreCompressTagged;
        break;
      case MachineRepresentation::kWord64:
        opcode = kPPC_StoreWord64;
        if (mode != kInt34Imm) mode = kInt16Imm_4ByteAligned;
        if (m.IsWord64ReverseBytes()) {
          opcode = kPPC_StoreByteRev64;
          value = value->InputAt(0);
          mode = kNoImmediate;
        }
        break;
      case MachineRepresentation::kSimd128:
        opcode = kPPC_StoreSimd128;
        // Vectors do not support MRI mode, only MRR is available.
        mode = kNoImmediate;
        break;
      case MachineRepresentation::kSimd256:  // Fall through.
      case MachineRepresentation::kMapWord:  // Fall through.
      case MachineRepresentation::kNone:
        UNREACHABLE();
    }

    if (base != nullptr && base->opcode() == IrOpcode::kLoadRootRegister) {
      selector->Emit(opcode | AddressingModeField::encode(kMode_Root),
                     g.NoOutput(), g.UseRegister(offset), g.UseRegister(value),
                     g.UseImmediate(is_atomic));
    } else if (g.CanBeImmediate(offset, mode)) {
      selector->Emit(opcode | AddressingModeField::encode(kMode_MRI),
                     g.NoOutput(), g.UseRegister(base), g.UseImmediate(offset),
                     g.UseRegister(value), g.UseImmediate(is_atomic));
    } else if (g.CanBeImmediate(base, mode)) {
      selector->Emit(opcode | AddressingModeField::encode(kMode_MRI),
                     g.NoOutput(), g.UseRegister(offset), g.UseImmediate(base),
                     g.UseRegister(value), g.UseImmediate(is_atomic));
    } else {
      selector->Emit(opcode | AddressingModeField::encode(kMode_MRR),
                     g.NoOutput(), g.UseRegister(base), g.UseRegister(offset),
                     g.UseRegister(value), g.UseImmediate(is_atomic));
    }
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitStorePair(Node* node) {
  UNREACHABLE();
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitStore(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitStoreCommon(this, node, StoreRepresentationOf(node->op()),
                     base::nullopt);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitProtectedStore(node_t node) {
  // TODO(eholk)
  UNIMPLEMENTED();
}

// Architecture supports unaligned access, therefore VisitLoad is used instead
template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitUnalignedLoad(Node* node) {
  UNREACHABLE();
}

// Architecture supports unaligned access, therefore VisitStore is used instead
template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitUnalignedStore(Node* node) {
  UNREACHABLE();
}

template <typename Adapter, typename Matcher>
static void VisitLogical(InstructionSelectorT<Adapter>* selector, Node* node,
                         Matcher* m, ArchOpcode opcode, bool left_can_cover,
                         bool right_can_cover, ImmediateMode imm_mode) {
  PPCOperandGeneratorT<Adapter> g(selector);

  // Map instruction to equivalent operation with inverted right input.
  ArchOpcode inv_opcode = opcode;
  switch (opcode) {
    case kPPC_And:
      inv_opcode = kPPC_AndComplement;
      break;
    case kPPC_Or:
      inv_opcode = kPPC_OrComplement;
      break;
    default:
      UNREACHABLE();
  }

  // Select Logical(y, ~x) for Logical(Xor(x, -1), y).
  if ((m->left().IsWord32Xor() || m->left().IsWord64Xor()) && left_can_cover) {
    Matcher mleft(m->left().node());
    if (mleft.right().Is(-1)) {
      selector->Emit(inv_opcode, g.DefineAsRegister(node),
                     g.UseRegister(m->right().node()),
                     g.UseRegister(mleft.left().node()));
      return;
    }
  }

  // Select Logical(x, ~y) for Logical(x, Xor(y, -1)).
  if ((m->right().IsWord32Xor() || m->right().IsWord64Xor()) &&
      right_can_cover) {
    Matcher mright(m->right().node());
    if (mright.right().Is(-1)) {
      // TODO(all): support shifted operand on right.
      selector->Emit(inv_opcode, g.DefineAsRegister(node),
                     g.UseRegister(m->left().node()),
                     g.UseRegister(mright.left().node()));
      return;
    }
  }

  VisitBinop<Adapter, Matcher>(selector, node, opcode, imm_mode);
}

static inline bool IsContiguousMask32(uint32_t value, int* mb, int* me) {
  int mask_width = base::bits::CountPopulation(value);
  int mask_msb = base::bits::CountLeadingZeros32(value);
  int mask_lsb = base::bits::CountTrailingZeros32(value);
  if ((mask_width == 0) || (mask_msb + mask_width + mask_lsb != 32))
    return false;
  *mb = mask_lsb + mask_width - 1;
  *me = mask_lsb;
  return true;
}

#if V8_TARGET_ARCH_PPC64
static inline bool IsContiguousMask64(uint64_t value, int* mb, int* me) {
  int mask_width = base::bits::CountPopulation(value);
  int mask_msb = base::bits::CountLeadingZeros64(value);
  int mask_lsb = base::bits::CountTrailingZeros64(value);
  if ((mask_width == 0) || (mask_msb + mask_width + mask_lsb != 64))
    return false;
  *mb = mask_lsb + mask_width - 1;
  *me = mask_lsb;
  return true;
}
#endif

// TODO(mbrandy): Absorb rotate-right into rlwinm?
template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord32And(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    PPCOperandGeneratorT<Adapter> g(this);
    Int32BinopMatcher m(node);
    int mb = 0;
    int me = 0;
    if (m.right().HasResolvedValue() &&
        IsContiguousMask32(m.right().ResolvedValue(), &mb, &me)) {
      int sh = 0;
      Node* left = m.left().node();
      if ((m.left().IsWord32Shr() || m.left().IsWord32Shl()) &&
          CanCover(node, left)) {
        // Try to absorb left/right shift into rlwinm
        Int32BinopMatcher mleft(m.left().node());
        if (mleft.right().IsInRange(0, 31)) {
          left = mleft.left().node();
          sh = mleft.right().ResolvedValue();
          if (m.left().IsWord32Shr()) {
            // Adjust the mask such that it doesn't include any rotated bits.
            if (mb > 31 - sh) mb = 31 - sh;
            sh = (32 - sh) & 0x1F;
          } else {
            // Adjust the mask such that it doesn't include any rotated bits.
            if (me < sh) me = sh;
          }
        }
      }
      if (mb >= me) {
        Emit(kPPC_RotLeftAndMask32, g.DefineAsRegister(node),
             g.UseRegister(left), g.TempImmediate(sh), g.TempImmediate(mb),
             g.TempImmediate(me));
        return;
      }
    }
    VisitLogical<Adapter, Int32BinopMatcher>(
        this, node, &m, kPPC_And, CanCover(node, m.left().node()),
        CanCover(node, m.right().node()), kInt16Imm_Unsigned);
  }
}

#if V8_TARGET_ARCH_PPC64
// TODO(mbrandy): Absorb rotate-right into rldic?
template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord64And(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    PPCOperandGeneratorT<Adapter> g(this);
    Int64BinopMatcher m(node);
    int mb = 0;
    int me = 0;
    if (m.right().HasResolvedValue() &&
        IsContiguousMask64(m.right().ResolvedValue(), &mb, &me)) {
      int sh = 0;
      Node* left = m.left().node();
      if ((m.left().IsWord64Shr() || m.left().IsWord64Shl()) &&
          CanCover(node, left)) {
        // Try to absorb left/right shift into rldic
        Int64BinopMatcher mleft(m.left().node());
        if (mleft.right().IsInRange(0, 63)) {
          left = mleft.left().node();
          sh = mleft.right().ResolvedValue();
          if (m.left().IsWord64Shr()) {
            // Adjust the mask such that it doesn't include any rotated bits.
            if (mb > 63 - sh) mb = 63 - sh;
            sh = (64 - sh) & 0x3F;
          } else {
            // Adjust the mask such that it doesn't include any rotated bits.
            if (me < sh) me = sh;
          }
        }
      }
      if (mb >= me) {
        bool match = false;
        ArchOpcode opcode;
        int mask;
        if (me == 0) {
          match = true;
          opcode = kPPC_RotLeftAndClearLeft64;
          mask = mb;
        } else if (mb == 63) {
          match = true;
          opcode = kPPC_RotLeftAndClearRight64;
          mask = me;
        } else if (sh && me <= sh && m.left().IsWord64Shl()) {
          match = true;
          opcode = kPPC_RotLeftAndClear64;
          mask = mb;
        }
        if (match) {
          Emit(opcode, g.DefineAsRegister(node), g.UseRegister(left),
               g.TempImmediate(sh), g.TempImmediate(mask));
          return;
        }
      }
    }
    VisitLogical<Adapter, Int64BinopMatcher>(
        this, node, &m, kPPC_And, CanCover(node, m.left().node()),
        CanCover(node, m.right().node()), kInt16Imm_Unsigned);
  }
}
#endif

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord32Or(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    Int32BinopMatcher m(node);
    VisitLogical<Adapter, Int32BinopMatcher>(
        this, node, &m, kPPC_Or, CanCover(node, m.left().node()),
        CanCover(node, m.right().node()), kInt16Imm_Unsigned);
  }
}

#if V8_TARGET_ARCH_PPC64
template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord64Or(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    Int64BinopMatcher m(node);
    VisitLogical<Adapter, Int64BinopMatcher>(
        this, node, &m, kPPC_Or, CanCover(node, m.left().node()),
        CanCover(node, m.right().node()), kInt16Imm_Unsigned);
  }
}
#endif

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord32Xor(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    PPCOperandGeneratorT<Adapter> g(this);
    Int32BinopMatcher m(node);
    if (m.right().Is(-1)) {
      Emit(kPPC_Not, g.DefineAsRegister(node), g.UseRegister(m.left().node()));
    } else {
      VisitBinop<Adapter, Int32BinopMatcher>(this, node, kPPC_Xor,
                                             kInt16Imm_Unsigned);
    }
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitStackPointerGreaterThan(
    node_t node, FlagsContinuation* cont) {
  StackCheckKind kind;
  node_t value;
  if constexpr (Adapter::IsTurboshaft) {
    const auto& op =
        this->turboshaft_graph()
            ->Get(node)
            .template Cast<turboshaft::StackPointerGreaterThanOp>();
    kind = op.kind;
    value = op.stack_limit();
  } else {
    kind = StackCheckKindOf(node->op());
    value = node->InputAt(0);
  }
  InstructionCode opcode =
      kArchStackPointerGreaterThan | MiscField::encode(static_cast<int>(kind));

  PPCOperandGeneratorT<Adapter> g(this);

  // No outputs.
  InstructionOperand* const outputs = nullptr;
  const int output_count = 0;

  // Applying an offset to this stack check requires a temp register. Offsets
  // are only applied to the first stack check. If applying an offset, we must
  // ensure the input and temp registers do not alias, thus kUniqueRegister.
  InstructionOperand temps[] = {g.TempRegister()};
  const int temp_count = (kind == StackCheckKind::kJSFunctionEntry) ? 1 : 0;
  const auto register_mode = (kind == StackCheckKind::kJSFunctionEntry)
                                 ? OperandGenerator::kUniqueRegister
                                 : OperandGenerator::kRegister;

  InstructionOperand inputs[] = {g.UseRegisterWithMode(value, register_mode)};
  static constexpr int input_count = arraysize(inputs);

  EmitWithContinuation(opcode, output_count, outputs, input_count, inputs,
                       temp_count, temps, cont);
}

#if V8_TARGET_ARCH_PPC64
template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord64Xor(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    PPCOperandGeneratorT<Adapter> g(this);
    Int64BinopMatcher m(node);
    if (m.right().Is(-1)) {
      Emit(kPPC_Not, g.DefineAsRegister(node), g.UseRegister(m.left().node()));
    } else {
      VisitBinop<Adapter, Int64BinopMatcher>(this, node, kPPC_Xor,
                                             kInt16Imm_Unsigned);
    }
  }
}
#endif

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord32Shl(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    PPCOperandGeneratorT<Adapter> g(this);
    Int32BinopMatcher m(node);
    if (m.left().IsWord32And() && m.right().IsInRange(0, 31)) {
      // Try to absorb logical-and into rlwinm
      Int32BinopMatcher mleft(m.left().node());
      int sh = m.right().ResolvedValue();
      int mb;
      int me;
      if (mleft.right().HasResolvedValue() &&
          IsContiguousMask32(mleft.right().ResolvedValue() << sh, &mb, &me)) {
        // Adjust the mask such that it doesn't include any rotated bits.
        if (me < sh) me = sh;
        if (mb >= me) {
          Emit(kPPC_RotLeftAndMask32, g.DefineAsRegister(node),
               g.UseRegister(mleft.left().node()), g.TempImmediate(sh),
               g.TempImmediate(mb), g.TempImmediate(me));
          return;
        }
      }
    }
    VisitRRO(this, kPPC_ShiftLeft32, node, kShift32Imm);
  }
}

#if V8_TARGET_ARCH_PPC64
template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord64Shl(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    PPCOperandGeneratorT<Adapter> g(this);
    Int64BinopMatcher m(node);
    // TODO(mbrandy): eliminate left sign extension if right >= 32
    if (m.left().IsWord64And() && m.right().IsInRange(0, 63)) {
      // Try to absorb logical-and into rldic
      Int64BinopMatcher mleft(m.left().node());
      int sh = m.right().ResolvedValue();
      int mb;
      int me;
      if (mleft.right().HasResolvedValue() &&
          IsContiguousMask64(mleft.right().ResolvedValue() << sh, &mb, &me)) {
        // Adjust the mask such that it doesn't include any rotated bits.
        if (me < sh) me = sh;
        if (mb >= me) {
          bool match = false;
          ArchOpcode opcode;
          int mask;
          if (me == 0) {
            match = true;
            opcode = kPPC_RotLeftAndClearLeft64;
            mask = mb;
          } else if (mb == 63) {
            match = true;
            opcode = kPPC_RotLeftAndClearRight64;
            mask = me;
          } else if (sh && me <= sh) {
            match = true;
            opcode = kPPC_RotLeftAndClear64;
            mask = mb;
          }
          if (match) {
            Emit(opcode, g.DefineAsRegister(node),
                 g.UseRegister(mleft.left().node()), g.TempImmediate(sh),
                 g.TempImmediate(mask));
            return;
          }
        }
      }
    }
    VisitRRO(this, kPPC_ShiftLeft64, node, kShift64Imm);
  }
}
#endif

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord32Shr(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    PPCOperandGeneratorT<Adapter> g(this);
    Int32BinopMatcher m(node);
    if (m.left().IsWord32And() && m.right().IsInRange(0, 31)) {
      // Try to absorb logical-and into rlwinm
      Int32BinopMatcher mleft(m.left().node());
      int sh = m.right().ResolvedValue();
      int mb;
      int me;
      if (mleft.right().HasResolvedValue() &&
          IsContiguousMask32((uint32_t)(mleft.right().ResolvedValue()) >> sh,
                             &mb, &me)) {
        // Adjust the mask such that it doesn't include any rotated bits.
        if (mb > 31 - sh) mb = 31 - sh;
        sh = (32 - sh) & 0x1F;
        if (mb >= me) {
          Emit(kPPC_RotLeftAndMask32, g.DefineAsRegister(node),
               g.UseRegister(mleft.left().node()), g.TempImmediate(sh),
               g.TempImmediate(mb), g.TempImmediate(me));
          return;
        }
      }
    }
    VisitRRO(this, kPPC_ShiftRight32, node, kShift32Imm);
  }
}

#if V8_TARGET_ARCH_PPC64
template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord64Shr(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    PPCOperandGeneratorT<Adapter> g(this);
    Int64BinopMatcher m(node);
    if (m.left().IsWord64And() && m.right().IsInRange(0, 63)) {
      // Try to absorb logical-and into rldic
      Int64BinopMatcher mleft(m.left().node());
      int sh = m.right().ResolvedValue();
      int mb;
      int me;
      if (mleft.right().HasResolvedValue() &&
          IsContiguousMask64((uint64_t)(mleft.right().ResolvedValue()) >> sh,
                             &mb, &me)) {
        // Adjust the mask such that it doesn't include any rotated bits.
        if (mb > 63 - sh) mb = 63 - sh;
        sh = (64 - sh) & 0x3F;
        if (mb >= me) {
          bool match = false;
          ArchOpcode opcode;
          int mask;
          if (me == 0) {
            match = true;
            opcode = kPPC_RotLeftAndClearLeft64;
            mask = mb;
          } else if (mb == 63) {
            match = true;
            opcode = kPPC_RotLeftAndClearRight64;
            mask = me;
          }
          if (match) {
            Emit(opcode, g.DefineAsRegister(node),
                 g.UseRegister(mleft.left().node()), g.TempImmediate(sh),
                 g.TempImmediate(mask));
            return;
          }
        }
      }
    }
    VisitRRO(this, kPPC_ShiftRight64, node, kShift64Imm);
  }
}
#endif

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord32Sar(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    PPCOperandGeneratorT<Adapter> g(this);
    Int32BinopMatcher m(node);
    // Replace with sign extension for (x << K) >> K where K is 16 or 24.
    if (CanCover(node, m.left().node()) && m.left().IsWord32Shl()) {
      Int32BinopMatcher mleft(m.left().node());
      if (mleft.right().Is(16) && m.right().Is(16)) {
        Emit(kPPC_ExtendSignWord16, g.DefineAsRegister(node),
             g.UseRegister(mleft.left().node()));
        return;
      } else if (mleft.right().Is(24) && m.right().Is(24)) {
        Emit(kPPC_ExtendSignWord8, g.DefineAsRegister(node),
             g.UseRegister(mleft.left().node()));
        return;
      }
    }
    VisitRRO(this, kPPC_ShiftRightAlg32, node, kShift32Imm);
  }
}

#if !V8_TARGET_ARCH_PPC64
template <typename Adapter>
void VisitPairBinop(InstructionSelectorT<Adapter>* selector,
                    InstructionCode opcode, InstructionCode opcode2,
                    Node* node) {
  PPCOperandGeneratorT<Adapter> g(selector);

  Node* projection1 = NodeProperties::FindProjection(node, 1);
  if (projection1) {
    // We use UseUniqueRegister here to avoid register sharing with the output
    // registers.
    InstructionOperand inputs[] = {
        g.UseRegister(node->InputAt(0)), g.UseUniqueRegister(node->InputAt(1)),
        g.UseRegister(node->InputAt(2)), g.UseUniqueRegister(node->InputAt(3))};

    InstructionOperand outputs[] = {
        g.DefineAsRegister(node),
        g.DefineAsRegister(NodeProperties::FindProjection(node, 1))};

    selector->Emit(opcode, 2, outputs, 4, inputs);
  } else {
    // The high word of the result is not used, so we emit the standard 32 bit
    // instruction.
    selector->Emit(opcode2, g.DefineSameAsFirst(node),
                   g.UseRegister(node->InputAt(0)),
                   g.UseRegister(node->InputAt(2)));
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitInt32PairAdd(Node* node) {
  VisitPairBinop(this, kPPC_AddPair, kPPC_Add32, node);
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitInt32PairSub(Node* node) {
  VisitPairBinop(this, kPPC_SubPair, kPPC_Sub, node);
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitInt32PairMul(Node* node) {
  PPCOperandGeneratorT<Adapter> g(this);
  Node* projection1 = NodeProperties::FindProjection(node, 1);
  if (projection1) {
    InstructionOperand inputs[] = {g.UseUniqueRegister(node->InputAt(0)),
                                   g.UseUniqueRegister(node->InputAt(1)),
                                   g.UseUniqueRegister(node->InputAt(2)),
                                   g.UseUniqueRegister(node->InputAt(3))};

    InstructionOperand outputs[] = {
        g.DefineAsRegister(node),
        g.DefineAsRegister(NodeProperties::FindProjection(node, 1))};

    InstructionOperand temps[] = {g.TempRegister(), g.TempRegister()};

    Emit(kPPC_MulPair, 2, outputs, 4, inputs, 2, temps);
  } else {
    // The high word of the result is not used, so we emit the standard 32 bit
    // instruction.
    Emit(kPPC_Mul32, g.DefineSameAsFirst(node), g.UseRegister(node->InputAt(0)),
         g.UseRegister(node->InputAt(2)));
  }
}

namespace {
// Shared routine for multiple shift operations.
template <typename Adapter>
void VisitPairShift(InstructionSelectorT<Adapter>* selector,
                    InstructionCode opcode, Node* node) {
  PPCOperandGeneratorT<Adapter> g(selector);
  // We use g.UseUniqueRegister here to guarantee that there is
  // no register aliasing of input registers with output registers.
  Int32Matcher m(node->InputAt(2));
  InstructionOperand shift_operand;
  if (m.HasResolvedValue()) {
    shift_operand = g.UseImmediate(m.node());
  } else {
    shift_operand = g.UseUniqueRegister(m.node());
  }

  InstructionOperand inputs[] = {g.UseUniqueRegister(node->InputAt(0)),
                                 g.UseUniqueRegister(node->InputAt(1)),
                                 shift_operand};

  Node* projection1 = NodeProperties::FindProjection(node, 1);

  InstructionOperand outputs[2];
  InstructionOperand temps[1];
  int32_t output_count = 0;
  int32_t temp_count = 0;

  outputs[output_count++] = g.DefineAsRegister(node);
  if (projection1) {
    outputs[output_count++] = g.DefineAsRegister(projection1);
  } else {
    temps[temp_count++] = g.TempRegister();
  }

  selector->Emit(opcode, output_count, outputs, 3, inputs, temp_count, temps);
}
}  // namespace

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord32PairShl(Node* node) {
  VisitPairShift(this, kPPC_ShiftLeftPair, node);
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord32PairShr(Node* node) {
  VisitPairShift(this, kPPC_ShiftRightPair, node);
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord32PairSar(Node* node) {
  VisitPairShift(this, kPPC_ShiftRightAlgPair, node);
}
#endif

#if V8_TARGET_ARCH_PPC64
template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord64Sar(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    PPCOperandGeneratorT<Adapter> g(this);
    Int64BinopMatcher m(node);
    if (CanCover(m.node(), m.left().node()) && m.left().IsLoad() &&
        m.right().Is(32)) {
      // Just load and sign-extend the interesting 4 bytes instead. This
      // happens, for example, when we're loading and untagging SMIs.
      BaseWithIndexAndDisplacement64Matcher mleft(m.left().node(),
                                                  AddressOption::kAllowAll);
      if (mleft.matches() && mleft.index() == nullptr) {
        int64_t offset = 0;
        Node* displacement = mleft.displacement();
        if (displacement != nullptr) {
          Int64Matcher mdisplacement(displacement);
          DCHECK(mdisplacement.HasResolvedValue());
          offset = mdisplacement.ResolvedValue();
        }
        offset = SmiWordOffset(offset);
        if (g.CanBeImmediate(offset, kInt16Imm_4ByteAligned)) {
          Emit(kPPC_LoadWordS32 | AddressingModeField::encode(kMode_MRI),
               g.DefineAsRegister(node), g.UseRegister(mleft.base()),
               g.TempImmediate(offset), g.UseImmediate(0));
          return;
        }
      }
    }
    VisitRRO(this, kPPC_ShiftRightAlg64, node, kShift64Imm);
  }
}
#endif

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord32Rol(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    UNREACHABLE();
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord64Rol(node_t node) {
  UNREACHABLE();
}

// TODO(mbrandy): Absorb logical-and into rlwinm?
template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord32Ror(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRRO(this, kPPC_RotRight32, node, kShift32Imm);
  }
}

#if V8_TARGET_ARCH_PPC64
// TODO(mbrandy): Absorb logical-and into rldic?
template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord64Ror(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRRO(this, kPPC_RotRight64, node, kShift64Imm);
  }
}
#endif

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord32Clz(Node* node) {
  PPCOperandGeneratorT<Adapter> g(this);
  Emit(kPPC_Cntlz32, g.DefineAsRegister(node), g.UseRegister(node->InputAt(0)));
}

#if V8_TARGET_ARCH_PPC64
template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord64Clz(Node* node) {
  PPCOperandGeneratorT<Adapter> g(this);
  Emit(kPPC_Cntlz64, g.DefineAsRegister(node), g.UseRegister(node->InputAt(0)));
}
#endif

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord32Popcnt(Node* node) {
  PPCOperandGeneratorT<Adapter> g(this);
  Emit(kPPC_Popcnt32, g.DefineAsRegister(node),
       g.UseRegister(node->InputAt(0)));
}

#if V8_TARGET_ARCH_PPC64
template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord64Popcnt(Node* node) {
  PPCOperandGeneratorT<Adapter> g(this);
  Emit(kPPC_Popcnt64, g.DefineAsRegister(node),
       g.UseRegister(node->InputAt(0)));
}
#endif

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord32Ctz(Node* node) {
  UNREACHABLE();
}

#if V8_TARGET_ARCH_PPC64
template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord64Ctz(Node* node) {
  UNREACHABLE();
}
#endif

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord32ReverseBits(Node* node) {
  UNREACHABLE();
}

#if V8_TARGET_ARCH_PPC64
template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord64ReverseBits(Node* node) {
  UNREACHABLE();
}
#endif

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord64ReverseBytes(Node* node) {
  PPCOperandGeneratorT<Adapter> g(this);
  InstructionOperand temp[] = {g.TempRegister()};
  NodeMatcher input(node->InputAt(0));
  if (CanCover(node, input.node()) && input.IsLoad()) {
    LoadRepresentation load_rep = LoadRepresentationOf(input.node()->op());
    if (load_rep.representation() == MachineRepresentation::kWord64) {
      Node* base = input.node()->InputAt(0);
      Node* offset = input.node()->InputAt(1);
      bool is_atomic = (node->opcode() == IrOpcode::kWord32AtomicLoad ||
                        node->opcode() == IrOpcode::kWord64AtomicLoad);
      Emit(kPPC_LoadByteRev64 | AddressingModeField::encode(kMode_MRR),
           g.DefineAsRegister(node), g.UseRegister(base), g.UseRegister(offset),
           g.UseImmediate(is_atomic));
      return;
    }
  }
  Emit(kPPC_ByteRev64, g.DefineAsRegister(node),
       g.UseUniqueRegister(node->InputAt(0)), 1, temp);
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord32ReverseBytes(Node* node) {
  PPCOperandGeneratorT<Adapter> g(this);
  NodeMatcher input(node->InputAt(0));
  if (CanCover(node, input.node()) && input.IsLoad()) {
    LoadRepresentation load_rep = LoadRepresentationOf(input.node()->op());
    if (load_rep.representation() == MachineRepresentation::kWord32) {
      Node* base = input.node()->InputAt(0);
      Node* offset = input.node()->InputAt(1);
      bool is_atomic = (node->opcode() == IrOpcode::kWord32AtomicLoad ||
                        node->opcode() == IrOpcode::kWord64AtomicLoad);
      Emit(kPPC_LoadByteRev32 | AddressingModeField::encode(kMode_MRR),
           g.DefineAsRegister(node), g.UseRegister(base), g.UseRegister(offset),
           g.UseImmediate(is_atomic));
      return;
    }
  }
  Emit(kPPC_ByteRev32, g.DefineAsRegister(node),
       g.UseRegister(node->InputAt(0)));
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitSimd128ReverseBytes(Node* node) {
  PPCOperandGeneratorT<Adapter> g(this);
  Emit(kPPC_LoadReverseSimd128RR, g.DefineAsRegister(node),
       g.UseRegister(node->InputAt(0)));
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitInt32Add(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitBinop<Adapter, Int32BinopMatcher>(this, node, kPPC_Add32, kInt16Imm);
  }
}

#if V8_TARGET_ARCH_PPC64
template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitInt64Add(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitBinop<Adapter, Int64BinopMatcher>(this, node, kPPC_Add64, kInt16Imm);
  }
}
#endif

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitInt32Sub(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    PPCOperandGeneratorT<Adapter> g(this);
    Int32BinopMatcher m(node);
    if (m.left().Is(0)) {
      Emit(kPPC_Neg, g.DefineAsRegister(node), g.UseRegister(m.right().node()));
    } else {
      VisitBinop<Adapter, Int32BinopMatcher>(this, node, kPPC_Sub,
                                             kInt16Imm_Negate);
    }
  }
}

#if V8_TARGET_ARCH_PPC64
template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitInt64Sub(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    PPCOperandGeneratorT<Adapter> g(this);
    Int64BinopMatcher m(node);
    if (m.left().Is(0)) {
      Emit(kPPC_Neg, g.DefineAsRegister(node), g.UseRegister(m.right().node()));
    } else {
      VisitBinop<Adapter, Int64BinopMatcher>(this, node, kPPC_Sub,
                                             kInt16Imm_Negate);
    }
  }
}
#endif

namespace {

template <typename Adapter>
void VisitCompare(InstructionSelectorT<Adapter>* selector,
                  InstructionCode opcode, InstructionOperand left,
                  InstructionOperand right, FlagsContinuationT<Adapter>* cont);
template <typename Adapter>
void EmitInt32MulWithOverflow(InstructionSelectorT<Adapter>* selector,
                              Node* node, FlagsContinuationT<Adapter>* cont) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    PPCOperandGeneratorT<Adapter> g(selector);
    Int32BinopMatcher m(node);
    InstructionOperand result_operand = g.DefineAsRegister(node);
    InstructionOperand high32_operand = g.TempRegister();
    InstructionOperand temp_operand = g.TempRegister();
    {
      InstructionOperand outputs[] = {result_operand, high32_operand};
      InstructionOperand inputs[] = {g.UseRegister(m.left().node()),
                                     g.UseRegister(m.right().node())};
      selector->Emit(kPPC_Mul32WithHigh32, 2, outputs, 2, inputs);
    }
    {
      InstructionOperand shift_31 = g.UseImmediate(31);
      InstructionOperand outputs[] = {temp_operand};
      InstructionOperand inputs[] = {result_operand, shift_31};
      selector->Emit(kPPC_ShiftRightAlg32, 1, outputs, 2, inputs);
    }

    VisitCompare(selector, kPPC_Cmp32, high32_operand, temp_operand, cont);
  }
}

template <typename Adapter>
void EmitInt64MulWithOverflow(InstructionSelectorT<Adapter>* selector,
                              Node* node, FlagsContinuationT<Adapter>* cont) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    PPCOperandGeneratorT<Adapter> g(selector);
    Int64BinopMatcher m(node);
    InstructionOperand result = g.DefineAsRegister(node);
    InstructionOperand left = g.UseRegister(m.left().node());
    InstructionOperand high = g.TempRegister();
    InstructionOperand result_sign = g.TempRegister();
    InstructionOperand right = g.UseRegister(m.right().node());
    selector->Emit(kPPC_Mul64, result, left, right);
    selector->Emit(kPPC_MulHighS64, high, left, right);
    selector->Emit(kPPC_ShiftRightAlg64, result_sign, result,
                   g.TempImmediate(63));
    // Test whether {high} is a sign-extension of {result}.
    selector->EmitWithContinuation(kPPC_Cmp64, high, result_sign, cont);
  }
}

}  // namespace

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitInt32Mul(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRRR(this, kPPC_Mul32, node);
  }
}

#if V8_TARGET_ARCH_PPC64
template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitInt64Mul(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRRR(this, kPPC_Mul64, node);
  }
}
#endif

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitInt32MulHigh(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    PPCOperandGeneratorT<Adapter> g(this);
    Emit(kPPC_MulHigh32, g.DefineAsRegister(node),
         g.UseRegister(node->InputAt(0)), g.UseRegister(node->InputAt(1)));
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitUint32MulHigh(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    PPCOperandGeneratorT<Adapter> g(this);
    Emit(kPPC_MulHighU32, g.DefineAsRegister(node),
         g.UseRegister(node->InputAt(0)), g.UseRegister(node->InputAt(1)));
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitInt64MulHigh(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    PPCOperandGeneratorT<Adapter> g(this);
    Emit(kPPC_MulHighS64, g.DefineAsRegister(node),
         g.UseRegister(node->InputAt(0)), g.UseRegister(node->InputAt(1)));
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitUint64MulHigh(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    PPCOperandGeneratorT<Adapter> g(this);
    Emit(kPPC_MulHighU64, g.DefineAsRegister(node),
         g.UseRegister(node->InputAt(0)), g.UseRegister(node->InputAt(1)));
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitInt32Div(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRRR(this, kPPC_Div32, node);
  }
}

#if V8_TARGET_ARCH_PPC64
template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitInt64Div(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRRR(this, kPPC_Div64, node);
  }
}
#endif

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitUint32Div(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRRR(this, kPPC_DivU32, node);
  }
}

#if V8_TARGET_ARCH_PPC64
template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitUint64Div(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRRR(this, kPPC_DivU64, node);
  }
}
#endif

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitInt32Mod(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRRR(this, kPPC_Mod32, node);
  }
}

#if V8_TARGET_ARCH_PPC64
template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitInt64Mod(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRRR(this, kPPC_Mod64, node);
  }
}
#endif

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitUint32Mod(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRRR(this, kPPC_ModU32, node);
  }
}

#if V8_TARGET_ARCH_PPC64
template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitUint64Mod(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRRR(this, kPPC_ModU64, node);
  }
}
#endif

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitChangeFloat32ToFloat64(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_Float32ToDouble, node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitRoundInt32ToFloat32(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_Int32ToFloat32, node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitRoundUint32ToFloat32(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_Uint32ToFloat32, node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitChangeInt32ToFloat64(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_Int32ToDouble, node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitChangeUint32ToFloat64(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_Uint32ToDouble, node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitChangeFloat64ToInt32(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_DoubleToInt32, node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitChangeFloat64ToUint32(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_DoubleToUint32, node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitTruncateFloat64ToUint32(Node* node) {
  VisitRR(this, kPPC_DoubleToUint32, node);
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitSignExtendWord8ToInt32(Node* node) {
  // TODO(mbrandy): inspect input to see if nop is appropriate.
  VisitRR(this, kPPC_ExtendSignWord8, node);
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitSignExtendWord16ToInt32(Node* node) {
  // TODO(mbrandy): inspect input to see if nop is appropriate.
  VisitRR(this, kPPC_ExtendSignWord16, node);
}

#if V8_TARGET_ARCH_PPC64
template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitTryTruncateFloat32ToInt64(Node* node) {
  VisitTryTruncateDouble(this, kPPC_DoubleToInt64, node);
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitTryTruncateFloat64ToInt64(Node* node) {
  VisitTryTruncateDouble(this, kPPC_DoubleToInt64, node);
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitTruncateFloat64ToInt64(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_DoubleToInt64, node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitTryTruncateFloat32ToUint64(
    Node* node) {
  VisitTryTruncateDouble(this, kPPC_DoubleToUint64, node);
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitTryTruncateFloat64ToUint64(
    Node* node) {
  VisitTryTruncateDouble(this, kPPC_DoubleToUint64, node);
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitTryTruncateFloat64ToInt32(Node* node) {
  UNIMPLEMENTED();
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitTryTruncateFloat64ToUint32(
    Node* node) {
  UNIMPLEMENTED();
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitBitcastWord32ToWord64(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    DCHECK(SmiValuesAre31Bits());
    DCHECK(COMPRESS_POINTERS_BOOL);
    EmitIdentity(node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitChangeInt32ToInt64(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    // TODO(mbrandy): inspect input to see if nop is appropriate.
    VisitRR(this, kPPC_ExtendSignWord32, node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitSignExtendWord8ToInt64(Node* node) {
  // TODO(mbrandy): inspect input to see if nop is appropriate.
  VisitRR(this, kPPC_ExtendSignWord8, node);
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitSignExtendWord16ToInt64(Node* node) {
  // TODO(mbrandy): inspect input to see if nop is appropriate.
  VisitRR(this, kPPC_ExtendSignWord16, node);
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitSignExtendWord32ToInt64(Node* node) {
  // TODO(mbrandy): inspect input to see if nop is appropriate.
  VisitRR(this, kPPC_ExtendSignWord32, node);
}

template <typename Adapter>
bool InstructionSelectorT<Adapter>::ZeroExtendsWord32ToWord64NoPhis(
    node_t node) {
  UNIMPLEMENTED();
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitChangeUint32ToUint64(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    // TODO(mbrandy): inspect input to see if nop is appropriate.
    VisitRR(this, kPPC_Uint32ToUint64, node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitChangeFloat64ToUint64(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_DoubleToUint64, node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitChangeFloat64ToInt64(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_DoubleToInt64, node);
  }
}
#endif

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitTruncateFloat64ToFloat32(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_DoubleToFloat32, node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitTruncateFloat64ToWord32(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kArchTruncateDoubleToI, node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitRoundFloat64ToInt32(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_DoubleToInt32, node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitTruncateFloat32ToInt32(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    PPCOperandGeneratorT<Adapter> g(this);

    InstructionCode opcode = kPPC_Float32ToInt32;
    TruncateKind kind = OpParameter<TruncateKind>(node->op());
    if (kind == TruncateKind::kSetOverflowToMin) {
      opcode |= MiscField::encode(true);
    }

    Emit(opcode, g.DefineAsRegister(node), g.UseRegister(node->InputAt(0)));
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitTruncateFloat32ToUint32(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    PPCOperandGeneratorT<Adapter> g(this);

    InstructionCode opcode = kPPC_Float32ToUint32;
    TruncateKind kind = OpParameter<TruncateKind>(node->op());
    if (kind == TruncateKind::kSetOverflowToMin) {
      opcode |= MiscField::encode(true);
    }

    Emit(opcode, g.DefineAsRegister(node), g.UseRegister(node->InputAt(0)));
  }
}

#if V8_TARGET_ARCH_PPC64
template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitTruncateInt64ToInt32(Node* node) {
  // TODO(mbrandy): inspect input to see if nop is appropriate.
  VisitRR(this, kPPC_Int64ToInt32, node);
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitRoundInt64ToFloat32(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_Int64ToFloat32, node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitRoundInt64ToFloat64(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_Int64ToDouble, node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitChangeInt64ToFloat64(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_Int64ToDouble, node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitRoundUint64ToFloat32(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_Uint64ToFloat32, node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitRoundUint64ToFloat64(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_Uint64ToDouble, node);
  }
}
#endif

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitBitcastFloat32ToInt32(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_BitcastFloat32ToInt32, node);
  }
}

#if V8_TARGET_ARCH_PPC64
template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitBitcastFloat64ToInt64(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_BitcastDoubleToInt64, node);
  }
}
#endif

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitBitcastInt32ToFloat32(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_BitcastInt32ToFloat32, node);
  }
}

#if V8_TARGET_ARCH_PPC64
template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitBitcastInt64ToFloat64(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_BitcastInt64ToDouble, node);
  }
}
#endif

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat32Add(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRRR(this, kPPC_AddDouble | MiscField::encode(1), node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat64Add(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    // TODO(mbrandy): detect multiply-add
    VisitRRR(this, kPPC_AddDouble, node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat32Sub(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRRR(this, kPPC_SubDouble | MiscField::encode(1), node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat64Sub(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    // TODO(mbrandy): detect multiply-subtract
    VisitRRR(this, kPPC_SubDouble, node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat32Mul(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRRR(this, kPPC_MulDouble | MiscField::encode(1), node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat64Mul(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    // TODO(mbrandy): detect negate
    VisitRRR(this, kPPC_MulDouble, node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat32Div(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRRR(this, kPPC_DivDouble | MiscField::encode(1), node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat64Div(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRRR(this, kPPC_DivDouble, node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat64Mod(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    PPCOperandGeneratorT<Adapter> g(this);
    Emit(kPPC_ModDouble, g.DefineAsFixed(node, d1),
         g.UseFixed(node->InputAt(0), d1), g.UseFixed(node->InputAt(1), d2))
        ->MarkAsCall();
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat32Max(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRRR(this, kPPC_MaxDouble | MiscField::encode(1), node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat64Max(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRRR(this, kPPC_MaxDouble, node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat64SilenceNaN(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_Float64SilenceNaN, node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat32Min(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRRR(this, kPPC_MinDouble | MiscField::encode(1), node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat64Min(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRRR(this, kPPC_MinDouble, node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat32Abs(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_AbsDouble | MiscField::encode(1), node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat64Abs(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_AbsDouble, node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat32Sqrt(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_SqrtDouble | MiscField::encode(1), node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat64Ieee754Unop(
    node_t node, InstructionCode opcode) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    PPCOperandGeneratorT<Adapter> g(this);
    Emit(opcode, g.DefineAsFixed(node, d1), g.UseFixed(node->InputAt(0), d1))
        ->MarkAsCall();
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat64Ieee754Binop(
    node_t node, InstructionCode opcode) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    PPCOperandGeneratorT<Adapter> g(this);
    Emit(opcode, g.DefineAsFixed(node, d1), g.UseFixed(node->InputAt(0), d1),
         g.UseFixed(node->InputAt(1), d2))
        ->MarkAsCall();
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat64Sqrt(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_SqrtDouble, node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat32RoundDown(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_FloorDouble | MiscField::encode(1), node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat64RoundDown(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_FloorDouble, node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat32RoundUp(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_CeilDouble | MiscField::encode(1), node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat64RoundUp(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_CeilDouble, node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat32RoundTruncate(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_TruncateDouble | MiscField::encode(1), node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat64RoundTruncate(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_TruncateDouble, node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat64RoundTiesAway(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_RoundDouble, node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat32Neg(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_NegDouble, node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat64Neg(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    VisitRR(this, kPPC_NegDouble, node);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitInt32AddWithOverflow(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    if (Node* ovf = NodeProperties::FindProjection(node, 1)) {
      FlagsContinuation cont = FlagsContinuation::ForSet(kOverflow, ovf);
      return VisitBinop<Adapter, Int32BinopMatcher>(
          this, node, kPPC_AddWithOverflow32, kInt16Imm, &cont);
    }
    FlagsContinuation cont;
    VisitBinop<Adapter, Int32BinopMatcher>(this, node, kPPC_AddWithOverflow32,
                                           kInt16Imm, &cont);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitInt32SubWithOverflow(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    if (Node* ovf = NodeProperties::FindProjection(node, 1)) {
      FlagsContinuation cont = FlagsContinuation::ForSet(kOverflow, ovf);
      return VisitBinop<Adapter, Int32BinopMatcher>(
          this, node, kPPC_SubWithOverflow32, kInt16Imm_Negate, &cont);
    }
    FlagsContinuation cont;
    VisitBinop<Adapter, Int32BinopMatcher>(this, node, kPPC_SubWithOverflow32,
                                           kInt16Imm_Negate, &cont);
  }
}

#if V8_TARGET_ARCH_PPC64
template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitInt64AddWithOverflow(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    if (Node* ovf = NodeProperties::FindProjection(node, 1)) {
      FlagsContinuation cont = FlagsContinuation::ForSet(kOverflow, ovf);
      return VisitBinop<Adapter, Int64BinopMatcher>(this, node, kPPC_Add64,
                                                    kInt16Imm, &cont);
    }
    FlagsContinuation cont;
    VisitBinop<Adapter, Int64BinopMatcher>(this, node, kPPC_Add64, kInt16Imm,
                                           &cont);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitInt64SubWithOverflow(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    if (Node* ovf = NodeProperties::FindProjection(node, 1)) {
      FlagsContinuation cont = FlagsContinuation::ForSet(kOverflow, ovf);
      return VisitBinop<Adapter, Int64BinopMatcher>(this, node, kPPC_Sub,
                                                    kInt16Imm_Negate, &cont);
    }
    FlagsContinuation cont;
    VisitBinop<Adapter, Int64BinopMatcher>(this, node, kPPC_Sub,
                                           kInt16Imm_Negate, &cont);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitInt64MulWithOverflow(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    if (Node* ovf = NodeProperties::FindProjection(node, 1)) {
      FlagsContinuation cont = FlagsContinuation::ForSet(kNotEqual, ovf);
      return EmitInt64MulWithOverflow(this, node, &cont);
    }
    FlagsContinuation cont;
    EmitInt64MulWithOverflow(this, node, &cont);
  }
}
#endif

template <typename Adapter>
static bool CompareLogical(FlagsContinuationT<Adapter>* cont) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    switch (cont->condition()) {
      case kUnsignedLessThan:
      case kUnsignedGreaterThanOrEqual:
      case kUnsignedLessThanOrEqual:
      case kUnsignedGreaterThan:
        return true;
      default:
        return false;
    }
    UNREACHABLE();
  }
}

namespace {

// Shared routine for multiple compare operations.
template <typename Adapter>
void VisitCompare(InstructionSelectorT<Adapter>* selector,
                  InstructionCode opcode, InstructionOperand left,
                  InstructionOperand right, FlagsContinuationT<Adapter>* cont) {
  selector->EmitWithContinuation(opcode, left, right, cont);
}

// Shared routine for multiple word compare operations.
template <typename Adapter>
void VisitWordCompare(InstructionSelectorT<Adapter>* selector,
                      typename Adapter::node_t node, InstructionCode opcode,
                      FlagsContinuationT<Adapter>* cont, bool commutative,
                      ImmediateMode immediate_mode) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    PPCOperandGeneratorT<Adapter> g(selector);
    Node* left = node->InputAt(0);
    Node* right = node->InputAt(1);

    // Match immediates on left or right side of comparison.
    if (g.CanBeImmediate(right, immediate_mode)) {
      VisitCompare(selector, opcode, g.UseRegister(left), g.UseImmediate(right),
                   cont);
    } else if (g.CanBeImmediate(left, immediate_mode)) {
      if (!commutative) cont->Commute();
      VisitCompare(selector, opcode, g.UseRegister(right), g.UseImmediate(left),
                   cont);
    } else {
      VisitCompare(selector, opcode, g.UseRegister(left), g.UseRegister(right),
                   cont);
    }
  }
}

template <typename Adapter>
void VisitWord32Compare(InstructionSelectorT<Adapter>* selector,
                        typename Adapter::node_t node,
                        FlagsContinuationT<Adapter>* cont) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    ImmediateMode mode =
        (CompareLogical(cont) ? kInt16Imm_Unsigned : kInt16Imm);
    VisitWordCompare(selector, node, kPPC_Cmp32, cont, false, mode);
  }
}

#if V8_TARGET_ARCH_PPC64
template <typename Adapter>
void VisitWord64Compare(InstructionSelectorT<Adapter>* selector, Node* node,
                        FlagsContinuationT<Adapter>* cont) {
  ImmediateMode mode = (CompareLogical(cont) ? kInt16Imm_Unsigned : kInt16Imm);
  VisitWordCompare(selector, node, kPPC_Cmp64, cont, false, mode);
}
#endif

// Shared routine for multiple float32 compare operations.
template <typename Adapter>
void VisitFloat32Compare(InstructionSelectorT<Adapter>* selector,
                         typename Adapter::node_t node,
                         FlagsContinuationT<Adapter>* cont) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    PPCOperandGeneratorT<Adapter> g(selector);
    Node* left = node->InputAt(0);
    Node* right = node->InputAt(1);
    VisitCompare(selector, kPPC_CmpDouble, g.UseRegister(left),
                 g.UseRegister(right), cont);
  }
}

// Shared routine for multiple float64 compare operations.
template <typename Adapter>
void VisitFloat64Compare(InstructionSelectorT<Adapter>* selector,
                         typename Adapter::node_t node,
                         FlagsContinuationT<Adapter>* cont) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    PPCOperandGeneratorT<Adapter> g(selector);
    Node* left = node->InputAt(0);
    Node* right = node->InputAt(1);
    VisitCompare(selector, kPPC_CmpDouble, g.UseRegister(left),
                 g.UseRegister(right), cont);
  }
}

}  // namespace

// Shared routine for word comparisons against zero.
template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWordCompareZero(
    node_t user, node_t value, FlagsContinuation* cont) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    // Try to combine with comparisons against 0 by simply inverting the branch.
    while (value->opcode() == IrOpcode::kWord32Equal && CanCover(user, value)) {
      Int32BinopMatcher m(value);
      if (!m.right().Is(0)) break;

      user = value;
      value = m.left().node();
      cont->Negate();
    }

    if (CanCover(user, value)) {
      switch (value->opcode()) {
        case IrOpcode::kWord32Equal:
          cont->OverwriteAndNegateIfEqual(kEqual);
          return VisitWord32Compare(this, value, cont);
        case IrOpcode::kInt32LessThan:
          cont->OverwriteAndNegateIfEqual(kSignedLessThan);
          return VisitWord32Compare(this, value, cont);
        case IrOpcode::kInt32LessThanOrEqual:
          cont->OverwriteAndNegateIfEqual(kSignedLessThanOrEqual);
          return VisitWord32Compare(this, value, cont);
        case IrOpcode::kUint32LessThan:
          cont->OverwriteAndNegateIfEqual(kUnsignedLessThan);
          return VisitWord32Compare(this, value, cont);
        case IrOpcode::kUint32LessThanOrEqual:
          cont->OverwriteAndNegateIfEqual(kUnsignedLessThanOrEqual);
          return VisitWord32Compare(this, value, cont);
#if V8_TARGET_ARCH_PPC64
      case IrOpcode::kWord64Equal:
        cont->OverwriteAndNegateIfEqual(kEqual);
        return VisitWord64Compare(this, value, cont);
      case IrOpcode::kInt64LessThan:
        cont->OverwriteAndNegateIfEqual(kSignedLessThan);
        return VisitWord64Compare(this, value, cont);
      case IrOpcode::kInt64LessThanOrEqual:
        cont->OverwriteAndNegateIfEqual(kSignedLessThanOrEqual);
        return VisitWord64Compare(this, value, cont);
      case IrOpcode::kUint64LessThan:
        cont->OverwriteAndNegateIfEqual(kUnsignedLessThan);
        return VisitWord64Compare(this, value, cont);
      case IrOpcode::kUint64LessThanOrEqual:
        cont->OverwriteAndNegateIfEqual(kUnsignedLessThanOrEqual);
        return VisitWord64Compare(this, value, cont);
#endif
      case IrOpcode::kFloat32Equal:
        cont->OverwriteAndNegateIfEqual(kEqual);
        return VisitFloat32Compare(this, value, cont);
      case IrOpcode::kFloat32LessThan:
        cont->OverwriteAndNegateIfEqual(kUnsignedLessThan);
        return VisitFloat32Compare(this, value, cont);
      case IrOpcode::kFloat32LessThanOrEqual:
        cont->OverwriteAndNegateIfEqual(kUnsignedLessThanOrEqual);
        return VisitFloat32Compare(this, value, cont);
      case IrOpcode::kFloat64Equal:
        cont->OverwriteAndNegateIfEqual(kEqual);
        return VisitFloat64Compare(this, value, cont);
      case IrOpcode::kFloat64LessThan:
        cont->OverwriteAndNegateIfEqual(kUnsignedLessThan);
        return VisitFloat64Compare(this, value, cont);
      case IrOpcode::kFloat64LessThanOrEqual:
        cont->OverwriteAndNegateIfEqual(kUnsignedLessThanOrEqual);
        return VisitFloat64Compare(this, value, cont);
      case IrOpcode::kProjection:
        // Check if this is the overflow output projection of an
        // <Operation>WithOverflow node.
        if (ProjectionIndexOf(value->op()) == 1u) {
          // We cannot combine the <Operation>WithOverflow with this branch
          // unless the 0th projection (the use of the actual value of the
          // <Operation> is either nullptr, which means there's no use of the
          // actual value, or was already defined, which means it is scheduled
          // *AFTER* this branch).
          Node* const node = value->InputAt(0);
          Node* const result = NodeProperties::FindProjection(node, 0);
          if (result == nullptr || IsDefined(result)) {
            switch (node->opcode()) {
              case IrOpcode::kInt32AddWithOverflow:
                cont->OverwriteAndNegateIfEqual(kOverflow);
                return VisitBinop<Adapter, Int32BinopMatcher>(
                    this, node, kPPC_AddWithOverflow32, kInt16Imm, cont);
              case IrOpcode::kInt32SubWithOverflow:
                cont->OverwriteAndNegateIfEqual(kOverflow);
                return VisitBinop<Adapter, Int32BinopMatcher>(
                    this, node, kPPC_SubWithOverflow32, kInt16Imm_Negate, cont);
              case IrOpcode::kInt32MulWithOverflow:
                cont->OverwriteAndNegateIfEqual(kNotEqual);
                return EmitInt32MulWithOverflow(this, node, cont);
#if V8_TARGET_ARCH_PPC64
              case IrOpcode::kInt64AddWithOverflow:
                cont->OverwriteAndNegateIfEqual(kOverflow);
                return VisitBinop<Adapter, Int64BinopMatcher>(
                    this, node, kPPC_Add64, kInt16Imm, cont);
              case IrOpcode::kInt64SubWithOverflow:
                cont->OverwriteAndNegateIfEqual(kOverflow);
                return VisitBinop<Adapter, Int64BinopMatcher>(
                    this, node, kPPC_Sub, kInt16Imm_Negate, cont);
              case IrOpcode::kInt64MulWithOverflow:
                cont->OverwriteAndNegateIfEqual(kNotEqual);
                return EmitInt64MulWithOverflow(this, node, cont);
#endif
              default:
                break;
            }
          }
        }
        break;
      case IrOpcode::kInt32Sub:
        return VisitWord32Compare(this, value, cont);
      case IrOpcode::kWord32And:
        // TODO(mbandy): opportunity for rlwinm?
        return VisitWordCompare(this, value, kPPC_Tst32, cont, true,
                                kInt16Imm_Unsigned);
// TODO(mbrandy): Handle?
// case IrOpcode::kInt32Add:
// case IrOpcode::kWord32Or:
// case IrOpcode::kWord32Xor:
// case IrOpcode::kWord32Sar:
// case IrOpcode::kWord32Shl:
// case IrOpcode::kWord32Shr:
// case IrOpcode::kWord32Ror:
#if V8_TARGET_ARCH_PPC64
      case IrOpcode::kInt64Sub:
        return VisitWord64Compare(this, value, cont);
      case IrOpcode::kWord64And:
        // TODO(mbandy): opportunity for rldic?
        return VisitWordCompare(this, value, kPPC_Tst64, cont, true,
                                kInt16Imm_Unsigned);
// TODO(mbrandy): Handle?
// case IrOpcode::kInt64Add:
// case IrOpcode::kWord64Or:
// case IrOpcode::kWord64Xor:
// case IrOpcode::kWord64Sar:
// case IrOpcode::kWord64Shl:
// case IrOpcode::kWord64Shr:
// case IrOpcode::kWord64Ror:
#endif
      case IrOpcode::kStackPointerGreaterThan:
        cont->OverwriteAndNegateIfEqual(kStackPointerGreaterThanCondition);
        return VisitStackPointerGreaterThan(value, cont);
      default:
        break;
      }
    }

  // Branch could not be combined with a compare, emit compare against 0.
  PPCOperandGeneratorT<Adapter> g(this);
  VisitCompare(this, kPPC_Cmp32, g.UseRegister(value), g.TempImmediate(0),
               cont);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitSwitch(node_t node,
                                                const SwitchInfo& sw) {
  if constexpr (Adapter::IsTurboshaft) {
  UNIMPLEMENTED();
  } else {
  PPCOperandGeneratorT<Adapter> g(this);
  InstructionOperand value_operand = g.UseRegister(node->InputAt(0));

  // Emit either ArchTableSwitch or ArchBinarySearchSwitch.
  if (enable_switch_jump_table_ ==
      InstructionSelector::kEnableSwitchJumpTable) {
  static const size_t kMaxTableSwitchValueRange = 2 << 16;
  size_t table_space_cost = 4 + sw.value_range();
  size_t table_time_cost = 3;
  size_t lookup_space_cost = 3 + 2 * sw.case_count();
  size_t lookup_time_cost = sw.case_count();
  if (sw.case_count() > 0 &&
      table_space_cost + 3 * table_time_cost <=
          lookup_space_cost + 3 * lookup_time_cost &&
      sw.min_value() > std::numeric_limits<int32_t>::min() &&
      sw.value_range() <= kMaxTableSwitchValueRange) {
      InstructionOperand index_operand = value_operand;
      if (sw.min_value()) {
      index_operand = g.TempRegister();
      Emit(kPPC_Sub, index_operand, value_operand,
           g.TempImmediate(sw.min_value()));
      }
      // Generate a table lookup.
      return EmitTableSwitch(sw, index_operand);
  }
  }

  // Generate a tree of conditional jumps.
  return EmitBinarySearchSwitch(sw, value_operand);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord32Equal(node_t const node) {
  if constexpr (Adapter::IsTurboshaft) {
  UNIMPLEMENTED();
  } else {
  FlagsContinuation cont = FlagsContinuation::ForSet(kEqual, node);
  VisitWord32Compare(this, node, &cont);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitInt32LessThan(node_t node) {
  FlagsContinuation cont = FlagsContinuation::ForSet(kSignedLessThan, node);
  VisitWord32Compare(this, node, &cont);
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitInt32LessThanOrEqual(node_t node) {
  FlagsContinuation cont =
      FlagsContinuation::ForSet(kSignedLessThanOrEqual, node);
  VisitWord32Compare(this, node, &cont);
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitUint32LessThan(node_t node) {
  FlagsContinuation cont = FlagsContinuation::ForSet(kUnsignedLessThan, node);
  VisitWord32Compare(this, node, &cont);
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitUint32LessThanOrEqual(node_t node) {
  FlagsContinuation cont =
      FlagsContinuation::ForSet(kUnsignedLessThanOrEqual, node);
  VisitWord32Compare(this, node, &cont);
}

#if V8_TARGET_ARCH_PPC64
template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord64Equal(node_t const node) {
  if constexpr (Adapter::IsTurboshaft) {
  UNIMPLEMENTED();
  } else {
  FlagsContinuation cont = FlagsContinuation::ForSet(kEqual, node);
  VisitWord64Compare(this, node, &cont);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitInt64LessThan(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
  UNIMPLEMENTED();
  } else {
  FlagsContinuation cont = FlagsContinuation::ForSet(kSignedLessThan, node);
  VisitWord64Compare(this, node, &cont);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitInt64LessThanOrEqual(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
  UNIMPLEMENTED();
  } else {
  FlagsContinuation cont =
      FlagsContinuation::ForSet(kSignedLessThanOrEqual, node);
  VisitWord64Compare(this, node, &cont);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitUint64LessThan(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
  UNIMPLEMENTED();
  } else {
  FlagsContinuation cont = FlagsContinuation::ForSet(kUnsignedLessThan, node);
  VisitWord64Compare(this, node, &cont);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitUint64LessThanOrEqual(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
  UNIMPLEMENTED();
  } else {
  FlagsContinuation cont =
      FlagsContinuation::ForSet(kUnsignedLessThanOrEqual, node);
  VisitWord64Compare(this, node, &cont);
  }
}
#endif

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitInt32MulWithOverflow(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
  UNIMPLEMENTED();
  } else {
  if (Node* ovf = NodeProperties::FindProjection(node, 1)) {
    FlagsContinuation cont = FlagsContinuation::ForSet(kNotEqual, ovf);
    return EmitInt32MulWithOverflow(this, node, &cont);
  }
  FlagsContinuation cont;
  EmitInt32MulWithOverflow(this, node, &cont);
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat32Equal(node_t node) {
  FlagsContinuation cont = FlagsContinuation::ForSet(kEqual, node);
  VisitFloat32Compare(this, node, &cont);
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat32LessThan(node_t node) {
  FlagsContinuation cont = FlagsContinuation::ForSet(kUnsignedLessThan, node);
  VisitFloat32Compare(this, node, &cont);
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat32LessThanOrEqual(node_t node) {
  FlagsContinuation cont =
      FlagsContinuation::ForSet(kUnsignedLessThanOrEqual, node);
  VisitFloat32Compare(this, node, &cont);
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat64Equal(node_t node) {
  FlagsContinuation cont = FlagsContinuation::ForSet(kEqual, node);
  VisitFloat64Compare(this, node, &cont);
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat64LessThan(node_t node) {
  FlagsContinuation cont = FlagsContinuation::ForSet(kUnsignedLessThan, node);
  VisitFloat64Compare(this, node, &cont);
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat64LessThanOrEqual(node_t node) {
  FlagsContinuation cont =
      FlagsContinuation::ForSet(kUnsignedLessThanOrEqual, node);
  VisitFloat64Compare(this, node, &cont);
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::EmitMoveParamToFPR(node_t node, int index) {
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::EmitMoveFPRToParam(
    InstructionOperand* op, LinkageLocation location) {}

template <typename Adapter>
void InstructionSelectorT<Adapter>::EmitPrepareArguments(
    ZoneVector<PushParameter>* arguments, const CallDescriptor* call_descriptor,
    node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
  UNIMPLEMENTED();
  } else {
  PPCOperandGeneratorT<Adapter> g(this);

  // Prepare for C function call.
  if (call_descriptor->IsCFunctionCall()) {
    Emit(kArchPrepareCallCFunction | MiscField::encode(static_cast<int>(
                                         call_descriptor->ParameterCount())),
         0, nullptr, 0, nullptr);

    // Poke any stack arguments.
    int slot = kStackFrameExtraParamSlot;
    for (PushParameter input : (*arguments)) {
      if (input.node == nullptr) continue;
      Emit(kPPC_StoreToStackSlot, g.NoOutput(), g.UseRegister(input.node),
           g.TempImmediate(slot));
      ++slot;
    }
  } else {
    // Push any stack arguments.
    int stack_decrement = 0;
    for (PushParameter input : base::Reversed(*arguments)) {
      stack_decrement += kSystemPointerSize;
      // Skip any alignment holes in pushed nodes.
      if (input.node == nullptr) continue;
      InstructionOperand decrement = g.UseImmediate(stack_decrement);
      stack_decrement = 0;
      Emit(kPPC_Push, g.NoOutput(), decrement, g.UseRegister(input.node));
    }
  }
  }
}

template <typename Adapter>
bool InstructionSelectorT<Adapter>::IsTailCallAddressImmediate() {
  return false;
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat64ExtractLowWord32(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
  UNIMPLEMENTED();
  } else {
  PPCOperandGeneratorT<Adapter> g(this);
  Emit(kPPC_DoubleExtractLowWord32, g.DefineAsRegister(node),
       g.UseRegister(node->InputAt(0)));
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat64ExtractHighWord32(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
  UNIMPLEMENTED();
  } else {
  PPCOperandGeneratorT<Adapter> g(this);
  Emit(kPPC_DoubleExtractHighWord32, g.DefineAsRegister(node),
       g.UseRegister(node->InputAt(0)));
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat64InsertLowWord32(Node* node) {
  PPCOperandGeneratorT<Adapter> g(this);
  Node* left = node->InputAt(0);
  Node* right = node->InputAt(1);
  if (left->opcode() == IrOpcode::kFloat64InsertHighWord32 &&
      CanCover(node, left)) {
    left = left->InputAt(1);
    Emit(kPPC_DoubleConstruct, g.DefineAsRegister(node), g.UseRegister(left),
         g.UseRegister(right));
    return;
  }
  Emit(kPPC_DoubleInsertLowWord32, g.DefineSameAsFirst(node),
       g.UseRegister(left), g.UseRegister(right));
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat64InsertHighWord32(Node* node) {
  PPCOperandGeneratorT<Adapter> g(this);
  Node* left = node->InputAt(0);
  Node* right = node->InputAt(1);
  if (left->opcode() == IrOpcode::kFloat64InsertLowWord32 &&
      CanCover(node, left)) {
    left = left->InputAt(1);
    Emit(kPPC_DoubleConstruct, g.DefineAsRegister(node), g.UseRegister(right),
         g.UseRegister(left));
    return;
  }
  Emit(kPPC_DoubleInsertHighWord32, g.DefineSameAsFirst(node),
       g.UseRegister(left), g.UseRegister(right));
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitMemoryBarrier(Node* node) {
  PPCOperandGeneratorT<Adapter> g(this);
  Emit(kPPC_Sync, g.NoOutput());
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord32AtomicLoad(Node* node) {
  AtomicLoadParameters atomic_load_params = AtomicLoadParametersOf(node->op());
  LoadRepresentation load_rep = atomic_load_params.representation();
  VisitLoadCommon(this, node, load_rep);
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord64AtomicLoad(Node* node) {
  AtomicLoadParameters atomic_load_params = AtomicLoadParametersOf(node->op());
  LoadRepresentation load_rep = atomic_load_params.representation();
  VisitLoadCommon(this, node, load_rep);
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord32AtomicStore(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    AtomicStoreParameters store_params = AtomicStoreParametersOf(node->op());
    VisitStoreCommon(this, node, store_params.store_representation(),
                     store_params.order());
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord64AtomicStore(node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    AtomicStoreParameters store_params = AtomicStoreParametersOf(node->op());
    VisitStoreCommon(this, node, store_params.store_representation(),
                     store_params.order());
  }
}

template <typename Adapter>
void VisitAtomicExchange(InstructionSelectorT<Adapter>* selector, Node* node,
                         ArchOpcode opcode) {
  PPCOperandGeneratorT<Adapter> g(selector);
  Node* base = node->InputAt(0);
  Node* index = node->InputAt(1);
  Node* value = node->InputAt(2);

  AddressingMode addressing_mode = kMode_MRR;
  InstructionOperand inputs[3];
  size_t input_count = 0;
  inputs[input_count++] = g.UseUniqueRegister(base);
  inputs[input_count++] = g.UseUniqueRegister(index);
  inputs[input_count++] = g.UseUniqueRegister(value);
  InstructionOperand outputs[1];
  outputs[0] = g.UseUniqueRegister(node);
  InstructionCode code = opcode | AddressingModeField::encode(addressing_mode);
  selector->Emit(code, 1, outputs, input_count, inputs);
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord32AtomicExchange(Node* node) {
  ArchOpcode opcode;
  MachineType type = AtomicOpType(node->op());
  if (type == MachineType::Int8()) {
    opcode = kAtomicExchangeInt8;
  } else if (type == MachineType::Uint8()) {
    opcode = kPPC_AtomicExchangeUint8;
  } else if (type == MachineType::Int16()) {
    opcode = kAtomicExchangeInt16;
  } else if (type == MachineType::Uint16()) {
    opcode = kPPC_AtomicExchangeUint16;
  } else if (type == MachineType::Int32() || type == MachineType::Uint32()) {
    opcode = kPPC_AtomicExchangeWord32;
  } else {
    UNREACHABLE();
  }
  VisitAtomicExchange(this, node, opcode);
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord64AtomicExchange(Node* node) {
  ArchOpcode opcode;
  MachineType type = AtomicOpType(node->op());
  if (type == MachineType::Uint8()) {
    opcode = kPPC_AtomicExchangeUint8;
  } else if (type == MachineType::Uint16()) {
    opcode = kPPC_AtomicExchangeUint16;
  } else if (type == MachineType::Uint32()) {
    opcode = kPPC_AtomicExchangeWord32;
  } else if (type == MachineType::Uint64()) {
    opcode = kPPC_AtomicExchangeWord64;
  } else {
    UNREACHABLE();
  }
  VisitAtomicExchange(this, node, opcode);
}

template <typename Adapter>
void VisitAtomicCompareExchange(InstructionSelectorT<Adapter>* selector,
                                Node* node, ArchOpcode opcode) {
  PPCOperandGeneratorT<Adapter> g(selector);
  Node* base = node->InputAt(0);
  Node* index = node->InputAt(1);
  Node* old_value = node->InputAt(2);
  Node* new_value = node->InputAt(3);

  AddressingMode addressing_mode = kMode_MRR;
  InstructionCode code = opcode | AddressingModeField::encode(addressing_mode);

  InstructionOperand inputs[4];
  size_t input_count = 0;
  inputs[input_count++] = g.UseUniqueRegister(base);
  inputs[input_count++] = g.UseUniqueRegister(index);
  inputs[input_count++] = g.UseUniqueRegister(old_value);
  inputs[input_count++] = g.UseUniqueRegister(new_value);

  InstructionOperand outputs[1];
  size_t output_count = 0;
  outputs[output_count++] = g.DefineAsRegister(node);

  selector->Emit(code, output_count, outputs, input_count, inputs);
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord32AtomicCompareExchange(
    Node* node) {
  MachineType type = AtomicOpType(node->op());
  ArchOpcode opcode;
  if (type == MachineType::Int8()) {
    opcode = kAtomicCompareExchangeInt8;
  } else if (type == MachineType::Uint8()) {
    opcode = kPPC_AtomicCompareExchangeUint8;
  } else if (type == MachineType::Int16()) {
    opcode = kAtomicCompareExchangeInt16;
  } else if (type == MachineType::Uint16()) {
    opcode = kPPC_AtomicCompareExchangeUint16;
  } else if (type == MachineType::Int32() || type == MachineType::Uint32()) {
    opcode = kPPC_AtomicCompareExchangeWord32;
  } else {
    UNREACHABLE();
  }
  VisitAtomicCompareExchange(this, node, opcode);
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord64AtomicCompareExchange(
    Node* node) {
  MachineType type = AtomicOpType(node->op());
  ArchOpcode opcode;
  if (type == MachineType::Uint8()) {
    opcode = kPPC_AtomicCompareExchangeUint8;
  } else if (type == MachineType::Uint16()) {
    opcode = kPPC_AtomicCompareExchangeUint16;
  } else if (type == MachineType::Uint32()) {
    opcode = kPPC_AtomicCompareExchangeWord32;
  } else if (type == MachineType::Uint64()) {
    opcode = kPPC_AtomicCompareExchangeWord64;
  } else {
    UNREACHABLE();
  }
  VisitAtomicCompareExchange(this, node, opcode);
}

template <typename Adapter>
void VisitAtomicBinaryOperation(InstructionSelectorT<Adapter>* selector,
                                Node* node, ArchOpcode int8_op,
                                ArchOpcode uint8_op, ArchOpcode int16_op,
                                ArchOpcode uint16_op, ArchOpcode int32_op,
                                ArchOpcode uint32_op, ArchOpcode int64_op,
                                ArchOpcode uint64_op) {
  PPCOperandGeneratorT<Adapter> g(selector);
  Node* base = node->InputAt(0);
  Node* index = node->InputAt(1);
  Node* value = node->InputAt(2);
  MachineType type = AtomicOpType(node->op());

  ArchOpcode opcode;

  if (type == MachineType::Int8()) {
    opcode = int8_op;
  } else if (type == MachineType::Uint8()) {
    opcode = uint8_op;
  } else if (type == MachineType::Int16()) {
    opcode = int16_op;
  } else if (type == MachineType::Uint16()) {
    opcode = uint16_op;
  } else if (type == MachineType::Int32()) {
    opcode = int32_op;
  } else if (type == MachineType::Uint32()) {
    opcode = uint32_op;
  } else if (type == MachineType::Int64()) {
    opcode = int64_op;
  } else if (type == MachineType::Uint64()) {
    opcode = uint64_op;
  } else {
    UNREACHABLE();
  }

  AddressingMode addressing_mode = kMode_MRR;
  InstructionCode code = opcode | AddressingModeField::encode(addressing_mode);
  InstructionOperand inputs[3];

  size_t input_count = 0;
  inputs[input_count++] = g.UseUniqueRegister(base);
  inputs[input_count++] = g.UseUniqueRegister(index);
  inputs[input_count++] = g.UseUniqueRegister(value);

  InstructionOperand outputs[1];
  size_t output_count = 0;
  outputs[output_count++] = g.DefineAsRegister(node);

  selector->Emit(code, output_count, outputs, input_count, inputs);
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord32AtomicBinaryOperation(
    node_t node, ArchOpcode int8_op, ArchOpcode uint8_op, ArchOpcode int16_op,
    ArchOpcode uint16_op, ArchOpcode word32_op) {
  // Unused
  UNREACHABLE();
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitWord64AtomicBinaryOperation(
    node_t node, ArchOpcode uint8_op, ArchOpcode uint16_op,
    ArchOpcode uint32_op, ArchOpcode uint64_op) {
  // Unused
  UNREACHABLE();
}

#define VISIT_ATOMIC_BINOP(op)                                            \
  template <typename Adapter>                                             \
  void InstructionSelectorT<Adapter>::VisitWord32Atomic##op(Node* node) { \
    VisitAtomicBinaryOperation(                                           \
        this, node, kPPC_Atomic##op##Int8, kPPC_Atomic##op##Uint8,        \
        kPPC_Atomic##op##Int16, kPPC_Atomic##op##Uint16,                  \
        kPPC_Atomic##op##Int32, kPPC_Atomic##op##Uint32,                  \
        kPPC_Atomic##op##Int64, kPPC_Atomic##op##Uint64);                 \
  }                                                                       \
  template <typename Adapter>                                             \
  void InstructionSelectorT<Adapter>::VisitWord64Atomic##op(Node* node) { \
    VisitAtomicBinaryOperation(                                           \
        this, node, kPPC_Atomic##op##Int8, kPPC_Atomic##op##Uint8,        \
        kPPC_Atomic##op##Int16, kPPC_Atomic##op##Uint16,                  \
        kPPC_Atomic##op##Int32, kPPC_Atomic##op##Uint32,                  \
        kPPC_Atomic##op##Int64, kPPC_Atomic##op##Uint64);                 \
  }
VISIT_ATOMIC_BINOP(Add)
VISIT_ATOMIC_BINOP(Sub)
VISIT_ATOMIC_BINOP(And)
VISIT_ATOMIC_BINOP(Or)
VISIT_ATOMIC_BINOP(Xor)
#undef VISIT_ATOMIC_BINOP

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitInt32AbsWithOverflow(Node* node) {
  UNREACHABLE();
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitInt64AbsWithOverflow(Node* node) {
  UNREACHABLE();
}

#define SIMD_TYPES(V) \
  V(F64x2)            \
  V(F32x4)            \
  V(I64x2)            \
  V(I32x4)            \
  V(I16x8)            \
  V(I8x16)

#define SIMD_BINOP_LIST(V) \
  V(F64x2Add)              \
  V(F64x2Sub)              \
  V(F64x2Mul)              \
  V(F64x2Eq)               \
  V(F64x2Ne)               \
  V(F64x2Le)               \
  V(F64x2Lt)               \
  V(F64x2Div)              \
  V(F64x2Min)              \
  V(F64x2Max)              \
  V(F64x2Pmin)             \
  V(F64x2Pmax)             \
  V(F32x4Add)              \
  V(F32x4Sub)              \
  V(F32x4Mul)              \
  V(F32x4Eq)               \
  V(F32x4Ne)               \
  V(F32x4Lt)               \
  V(F32x4Le)               \
  V(F32x4Div)              \
  V(F32x4Min)              \
  V(F32x4Max)              \
  V(F32x4Pmin)             \
  V(F32x4Pmax)             \
  V(I64x2Add)              \
  V(I64x2Sub)              \
  V(I64x2Mul)              \
  V(I64x2Eq)               \
  V(I64x2Ne)               \
  V(I64x2ExtMulLowI32x4S)  \
  V(I64x2ExtMulHighI32x4S) \
  V(I64x2ExtMulLowI32x4U)  \
  V(I64x2ExtMulHighI32x4U) \
  V(I64x2GtS)              \
  V(I64x2GeS)              \
  V(I64x2Shl)              \
  V(I64x2ShrS)             \
  V(I64x2ShrU)             \
  V(I32x4Add)              \
  V(I32x4Sub)              \
  V(I32x4Mul)              \
  V(I32x4MinS)             \
  V(I32x4MinU)             \
  V(I32x4MaxS)             \
  V(I32x4MaxU)             \
  V(I32x4Eq)               \
  V(I32x4Ne)               \
  V(I32x4GtS)              \
  V(I32x4GeS)              \
  V(I32x4GtU)              \
  V(I32x4GeU)              \
  V(I32x4DotI16x8S)        \
  V(I32x4ExtMulLowI16x8S)  \
  V(I32x4ExtMulHighI16x8S) \
  V(I32x4ExtMulLowI16x8U)  \
  V(I32x4ExtMulHighI16x8U) \
  V(I32x4Shl)              \
  V(I32x4ShrS)             \
  V(I32x4ShrU)             \
  V(I16x8Add)              \
  V(I16x8Sub)              \
  V(I16x8Mul)              \
  V(I16x8MinS)             \
  V(I16x8MinU)             \
  V(I16x8MaxS)             \
  V(I16x8MaxU)             \
  V(I16x8Eq)               \
  V(I16x8Ne)               \
  V(I16x8GtS)              \
  V(I16x8GeS)              \
  V(I16x8GtU)              \
  V(I16x8GeU)              \
  V(I16x8SConvertI32x4)    \
  V(I16x8UConvertI32x4)    \
  V(I16x8AddSatS)          \
  V(I16x8SubSatS)          \
  V(I16x8AddSatU)          \
  V(I16x8SubSatU)          \
  V(I16x8RoundingAverageU) \
  V(I16x8Q15MulRSatS)      \
  V(I16x8ExtMulLowI8x16S)  \
  V(I16x8ExtMulHighI8x16S) \
  V(I16x8ExtMulLowI8x16U)  \
  V(I16x8ExtMulHighI8x16U) \
  V(I16x8Shl)              \
  V(I16x8ShrS)             \
  V(I16x8ShrU)             \
  V(I8x16Add)              \
  V(I8x16Sub)              \
  V(I8x16MinS)             \
  V(I8x16MinU)             \
  V(I8x16MaxS)             \
  V(I8x16MaxU)             \
  V(I8x16Eq)               \
  V(I8x16Ne)               \
  V(I8x16GtS)              \
  V(I8x16GeS)              \
  V(I8x16GtU)              \
  V(I8x16GeU)              \
  V(I8x16SConvertI16x8)    \
  V(I8x16UConvertI16x8)    \
  V(I8x16AddSatS)          \
  V(I8x16SubSatS)          \
  V(I8x16AddSatU)          \
  V(I8x16SubSatU)          \
  V(I8x16RoundingAverageU) \
  V(I8x16Swizzle)          \
  V(I8x16Shl)              \
  V(I8x16ShrS)             \
  V(I8x16ShrU)             \
  V(S128And)               \
  V(S128Or)                \
  V(S128Xor)               \
  V(S128AndNot)

#define SIMD_UNOP_LIST(V)      \
  V(F64x2Abs)                  \
  V(F64x2Neg)                  \
  V(F64x2Sqrt)                 \
  V(F64x2Ceil)                 \
  V(F64x2Floor)                \
  V(F64x2Trunc)                \
  V(F64x2ConvertLowI32x4S)     \
  V(F64x2ConvertLowI32x4U)     \
  V(F64x2PromoteLowF32x4)      \
  V(F64x2Splat)                \
  V(F32x4Abs)                  \
  V(F32x4Neg)                  \
  V(F32x4Sqrt)                 \
  V(F32x4SConvertI32x4)        \
  V(F32x4UConvertI32x4)        \
  V(F32x4Ceil)                 \
  V(F32x4Floor)                \
  V(F32x4Trunc)                \
  V(F32x4DemoteF64x2Zero)      \
  V(F32x4Splat)                \
  V(I64x2Abs)                  \
  V(I64x2Neg)                  \
  V(I64x2SConvertI32x4Low)     \
  V(I64x2SConvertI32x4High)    \
  V(I64x2UConvertI32x4Low)     \
  V(I64x2UConvertI32x4High)    \
  V(I64x2AllTrue)              \
  V(I64x2BitMask)              \
  V(I32x4Neg)                  \
  V(I64x2Splat)                \
  V(I32x4Abs)                  \
  V(I32x4SConvertF32x4)        \
  V(I32x4UConvertF32x4)        \
  V(I32x4SConvertI16x8Low)     \
  V(I32x4SConvertI16x8High)    \
  V(I32x4UConvertI16x8Low)     \
  V(I32x4UConvertI16x8High)    \
  V(I32x4ExtAddPairwiseI16x8S) \
  V(I32x4ExtAddPairwiseI16x8U) \
  V(I32x4TruncSatF64x2SZero)   \
  V(I32x4TruncSatF64x2UZero)   \
  V(I32x4AllTrue)              \
  V(I32x4BitMask)              \
  V(I32x4Splat)                \
  V(I16x8Neg)                  \
  V(I16x8Abs)                  \
  V(I16x8AllTrue)              \
  V(I16x8BitMask)              \
  V(I16x8Splat)                \
  V(I8x16Neg)                  \
  V(I8x16Abs)                  \
  V(I8x16Popcnt)               \
  V(I8x16AllTrue)              \
  V(I8x16BitMask)              \
  V(I8x16Splat)                \
  V(I16x8SConvertI8x16Low)     \
  V(I16x8SConvertI8x16High)    \
  V(I16x8UConvertI8x16Low)     \
  V(I16x8UConvertI8x16High)    \
  V(I16x8ExtAddPairwiseI8x16S) \
  V(I16x8ExtAddPairwiseI8x16U) \
  V(S128Not)                   \
  V(V128AnyTrue)

#define SIMD_VISIT_EXTRACT_LANE(Type, Sign)                           \
  template <typename Adapter>                                         \
  void InstructionSelectorT<Adapter>::Visit##Type##ExtractLane##Sign( \
      Node* node) {                                                   \
    PPCOperandGeneratorT<Adapter> g(this);                            \
    int32_t lane = OpParameter<int32_t>(node->op());                  \
    Emit(kPPC_##Type##ExtractLane##Sign, g.DefineAsRegister(node),    \
         g.UseRegister(node->InputAt(0)), g.UseImmediate(lane));      \
  }
SIMD_VISIT_EXTRACT_LANE(F64x2, )
SIMD_VISIT_EXTRACT_LANE(F32x4, )
SIMD_VISIT_EXTRACT_LANE(I64x2, )
SIMD_VISIT_EXTRACT_LANE(I32x4, )
SIMD_VISIT_EXTRACT_LANE(I16x8, U)
SIMD_VISIT_EXTRACT_LANE(I16x8, S)
SIMD_VISIT_EXTRACT_LANE(I8x16, U)
SIMD_VISIT_EXTRACT_LANE(I8x16, S)
#undef SIMD_VISIT_EXTRACT_LANE

#define SIMD_VISIT_REPLACE_LANE(Type)                                        \
  template <typename Adapter>                                                \
  void InstructionSelectorT<Adapter>::Visit##Type##ReplaceLane(Node* node) { \
    PPCOperandGeneratorT<Adapter> g(this);                                   \
    int32_t lane = OpParameter<int32_t>(node->op());                         \
    Emit(kPPC_##Type##ReplaceLane, g.DefineSameAsFirst(node),                \
         g.UseRegister(node->InputAt(0)), g.UseImmediate(lane),              \
         g.UseRegister(node->InputAt(1)));                                   \
  }
SIMD_TYPES(SIMD_VISIT_REPLACE_LANE)
#undef SIMD_VISIT_REPLACE_LANE

#define SIMD_VISIT_BINOP(Opcode)                                           \
  template <typename Adapter>                                              \
  void InstructionSelectorT<Adapter>::Visit##Opcode(Node* node) {          \
    PPCOperandGeneratorT<Adapter> g(this);                                 \
    InstructionOperand temps[] = {g.TempRegister()};                       \
    Emit(kPPC_##Opcode, g.DefineAsRegister(node),                          \
         g.UseRegister(node->InputAt(0)), g.UseRegister(node->InputAt(1)), \
         arraysize(temps), temps);                                         \
  }
SIMD_BINOP_LIST(SIMD_VISIT_BINOP)
#undef SIMD_VISIT_BINOP
#undef SIMD_BINOP_LIST

#define SIMD_VISIT_UNOP(Opcode)                                   \
  template <typename Adapter>                                     \
  void InstructionSelectorT<Adapter>::Visit##Opcode(Node* node) { \
    PPCOperandGeneratorT<Adapter> g(this);                        \
    Emit(kPPC_##Opcode, g.DefineAsRegister(node),                 \
         g.UseRegister(node->InputAt(0)));                        \
  }
SIMD_UNOP_LIST(SIMD_VISIT_UNOP)
#undef SIMD_VISIT_UNOP
#undef SIMD_UNOP_LIST

#define SIMD_VISIT_QFMOP(Opcode)                                           \
  template <typename Adapter>                                              \
  void InstructionSelectorT<Adapter>::Visit##Opcode(Node* node) {          \
    PPCOperandGeneratorT<Adapter> g(this);                                 \
    Emit(kPPC_##Opcode, g.DefineSameAsFirst(node),                         \
         g.UseRegister(node->InputAt(0)), g.UseRegister(node->InputAt(1)), \
         g.UseRegister(node->InputAt(2)));                                 \
  }
SIMD_VISIT_QFMOP(F64x2Qfma)
SIMD_VISIT_QFMOP(F64x2Qfms)
SIMD_VISIT_QFMOP(F32x4Qfma)
SIMD_VISIT_QFMOP(F32x4Qfms)
#undef SIMD_VISIT_QFMOP

#define SIMD_RELAXED_OP_LIST(V)                           \
  V(F64x2RelaxedMin, F64x2Pmin)                           \
  V(F64x2RelaxedMax, F64x2Pmax)                           \
  V(F32x4RelaxedMin, F32x4Pmin)                           \
  V(F32x4RelaxedMax, F32x4Pmax)                           \
  V(I32x4RelaxedTruncF32x4S, I32x4SConvertF32x4)          \
  V(I32x4RelaxedTruncF32x4U, I32x4UConvertF32x4)          \
  V(I32x4RelaxedTruncF64x2SZero, I32x4TruncSatF64x2SZero) \
  V(I32x4RelaxedTruncF64x2UZero, I32x4TruncSatF64x2UZero) \
  V(I16x8RelaxedQ15MulRS, I16x8Q15MulRSatS)               \
  V(I8x16RelaxedLaneSelect, S128Select)                   \
  V(I16x8RelaxedLaneSelect, S128Select)                   \
  V(I32x4RelaxedLaneSelect, S128Select)                   \
  V(I64x2RelaxedLaneSelect, S128Select)

#define SIMD_VISIT_RELAXED_OP(name, op)                         \
  template <typename Adapter>                                   \
  void InstructionSelectorT<Adapter>::Visit##name(Node* node) { \
    Visit##op(node);                                            \
  }
SIMD_RELAXED_OP_LIST(SIMD_VISIT_RELAXED_OP)
#undef SIMD_VISIT_RELAXED_OP
#undef SIMD_RELAXED_OP_LIST
#undef SIMD_TYPES

#if V8_ENABLE_WEBASSEMBLY
template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitI8x16Shuffle(Node* node) {
  uint8_t shuffle[kSimd128Size];
  bool is_swizzle;
  CanonicalizeShuffle(node, shuffle, &is_swizzle);
  PPCOperandGeneratorT<Adapter> g(this);
  Node* input0 = node->InputAt(0);
  Node* input1 = node->InputAt(1);
  // Remap the shuffle indices to match IBM lane numbering.
  int max_index = 15;
  int total_lane_count = 2 * kSimd128Size;
  uint8_t shuffle_remapped[kSimd128Size];
  for (int i = 0; i < kSimd128Size; i++) {
    uint8_t current_index = shuffle[i];
    shuffle_remapped[i] = (current_index <= max_index
                               ? max_index - current_index
                               : total_lane_count - current_index + max_index);
  }
  Emit(kPPC_I8x16Shuffle, g.DefineAsRegister(node), g.UseRegister(input0),
       g.UseRegister(input1),
       g.UseImmediate(wasm::SimdShuffle::Pack4Lanes(shuffle_remapped)),
       g.UseImmediate(wasm::SimdShuffle::Pack4Lanes(shuffle_remapped + 4)),
       g.UseImmediate(wasm::SimdShuffle::Pack4Lanes(shuffle_remapped + 8)),
       g.UseImmediate(wasm::SimdShuffle::Pack4Lanes(shuffle_remapped + 12)));
}
#else
template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitI8x16Shuffle(Node* node) {
  UNREACHABLE();
}
#endif  // V8_ENABLE_WEBASSEMBLY

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitS128Zero(Node* node) {
  PPCOperandGeneratorT<Adapter> g(this);
  Emit(kPPC_S128Zero, g.DefineAsRegister(node));
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitS128Select(Node* node) {
  PPCOperandGeneratorT<Adapter> g(this);
  Emit(kPPC_S128Select, g.DefineAsRegister(node),
       g.UseRegister(node->InputAt(0)), g.UseRegister(node->InputAt(1)),
       g.UseRegister(node->InputAt(2)));
}

// This is a replica of SimdShuffle::Pack4Lanes. However, above function will
// not be available on builds with webassembly disabled, hence we need to have
// it declared locally as it is used on other visitors such as S128Const.
static int32_t Pack4Lanes(const uint8_t* shuffle) {
  int32_t result = 0;
  for (int i = 3; i >= 0; --i) {
    result <<= 8;
    result |= shuffle[i];
  }
  return result;
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitS128Const(Node* node) {
  PPCOperandGeneratorT<Adapter> g(this);
  uint32_t val[kSimd128Size / sizeof(uint32_t)];
  memcpy(val, S128ImmediateParameterOf(node->op()).data(), kSimd128Size);
  // If all bytes are zeros, avoid emitting code for generic constants.
  bool all_zeros = !(val[0] || val[1] || val[2] || val[3]);
  bool all_ones = val[0] == UINT32_MAX && val[1] == UINT32_MAX &&
                  val[2] == UINT32_MAX && val[3] == UINT32_MAX;
  InstructionOperand dst = g.DefineAsRegister(node);
  if (all_zeros) {
    Emit(kPPC_S128Zero, dst);
  } else if (all_ones) {
    Emit(kPPC_S128AllOnes, dst);
  } else {
    // We have to use Pack4Lanes to reverse the bytes (lanes) on BE,
    // Which in this case is ineffective on LE.
    Emit(kPPC_S128Const, g.DefineAsRegister(node),
         g.UseImmediate(Pack4Lanes(base::bit_cast<uint8_t*>(&val[0]))),
         g.UseImmediate(Pack4Lanes(base::bit_cast<uint8_t*>(&val[0]) + 4)),
         g.UseImmediate(Pack4Lanes(base::bit_cast<uint8_t*>(&val[0]) + 8)),
         g.UseImmediate(Pack4Lanes(base::bit_cast<uint8_t*>(&val[0]) + 12)));
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitI16x8DotI8x16I7x16S(Node* node) {
  PPCOperandGeneratorT<Adapter> g(this);
  Emit(kPPC_I16x8DotI8x16S, g.DefineAsRegister(node),
       g.UseUniqueRegister(node->InputAt(0)),
       g.UseUniqueRegister(node->InputAt(1)));
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitI32x4DotI8x16I7x16AddS(Node* node) {
  PPCOperandGeneratorT<Adapter> g(this);
  Emit(kPPC_I32x4DotI8x16AddS, g.DefineAsRegister(node),
       g.UseUniqueRegister(node->InputAt(0)),
       g.UseUniqueRegister(node->InputAt(1)),
       g.UseUniqueRegister(node->InputAt(2)));
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::EmitPrepareResults(
    ZoneVector<PushParameter>* results, const CallDescriptor* call_descriptor,
    node_t node) {
  if constexpr (Adapter::IsTurboshaft) {
    UNIMPLEMENTED();
  } else {
    PPCOperandGeneratorT<Adapter> g(this);

    for (PushParameter output : *results) {
    if (!output.location.IsCallerFrameSlot()) continue;
    // Skip any alignment holes in nodes.
    if (output.node != nullptr) {
      DCHECK(!call_descriptor->IsCFunctionCall());
      if (output.location.GetType() == MachineType::Float32()) {
        MarkAsFloat32(output.node);
      } else if (output.location.GetType() == MachineType::Float64()) {
        MarkAsFloat64(output.node);
      } else if (output.location.GetType() == MachineType::Simd128()) {
        MarkAsSimd128(output.node);
      }
      int offset = call_descriptor->GetOffsetToReturns();
      int reverse_slot = -output.location.GetLocation() - offset;
      Emit(kPPC_Peek, g.DefineAsRegister(output.node),
           g.UseImmediate(reverse_slot));
    }
    }
  }
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitLoadLane(Node* node) {
  LoadLaneParameters params = LoadLaneParametersOf(node->op());
  InstructionCode opcode = kArchNop;
  if (params.rep == MachineType::Int8()) {
    opcode = kPPC_S128Load8Lane;
  } else if (params.rep == MachineType::Int16()) {
    opcode = kPPC_S128Load16Lane;
  } else if (params.rep == MachineType::Int32()) {
    opcode = kPPC_S128Load32Lane;
  } else if (params.rep == MachineType::Int64()) {
    opcode = kPPC_S128Load64Lane;
  } else {
    UNREACHABLE();
  }

  PPCOperandGeneratorT<Adapter> g(this);
  Emit(opcode | AddressingModeField::encode(kMode_MRR),
       g.DefineSameAsFirst(node), g.UseRegister(node->InputAt(2)),
       g.UseRegister(node->InputAt(0)), g.UseRegister(node->InputAt(1)),
       g.UseImmediate(params.laneidx));
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitLoadTransform(Node* node) {
  LoadTransformParameters params = LoadTransformParametersOf(node->op());
  PPCOperandGeneratorT<Adapter> g(this);
  Node* base = node->InputAt(0);
  Node* index = node->InputAt(1);

  ArchOpcode opcode;
  switch (params.transformation) {
    case LoadTransformation::kS128Load8Splat:
      opcode = kPPC_S128Load8Splat;
      break;
    case LoadTransformation::kS128Load16Splat:
      opcode = kPPC_S128Load16Splat;
      break;
    case LoadTransformation::kS128Load32Splat:
      opcode = kPPC_S128Load32Splat;
      break;
    case LoadTransformation::kS128Load64Splat:
      opcode = kPPC_S128Load64Splat;
      break;
    case LoadTransformation::kS128Load8x8S:
      opcode = kPPC_S128Load8x8S;
      break;
    case LoadTransformation::kS128Load8x8U:
      opcode = kPPC_S128Load8x8U;
      break;
    case LoadTransformation::kS128Load16x4S:
      opcode = kPPC_S128Load16x4S;
      break;
    case LoadTransformation::kS128Load16x4U:
      opcode = kPPC_S128Load16x4U;
      break;
    case LoadTransformation::kS128Load32x2S:
      opcode = kPPC_S128Load32x2S;
      break;
    case LoadTransformation::kS128Load32x2U:
      opcode = kPPC_S128Load32x2U;
      break;
    case LoadTransformation::kS128Load32Zero:
      opcode = kPPC_S128Load32Zero;
      break;
    case LoadTransformation::kS128Load64Zero:
      opcode = kPPC_S128Load64Zero;
      break;
    default:
      UNREACHABLE();
  }
  Emit(opcode | AddressingModeField::encode(kMode_MRR),
       g.DefineAsRegister(node), g.UseRegister(base), g.UseRegister(index));
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitStoreLane(Node* node) {
  PPCOperandGeneratorT<Adapter> g(this);

  StoreLaneParameters params = StoreLaneParametersOf(node->op());
  InstructionCode opcode = kArchNop;
  if (params.rep == MachineRepresentation::kWord8) {
    opcode = kPPC_S128Store8Lane;
  } else if (params.rep == MachineRepresentation::kWord16) {
    opcode = kPPC_S128Store16Lane;
  } else if (params.rep == MachineRepresentation::kWord32) {
    opcode = kPPC_S128Store32Lane;
  } else if (params.rep == MachineRepresentation::kWord64) {
    opcode = kPPC_S128Store64Lane;
  } else {
    UNREACHABLE();
  }

  InstructionOperand inputs[4];
  InstructionOperand value_operand = g.UseRegister(node->InputAt(2));
  inputs[0] = value_operand;
  inputs[1] = g.UseRegister(node->InputAt(0));
  inputs[2] = g.UseRegister(node->InputAt(1));
  inputs[3] = g.UseImmediate(params.laneidx);
  Emit(opcode | AddressingModeField::encode(kMode_MRR), 0, nullptr, 4, inputs);
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::AddOutputToSelectContinuation(
    OperandGenerator* g, int first_input_index, node_t node) {
  UNREACHABLE();
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat32RoundTiesEven(node_t node) {
  UNREACHABLE();
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitFloat64RoundTiesEven(node_t node) {
  UNREACHABLE();
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitF64x2NearestInt(Node* node) {
  UNREACHABLE();
}

template <typename Adapter>
void InstructionSelectorT<Adapter>::VisitF32x4NearestInt(Node* node) {
  UNREACHABLE();
}

MachineOperatorBuilder::Flags
InstructionSelector::SupportedMachineOperatorFlags() {
  return MachineOperatorBuilder::kFloat32RoundDown |
         MachineOperatorBuilder::kFloat64RoundDown |
         MachineOperatorBuilder::kFloat32RoundUp |
         MachineOperatorBuilder::kFloat64RoundUp |
         MachineOperatorBuilder::kFloat32RoundTruncate |
         MachineOperatorBuilder::kFloat64RoundTruncate |
         MachineOperatorBuilder::kFloat64RoundTiesAway |
         MachineOperatorBuilder::kWord32Popcnt |
         MachineOperatorBuilder::kWord64Popcnt;
  // We omit kWord32ShiftIsSafe as s[rl]w use 0x3F as a mask rather than 0x1F.
}

MachineOperatorBuilder::AlignmentRequirements
InstructionSelector::AlignmentRequirements() {
  return MachineOperatorBuilder::AlignmentRequirements::
      FullUnalignedAccessSupport();
}

template class EXPORT_TEMPLATE_DEFINE(V8_EXPORT_PRIVATE)
    InstructionSelectorT<TurbofanAdapter>;
template class EXPORT_TEMPLATE_DEFINE(V8_EXPORT_PRIVATE)
    InstructionSelectorT<TurboshaftAdapter>;

}  // namespace compiler
}  // namespace internal
}  // namespace v8
