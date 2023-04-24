Warning: unknown flag --experiment.
Try --help for options
--- WebAssembly code ---
name: wasm-function[19]
index: 19
kind: wasm function
compiler: TurboFan
Body (size = 64 = 48 + 16 padding)
Instructions (size = 40)
0x27c1a074fd40     0  55                   push rbp
0x27c1a074fd41     1  4889e5               REX.W movq rbp,rsp
0x27c1a074fd44     4  6a08                 push 0x8
0x27c1a074fd46     6  56                   push rsi
0x27c1a074fd47     7  488b464f             REX.W movq rax,[rsi+0x4f]
0x27c1a074fd4b     b  48c1e818             REX.W shrq rax, 24
0x27c1a074fd4f     f  4903c6               REX.W addq rax,r14
0x27c1a074fd52    12  c7400c800b0100       movl [rax+0xc],0x10b80
0x27c1a074fd59    19  c74008800b0000       movl [rax+0x8],0xb80
0x27c1a074fd60    20  488be5               REX.W movq rsp,rbp
0x27c1a074fd63    23  5d                   pop rbp
0x27c1a074fd64    24  c3                   retl
0x27c1a074fd65    25  90                   nop
0x27c1a074fd66    26  6690                 nop

Safepoints (entries = 0, byte size = 8)

RelocInfo (size = 0)

--- End code ---
--- WebAssembly code ---
name: wasm-function[22]
index: 22
kind: wasm function
compiler: TurboFan
Body (size = 64 = 36 + 28 padding)
Instructions (size = 28)
0x27c1a074fd80     0  55                   push rbp
0x27c1a074fd81     1  4889e5               REX.W movq rbp,rsp
0x27c1a074fd84     4  6a08                 push 0x8
0x27c1a074fd86     6  56                   push rsi
0x27c1a074fd87     7  488b5e4f             REX.W movq rbx,[rsi+0x4f]
0x27c1a074fd8b     b  48c1eb18             REX.W shrq rbx, 24
0x27c1a074fd8f     f  4903de               REX.W addq rbx,r14
0x27c1a074fd92    12  8b4308               movl rax,[rbx+0x8]
0x27c1a074fd95    15  488be5               REX.W movq rsp,rbp
0x27c1a074fd98    18  5d                   pop rbp
0x27c1a074fd99    19  c3                   retl
0x27c1a074fd9a    1a  90                   nop
0x27c1a074fd9b    1b  90                   nop

Safepoints (entries = 0, byte size = 8)

RelocInfo (size = 0)

--- End code ---
--- WebAssembly code ---
name: wasm-function[2]
index: 2
kind: wasm function
compiler: TurboFan
Body (size = 128 = 80 + 48 padding)
Instructions (size = 72)
0x27c1a074fdc0     0  55                   push rbp
0x27c1a074fdc1     1  4889e5               REX.W movq rbp,rsp
0x27c1a074fdc4     4  6a08                 push 0x8
0x27c1a074fdc6     6  56                   push rsi
0x27c1a074fdc7     7  488b461f             REX.W movq rax,[rsi+0x1f]
0x27c1a074fdcb     b  48c1e818             REX.W shrq rax, 24
0x27c1a074fdcf     f  4903c6               REX.W addq rax,r14
0x27c1a074fdd2    12  488b5e4f             REX.W movq rbx,[rsi+0x4f]
0x27c1a074fdd6    16  48c1eb18             REX.W shrq rbx, 24
0x27c1a074fdda    1a  4903de               REX.W addq rbx,r14
0x27c1a074fddd    1d  c7430c800b0100       movl [rbx+0xc],0x10b80
0x27c1a074fde4    24  c74308800b0000       movl [rbx+0x8],0xb80
0x27c1a074fdeb    2b  c780600b0000e80a0000 movl [rax+0xb60],0xae8
0x27c1a074fdf5    35  c780180b00002a000000 movl [rax+0xb18],0x2a
0x27c1a074fdff    3f  488be5               REX.W movq rsp,rbp
0x27c1a074fe02    42  5d                   pop rbp
0x27c1a074fe03    43  c3                   retl
0x27c1a074fe04    44  90                   nop
0x27c1a074fe05    45  0f1f00               nop

Safepoints (entries = 0, byte size = 8)

RelocInfo (size = 0)

--- End code ---
Revec: TryRevectorize wasm-function#3
Revec: Enter PrintStores
Revec: address = #38:Int32Add 
Revec: #44:ProtectedStore, Revec: #53:ProtectedStore, Revec: #62:ProtectedStore, Revec: 
Revec: Enter ReduceStoreChains
Revec: Finish revectorize wasm-function#3
--- WebAssembly code ---
name: wasm-function[3]
index: 3
kind: wasm function
compiler: TurboFan
Body (size = 1152 = 1124 + 28 padding)
Instructions (size = 1108)
0x27c1a074fe40     0  55                   push rbp
0x27c1a074fe41     1  4889e5               REX.W movq rbp,rsp
0x27c1a074fe44     4  6a08                 push 0x8
0x27c1a074fe46     6  56                   push rsi
0x27c1a074fe47     7  4883ec70             REX.W subq rsp,0x70
0x27c1a074fe4b     b  488b7e2f             REX.W movq rdi,[rsi+0x2f]
0x27c1a074fe4f     f  483b27               REX.W cmpq rsp,[rdi]
0x27c1a074fe52    12  0f8672030000         jna 0x27c1a07501ca  <+0x38a>
0x27c1a074fe58    18  4c8b461f             REX.W movq r8,[rsi+0x1f]
0x27c1a074fe5c    1c  49c1e818             REX.W shrq r8, 24
0x27c1a074fe60    20  4d03c6               REX.W addq r8,r14
0x27c1a074fe63    23  4c8b4e4f             REX.W movq r9,[rsi+0x4f]
0x27c1a074fe67    27  49c1e918             REX.W shrq r9, 24
0x27c1a074fe6b    2b  4d03ce               REX.W addq r9,r14
0x27c1a074fe6e    2e  458b19               movl r11,[r9]
0x27c1a074fe71    31  4181eb509c0000       subl r11,0x9c50
0x27c1a074fe78    38  49ba6400000064000000 REX.W movq r10,0x6400000064
0x27c1a074fe82    42  c4c1f96ec2           vmovq xmm0,r10
0x27c1a074fe87    47  c5f96cc0             vpunpcklqdq xmm0,xmm0,xmm0
0x27c1a074fe8b    4b  458919               movl [r9],r11
0x27c1a074fe8e    4e  4c8945c0             REX.W movq [rbp-0x40],r8
0x27c1a074fe92    52  4c894de8             REX.W movq [rbp-0x18],r9
0x27c1a074fe96    56  4c895de0             REX.W movq [rbp-0x20],r11
0x27c1a074fe9a    5a  33d2                 xorl rdx,rdx
0x27c1a074fe9c    5c  4c8be2               REX.W movq r12,rdx
0x27c1a074fe9f    5f  e920000000           jmp 0x27c1a074fec4  <+0x84>
0x27c1a074fea4    64  660f1f840000000000   nop
0x27c1a074fead    6d  660f1f840000000000   nop
0x27c1a074feb6    76  660f1f840000000000   nop
0x27c1a074febf    7f  90                   nop
0x27c1a074fec0    80  458d670c             leal r12,[r15+0xc]
0x27c1a074fec4    84  483b27               REX.W cmpq rsp,[rdi]
0x27c1a074fec7    87  0f8613030000         jna 0x27c1a07501e0  <+0x3a0>
0x27c1a074fecd    8d  478d7ca310           leal r15,[r11+r12*4+0x10]
0x27c1a074fed2    92  c4817a6f0c38         vmovdqu xmm1,[r8+r15*1]
0x27c1a074fed8    98  c5f1fec8             vpaddd xmm1,xmm1,xmm0
0x27c1a074fedc    9c  c4817a7f0c38         vmovdqu [r8+r15*1],xmm1
0x27c1a074fee2    a2  c4817a6f4c3810       vmovdqu xmm1,[r8+r15*1+0x10]
0x27c1a074fee9    a9  c5f1fec8             vpaddd xmm1,xmm1,xmm0
0x27c1a074feed    ad  c4817a7f4c0710       vmovdqu [r15+r8*1+0x10],xmm1
0x27c1a074fef4    b4  c4817a6f4c3820       vmovdqu xmm1,[r8+r15*1+0x20]
0x27c1a074fefb    bb  c5f1fec8             vpaddd xmm1,xmm1,xmm0
0x27c1a074feff    bf  c4817a7f4c0720       vmovdqu [r15+r8*1+0x20],xmm1
0x27c1a074ff06    c6  4181fc00270000       cmpl r12,0x2700
0x27c1a074ff0d    cd  0f844b000000         jz 0x27c1a074ff5e  <+0x11e>
0x27c1a074ff13    d3  458d7c240c           leal r15,[r12+0xc]
0x27c1a074ff18    d8  438d44bb10           leal rax,[r11+r15*4+0x10]
0x27c1a074ff1d    dd  c4c17a6f0c00         vmovdqu xmm1,[r8+rax*1]
0x27c1a074ff23    e3  c5f1fec8             vpaddd xmm1,xmm1,xmm0
0x27c1a074ff27    e7  c4c17a7f0c00         vmovdqu [r8+rax*1],xmm1
0x27c1a074ff2d    ed  c4c17a6f4c0010       vmovdqu xmm1,[r8+rax*1+0x10]
0x27c1a074ff34    f4  c5f1fec8             vpaddd xmm1,xmm1,xmm0
0x27c1a074ff38    f8  c4a17a7f4c0010       vmovdqu [rax+r8*1+0x10],xmm1
0x27c1a074ff3f    ff  c4c17a6f4c0020       vmovdqu xmm1,[r8+rax*1+0x20]
0x27c1a074ff46   106  c5f1fec8             vpaddd xmm1,xmm1,xmm0
0x27c1a074ff4a   10a  c4a17a7f4c0020       vmovdqu [rax+r8*1+0x20],xmm1
0x27c1a074ff51   111  4181fcf4260000       cmpl r12,0x26f4
0x27c1a074ff58   118  0f8562ffffff         jnz 0x27c1a074fec0  <+0x80>
0x27c1a074ff5e   11e  438bbc18409c0000     movl rdi,[r8+r11*1+0x9c40]
0x27c1a074ff66   126  83c764               addl rdi,0x64
0x27c1a074ff69   129  4389bc03409c0000     movl [r11+r8*1+0x9c40],rdi
0x27c1a074ff71   131  438bbc18449c0000     movl rdi,[r8+r11*1+0x9c44]
0x27c1a074ff79   139  83c764               addl rdi,0x64
0x27c1a074ff7c   13c  4389bc03449c0000     movl [r11+r8*1+0x9c44],rdi
0x27c1a074ff84   144  438bbc18489c0000     movl rdi,[r8+r11*1+0x9c48]
0x27c1a074ff8c   14c  83c764               addl rdi,0x64
0x27c1a074ff8f   14f  4389bc03489c0000     movl [r11+r8*1+0x9c48],rdi
0x27c1a074ff97   157  43893c18             movl [r8+r11*1],rdi
0x27c1a074ff9b   15b  418b39               movl rdi,[r9]
0x27c1a074ff9e   15e  83ef10               subl rdi,0x10
0x27c1a074ffa1   161  418939               movl [r9],rdi
0x27c1a074ffa4   164  46895c070c           movl [rdi+r8*1+0xc],r11
0x27c1a074ffa9   169  458b21               movl r12,[r9]
0x27c1a074ffac   16c  4181ecd0000000       subl r12,0xd0
0x27c1a074ffb3   173  458921               movl [r9],r12
0x27c1a074ffb6   176  47899c04cc000000     movl [r12+r8*1+0xcc],r11
0x27c1a074ffbe   17e  418d8424a0000000     leal rax,[r12+0xa0]
0x27c1a074ffc6   186  48897dd8             REX.W movq [rbp-0x28],rdi
0x27c1a074ffca   18a  4c8965d0             REX.W movq [rbp-0x30],r12
0x27c1a074ffce   18e  b928000000           movl rcx,0x28
0x27c1a074ffd3   193  48894598             REX.W movq [rbp-0x68],rax
0x27c1a074ffd7   197  e83df0ffff           call 0x27c1a074f019  (jump table)    ;; internal wasm call
0x27c1a074ffdc   19c  8b7dd0               movl rdi,[rbp-0x30]
0x27c1a074ffdf   19f  4c8b45c0             REX.W movq r8,[rbp-0x40]
0x27c1a074ffe3   1a3  458b8c38cc000000     movl r9,[r8+rdi*1+0xcc]
0x27c1a074ffeb   1ab  46898c07c8000000     movl [rdi+r8*1+0xc8],r9
0x27c1a074fff3   1b3  8d4f50               leal rcx,[rdi+0x50]
0x27c1a074fff6   1b6  8d97c8000000         leal rdx,[rdi+0xc8]
0x27c1a074fffc   1bc  48894da0             REX.W movq [rbp-0x60],rcx
0x27c1a0750000   1c0  488955a8             REX.W movq [rbp-0x58],rdx
0x27c1a0750004   1c4  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a0750008   1c8  33c0                 xorl rax,rax
0x27c1a075000a   1ca  8b5d98               movl rbx,[rbp-0x68]
0x27c1a075000d   1cd  e816f0ffff           call 0x27c1a074f028  (jump table)    ;; internal wasm call
0x27c1a0750012   1d2  85c0                 testl rax,rax
0x27c1a0750014   1d4  0f8c84010000         jl 0x27c1a075019e  <+0x35e>
0x27c1a075001a   1da  488b7dc0             REX.W movq rdi,[rbp-0x40]
0x27c1a075001e   1de  448b875c060000       movl r8,[rdi+0x65c]
0x27c1a0750025   1e5  448b8f10060000       movl r9,[rdi+0x610]
0x27c1a075002c   1ec  4c8945c8             REX.W movq [rbp-0x38],r8
0x27c1a0750030   1f0  4c894db8             REX.W movq [rbp-0x48],r9
0x27c1a0750034   1f4  83bf5806000000       cmpl [rdi+0x658],0x0
0x27c1a075003b   1fb  0f8f0e000000         jg 0x27c1a075004f  <+0x20f>
0x27c1a0750041   201  458bd9               movl r11,r9
0x27c1a0750044   204  4183e3df             andl r11,0xdf
0x27c1a0750048   208  44899f10060000       movl [rdi+0x610],r11
0x27c1a075004f   20f  83bf4006000000       cmpl [rdi+0x640],0x0
0x27c1a0750056   216  0f8536000000         jnz 0x27c1a0750092  <+0x252>
0x27c1a075005c   21c  c7874006000050000000 movl [rdi+0x640],0x50
0x27c1a0750066   226  c7872c06000000000000 movl [rdi+0x62c],0x0
0x27c1a0750070   230  48c7872006000000000000 REX.W movq [rdi+0x620],0x0
0x27c1a075007b   23b  448b9f3c060000       movl r11,[rdi+0x63c]
0x27c1a0750082   242  448b65d0             movl r12,[rbp-0x30]
0x27c1a0750086   246  4489a73c060000       movl [rdi+0x63c],r12
0x27c1a075008d   24d  e910000000           jmp 0x27c1a07500a2  <+0x262>
0x27c1a0750092   252  83bf2006000000       cmpl [rdi+0x620],0x0
0x27c1a0750099   259  0f8526000000         jnz 0x27c1a07500c5  <+0x285>
0x27c1a075009f   25f  4533db               xorl r11,r11
0x27c1a07500a2   262  b810060000           movl rax,0x610
0x27c1a07500a7   267  4c895db0             REX.W movq [rbp-0x50],r11
0x27c1a07500ab   26b  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a07500af   26f  e86aefffff           call 0x27c1a074f01e  (jump table)    ;; internal wasm call
0x27c1a07500b4   274  85c0                 testl rax,rax
0x27c1a07500b6   276  0f8527000000         jnz 0x27c1a07500e3  <+0x2a3>
0x27c1a07500bc   27c  448b5db0             movl r11,[rbp-0x50]
0x27c1a07500c0   280  e903000000           jmp 0x27c1a07500c8  <+0x288>
0x27c1a07500c5   285  4533db               xorl r11,r11
0x27c1a07500c8   288  4c895db0             REX.W movq [rbp-0x50],r11
0x27c1a07500cc   28c  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a07500d0   290  b810060000           movl rax,0x610
0x27c1a07500d5   295  8b55a8               movl rdx,[rbp-0x58]
0x27c1a07500d8   298  8b4da0               movl rcx,[rbp-0x60]
0x27c1a07500db   29b  8b5d98               movl rbx,[rbp-0x68]
0x27c1a07500de   29e  e845efffff           call 0x27c1a074f028  (jump table)    ;; internal wasm call
0x27c1a07500e3   2a3  448b5db0             movl r11,[rbp-0x50]
0x27c1a07500e7   2a7  4585db               testl r11,r11
0x27c1a07500ea   2aa  0f8509000000         jnz 0x27c1a07500f9  <+0x2b9>
0x27c1a07500f0   2b0  488b7dc0             REX.W movq rdi,[rbp-0x40]
0x27c1a07500f4   2b4  e988000000           jmp 0x27c1a0750181  <+0x341>
0x27c1a07500f9   2b9  488b7dc0             REX.W movq rdi,[rbp-0x40]
0x27c1a07500fd   2bd  448b8734060000       movl r8,[rdi+0x634]
0x27c1a0750104   2c4  4c8b4df0             REX.W movq r9,[rbp-0x10]
0x27c1a0750108   2c8  4d8b6147             REX.W movq r12,[r9+0x47]
0x27c1a075010c   2cc  4d8b793f             REX.W movq r15,[r9+0x3f]
0x27c1a0750110   2d0  418b410f             movl rax,[r9+0xf]
0x27c1a0750114   2d4  4903c6               REX.W addq rax,r14
0x27c1a0750117   2d7  428d1c8500000000     leal rbx,[r8*4+0x0]
0x27c1a075011f   2df  4d8b4937             REX.W movq r9,[r9+0x37]
0x27c1a0750123   2e3  4183f804             cmpl r8,0x4
0x27c1a0750127   2e7  0f83ee000000         jnc 0x27c1a075021b  <+0x3db>
0x27c1a075012d   2ed  458b241c             movl r12,[r12+rbx*1]
0x27c1a0750131   2f1  453921               cmpl [r9],r12
0x27c1a0750134   2f4  0f85dc000000         jnz 0x27c1a0750216  <+0x3d6>
0x27c1a075013a   2fa  428b748007           movl rsi,[rax+r8*4+0x7]
0x27c1a075013f   2ff  4903f6               REX.W addq rsi,r14
0x27c1a0750142   302  4f8b04c7             REX.W movq r8,[r15+r8*8]
0x27c1a0750146   306  33c9                 xorl rcx,rcx
0x27c1a0750148   308  b810060000           movl rax,0x610
0x27c1a075014d   30d  488bd1               REX.W movq rdx,rcx
0x27c1a0750150   310  41ffd0               call r8
0x27c1a0750153   313  488b7dc0             REX.W movq rdi,[rbp-0x40]
0x27c1a0750157   317  c7874006000000000000 movl [rdi+0x640],0x0
0x27c1a0750161   321  448b5db0             movl r11,[rbp-0x50]
0x27c1a0750165   325  44899f3c060000       movl [rdi+0x63c],r11
0x27c1a075016c   32c  c7872c06000000000000 movl [rdi+0x62c],0x0
0x27c1a0750176   336  48c7872006000000000000 REX.W movq [rdi+0x620],0x0
0x27c1a0750181   341  448b45b8             movl r8,[rbp-0x48]
0x27c1a0750185   345  4183e020             andl r8,0x20
0x27c1a0750189   349  448b8f10060000       movl r9,[rdi+0x610]
0x27c1a0750190   350  450bc1               orl r8,r9
0x27c1a0750193   353  44898710060000       movl [rdi+0x610],r8
0x27c1a075019a   35a  837dc800             cmpl [rbp-0x38],0x0
0x27c1a075019e   35e  8b7dd0               movl rdi,[rbp-0x30]
0x27c1a07501a1   361  81c7d0000000         addl rdi,0xd0
0x27c1a07501a7   367  4c8b45e8             REX.W movq r8,[rbp-0x18]
0x27c1a07501ab   36b  418938               movl [r8],rdi
0x27c1a07501ae   36e  8b7dd8               movl rdi,[rbp-0x28]
0x27c1a07501b1   371  83c710               addl rdi,0x10
0x27c1a07501b4   374  418938               movl [r8],rdi
0x27c1a07501b7   377  8b7de0               movl rdi,[rbp-0x20]
0x27c1a07501ba   37a  81c7509c0000         addl rdi,0x9c50
0x27c1a07501c0   380  418938               movl [r8],rdi
0x27c1a07501c3   383  33c0                 xorl rax,rax
0x27c1a07501c5   385  488be5               REX.W movq rsp,rbp
0x27c1a07501c8   388  5d                   pop rbp
0x27c1a07501c9   389  c3                   retl
0x27c1a07501ca   38a  48897dd0             REX.W movq [rbp-0x30],rdi
0x27c1a07501ce   38e  e83df1ffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a07501d3   393  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a07501d7   397  488b7dd0             REX.W movq rdi,[rbp-0x30]
0x27c1a07501db   39b  e978fcffff           jmp 0x27c1a074fe58  <+0x18>
0x27c1a07501e0   3a0  4c8965d8             REX.W movq [rbp-0x28],r12
0x27c1a07501e4   3a4  c5f8114580           vmovups [rbp-0x80],xmm0
0x27c1a07501e9   3a9  48897dd0             REX.W movq [rbp-0x30],rdi
0x27c1a07501ed   3ad  e81ef1ffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a07501f2   3b2  33d2                 xorl rdx,rdx
0x27c1a07501f4   3b4  4c8b4de8             REX.W movq r9,[rbp-0x18]
0x27c1a07501f8   3b8  448b5de0             movl r11,[rbp-0x20]
0x27c1a07501fc   3bc  4c8b45c0             REX.W movq r8,[rbp-0x40]
0x27c1a0750200   3c0  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a0750204   3c4  448b65d8             movl r12,[rbp-0x28]
0x27c1a0750208   3c8  c5f8104580           vmovups xmm0,[rbp-0x80]
0x27c1a075020d   3cd  488b7dd0             REX.W movq rdi,[rbp-0x30]
0x27c1a0750211   3d1  e9b7fcffff           jmp 0x27c1a074fecd  <+0x8d>
0x27c1a0750216   3d6  e8d5eeffff           call 0x27c1a074f0f0  (jump table)    ;; wasm stub: ThrowWasmTrapFuncSigMismatch
0x27c1a075021b   3db  e800efffff           call 0x27c1a074f120  (jump table)    ;; wasm stub: ThrowWasmTrapTableOutOfBounds
0x27c1a0750220   3e0  e86beeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0750225   3e5  e866eeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075022a   3ea  e861eeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075022f   3ef  e85ceeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0750234   3f4  e857eeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0750239   3f9  e852eeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075023e   3fe  e84deeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0750243   403  e848eeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0750248   408  e843eeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075024d   40d  e83eeeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0750252   412  e839eeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0750257   417  e834eeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075025c   41c  e82feeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0750261   421  e82aeeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0750266   426  e825eeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075026b   42b  e820eeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0750270   430  e81beeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0750275   435  e816eeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075027a   43a  e811eeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075027f   43f  e80ceeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0750284   444  e807eeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0750289   449  e802eeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075028e   44e  e8fdedffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0750293   453  90                   nop

Protected instructions:
 pc offset  land pad
       1ab       3e0
       1a3       3e5
       176       3ea
       164       3ef
       157       3f4
       14f       3f9
       144       3fe
       13c       403
       131       408
       129       40d
       11e       412
       10a       417
        ff       41c
        f8       421
        ed       426
        e7       42b
        dd       430
        bf       435
        b4       43a
        ad       43f
        a2       444
        9c       449
        92       44e

Source positions:
 pc offset  position
        92        31
        9c        56
        a2        64
        ad        89
        b4        97
        bf       122
        dd        31
        e7        56
        ed        64
        f8        89
        ff        97
       10a       122
       11e       145
       129       154
       131       163
       13c       172
       144       181
       14f       192
       157       201
       164       217
       176       238
       186       254
       19c       260
       1ab       264
       1bc       286
       262       408
       288       435
       306       457
       38a         0
       3a0        14
       3d6       457
       3e0       264
       3e5       260
       3ea       238
       3ef       217
       3f4       201
       3f9       192
       3fe       181
       403       172
       408       163
       40d       154
       412       145
       417       122
       41c        97
       421        89
       426        64
       42b        56
       430        31
       435       122
       43a        97
       43f        89
       444        64
       449        56
       44e        31

Safepoints (entries = 1, byte size = 13)
0x27c1a074ffdc    19c  slots (sp->fp): 000000000000000000000000

RelocInfo (size = 41)
0x27c1a074ffd8  internal wasm call
0x27c1a075000e  internal wasm call
0x27c1a07500b0  internal wasm call
0x27c1a07500df  internal wasm call
0x27c1a07501cf  wasm stub call
0x27c1a07501ee  wasm stub call
0x27c1a0750217  wasm stub call
0x27c1a075021c  wasm stub call
0x27c1a0750221  wasm stub call
0x27c1a0750226  wasm stub call
0x27c1a075022b  wasm stub call
0x27c1a0750230  wasm stub call
0x27c1a0750235  wasm stub call
0x27c1a075023a  wasm stub call
0x27c1a075023f  wasm stub call
0x27c1a0750244  wasm stub call
0x27c1a0750249  wasm stub call
0x27c1a075024e  wasm stub call
0x27c1a0750253  wasm stub call
0x27c1a0750258  wasm stub call
0x27c1a075025d  wasm stub call
0x27c1a0750262  wasm stub call
0x27c1a0750267  wasm stub call
0x27c1a075026c  wasm stub call
0x27c1a0750271  wasm stub call
0x27c1a0750276  wasm stub call
0x27c1a075027b  wasm stub call
0x27c1a0750280  wasm stub call
0x27c1a0750285  wasm stub call
0x27c1a075028a  wasm stub call
0x27c1a075028f  wasm stub call

--- End code ---
--- WebAssembly code ---
name: wasm-function[7]
index: 7
kind: wasm function
compiler: TurboFan
Body (size = 640 = 608 + 32 padding)
Instructions (size = 596)
0x27c1a07502c0     0  55                   push rbp
0x27c1a07502c1     1  4889e5               REX.W movq rbp,rsp
0x27c1a07502c4     4  6a08                 push 0x8
0x27c1a07502c6     6  56                   push rsi
0x27c1a07502c7     7  4883ec28             REX.W subq rsp,0x28
0x27c1a07502cb     b  488b5e1f             REX.W movq rbx,[rsi+0x1f]
0x27c1a07502cf     f  48c1eb18             REX.W shrq rbx, 24
0x27c1a07502d3    13  4903de               REX.W addq rbx,r14
0x27c1a07502d6    16  85c9                 testl rcx,rcx
0x27c1a07502d8    18  0f846b010000         jz 0x27c1a0750449  <+0x189>
0x27c1a07502de    1e  8d3c08               leal rdi,[rax+rcx*1]
0x27c1a07502e1    21  448bc0               movl r8,rax
0x27c1a07502e4    24  448d4fff             leal r9,[rdi-0x1]
0x27c1a07502e8    28  42881403             movb [rbx+r8*1],dl
0x27c1a07502ec    2c  4288140b             movb [rbx+r9*1],dl
0x27c1a07502f0    30  83f903               cmpl rcx,0x3
0x27c1a07502f3    33  0f8250010000         jc 0x27c1a0750449  <+0x189>
0x27c1a07502f9    39  4188541802           movb [r8+rbx*1+0x2],dl
0x27c1a07502fe    3e  448d4ffd             leal r9,[rdi-0x3]
0x27c1a0750302    42  4188541801           movb [r8+rbx*1+0x1],dl
0x27c1a0750307    47  448d5ffe             leal r11,[rdi-0x2]
0x27c1a075030b    4b  4288140b             movb [rbx+r9*1],dl
0x27c1a075030f    4f  4288141b             movb [rbx+r11*1],dl
0x27c1a0750313    53  83f907               cmpl rcx,0x7
0x27c1a0750316    56  0f822d010000         jc 0x27c1a0750449  <+0x189>
0x27c1a075031c    5c  83ef04               subl rdi,0x4
0x27c1a075031f    5f  4188541803           movb [r8+rbx*1+0x3],dl
0x27c1a0750324    64  88143b               movb [rbx+rdi*1],dl
0x27c1a0750327    67  83f909               cmpl rcx,0x9
0x27c1a075032a    6a  0f8219010000         jc 0x27c1a0750449  <+0x189>
0x27c1a0750330    70  8bf8                 movl rdi,rax
0x27c1a0750332    72  f7df                 negl rdi
0x27c1a0750334    74  83e703               andl rdi,0x3
0x27c1a0750337    77  03c7                 addl rax,rdi
0x27c1a0750339    79  0fb6d2               movzxbl rdx,rdx
0x27c1a075033c    7c  69d201010101         imull rdx,rdx,0x1010101
0x27c1a0750342    82  2bcf                 subl rcx,rdi
0x27c1a0750344    84  83e1fc               andl rcx,0xfc
0x27c1a0750347    87  8d3c08               leal rdi,[rax+rcx*1]
0x27c1a075034a    8a  448d47fc             leal r8,[rdi-0x4]
0x27c1a075034e    8e  891403               movl [rbx+rax*1],rdx
0x27c1a0750351    91  42891403             movl [rbx+r8*1],rdx
0x27c1a0750355    95  83f909               cmpl rcx,0x9
0x27c1a0750358    98  0f82eb000000         jc 0x27c1a0750449  <+0x189>
0x27c1a075035e    9e  89541808             movl [rax+rbx*1+0x8],rdx
0x27c1a0750362    a2  448d47f8             leal r8,[rdi-0x8]
0x27c1a0750366    a6  89541804             movl [rax+rbx*1+0x4],rdx
0x27c1a075036a    aa  448d4ff4             leal r9,[rdi-0xc]
0x27c1a075036e    ae  42891403             movl [rbx+r8*1],rdx
0x27c1a0750372    b2  4289140b             movl [rbx+r9*1],rdx
0x27c1a0750376    b6  83f919               cmpl rcx,0x19
0x27c1a0750379    b9  0f82ca000000         jc 0x27c1a0750449  <+0x189>
0x27c1a075037f    bf  448bc0               movl r8,rax
0x27c1a0750382    c2  4183e004             andl r8,0x4
0x27c1a0750386    c6  4183c818             orl r8,0x18
0x27c1a075038a    ca  412bc8               subl rcx,r8
0x27c1a075038d    cd  89541818             movl [rax+rbx*1+0x18],rdx
0x27c1a0750391    d1  89541814             movl [rax+rbx*1+0x14],rdx
0x27c1a0750395    d5  89541810             movl [rax+rbx*1+0x10],rdx
0x27c1a0750399    d9  448d4ff0             leal r9,[rdi-0x10]
0x27c1a075039d    dd  8954180c             movl [rax+rbx*1+0xc],rdx
0x27c1a07503a1    e1  448d5fec             leal r11,[rdi-0x14]
0x27c1a07503a5    e5  4289140b             movl [rbx+r9*1],rdx
0x27c1a07503a9    e9  448d4fe8             leal r9,[rdi-0x18]
0x27c1a07503ad    ed  4289141b             movl [rbx+r11*1],rdx
0x27c1a07503b1    f1  83ef1c               subl rdi,0x1c
0x27c1a07503b4    f4  4289140b             movl [rbx+r9*1],rdx
0x27c1a07503b8    f8  89143b               movl [rbx+rdi*1],rdx
0x27c1a07503bb    fb  83f920               cmpl rcx,0x20
0x27c1a07503be    fe  0f8285000000         jc 0x27c1a0750449  <+0x189>
0x27c1a07503c4   104  4103c0               addl rax,r8
0x27c1a07503c7   107  488b762f             REX.W movq rsi,[rsi+0x2f]
0x27c1a07503cb   10b  48bf0100000001000000 REX.W movq rdi,0x100000001
0x27c1a07503d5   115  480faffa             REX.W imulq rdi,rdx
0x27c1a07503d9   119  e925000000           jmp 0x27c1a0750403  <+0x143>
0x27c1a07503de   11e  660f1f840000000000   nop
0x27c1a07503e7   127  660f1f840000000000   nop
0x27c1a07503f0   130  660f1f840000000000   nop
0x27c1a07503f9   139  0f1f8000000000       nop
0x27c1a0750400   140  83c020               addl rax,0x20
0x27c1a0750403   143  483b26               REX.W cmpq rsp,[rsi]
0x27c1a0750406   146  0f8642000000         jna 0x27c1a075044e  <+0x18e>
0x27c1a075040c   14c  48897c1818           REX.W movq [rax+rbx*1+0x18],rdi
0x27c1a0750411   151  48897c1810           REX.W movq [rax+rbx*1+0x10],rdi
0x27c1a0750416   156  48897c1808           REX.W movq [rax+rbx*1+0x8],rdi
0x27c1a075041b   15b  48893c03             REX.W movq [rbx+rax*1],rdi
0x27c1a075041f   15f  8d51e0               leal rdx,[rcx-0x20]
0x27c1a0750422   162  83fa1f               cmpl rdx,0x1f
0x27c1a0750425   165  0f861e000000         jna 0x27c1a0750449  <+0x189>
0x27c1a075042b   16b  83c020               addl rax,0x20
0x27c1a075042e   16e  48897c1818           REX.W movq [rax+rbx*1+0x18],rdi
0x27c1a0750433   173  48897c1810           REX.W movq [rax+rbx*1+0x10],rdi
0x27c1a0750438   178  48897c1808           REX.W movq [rax+rbx*1+0x8],rdi
0x27c1a075043d   17d  48893c03             REX.W movq [rbx+rax*1],rdi
0x27c1a0750441   181  8d4ae0               leal rcx,[rdx-0x20]
0x27c1a0750444   184  83f91f               cmpl rcx,0x1f
0x27c1a0750447   187  77b7                 ja 0x27c1a0750400  <+0x140>
0x27c1a0750449   189  488be5               REX.W movq rsp,rbp
0x27c1a075044c   18c  5d                   pop rbp
0x27c1a075044d   18d  c3                   retl
0x27c1a075044e   18e  48895de8             REX.W movq [rbp-0x18],rbx
0x27c1a0750452   192  48897de0             REX.W movq [rbp-0x20],rdi
0x27c1a0750456   196  488945d8             REX.W movq [rbp-0x28],rax
0x27c1a075045a   19a  48894dd0             REX.W movq [rbp-0x30],rcx
0x27c1a075045e   19e  488975c8             REX.W movq [rbp-0x38],rsi
0x27c1a0750462   1a2  e8a9eeffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a0750467   1a7  488b5de8             REX.W movq rbx,[rbp-0x18]
0x27c1a075046b   1ab  488b7de0             REX.W movq rdi,[rbp-0x20]
0x27c1a075046f   1af  8b45d8               movl rax,[rbp-0x28]
0x27c1a0750472   1b2  8b4dd0               movl rcx,[rbp-0x30]
0x27c1a0750475   1b5  488b75c8             REX.W movq rsi,[rbp-0x38]
0x27c1a0750479   1b9  eb91                 jmp 0x27c1a075040c  <+0x14c>
0x27c1a075047b   1bb  e810ecffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0750480   1c0  e80becffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0750485   1c5  e806ecffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075048a   1ca  e801ecffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075048f   1cf  e8fcebffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0750494   1d4  e8f7ebffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0750499   1d9  e8f2ebffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075049e   1de  e8edebffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07504a3   1e3  e8e8ebffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07504a8   1e8  e8e3ebffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07504ad   1ed  e8deebffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07504b2   1f2  e8d9ebffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07504b7   1f7  e8d4ebffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07504bc   1fc  e8cfebffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07504c1   201  e8caebffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07504c6   206  e8c5ebffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07504cb   20b  e8c0ebffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07504d0   210  e8bbebffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07504d5   215  e8b6ebffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07504da   21a  e8b1ebffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07504df   21f  e8acebffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07504e4   224  e8a7ebffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07504e9   229  e8a2ebffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07504ee   22e  e89debffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07504f3   233  e898ebffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07504f8   238  e893ebffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07504fd   23d  e88eebffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0750502   242  e889ebffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0750507   247  e884ebffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075050c   24c  e87febffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0750511   251  90                   nop
0x27c1a0750512   252  6690                 nop

Protected instructions:
 pc offset  land pad
       17d       1bb
       178       1c0
       173       1c5
       16e       1ca
       15b       1cf
       156       1d4
       151       1d9
       14c       1de
        f8       1e3
        f4       1e8
        ed       1ed
        e5       1f2
        dd       1f7
        d5       1fc
        d1       201
        cd       206
        b2       20b
        ae       210
        a6       215
        9e       21a
        91       21f
        8e       224
        64       229
        5f       22e
        4f       233
        4b       238
        42       23d
        39       242
        2c       247
        28       24c

Source positions:
 pc offset  position
        28        16
        2c        31
        39        45
        42        52
        4b        62
        4f        72
        5f        86
        64        96
        8e       135
        91       158
        9e       172
        a6       179
        ae       189
        b2       199
        cd       213
        d1       220
        d5       227
        dd       234
        e5       244
        ed       254
        f4       264
        f8       274
       14c       322
       151       329
       156       336
       15b       343
       16e       322
       173       329
       178       336
       17d       343
       18e       316
       1bb       343
       1c0       336
       1c5       329
       1ca       322
       1cf       343
       1d4       336
       1d9       329
       1de       322
       1e3       274
       1e8       264
       1ed       254
       1f2       244
       1f7       234
       1fc       227
       201       220
       206       213
       20b       199
       210       189
       215       179
       21a       172
       21f       158
       224       135
       229        96
       22e        86
       233        72
       238        62
       23d        52
       242        45
       247        31
       24c        16

Safepoints (entries = 1, byte size = 12)
0x27c1a0750467    1a7  slots (sp->fp): 0000000000000000

RelocInfo (size = 33)
0x27c1a0750463  wasm stub call
0x27c1a075047c  wasm stub call
0x27c1a0750481  wasm stub call
0x27c1a0750486  wasm stub call
0x27c1a075048b  wasm stub call
0x27c1a0750490  wasm stub call
0x27c1a0750495  wasm stub call
0x27c1a075049a  wasm stub call
0x27c1a075049f  wasm stub call
0x27c1a07504a4  wasm stub call
0x27c1a07504a9  wasm stub call
0x27c1a07504ae  wasm stub call
0x27c1a07504b3  wasm stub call
0x27c1a07504b8  wasm stub call
0x27c1a07504bd  wasm stub call
0x27c1a07504c2  wasm stub call
0x27c1a07504c7  wasm stub call
0x27c1a07504cc  wasm stub call
0x27c1a07504d1  wasm stub call
0x27c1a07504d6  wasm stub call
0x27c1a07504db  wasm stub call
0x27c1a07504e0  wasm stub call
0x27c1a07504e5  wasm stub call
0x27c1a07504ea  wasm stub call
0x27c1a07504ef  wasm stub call
0x27c1a07504f4  wasm stub call
0x27c1a07504f9  wasm stub call
0x27c1a07504fe  wasm stub call
0x27c1a0750503  wasm stub call
0x27c1a0750508  wasm stub call
0x27c1a075050d  wasm stub call

--- End code ---
--- WebAssembly code ---
name: wasm-function[10]
index: 10
kind: wasm function
compiler: TurboFan
Body (size = 10880 = 10872 + 8 padding)
Instructions (size = 10856)
0x27c1a0750540     0  55                   push rbp
0x27c1a0750541     1  4889e5               REX.W movq rbp,rsp
0x27c1a0750544     4  6a08                 push 0x8
0x27c1a0750546     6  56                   push rsi
0x27c1a0750547     7  4881eca8000000       REX.W subq rsp,0xa8
0x27c1a075054e     e  488b7e2f             REX.W movq rdi,[rsi+0x2f]
0x27c1a0750552    12  48894598             REX.W movq [rbp-0x68],rax
0x27c1a0750556    16  48895dc0             REX.W movq [rbp-0x40],rbx
0x27c1a075055a    1a  48894da8             REX.W movq [rbp-0x58],rcx
0x27c1a075055e    1e  488955b0             REX.W movq [rbp-0x50],rdx
0x27c1a0750562    22  48897db8             REX.W movq [rbp-0x48],rdi
0x27c1a0750566    26  483b27               REX.W cmpq rsp,[rdi]
0x27c1a0750569    29  0f861c220000         jna 0x27c1a075278b  <+0x224b>
0x27c1a075056f    2f  4c8b461f             REX.W movq r8,[rsi+0x1f]
0x27c1a0750573    33  49c1e818             REX.W shrq r8, 24
0x27c1a0750577    37  4d03c6               REX.W addq r8,r14
0x27c1a075057a    3a  4c8b5e4f             REX.W movq r11,[rsi+0x4f]
0x27c1a075057e    3e  49c1eb18             REX.W shrq r11, 24
0x27c1a0750582    42  4d03de               REX.W addq r11,r14
0x27c1a0750585    45  458b23               movl r12,[r11]
0x27c1a0750588    48  4183ec50             subl r12,0x50
0x27c1a075058c    4c  458923               movl [r11],r12
0x27c1a075058f    4f  43c744044c11040000   movl [r12+r8*1+0x4c],0x411
0x27c1a0750598    58  4c8945d8             REX.W movq [rbp-0x28],r8
0x27c1a075059c    5c  4c895de8             REX.W movq [rbp-0x18],r11
0x27c1a07505a0    60  4c8965e0             REX.W movq [rbp-0x20],r12
0x27c1a07505a4    64  4531e4               xorl r12,r12
0x27c1a07505a7    67  41b911040000         movl r9,0x411
0x27c1a07505ad    6d  4d89e7               REX.W movq r15,r12
0x27c1a07505b0    70  4c8965a0             REX.W movq [rbp-0x60],r12
0x27c1a07505b4    74  4d8bd9               REX.W movq r11,r9
0x27c1a07505b7    77  e911000000           jmp 0x27c1a07505cd  <+0x8d>
0x27c1a07505bc    7c  0f1f4000             nop
0x27c1a07505c0    80  4589e3               movl r11,r12
0x27c1a07505c3    83  458be7               movl r12,r15
0x27c1a07505c6    86  448bbd48ffffff       movl r15,[rbp-0xb8]
0x27c1a07505cd    8d  483b27               REX.W cmpq rsp,[rdi]
0x27c1a07505d0    90  0f86d3210000         jna 0x27c1a07527a9  <+0x2269>
0x27c1a07505d6    96  418bdf               movl rbx,r15
0x27c1a07505d9    99  81f3ffffff7f         xorl rbx,0x7fffffff
0x27c1a07505df    9f  4439e3               cmpl rbx,r12
0x27c1a07505e2    a2  0f8c74210000         jl 0x27c1a075275c  <+0x221c>
0x27c1a07505e8    a8  4501e7               addl r15,r12
0x27c1a07505eb    ab  470fb62418           movzxbl r12,[r8+r11*1]
0x27c1a07505f0    b0  4c89bd48ffffff       REX.W movq [rbp-0xb8],r15
0x27c1a07505f7    b7  4585e4               testl r12,r12
0x27c1a07505fa    ba  0f848e1f0000         jz 0x27c1a075258e  <+0x204e>
0x27c1a0750600    c0  4c89e3               REX.W movq rbx,r12
0x27c1a0750603    c3  458be3               movl r12,r11
0x27c1a0750606    c6  e93f000000           jmp 0x27c1a075064a  <+0x10a>
0x27c1a075060b    cb  660f1f840000000000   nop
0x27c1a0750614    d4  660f1f840000000000   nop
0x27c1a075061d    dd  660f1f840000000000   nop
0x27c1a0750626    e6  660f1f840000000000   nop
0x27c1a075062f    ef  660f1f840000000000   nop
0x27c1a0750638    f8  0f1f840000000000     nop
0x27c1a0750640   100  430fb65c2001         movzxbl rbx,[r8+r12*1+0x1]
0x27c1a0750646   106  4183c401             addl r12,0x1
0x27c1a075064a   10a  483b27               REX.W cmpq rsp,[rdi]
0x27c1a075064d   10d  0f8699210000         jna 0x27c1a07527ec  <+0x22ac>
0x27c1a0750653   113  4c8bfb               REX.W movq r15,rbx
0x27c1a0750656   116  4181e7ff000000       andl r15,0xff
0x27c1a075065d   11d  0f840b000000         jz 0x27c1a075066e  <+0x12e>
0x27c1a0750663   123  80fb25               cmpb bl,0x25
0x27c1a0750666   126  0f840a000000         jz 0x27c1a0750676  <+0x136>
0x27c1a075066c   12c  ebd2                 jmp 0x27c1a0750640  <+0x100>
0x27c1a075066e   12e  4589e7               movl r15,r12
0x27c1a0750671   131  e9d8000000           jmp 0x27c1a075074e  <+0x20e>
0x27c1a0750676   136  4589e7               movl r15,r12
0x27c1a0750679   139  0f1f8000000000       nop
0x27c1a0750680   140  483b27               REX.W cmpq rsp,[rdi]
0x27c1a0750683   143  0f8699210000         jna 0x27c1a0752822  <+0x22e2>
0x27c1a0750689   149  430fb65c3801         movzxbl rbx,[r8+r15*1+0x1]
0x27c1a075068f   14f  83fb25               cmpl rbx,0x25
0x27c1a0750692   152  0f85a2000000         jnz 0x27c1a075073a  <+0x1fa>
0x27c1a0750698   158  4183c401             addl r12,0x1
0x27c1a075069c   15c  418d5f02             leal rbx,[r15+0x2]
0x27c1a07506a0   160  470fb67c3802         movzxbl r15,[r8+r15*1+0x2]
0x27c1a07506a6   166  4183ff25             cmpl r15,0x25
0x27c1a07506aa   16a  0f8598000000         jnz 0x27c1a0750748  <+0x208>
0x27c1a07506b0   170  450fb67c1801         movzxbl r15,[r8+rbx*1+0x1]
0x27c1a07506b6   176  4183ff25             cmpl r15,0x25
0x27c1a07506ba   17a  0f856a000000         jnz 0x27c1a075072a  <+0x1ea>
0x27c1a07506c0   180  4183c401             addl r12,0x1
0x27c1a07506c4   184  448d7b02             leal r15,[rbx+0x2]
0x27c1a07506c8   188  410fb65c1802         movzxbl rbx,[r8+rbx*1+0x2]
0x27c1a07506ce   18e  83fb25               cmpl rbx,0x25
0x27c1a07506d1   191  0f855b000000         jnz 0x27c1a0750732  <+0x1f2>
0x27c1a07506d7   197  430fb65c3801         movzxbl rbx,[r8+r15*1+0x1]
0x27c1a07506dd   19d  83fb25               cmpl rbx,0x25
0x27c1a07506e0   1a0  0f8554000000         jnz 0x27c1a075073a  <+0x1fa>
0x27c1a07506e6   1a6  4183c401             addl r12,0x1
0x27c1a07506ea   1aa  418d5f02             leal rbx,[r15+0x2]
0x27c1a07506ee   1ae  470fb67c3802         movzxbl r15,[r8+r15*1+0x2]
0x27c1a07506f4   1b4  4183ff25             cmpl r15,0x25
0x27c1a07506f8   1b8  0f854a000000         jnz 0x27c1a0750748  <+0x208>
0x27c1a07506fe   1be  450fb67c1801         movzxbl r15,[r8+rbx*1+0x1]
0x27c1a0750704   1c4  4183ff25             cmpl r15,0x25
0x27c1a0750708   1c8  0f851c000000         jnz 0x27c1a075072a  <+0x1ea>
0x27c1a075070e   1ce  4183c401             addl r12,0x1
0x27c1a0750712   1d2  448d7b02             leal r15,[rbx+0x2]
0x27c1a0750716   1d6  410fb65c1802         movzxbl rbx,[r8+rbx*1+0x2]
0x27c1a075071c   1dc  83fb25               cmpl rbx,0x25
0x27c1a075071f   1df  0f845bffffff         jz 0x27c1a0750680  <+0x140>
0x27c1a0750725   1e5  e908000000           jmp 0x27c1a0750732  <+0x1f2>
0x27c1a075072a   1ea  448bfb               movl r15,rbx
0x27c1a075072d   1ed  e908000000           jmp 0x27c1a075073a  <+0x1fa>
0x27c1a0750732   1f2  418bdf               movl rbx,r15
0x27c1a0750735   1f5  e90e000000           jmp 0x27c1a0750748  <+0x208>
0x27c1a075073a   1fa  4d8bd7               REX.W movq r10,r15
0x27c1a075073d   1fd  4d89e7               REX.W movq r15,r12
0x27c1a0750740   200  4d8be2               REX.W movq r12,r10
0x27c1a0750743   203  e906000000           jmp 0x27c1a075074e  <+0x20e>
0x27c1a0750748   208  4589e7               movl r15,r12
0x27c1a075074b   20b  448be3               movl r12,rbx
0x27c1a075074e   20e  8b9d48ffffff         movl rbx,[rbp-0xb8]
0x27c1a0750754   214  81f3ffffff7f         xorl rbx,0x7fffffff
0x27c1a075075a   21a  452bfb               subl r15,r11
0x27c1a075075d   21d  4c8965d0             REX.W movq [rbp-0x30],r12
0x27c1a0750761   221  48895d80             REX.W movq [rbp-0x80],rbx
0x27c1a0750765   225  4c89bd50ffffff       REX.W movq [rbp-0xb0],r15
0x27c1a075076c   22c  413bdf               cmpl rbx,r15
0x27c1a075076f   22f  0f8ce71f0000         jl 0x27c1a075275c  <+0x221c>
0x27c1a0750775   235  4c899d70ffffff       REX.W movq [rbp-0x90],r11
0x27c1a075077c   23c  85c0                 testl rax,rax
0x27c1a075077e   23e  0f842f000000         jz 0x27c1a07507b3  <+0x273>
0x27c1a0750784   244  418bcf               movl rcx,r15
0x27c1a0750787   247  418bd3               movl rdx,r11
0x27c1a075078a   24a  e89ee8ffff           call 0x27c1a074f02d  (jump table)    ;; internal wasm call
0x27c1a075078f   24f  4c8b45d8             REX.W movq r8,[rbp-0x28]
0x27c1a0750793   253  488b7db8             REX.W movq rdi,[rbp-0x48]
0x27c1a0750797   257  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a075079b   25b  8b4598               movl rax,[rbp-0x68]
0x27c1a075079e   25e  8b5d80               movl rbx,[rbp-0x80]
0x27c1a07507a1   261  448b9d70ffffff       movl r11,[rbp-0x90]
0x27c1a07507a8   268  448b65d0             movl r12,[rbp-0x30]
0x27c1a07507ac   26c  448bbd50ffffff       movl r15,[rbp-0xb0]
0x27c1a07507b3   273  4585ff               testl r15,r15
0x27c1a07507b6   276  0f8504feffff         jnz 0x27c1a07505c0  <+0x80>
0x27c1a07507bc   27c  4489e2               movl rdx,r12
0x27c1a07507bf   27f  4d8be0               REX.W movq r12,r8
0x27c1a07507c2   282  448b45e0             movl r8,[rbp-0x20]
0x27c1a07507c6   286  438954204c           movl [r8+r12*1+0x4c],rdx
0x27c1a07507cb   28b  450fbe7c1401         movsxbl r15,[r12+rdx*1+0x1]
0x27c1a07507d1   291  4183ef30             subl r15,0x30
0x27c1a07507d5   295  4183ff0a             cmpl r15,0xa
0x27c1a07507d9   299  0f833e000000         jnc 0x27c1a075081d  <+0x2dd>
0x27c1a07507df   29f  450fb67c1402         movzxbl r15,[r12+rdx*1+0x2]
0x27c1a07507e5   2a5  4183ff24             cmpl r15,0x24
0x27c1a07507e9   2a9  0f8412000000         jz 0x27c1a0750801  <+0x2c1>
0x27c1a07507ef   2af  448d7a01             leal r15,[rdx+0x1]
0x27c1a07507f3   2b3  418bd7               movl rdx,r15
0x27c1a07507f6   2b6  41bfffffffff         movl r15,0xffffffff
0x27c1a07507fc   2bc  e929000000           jmp 0x27c1a075082a  <+0x2ea>
0x27c1a0750801   2c1  450fbe7c1401         movsxbl r15,[r12+rdx*1+0x1]
0x27c1a0750807   2c7  4183ef30             subl r15,0x30
0x27c1a075080b   2cb  83c203               addl rdx,0x3
0x27c1a075080e   2ce  41b901000000         movl r9,0x1
0x27c1a0750814   2d4  4c894da0             REX.W movq [rbp-0x60],r9
0x27c1a0750818   2d8  e90d000000           jmp 0x27c1a075082a  <+0x2ea>
0x27c1a075081d   2dd  448d7a01             leal r15,[rdx+0x1]
0x27c1a0750821   2e1  418bd7               movl rdx,r15
0x27c1a0750824   2e4  41bfffffffff         movl r15,0xffffffff
0x27c1a075082a   2ea  438954204c           movl [r8+r12*1+0x4c],rdx
0x27c1a075082f   2ef  450fbe0c14           movsxbl r9,[r12+rdx*1]
0x27c1a0750834   2f4  458d59e0             leal r11,[r9-0x20]
0x27c1a0750838   2f8  4c897d90             REX.W movq [rbp-0x70],r15
0x27c1a075083c   2fc  4183fb1f             cmpl r11,0x1f
0x27c1a0750840   300  0f8719000000         ja 0x27c1a075085f  <+0x31f>
0x27c1a0750846   306  418bcb               movl rcx,r11
0x27c1a0750849   309  41bb01000000         movl r11,0x1
0x27c1a075084f   30f  41d3e3               shll r11, cl
0x27c1a0750852   312  41f7c389280100       testl r11,0x12889
0x27c1a0750859   319  0f8508000000         jnz 0x27c1a0750867  <+0x327>
0x27c1a075085f   31f  4533db               xorl r11,r11
0x27c1a0750862   322  e94d010000           jmp 0x27c1a07509b4  <+0x474>
0x27c1a0750867   327  4c8bcf               REX.W movq r9,rdi
0x27c1a075086a   32a  33ff                 xorl rdi,rdi
0x27c1a075086c   32c  e912000000           jmp 0x27c1a0750883  <+0x343>
0x27c1a0750871   331  660f1f840000000000   nop
0x27c1a075087a   33a  660f1f440000         nop
0x27c1a0750880   340  458bdf               movl r11,r15
0x27c1a0750883   343  493b21               REX.W cmpq rsp,[r9]
0x27c1a0750886   346  0f86cd1f0000         jna 0x27c1a0752859  <+0x2319>
0x27c1a075088c   34c  8d4a01               leal rcx,[rdx+0x1]
0x27c1a075088f   34f  43894c204c           movl [r8+r12*1+0x4c],rcx
0x27c1a0750894   354  410fbe541401         movsxbl rdx,[r12+rdx*1+0x1]
0x27c1a075089a   35a  448d7ae0             leal r15,[rdx-0x20]
0x27c1a075089e   35e  440bdf               orl r11,rdi
0x27c1a07508a1   361  4183ff20             cmpl r15,0x20
0x27c1a07508a5   365  0f8301010000         jnc 0x27c1a07509ac  <+0x46c>
0x27c1a07508ab   36b  4c8bd1               REX.W movq r10,rcx
0x27c1a07508ae   36e  498bcf               REX.W movq rcx,r15
0x27c1a07508b1   371  4d8bfa               REX.W movq r15,r10
0x27c1a07508b4   374  bf01000000           movl rdi,0x1
0x27c1a07508b9   379  d3e7                 shll rdi, cl
0x27c1a07508bb   37b  f7c789280100         testl rdi,0x12889
0x27c1a07508c1   381  0f84ba000000         jz 0x27c1a0750981  <+0x441>
0x27c1a07508c7   387  418d5701             leal rdx,[r15+0x1]
0x27c1a07508cb   38b  438954204c           movl [r8+r12*1+0x4c],rdx
0x27c1a07508d0   390  470fbe7c3c01         movsxbl r15,[r12+r15*1+0x1]
0x27c1a07508d6   396  418d4fe0             leal rcx,[r15-0x20]
0x27c1a07508da   39a  410bfb               orl rdi,r11
0x27c1a07508dd   39d  83f920               cmpl rcx,0x20
0x27c1a07508e0   3a0  0f83be000000         jnc 0x27c1a07509a4  <+0x464>
0x27c1a07508e6   3a6  41bb01000000         movl r11,0x1
0x27c1a07508ec   3ac  41d3e3               shll r11, cl
0x27c1a07508ef   3af  41f7c389280100       testl r11,0x12889
0x27c1a07508f6   3b6  0f846b000000         jz 0x27c1a0750967  <+0x427>
0x27c1a07508fc   3bc  448d7a01             leal r15,[rdx+0x1]
0x27c1a0750900   3c0  47897c204c           movl [r8+r12*1+0x4c],r15
0x27c1a0750905   3c5  410fbe541401         movsxbl rdx,[r12+rdx*1+0x1]
0x27c1a075090b   3cb  8d4ae0               leal rcx,[rdx-0x20]
0x27c1a075090e   3ce  440bdf               orl r11,rdi
0x27c1a0750911   3d1  83f920               cmpl rcx,0x20
0x27c1a0750914   3d4  0f8382000000         jnc 0x27c1a075099c  <+0x45c>
0x27c1a075091a   3da  bf01000000           movl rdi,0x1
0x27c1a075091f   3df  d3e7                 shll rdi, cl
0x27c1a0750921   3e1  f7c789280100         testl rdi,0x12889
0x27c1a0750927   3e7  0f8454000000         jz 0x27c1a0750981  <+0x441>
0x27c1a075092d   3ed  410bfb               orl rdi,r11
0x27c1a0750930   3f0  418d5701             leal rdx,[r15+0x1]
0x27c1a0750934   3f4  438954204c           movl [r8+r12*1+0x4c],rdx
0x27c1a0750939   3f9  470fbe5c3c01         movsxbl r11,[r12+r15*1+0x1]
0x27c1a075093f   3ff  418d4be0             leal rcx,[r11-0x20]
0x27c1a0750943   403  83f920               cmpl rcx,0x20
0x27c1a0750946   406  0f8343000000         jnc 0x27c1a075098f  <+0x44f>
0x27c1a075094c   40c  41bf01000000         movl r15,0x1
0x27c1a0750952   412  41d3e7               shll r15, cl
0x27c1a0750955   415  41f7c789280100       testl r15,0x12889
0x27c1a075095c   41c  0f851effffff         jnz 0x27c1a0750880  <+0x340>
0x27c1a0750962   422  e911000000           jmp 0x27c1a0750978  <+0x438>
0x27c1a0750967   427  448bd2               movl r10,rdx
0x27c1a075096a   42a  498bd7               REX.W movq rdx,r15
0x27c1a075096d   42d  458bfa               movl r15,r10
0x27c1a0750970   430  448bdf               movl r11,rdi
0x27c1a0750973   433  e909000000           jmp 0x27c1a0750981  <+0x441>
0x27c1a0750978   438  448bfa               movl r15,rdx
0x27c1a075097b   43b  498bd3               REX.W movq rdx,r11
0x27c1a075097e   43e  448bdf               movl r11,rdi
0x27c1a0750981   441  498bf9               REX.W movq rdi,r9
0x27c1a0750984   444  448bca               movl r9,rdx
0x27c1a0750987   447  418bd7               movl rdx,r15
0x27c1a075098a   44a  e925000000           jmp 0x27c1a07509b4  <+0x474>
0x27c1a075098f   44f  8bca                 movl rcx,rdx
0x27c1a0750991   451  498bd3               REX.W movq rdx,r11
0x27c1a0750994   454  448bdf               movl r11,rdi
0x27c1a0750997   457  e910000000           jmp 0x27c1a07509ac  <+0x46c>
0x27c1a075099c   45c  418bcf               movl rcx,r15
0x27c1a075099f   45f  e908000000           jmp 0x27c1a07509ac  <+0x46c>
0x27c1a07509a4   464  8bca                 movl rcx,rdx
0x27c1a07509a6   466  498bd7               REX.W movq rdx,r15
0x27c1a07509a9   469  448bdf               movl r11,rdi
0x27c1a07509ac   46c  498bf9               REX.W movq rdi,r9
0x27c1a07509af   46f  448bca               movl r9,rdx
0x27c1a07509b2   472  8bd1                 movl rdx,rcx
0x27c1a07509b4   474  4c899d50ffffff       REX.W movq [rbp-0xb0],r11
0x27c1a07509bb   47b  4183f92a             cmpl r9,0x2a
0x27c1a07509bf   47f  0f844a000000         jz 0x27c1a0750a0f  <+0x4cf>
0x27c1a07509c5   485  458d784c             leal r15,[r8+0x4c]
0x27c1a07509c9   489  418bc7               movl rax,r15
0x27c1a07509cc   48c  e861e6ffff           call 0x27c1a074f032  (jump table)    ;; internal wasm call
0x27c1a07509d1   491  85c0                 testl rax,rax
0x27c1a07509d3   493  0f8c011d0000         jl 0x27c1a07526da  <+0x219a>
0x27c1a07509d9   499  8b7de0               movl rdi,[rbp-0x20]
0x27c1a07509dc   49c  4c8b45d8             REX.W movq r8,[rbp-0x28]
0x27c1a07509e0   4a0  458b5c384c           movl r11,[r8+rdi*1+0x4c]
0x27c1a07509e5   4a5  448bf8               movl r15,rax
0x27c1a07509e8   4a8  418bd3               movl rdx,r11
0x27c1a07509eb   4ab  448b9d50ffffff       movl r11,[rbp-0xb0]
0x27c1a07509f2   4b2  448b4da0             movl r9,[rbp-0x60]
0x27c1a07509f6   4b6  4d8be0               REX.W movq r12,r8
0x27c1a07509f9   4b9  448bc7               movl r8,rdi
0x27c1a07509fc   4bc  488b7db8             REX.W movq rdi,[rbp-0x48]
0x27c1a0750a00   4c0  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a0750a04   4c4  8b4598               movl rax,[rbp-0x68]
0x27c1a0750a07   4c7  8b5d80               movl rbx,[rbp-0x80]
0x27c1a0750a0a   4ca  e9c4000000           jmp 0x27c1a0750ad3  <+0x593>
0x27c1a0750a0f   4cf  450fbe7c1401         movsxbl r15,[r12+rdx*1+0x1]
0x27c1a0750a15   4d5  4183ef30             subl r15,0x30
0x27c1a0750a19   4d9  4183ff0a             cmpl r15,0xa
0x27c1a0750a1d   4dd  0f834d000000         jnc 0x27c1a0750a70  <+0x530>
0x27c1a0750a23   4e3  450fb67c1402         movzxbl r15,[r12+rdx*1+0x2]
0x27c1a0750a29   4e9  4183ff24             cmpl r15,0x24
0x27c1a0750a2d   4ed  0f853d000000         jnz 0x27c1a0750a70  <+0x530>
0x27c1a0750a33   4f3  450fbe7c1401         movsxbl r15,[r12+rdx*1+0x1]
0x27c1a0750a39   4f9  8b4dc0               movl rcx,[rbp-0x40]
0x27c1a0750a3c   4fc  468dbcb940ffffff     leal r15,[rcx+r15*4-0xc0]
0x27c1a0750a44   504  43c7043c0a000000     movl [r12+r15*1],0xa
0x27c1a0750a4c   50c  450fbe7c1401         movsxbl r15,[r12+rdx*1+0x1]
0x27c1a0750a52   512  448b4da8             movl r9,[rbp-0x58]
0x27c1a0750a56   516  478dbcf980feffff     leal r15,[r9+r15*8-0x180]
0x27c1a0750a5e   51e  478b3c3c             movl r15,[r12+r15*1]
0x27c1a0750a62   522  83c203               addl rdx,0x3
0x27c1a0750a65   525  41b901000000         movl r9,0x1
0x27c1a0750a6b   52b  e94b000000           jmp 0x27c1a0750abb  <+0x57b>
0x27c1a0750a70   530  448b4da0             movl r9,[rbp-0x60]
0x27c1a0750a74   534  4585c9               testl r9,r9
0x27c1a0750a77   537  0f85d51c0000         jnz 0x27c1a0752752  <+0x2212>
0x27c1a0750a7d   53d  448d7a01             leal r15,[rdx+0x1]
0x27c1a0750a81   541  85c0                 testl rax,rax
0x27c1a0750a83   543  0f8513000000         jnz 0x27c1a0750a9c  <+0x55c>
0x27c1a0750a89   549  47897c204c           movl [r8+r12*1+0x4c],r15
0x27c1a0750a8e   54e  418bd7               movl rdx,r15
0x27c1a0750a91   551  4533c9               xorl r9,r9
0x27c1a0750a94   554  458bf9               movl r15,r9
0x27c1a0750a97   557  e937000000           jmp 0x27c1a0750ad3  <+0x593>
0x27c1a0750a9c   55c  8b55b0               movl rdx,[rbp-0x50]
0x27c1a0750a9f   55f  418b0c14             movl rcx,[r12+rdx*1]
0x27c1a0750aa3   563  448d4904             leal r9,[rcx+0x4]
0x27c1a0750aa7   567  45890c14             movl [r12+rdx*1],r9
0x27c1a0750aab   56b  418b140c             movl rdx,[r12+rcx*1]
0x27c1a0750aaf   56f  4d8bd7               REX.W movq r10,r15
0x27c1a0750ab2   572  4c8bfa               REX.W movq r15,rdx
0x27c1a0750ab5   575  498bd2               REX.W movq rdx,r10
0x27c1a0750ab8   578  4533c9               xorl r9,r9
0x27c1a0750abb   57b  438954204c           movl [r8+r12*1+0x4c],rdx
0x27c1a0750ac0   580  4585ff               testl r15,r15
0x27c1a0750ac3   583  0f8d0a000000         jge 0x27c1a0750ad3  <+0x593>
0x27c1a0750ac9   589  41f7df               negl r15
0x27c1a0750acc   58c  4181cb00200000       orl r11,0x2000
0x27c1a0750ad3   593  410fb60c14           movzxbl rcx,[r12+rdx*1]
0x27c1a0750ad8   598  4c89bd78ffffff       REX.W movq [rbp-0x88],r15
0x27c1a0750adf   59f  4c899d50ffffff       REX.W movq [rbp-0xb0],r11
0x27c1a0750ae6   5a6  4c894da0             REX.W movq [rbp-0x60],r9
0x27c1a0750aea   5aa  83f92e               cmpl rcx,0x2e
0x27c1a0750aed   5ad  0f840d000000         jz 0x27c1a0750b00  <+0x5c0>
0x27c1a0750af3   5b3  33c9                 xorl rcx,rcx
0x27c1a0750af5   5b5  41bbffffffff         movl r11,0xffffffff
0x27c1a0750afb   5bb  e9fc000000           jmp 0x27c1a0750bfc  <+0x6bc>
0x27c1a0750b00   5c0  410fb64c1401         movzxbl rcx,[r12+rdx*1+0x1]
0x27c1a0750b06   5c6  83f92a               cmpl rcx,0x2a
0x27c1a0750b09   5c9  0f844e000000         jz 0x27c1a0750b5d  <+0x61d>
0x27c1a0750b0f   5cf  418d484c             leal rcx,[r8+0x4c]
0x27c1a0750b13   5d3  83c201               addl rdx,0x1
0x27c1a0750b16   5d6  438954204c           movl [r8+r12*1+0x4c],rdx
0x27c1a0750b1b   5db  8bc1                 movl rax,rcx
0x27c1a0750b1d   5dd  e810e5ffff           call 0x27c1a074f032  (jump table)    ;; internal wasm call
0x27c1a0750b22   5e2  8b7de0               movl rdi,[rbp-0x20]
0x27c1a0750b25   5e5  4c8b45d8             REX.W movq r8,[rbp-0x28]
0x27c1a0750b29   5e9  458b5c384c           movl r11,[r8+rdi*1+0x4c]
0x27c1a0750b2e   5ee  b901000000           movl rcx,0x1
0x27c1a0750b33   5f3  418bd3               movl rdx,r11
0x27c1a0750b36   5f6  448bd8               movl r11,rax
0x27c1a0750b39   5f9  4d8be0               REX.W movq r12,r8
0x27c1a0750b3c   5fc  448bc7               movl r8,rdi
0x27c1a0750b3f   5ff  488b7db8             REX.W movq rdi,[rbp-0x48]
0x27c1a0750b43   603  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a0750b47   607  8b4598               movl rax,[rbp-0x68]
0x27c1a0750b4a   60a  8b5d80               movl rbx,[rbp-0x80]
0x27c1a0750b4d   60d  448bbd78ffffff       movl r15,[rbp-0x88]
0x27c1a0750b54   614  448b4da0             movl r9,[rbp-0x60]
0x27c1a0750b58   618  e99f000000           jmp 0x27c1a0750bfc  <+0x6bc>
0x27c1a0750b5d   61d  410fbe4c1402         movsxbl rcx,[r12+rdx*1+0x2]
0x27c1a0750b63   623  83e930               subl rcx,0x30
0x27c1a0750b66   626  83f90a               cmpl rcx,0xa
0x27c1a0750b69   629  0f834a000000         jnc 0x27c1a0750bb9  <+0x679>
0x27c1a0750b6f   62f  410fb64c1403         movzxbl rcx,[r12+rdx*1+0x3]
0x27c1a0750b75   635  83f924               cmpl rcx,0x24
0x27c1a0750b78   638  0f853b000000         jnz 0x27c1a0750bb9  <+0x679>
0x27c1a0750b7e   63e  410fbe4c1402         movsxbl rcx,[r12+rdx*1+0x2]
0x27c1a0750b84   644  448b5dc0             movl r11,[rbp-0x40]
0x27c1a0750b88   648  418d8c8b40ffffff     leal rcx,[r11+rcx*4-0xc0]
0x27c1a0750b90   650  41c7040c0a000000     movl [r12+rcx*1],0xa
0x27c1a0750b98   658  410fbe4c1402         movsxbl rcx,[r12+rdx*1+0x2]
0x27c1a0750b9e   65e  448b5da8             movl r11,[rbp-0x58]
0x27c1a0750ba2   662  418d8ccb80feffff     leal rcx,[r11+rcx*8-0x180]
0x27c1a0750baa   66a  418b0c0c             movl rcx,[r12+rcx*1]
0x27c1a0750bae   66e  83c204               addl rdx,0x4
0x27c1a0750bb1   671  448bd9               movl r11,rcx
0x27c1a0750bb4   674  e936000000           jmp 0x27c1a0750bef  <+0x6af>
0x27c1a0750bb9   679  4585c9               testl r9,r9
0x27c1a0750bbc   67c  0f85901b0000         jnz 0x27c1a0752752  <+0x2212>
0x27c1a0750bc2   682  83c202               addl rdx,0x2
0x27c1a0750bc5   685  85c0                 testl rax,rax
0x27c1a0750bc7   687  0f8508000000         jnz 0x27c1a0750bd5  <+0x695>
0x27c1a0750bcd   68d  4533db               xorl r11,r11
0x27c1a0750bd0   690  e91a000000           jmp 0x27c1a0750bef  <+0x6af>
0x27c1a0750bd5   695  8b4db0               movl rcx,[rbp-0x50]
0x27c1a0750bd8   698  458b1c0c             movl r11,[r12+rcx*1]
0x27c1a0750bdc   69c  458d7b04             leal r15,[r11+0x4]
0x27c1a0750be0   6a0  45893c0c             movl [r12+rcx*1],r15
0x27c1a0750be4   6a4  478b1c1c             movl r11,[r12+r11*1]
0x27c1a0750be8   6a8  448bbd78ffffff       movl r15,[rbp-0x88]
0x27c1a0750bef   6af  438954204c           movl [r8+r12*1+0x4c],rdx
0x27c1a0750bf4   6b4  418bcb               movl rcx,r11
0x27c1a0750bf7   6b7  f7d1                 notl rcx
0x27c1a0750bf9   6b9  c1e91f               shrl rcx, 31
0x27c1a0750bfc   6bc  4c895dd0             REX.W movq [rbp-0x30],r11
0x27c1a0750c00   6c0  48894dc8             REX.W movq [rbp-0x38],rcx
0x27c1a0750c04   6c4  4c8bdf               REX.W movq r11,rdi
0x27c1a0750c07   6c7  33ff                 xorl rdi,rdi
0x27c1a0750c09   6c9  e936000000           jmp 0x27c1a0750c44  <+0x704>
0x27c1a0750c0e   6ce  660f1f840000000000   nop
0x27c1a0750c17   6d7  660f1f840000000000   nop
0x27c1a0750c20   6e0  660f1f840000000000   nop
0x27c1a0750c29   6e9  660f1f840000000000   nop
0x27c1a0750c32   6f2  660f1f840000000000   nop
0x27c1a0750c3b   6fb  0f1f440000           nop
0x27c1a0750c40   700  4c8b5db8             REX.W movq r11,[rbp-0x48]
0x27c1a0750c44   704  493b23               REX.W cmpq rsp,[r11]
0x27c1a0750c47   707  0f86421c0000         jna 0x27c1a075288f  <+0x234f>
0x27c1a0750c4d   70d  450fbe1c14           movsxbl r11,[r12+rdx*1]
0x27c1a0750c52   712  458d7b85             leal r15,[r11-0x7b]
0x27c1a0750c56   716  4183ffc6             cmpl r15,0xc6
0x27c1a0750c5a   71a  0f82e81a0000         jc 0x27c1a0752748  <+0x2208>
0x27c1a0750c60   720  448d7a01             leal r15,[rdx+0x1]
0x27c1a0750c64   724  6bdf3a               imull rbx,rdi,0x3a
0x27c1a0750c67   727  4403db               addl r11,rbx
0x27c1a0750c6a   72a  470fb69c1cef030000   movzxbl r11,[r12+r11*1+0x3ef]
0x27c1a0750c73   733  418d5bff             leal rbx,[r11-0x1]
0x27c1a0750c77   737  83fb08               cmpl rbx,0x8
0x27c1a0750c7a   73a  0f83c5000000         jnc 0x27c1a0750d45  <+0x805>
0x27c1a0750c80   740  430fbe3c3c           movsxbl rdi,[r12+r15*1]
0x27c1a0750c85   745  8d5f85               leal rbx,[rdi-0x7b]
0x27c1a0750c88   748  83fbc6               cmpl rbx,0xc6
0x27c1a0750c8b   74b  0f82b71a0000         jc 0x27c1a0752748  <+0x2208>
0x27c1a0750c91   751  418d5f01             leal rbx,[r15+0x1]
0x27c1a0750c95   755  416bd33a             imull rdx,r11,0x3a
0x27c1a0750c99   759  03fa                 addl rdi,rdx
0x27c1a0750c9b   75b  410fb6bc3cef030000   movzxbl rdi,[r12+rdi*1+0x3ef]
0x27c1a0750ca4   764  8d57ff               leal rdx,[rdi-0x1]
0x27c1a0750ca7   767  83fa08               cmpl rdx,0x8
0x27c1a0750caa   76a  0f8368000000         jnc 0x27c1a0750d18  <+0x7d8>
0x27c1a0750cb0   770  450fbe1c1c           movsxbl r11,[r12+rbx*1]
0x27c1a0750cb5   775  458d7b85             leal r15,[r11-0x7b]
0x27c1a0750cb9   779  4183ffc6             cmpl r15,0xc6
0x27c1a0750cbd   77d  0f82851a0000         jc 0x27c1a0752748  <+0x2208>
0x27c1a0750cc3   783  448d7b01             leal r15,[rbx+0x1]
0x27c1a0750cc7   787  6bd73a               imull rdx,rdi,0x3a
0x27c1a0750cca   78a  4403da               addl r11,rdx
0x27c1a0750ccd   78d  470fb69c1cef030000   movzxbl r11,[r12+r11*1+0x3ef]
0x27c1a0750cd6   796  418d53ff             leal rdx,[r11-0x1]
0x27c1a0750cda   79a  83fa08               cmpl rdx,0x8
0x27c1a0750cdd   79d  0f8349000000         jnc 0x27c1a0750d2c  <+0x7ec>
0x27c1a0750ce3   7a3  430fbe3c3c           movsxbl rdi,[r12+r15*1]
0x27c1a0750ce8   7a8  8d5f85               leal rbx,[rdi-0x7b]
0x27c1a0750ceb   7ab  83fbc6               cmpl rbx,0xc6
0x27c1a0750cee   7ae  0f82541a0000         jc 0x27c1a0752748  <+0x2208>
0x27c1a0750cf4   7b4  418d5701             leal rdx,[r15+0x1]
0x27c1a0750cf8   7b8  416bdb3a             imull rbx,r11,0x3a
0x27c1a0750cfc   7bc  03fb                 addl rdi,rbx
0x27c1a0750cfe   7be  410fb6bc3cef030000   movzxbl rdi,[r12+rdi*1+0x3ef]
0x27c1a0750d07   7c7  8d5fff               leal rbx,[rdi-0x1]
0x27c1a0750d0a   7ca  83fb08               cmpl rbx,0x8
0x27c1a0750d0d   7cd  0f822dffffff         jc 0x27c1a0750c40  <+0x700>
0x27c1a0750d13   7d3  e91b000000           jmp 0x27c1a0750d33  <+0x7f3>
0x27c1a0750d18   7d8  4c8bd7               REX.W movq r10,rdi
0x27c1a0750d1b   7db  498bfb               REX.W movq rdi,r11
0x27c1a0750d1e   7de  458bda               movl r11,r10
0x27c1a0750d21   7e1  418bd7               movl rdx,r15
0x27c1a0750d24   7e4  448bfb               movl r15,rbx
0x27c1a0750d27   7e7  e919000000           jmp 0x27c1a0750d45  <+0x805>
0x27c1a0750d2c   7ec  8bd3                 movl rdx,rbx
0x27c1a0750d2e   7ee  e912000000           jmp 0x27c1a0750d45  <+0x805>
0x27c1a0750d33   7f3  4c8bd7               REX.W movq r10,rdi
0x27c1a0750d36   7f6  498bfb               REX.W movq rdi,r11
0x27c1a0750d39   7f9  458bda               movl r11,r10
0x27c1a0750d3c   7fc  4c8bd2               REX.W movq r10,rdx
0x27c1a0750d3f   7ff  498bd7               REX.W movq rdx,r15
0x27c1a0750d42   802  4d8bfa               REX.W movq r15,r10
0x27c1a0750d45   805  47897c204c           movl [r8+r12*1+0x4c],r15
0x27c1a0750d4a   80a  48897d88             REX.W movq [rbp-0x78],rdi
0x27c1a0750d4e   80e  48899568ffffff       REX.W movq [rbp-0x98],rdx
0x27c1a0750d55   815  4c89bd58ffffff       REX.W movq [rbp-0xa8],r15
0x27c1a0750d5c   81c  4183fb1b             cmpl r11,0x1b
0x27c1a0750d60   820  0f8480000000         jz 0x27c1a0750de6  <+0x8a6>
0x27c1a0750d66   826  4585db               testl r11,r11
0x27c1a0750d69   829  0f8474190000         jz 0x27c1a07526e3  <+0x21a3>
0x27c1a0750d6f   82f  837d9000             cmpl [rbp-0x70],0x0
0x27c1a0750d73   833  0f8d41000000         jge 0x27c1a0750dba  <+0x87a>
0x27c1a0750d79   839  85c0                 testl rax,rax
0x27c1a0750d7b   83b  0f846c190000         jz 0x27c1a07526ed  <+0x21ad>
0x27c1a0750d81   841  418d5840             leal rbx,[r8+0x40]
0x27c1a0750d85   845  8b4db0               movl rcx,[rbp-0x50]
0x27c1a0750d88   848  8bc3                 movl rax,rbx
0x27c1a0750d8a   84a  418bd3               movl rdx,r11
0x27c1a0750d8d   84d  e8a5e2ffff           call 0x27c1a074f037  (jump table)    ;; internal wasm call
0x27c1a0750d92   852  448b45e0             movl r8,[rbp-0x20]
0x27c1a0750d96   856  4c8b65d8             REX.W movq r12,[rbp-0x28]
0x27c1a0750d9a   85a  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a0750d9e   85e  8b4598               movl rax,[rbp-0x68]
0x27c1a0750da1   861  8b7d88               movl rdi,[rbp-0x78]
0x27c1a0750da4   864  8b9568ffffff         movl rdx,[rbp-0x98]
0x27c1a0750daa   86a  448bbd58ffffff       movl r15,[rbp-0xa8]
0x27c1a0750db1   871  448b4da0             movl r9,[rbp-0x60]
0x27c1a0750db5   875  e95b000000           jmp 0x27c1a0750e15  <+0x8d5>
0x27c1a0750dba   87a  8b5dc0               movl rbx,[rbp-0x40]
0x27c1a0750dbd   87d  8b4d90               movl rcx,[rbp-0x70]
0x27c1a0750dc0   880  448d3c8b             leal r15,[rbx+rcx*4]
0x27c1a0750dc4   884  8b5da8               movl rbx,[rbp-0x58]
0x27c1a0750dc7   887  8d0ccb               leal rcx,[rbx+rcx*8]
0x27c1a0750dca   88a  47891c3c             movl [r12+r15*1],r11
0x27c1a0750dce   88e  4d8b1c0c             REX.W movq r11,[r12+rcx*1]
0x27c1a0750dd2   892  4f895c2040           REX.W movq [r8+r12*1+0x40],r11
0x27c1a0750dd7   897  8b4dc8               movl rcx,[rbp-0x38]
0x27c1a0750dda   89a  448bbd58ffffff       movl r15,[rbp-0xa8]
0x27c1a0750de1   8a1  e90a000000           jmp 0x27c1a0750df0  <+0x8b0>
0x27c1a0750de6   8a6  837d9000             cmpl [rbp-0x70],0x0
0x27c1a0750dea   8aa  0f8d4e190000         jge 0x27c1a075273e  <+0x21fe>
0x27c1a0750df0   8b0  85c0                 testl rax,rax
0x27c1a0750df2   8b2  0f851d000000         jnz 0x27c1a0750e15  <+0x8d5>
0x27c1a0750df8   8b8  458bdf               movl r11,r15
0x27c1a0750dfb   8bb  448bbd48ffffff       movl r15,[rbp-0xb8]
0x27c1a0750e02   8c2  4d89e0               REX.W movq r8,r12
0x27c1a0750e05   8c5  4531e4               xorl r12,r12
0x27c1a0750e08   8c8  4c894da0             REX.W movq [rbp-0x60],r9
0x27c1a0750e0c   8cc  488b7db8             REX.W movq rdi,[rbp-0x48]
0x27c1a0750e10   8d0  e9b8f7ffff           jmp 0x27c1a07505cd  <+0x8d>
0x27c1a0750e15   8d5  448bda               movl r11,rdx
0x27c1a0750e18   8d8  470fbe1c1c           movsxbl r11,[r12+r11*1]
0x27c1a0750e1d   8dd  498bdb               REX.W movq rbx,r11
0x27c1a0750e20   8e0  83e30f               andl rbx,0xf
0x27c1a0750e23   8e3  498bd3               REX.W movq rdx,r11
0x27c1a0750e26   8e6  83e2df               andl rdx,0xdf
0x27c1a0750e29   8e9  498bcb               REX.W movq rcx,r11
0x27c1a0750e2c   8ec  80fb03               cmpb bl,0x3
0x27c1a0750e2f   8ef  0f44ca               cmovzl rcx,rdx
0x27c1a0750e32   8f2  85ff                 testl rdi,rdi
0x27c1a0750e34   8f4  440f45d9             cmovnzl r11,rcx
0x27c1a0750e38   8f8  418d5ba8             leal rbx,[r11-0x58]
0x27c1a0750e3c   8fc  83fb21               cmpl rbx,0x21
0x27c1a0750e3f   8ff  0f830b000000         jnc 0x27c1a0750e50  <+0x910>
0x27c1a0750e45   905  4c8d1554200000       REX.W leaq r10,[rip+0x2054]
0x27c1a0750e4c   90c  41ff24da             jmp [r10+rbx*8]
0x27c1a0750e50   910  418d7bbf             leal rdi,[r11-0x41]
0x27c1a0750e54   914  83ff07               cmpl rdi,0x7
0x27c1a0750e57   917  0f8313000000         jnc 0x27c1a0750e70  <+0x930>
0x27c1a0750e5d   91d  4c8d1504200000       REX.W leaq r10,[rip+0x2004]
0x27c1a0750e64   924  41ff24fa             jmp [r10+rdi*8]
0x27c1a0750e68   928  0f1f840000000000     nop
0x27c1a0750e70   930  4183fb53             cmpl r11,0x53
0x27c1a0750e74   934  0f8438000000         jz 0x27c1a0750eb2  <+0x972>
0x27c1a0750e7a   93a  418d7838             leal rdi,[r8+0x38]
0x27c1a0750e7e   93e  448b9d50ffffff       movl r11,[rbp-0xb0]
0x27c1a0750e85   945  4181e3fffffeff       andl r11,0xfffeffff
0x27c1a0750e8c   94c  8b9d50ffffff         movl rbx,[rbp-0xb0]
0x27c1a0750e92   952  66f78550ffffff0020   testw [rbp-0xb0],0x2000
0x27c1a0750e9b   95b  410f45db             cmovnzl rbx,r11
0x27c1a0750e9f   95f  41bb00040000         movl r11,0x400
0x27c1a0750ea5   965  33c9                 xorl rcx,rcx
0x27c1a0750ea7   967  8b9570ffffff         movl rdx,[rbp-0x90]
0x27c1a0750ead   96d  e9a1150000           jmp 0x27c1a0752453  <+0x1f13>
0x27c1a0750eb2   972  837dd000             cmpl [rbp-0x30],0x0
0x27c1a0750eb6   976  0f853f000000         jnz 0x27c1a0750efb  <+0x9bb>
0x27c1a0750ebc   97c  8bbd50ffffff         movl rdi,[rbp-0xb0]
0x27c1a0750ec2   982  81e7fffffeff         andl rdi,0xfffeffff
0x27c1a0750ec8   988  448b9d50ffffff       movl r11,[rbp-0xb0]
0x27c1a0750ecf   98f  66f78550ffffff0020   testw [rbp-0xb0],0x2000
0x27c1a0750ed8   998  440f45df             cmovnzl r11,rdi
0x27c1a0750edc   99c  8b7da8               movl rdi,[rbp-0x58]
0x27c1a0750edf   99f  ba20000000           movl rdx,0x20
0x27c1a0750ee4   9a4  8b8d78ffffff         movl rcx,[rbp-0x88]
0x27c1a0750eea   9aa  33db                 xorl rbx,rbx
0x27c1a0750eec   9ac  458bcb               movl r9,r11
0x27c1a0750eef   9af  e84ce1ffff           call 0x27c1a074f040  (jump table)    ;; internal wasm call
0x27c1a0750ef4   9b4  33db                 xorl rbx,rbx
0x27c1a0750ef6   9b6  e94e020000           jmp 0x27c1a0751149  <+0xc09>
0x27c1a0750efb   9bb  418bf8               movl rdi,r8
0x27c1a0750efe   9be  4d89e0               REX.W movq r8,r12
0x27c1a0750f01   9c1  458b5c3840           movl r11,[r8+rdi*1+0x40]
0x27c1a0750f06   9c6  4d8be0               REX.W movq r12,r8
0x27c1a0750f09   9c9  448bc7               movl r8,rdi
0x27c1a0750f0c   9cc  8b7dd0               movl rdi,[rbp-0x30]
0x27c1a0750f0f   9cf  e96d000000           jmp 0x27c1a0750f81  <+0xa41>
0x27c1a0750f14   9d4  660f1f840000000000   nop
0x27c1a0750f1d   9dd  0f1f00               nop
0x27c1a0750f20   9e0  418d7838             leal rdi,[r8+0x38]
0x27c1a0750f24   9e4  448b9d50ffffff       movl r11,[rbp-0xb0]
0x27c1a0750f2b   9eb  4181e3fffffeff       andl r11,0xfffeffff
0x27c1a0750f32   9f2  8b9d50ffffff         movl rbx,[rbp-0xb0]
0x27c1a0750f38   9f8  66f78550ffffff0020   testw [rbp-0xb0],0x2000
0x27c1a0750f41   a01  410f45db             cmovnzl rbx,r11
0x27c1a0750f45   a05  41bb00040000         movl r11,0x400
0x27c1a0750f4b   a0b  33c9                 xorl rcx,rcx
0x27c1a0750f4d   a0d  8b9570ffffff         movl rdx,[rbp-0x90]
0x27c1a0750f53   a13  e9fb140000           jmp 0x27c1a0752453  <+0x1f13>
0x27c1a0750f58   a18  0f1f840000000000     nop
0x27c1a0750f60   a20  43c744200c00000000   movl [r8+r12*1+0xc],0x0
0x27c1a0750f69   a29  4b8b7c0440           REX.W movq rdi,[r12+r8*1+0x40]
0x27c1a0750f6e   a2e  43897c2008           movl [r8+r12*1+0x8],rdi
0x27c1a0750f73   a33  458d5808             leal r11,[r8+0x8]
0x27c1a0750f77   a37  47895c2040           movl [r8+r12*1+0x40],r11
0x27c1a0750f7c   a3c  bfffffffff           movl rdi,0xffffffff
0x27c1a0750f81   a41  418d5804             leal rbx,[r8+0x4]
0x27c1a0750f85   a45  48897dd0             REX.W movq [rbp-0x30],rdi
0x27c1a0750f89   a49  48895dc8             REX.W movq [rbp-0x38],rbx
0x27c1a0750f8d   a4d  418bd3               movl rdx,r11
0x27c1a0750f90   a50  4533db               xorl r11,r11
0x27c1a0750f93   a53  e93d000000           jmp 0x27c1a0750fd5  <+0xa95>
0x27c1a0750f98   a58  660f1f840000000000   nop
0x27c1a0750fa1   a61  660f1f840000000000   nop
0x27c1a0750faa   a6a  660f1f840000000000   nop
0x27c1a0750fb3   a73  660f1f840000000000   nop
0x27c1a0750fbc   a7c  0f1f4000             nop
0x27c1a0750fc0   a80  8b7d90               movl rdi,[rbp-0x70]
0x27c1a0750fc3   a83  8d5704               leal rdx,[rdi+0x4]
0x27c1a0750fc6   a86  8b5dc8               movl rbx,[rbp-0x38]
0x27c1a0750fc9   a89  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a0750fcd   a8d  448b45e0             movl r8,[rbp-0x20]
0x27c1a0750fd1   a91  4c8b65d8             REX.W movq r12,[rbp-0x28]
0x27c1a0750fd5   a95  488b4db8             REX.W movq rcx,[rbp-0x48]
0x27c1a0750fd9   a99  483b21               REX.W cmpq rsp,[rcx]
0x27c1a0750fdc   a9c  0f86e1180000         jna 0x27c1a07528c3  <+0x2383>
0x27c1a0750fe2   aa2  418b3c14             movl rdi,[r12+rdx*1]
0x27c1a0750fe6   aa6  85ff                 testl rdi,rdi
0x27c1a0750fe8   aa8  0f843d000000         jz 0x27c1a075102b  <+0xaeb>
0x27c1a0750fee   aae  4c895d88             REX.W movq [rbp-0x78],r11
0x27c1a0750ff2   ab2  48895590             REX.W movq [rbp-0x70],rdx
0x27c1a0750ff6   ab6  8bc3                 movl rax,rbx
0x27c1a0750ff8   ab8  8bd7                 movl rdx,rdi
0x27c1a0750ffa   aba  e846e0ffff           call 0x27c1a074f045  (jump table)    ;; internal wasm call
0x27c1a0750fff   abf  85c0                 testl rax,rax
0x27c1a0751001   ac1  0f8c03170000         jl 0x27c1a075270a  <+0x21ca>
0x27c1a0751007   ac7  8b7dd0               movl rdi,[rbp-0x30]
0x27c1a075100a   aca  2b7d88               subl rdi,[rbp-0x78]
0x27c1a075100d   acd  3bf8                 cmpl rdi,rax
0x27c1a075100f   acf  0f8212000000         jc 0x27c1a0751027  <+0xae7>
0x27c1a0751015   ad5  448b5d88             movl r11,[rbp-0x78]
0x27c1a0751019   ad9  4403d8               addl r11,rax
0x27c1a075101c   adc  443b5dd0             cmpl r11,[rbp-0x30]
0x27c1a0751020   ae0  729e                 jc 0x27c1a0750fc0  <+0xa80>
0x27c1a0751022   ae2  e904000000           jmp 0x27c1a075102b  <+0xaeb>
0x27c1a0751027   ae7  448b5d88             movl r11,[rbp-0x78]
0x27c1a075102b   aeb  4c895d88             REX.W movq [rbp-0x78],r11
0x27c1a075102f   aef  4585db               testl r11,r11
0x27c1a0751032   af2  0f8cc0160000         jl 0x27c1a07526f8  <+0x21b8>
0x27c1a0751038   af8  8bbd50ffffff         movl rdi,[rbp-0xb0]
0x27c1a075103e   afe  81e7fffffeff         andl rdi,0xfffeffff
0x27c1a0751044   b04  448b8d50ffffff       movl r9,[rbp-0xb0]
0x27c1a075104b   b0b  66f78550ffffff0020   testw [rbp-0xb0],0x2000
0x27c1a0751054   b14  440f45cf             cmovnzl r9,rdi
0x27c1a0751058   b18  ba20000000           movl rdx,0x20
0x27c1a075105d   b1d  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a0751061   b21  8b4598               movl rax,[rbp-0x68]
0x27c1a0751064   b24  8b8d78ffffff         movl rcx,[rbp-0x88]
0x27c1a075106a   b2a  418bdb               movl rbx,r11
0x27c1a075106d   b2d  e8cedfffff           call 0x27c1a074f040  (jump table)    ;; internal wasm call
0x27c1a0751072   b32  837d8800             cmpl [rbp-0x78],0x0
0x27c1a0751076   b36  0f8507000000         jnz 0x27c1a0751083  <+0xb43>
0x27c1a075107c   b3c  33db                 xorl rbx,rbx
0x27c1a075107e   b3e  e9c6000000           jmp 0x27c1a0751149  <+0xc09>
0x27c1a0751083   b43  8b7de0               movl rdi,[rbp-0x20]
0x27c1a0751086   b46  4c8b45d8             REX.W movq r8,[rbp-0x28]
0x27c1a075108a   b4a  458b5c3840           movl r11,[r8+rdi*1+0x40]
0x27c1a075108f   b4f  4531e4               xorl r12,r12
0x27c1a0751092   b52  e938000000           jmp 0x27c1a07510cf  <+0xb8f>
0x27c1a0751097   b57  660f1f840000000000   nop
0x27c1a07510a0   b60  660f1f840000000000   nop
0x27c1a07510a9   b69  660f1f840000000000   nop
0x27c1a07510b2   b72  660f1f840000000000   nop
0x27c1a07510bb   b7b  0f1f440000           nop
0x27c1a07510c0   b80  448b5dd0             movl r11,[rbp-0x30]
0x27c1a07510c4   b84  4183c304             addl r11,0x4
0x27c1a07510c8   b88  4c8b45d8             REX.W movq r8,[rbp-0x28]
0x27c1a07510cc   b8c  8b7de0               movl rdi,[rbp-0x20]
0x27c1a07510cf   b8f  4c8b7db8             REX.W movq r15,[rbp-0x48]
0x27c1a07510d3   b93  8b4588               movl rax,[rbp-0x78]
0x27c1a07510d6   b96  493b27               REX.W cmpq rsp,[r15]
0x27c1a07510d9   b99  0f8610180000         jna 0x27c1a07528ef  <+0x23af>
0x27c1a07510df   b9f  438b1418             movl rdx,[r8+r11*1]
0x27c1a07510e3   ba3  85d2                 testl rdx,rdx
0x27c1a07510e5   ba5  0f844c000000         jz 0x27c1a0751137  <+0xbf7>
0x27c1a07510eb   bab  4c895dd0             REX.W movq [rbp-0x30],r11
0x27c1a07510ef   baf  4c896590             REX.W movq [rbp-0x70],r12
0x27c1a07510f3   bb3  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a07510f7   bb7  8b45c8               movl rax,[rbp-0x38]
0x27c1a07510fa   bba  e846dfffff           call 0x27c1a074f045  (jump table)    ;; internal wasm call
0x27c1a07510ff   bbf  448b6590             movl r12,[rbp-0x70]
0x27c1a0751103   bc3  4403e0               addl r12,rax
0x27c1a0751106   bc6  4c896590             REX.W movq [rbp-0x70],r12
0x27c1a075110a   bca  448b5d88             movl r11,[rbp-0x78]
0x27c1a075110e   bce  4539e3               cmpl r11,r12
0x27c1a0751111   bd1  0f822f000000         jc 0x27c1a0751146  <+0xc06>
0x27c1a0751117   bd7  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a075111b   bdb  8bc8                 movl rcx,rax
0x27c1a075111d   bdd  8b4598               movl rax,[rbp-0x68]
0x27c1a0751120   be0  8b55c8               movl rdx,[rbp-0x38]
0x27c1a0751123   be3  e805dfffff           call 0x27c1a074f02d  (jump table)    ;; internal wasm call
0x27c1a0751128   be8  448b6590             movl r12,[rbp-0x70]
0x27c1a075112c   bec  443b6588             cmpl r12,[rbp-0x78]
0x27c1a0751130   bf0  728e                 jc 0x27c1a07510c0  <+0xb80>
0x27c1a0751132   bf2  e907000000           jmp 0x27c1a075113e  <+0xbfe>
0x27c1a0751137   bf7  8bd8                 movl rbx,rax
0x27c1a0751139   bf9  e90b000000           jmp 0x27c1a0751149  <+0xc09>
0x27c1a075113e   bfe  8b5d88               movl rbx,[rbp-0x78]
0x27c1a0751141   c01  e903000000           jmp 0x27c1a0751149  <+0xc09>
0x27c1a0751146   c06  418bdb               movl rbx,r11
0x27c1a0751149   c09  8bbd50ffffff         movl rdi,[rbp-0xb0]
0x27c1a075114f   c0f  81e7fffffeff         andl rdi,0xfffeffff
0x27c1a0751155   c15  448b8550ffffff       movl r8,[rbp-0xb0]
0x27c1a075115c   c1c  66f78550ffffff0020   testw [rbp-0xb0],0x2000
0x27c1a0751165   c25  440f45c7             cmovnzl r8,rdi
0x27c1a0751169   c29  8bfb                 movl rdi,rbx
0x27c1a075116b   c2b  3b9d78ffffff         cmpl rbx,[rbp-0x88]
0x27c1a0751171   c31  0f4cbd78ffffff       cmovll rdi,[rbp-0x88]
0x27c1a0751178   c38  4181f000200000       xorl r8,0x2000
0x27c1a075117f   c3f  4889bd50ffffff       REX.W movq [rbp-0xb0],rdi
0x27c1a0751186   c46  ba20000000           movl rdx,0x20
0x27c1a075118b   c4b  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a075118f   c4f  8b4598               movl rax,[rbp-0x68]
0x27c1a0751192   c52  8b8d78ffffff         movl rcx,[rbp-0x88]
0x27c1a0751198   c58  458bc8               movl r9,r8
0x27c1a075119b   c5b  e8a0deffff           call 0x27c1a074f040  (jump table)    ;; internal wasm call
0x27c1a07511a0   c60  448bbd48ffffff       movl r15,[rbp-0xb8]
0x27c1a07511a7   c67  448ba550ffffff       movl r12,[rbp-0xb0]
0x27c1a07511ae   c6e  8b4598               movl rax,[rbp-0x68]
0x27c1a07511b1   c71  448b9d58ffffff       movl r11,[rbp-0xa8]
0x27c1a07511b8   c78  4c8b45d8             REX.W movq r8,[rbp-0x28]
0x27c1a07511bc   c7c  488b7db8             REX.W movq rdi,[rbp-0x48]
0x27c1a07511c0   c80  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a07511c4   c84  e904f4ffff           jmp 0x27c1a07505cd  <+0x8d>
0x27c1a07511c9   c89  0f1f8000000000       nop
0x27c1a07511d0   c90  418d7838             leal rdi,[r8+0x38]
0x27c1a07511d4   c94  448b9d50ffffff       movl r11,[rbp-0xb0]
0x27c1a07511db   c9b  4181e3fffffeff       andl r11,0xfffeffff
0x27c1a07511e2   ca2  8b9d50ffffff         movl rbx,[rbp-0xb0]
0x27c1a07511e8   ca8  66f78550ffffff0020   testw [rbp-0xb0],0x2000
0x27c1a07511f1   cb1  410f45db             cmovnzl rbx,r11
0x27c1a07511f5   cb5  41bb00040000         movl r11,0x400
0x27c1a07511fb   cbb  33c9                 xorl rcx,rcx
0x27c1a07511fd   cbd  8b9570ffffff         movl rdx,[rbp-0x90]
0x27c1a0751203   cc3  e94b120000           jmp 0x27c1a0752453  <+0x1f13>
0x27c1a0751208   cc8  0f1f840000000000     nop
0x27c1a0751210   cd0  8bbd50ffffff         movl rdi,[rbp-0xb0]
0x27c1a0751216   cd6  81e7fffffeff         andl rdi,0xfffeffff
0x27c1a075121c   cdc  8b9d50ffffff         movl rbx,[rbp-0xb0]
0x27c1a0751222   ce2  66f78550ffffff0020   testw [rbp-0xb0],0x2000
0x27c1a075122b   ceb  0f45df               cmovnzl rbx,rdi
0x27c1a075122e   cee  8b55d0               movl rdx,[rbp-0x30]
0x27c1a0751231   cf1  e90b100000           jmp 0x27c1a0752241  <+0x1d01>
0x27c1a0751236   cf6  660f1f840000000000   nop
0x27c1a075123f   cff  90                   nop
0x27c1a0751240   d00  418d7838             leal rdi,[r8+0x38]
0x27c1a0751244   d04  448b9d50ffffff       movl r11,[rbp-0xb0]
0x27c1a075124b   d0b  4181e3fffffeff       andl r11,0xfffeffff
0x27c1a0751252   d12  8b9d50ffffff         movl rbx,[rbp-0xb0]
0x27c1a0751258   d18  66f78550ffffff0020   testw [rbp-0xb0],0x2000
0x27c1a0751261   d21  410f45db             cmovnzl rbx,r11
0x27c1a0751265   d25  41bb00040000         movl r11,0x400
0x27c1a075126b   d2b  33c9                 xorl rcx,rcx
0x27c1a075126d   d2d  8b9570ffffff         movl rdx,[rbp-0x90]
0x27c1a0751273   d33  e9db110000           jmp 0x27c1a0752453  <+0x1f13>
0x27c1a0751278   d38  0f1f840000000000     nop
0x27c1a0751280   d40  418d7838             leal rdi,[r8+0x38]
0x27c1a0751284   d44  448b9d50ffffff       movl r11,[rbp-0xb0]
0x27c1a075128b   d4b  4181e3fffffeff       andl r11,0xfffeffff
0x27c1a0751292   d52  8b9d50ffffff         movl rbx,[rbp-0xb0]
0x27c1a0751298   d58  66f78550ffffff0020   testw [rbp-0xb0],0x2000
0x27c1a07512a1   d61  410f45db             cmovnzl rbx,r11
0x27c1a07512a5   d65  41bb00040000         movl r11,0x400
0x27c1a07512ab   d6b  33c9                 xorl rcx,rcx
0x27c1a07512ad   d6d  8b9570ffffff         movl rdx,[rbp-0x90]
0x27c1a07512b3   d73  e99b110000           jmp 0x27c1a0752453  <+0x1f13>
0x27c1a07512b8   d78  0f1f840000000000     nop
0x27c1a07512c0   d80  418d7838             leal rdi,[r8+0x38]
0x27c1a07512c4   d84  448b9d50ffffff       movl r11,[rbp-0xb0]
0x27c1a07512cb   d8b  4181e3fffffeff       andl r11,0xfffeffff
0x27c1a07512d2   d92  8b9d50ffffff         movl rbx,[rbp-0xb0]
0x27c1a07512d8   d98  66f78550ffffff0020   testw [rbp-0xb0],0x2000
0x27c1a07512e1   da1  410f45db             cmovnzl rbx,r11
0x27c1a07512e5   da5  41bb00040000         movl r11,0x400
0x27c1a07512eb   dab  33c9                 xorl rcx,rcx
0x27c1a07512ed   dad  8b9570ffffff         movl rdx,[rbp-0x90]
0x27c1a07512f3   db3  e95b110000           jmp 0x27c1a0752453  <+0x1f13>
0x27c1a07512f8   db8  0f1f840000000000     nop
0x27c1a0751300   dc0  418d7838             leal rdi,[r8+0x38]
0x27c1a0751304   dc4  448b9d50ffffff       movl r11,[rbp-0xb0]
0x27c1a075130b   dcb  4181e3fffffeff       andl r11,0xfffeffff
0x27c1a0751312   dd2  8b9d50ffffff         movl rbx,[rbp-0xb0]
0x27c1a0751318   dd8  66f78550ffffff0020   testw [rbp-0xb0],0x2000
0x27c1a0751321   de1  410f45db             cmovnzl rbx,r11
0x27c1a0751325   de5  41bb00040000         movl r11,0x400
0x27c1a075132b   deb  33c9                 xorl rcx,rcx
0x27c1a075132d   ded  8b9570ffffff         movl rdx,[rbp-0x90]
0x27c1a0751333   df3  e91b110000           jmp 0x27c1a0752453  <+0x1f13>
0x27c1a0751338   df8  0f1f840000000000     nop
0x27c1a0751340   e00  418d7838             leal rdi,[r8+0x38]
0x27c1a0751344   e04  448b9d50ffffff       movl r11,[rbp-0xb0]
0x27c1a075134b   e0b  4181e3fffffeff       andl r11,0xfffeffff
0x27c1a0751352   e12  8b9d50ffffff         movl rbx,[rbp-0xb0]
0x27c1a0751358   e18  66f78550ffffff0020   testw [rbp-0xb0],0x2000
0x27c1a0751361   e21  410f45db             cmovnzl rbx,r11
0x27c1a0751365   e25  41bb00040000         movl r11,0x400
0x27c1a075136b   e2b  33c9                 xorl rcx,rcx
0x27c1a075136d   e2d  8b9570ffffff         movl rdx,[rbp-0x90]
0x27c1a0751373   e33  e9db100000           jmp 0x27c1a0752453  <+0x1f13>
0x27c1a0751378   e38  0f1f840000000000     nop
0x27c1a0751380   e40  418d7838             leal rdi,[r8+0x38]
0x27c1a0751384   e44  448b9d50ffffff       movl r11,[rbp-0xb0]
0x27c1a075138b   e4b  4181e3fffffeff       andl r11,0xfffeffff
0x27c1a0751392   e52  8b9d50ffffff         movl rbx,[rbp-0xb0]
0x27c1a0751398   e58  66f78550ffffff0020   testw [rbp-0xb0],0x2000
0x27c1a07513a1   e61  410f45db             cmovnzl rbx,r11
0x27c1a07513a5   e65  41bb00040000         movl r11,0x400
0x27c1a07513ab   e6b  33c9                 xorl rcx,rcx
0x27c1a07513ad   e6d  8b9570ffffff         movl rdx,[rbp-0x90]
0x27c1a07513b3   e73  e99b100000           jmp 0x27c1a0752453  <+0x1f13>
0x27c1a07513b8   e78  0f1f840000000000     nop
0x27c1a07513c0   e80  418d7838             leal rdi,[r8+0x38]
0x27c1a07513c4   e84  448b9d50ffffff       movl r11,[rbp-0xb0]
0x27c1a07513cb   e8b  4181e3fffffeff       andl r11,0xfffeffff
0x27c1a07513d2   e92  8b9d50ffffff         movl rbx,[rbp-0xb0]
0x27c1a07513d8   e98  66f78550ffffff0020   testw [rbp-0xb0],0x2000
0x27c1a07513e1   ea1  410f45db             cmovnzl rbx,r11
0x27c1a07513e5   ea5  41bb00040000         movl r11,0x400
0x27c1a07513eb   eab  33c9                 xorl rcx,rcx
0x27c1a07513ed   ead  8b9570ffffff         movl rdx,[rbp-0x90]
0x27c1a07513f3   eb3  e95b100000           jmp 0x27c1a0752453  <+0x1f13>
0x27c1a07513f8   eb8  0f1f840000000000     nop
0x27c1a0751400   ec0  418d7838             leal rdi,[r8+0x38]
0x27c1a0751404   ec4  448b9d50ffffff       movl r11,[rbp-0xb0]
0x27c1a075140b   ecb  4181e3fffffeff       andl r11,0xfffeffff
0x27c1a0751412   ed2  8b9d50ffffff         movl rbx,[rbp-0xb0]
0x27c1a0751418   ed8  66f78550ffffff0020   testw [rbp-0xb0],0x2000
0x27c1a0751421   ee1  410f45db             cmovnzl rbx,r11
0x27c1a0751425   ee5  41bb00040000         movl r11,0x400
0x27c1a075142b   eeb  33c9                 xorl rcx,rcx
0x27c1a075142d   eed  8b9570ffffff         movl rdx,[rbp-0x90]
0x27c1a0751433   ef3  e91b100000           jmp 0x27c1a0752453  <+0x1f13>
0x27c1a0751438   ef8  0f1f840000000000     nop
0x27c1a0751440   f00  418d7838             leal rdi,[r8+0x38]
0x27c1a0751444   f04  448b9d50ffffff       movl r11,[rbp-0xb0]
0x27c1a075144b   f0b  4181e3fffffeff       andl r11,0xfffeffff
0x27c1a0751452   f12  8b9d50ffffff         movl rbx,[rbp-0xb0]
0x27c1a0751458   f18  66f78550ffffff0020   testw [rbp-0xb0],0x2000
0x27c1a0751461   f21  410f45db             cmovnzl rbx,r11
0x27c1a0751465   f25  41bb00040000         movl r11,0x400
0x27c1a075146b   f2b  33c9                 xorl rcx,rcx
0x27c1a075146d   f2d  8b9570ffffff         movl rdx,[rbp-0x90]
0x27c1a0751473   f33  e9db0f0000           jmp 0x27c1a0752453  <+0x1f13>
0x27c1a0751478   f38  0f1f840000000000     nop
0x27c1a0751480   f40  418d7838             leal rdi,[r8+0x38]
0x27c1a0751484   f44  8b9d50ffffff         movl rbx,[rbp-0xb0]
0x27c1a075148a   f4a  81e3fffffeff         andl rbx,0xfffeffff
0x27c1a0751490   f50  4f8b5c0440           REX.W movq r11,[r12+r8*1+0x40]
0x27c1a0751495   f55  47885c2037           movb [r8+r12*1+0x37],r11l
0x27c1a075149a   f5a  458d5837             leal r11,[r8+0x37]
0x27c1a075149e   f5e  418bd3               movl rdx,r11
0x27c1a07514a1   f61  48c745d001000000     REX.W movq [rbp-0x30],0x1
0x27c1a07514a9   f69  33c9                 xorl rcx,rcx
0x27c1a07514ab   f6b  41bb00040000         movl r11,0x400
0x27c1a07514b1   f71  e99d0f0000           jmp 0x27c1a0752453  <+0x1f13>
0x27c1a07514b6   f76  660f1f840000000000   nop
0x27c1a07514bf   f7f  90                   nop
0x27c1a07514c0   f80  418d7838             leal rdi,[r8+0x38]
0x27c1a07514c4   f84  448b9d50ffffff       movl r11,[rbp-0xb0]
0x27c1a07514cb   f8b  4181e3fffffeff       andl r11,0xfffeffff
0x27c1a07514d2   f92  8b9d50ffffff         movl rbx,[rbp-0xb0]
0x27c1a07514d8   f98  66f78550ffffff0020   testw [rbp-0xb0],0x2000
0x27c1a07514e1   fa1  410f45db             cmovnzl rbx,r11
0x27c1a07514e5   fa5  41bb00040000         movl r11,0x400
0x27c1a07514eb   fab  33c9                 xorl rcx,rcx
0x27c1a07514ed   fad  8b9570ffffff         movl rdx,[rbp-0x90]
0x27c1a07514f3   fb3  e95b0f0000           jmp 0x27c1a0752453  <+0x1f13>
0x27c1a07514f8   fb8  0f1f840000000000     nop
0x27c1a0751500   fc0  4b8b7c0440           REX.W movq rdi,[r12+r8*1+0x40]
0x27c1a0751505   fc5  4885ff               REX.W testq rdi,rdi
0x27c1a0751508   fc8  0f8c55000000         jl 0x27c1a0751563  <+0x1023>
0x27c1a075150e   fce  448b9d50ffffff       movl r11,[rbp-0xb0]
0x27c1a0751515   fd5  4181e3fffffeff       andl r11,0xfffeffff
0x27c1a075151c   fdc  8b9d50ffffff         movl rbx,[rbp-0xb0]
0x27c1a0751522   fe2  66f78550ffffff0020   testw [rbp-0xb0],0x2000
0x27c1a075152b   feb  410f45db             cmovnzl rbx,r11
0x27c1a075152f   fef  66f7c30008           testw rbx,0x800
0x27c1a0751534   ff4  0f8519000000         jnz 0x27c1a0751553  <+0x1013>
0x27c1a075153a   ffa  83e301               andl rbx,0x1
0x27c1a075153d   ffd  41bb00040000         movl r11,0x400
0x27c1a0751543  1003  ba02040000           movl rdx,0x402
0x27c1a0751548  1008  85db                 testl rbx,rbx
0x27c1a075154a  100a  440f45da             cmovnzl r11,rdx
0x27c1a075154e  100e  e94a090000           jmp 0x27c1a0751e9d  <+0x195d>
0x27c1a0751553  1013  41bb01040000         movl r11,0x401
0x27c1a0751559  1019  bb01000000           movl rbx,0x1
0x27c1a075155e  101e  e93a090000           jmp 0x27c1a0751e9d  <+0x195d>
0x27c1a0751563  1023  48f7df               REX.W negq rdi
0x27c1a0751566  1026  4b897c2040           REX.W movq [r8+r12*1+0x40],rdi
0x27c1a075156b  102b  41bb00040000         movl r11,0x400
0x27c1a0751571  1031  bb01000000           movl rbx,0x1
0x27c1a0751576  1036  e922090000           jmp 0x27c1a0751e9d  <+0x195d>
0x27c1a075157b  103b  0f1f440000           nop
0x27c1a0751580  1040  418d7838             leal rdi,[r8+0x38]
0x27c1a0751584  1044  448b9d50ffffff       movl r11,[rbp-0xb0]
0x27c1a075158b  104b  4181e3fffffeff       andl r11,0xfffeffff
0x27c1a0751592  1052  8b9d50ffffff         movl rbx,[rbp-0xb0]
0x27c1a0751598  1058  66f78550ffffff0020   testw [rbp-0xb0],0x2000
0x27c1a07515a1  1061  410f45db             cmovnzl rbx,r11
0x27c1a07515a5  1065  41bb00040000         movl r11,0x400
0x27c1a07515ab  106b  33c9                 xorl rcx,rcx
0x27c1a07515ad  106d  8b9570ffffff         movl rdx,[rbp-0x90]
0x27c1a07515b3  1073  e99b0e0000           jmp 0x27c1a0752453  <+0x1f13>
0x27c1a07515b8  1078  0f1f840000000000     nop
0x27c1a07515c0  1080  418d7838             leal rdi,[r8+0x38]
0x27c1a07515c4  1084  448b9d50ffffff       movl r11,[rbp-0xb0]
0x27c1a07515cb  108b  4181e3fffffeff       andl r11,0xfffeffff
0x27c1a07515d2  1092  8b9d50ffffff         movl rbx,[rbp-0xb0]
0x27c1a07515d8  1098  66f78550ffffff0020   testw [rbp-0xb0],0x2000
0x27c1a07515e1  10a1  410f45db             cmovnzl rbx,r11
0x27c1a07515e5  10a5  41bb00040000         movl r11,0x400
0x27c1a07515eb  10ab  33c9                 xorl rcx,rcx
0x27c1a07515ed  10ad  8b9570ffffff         movl rdx,[rbp-0x90]
0x27c1a07515f3  10b3  e95b0e0000           jmp 0x27c1a0752453  <+0x1f13>
0x27c1a07515f8  10b8  0f1f840000000000     nop
0x27c1a0751600  10c0  418d7838             leal rdi,[r8+0x38]
0x27c1a0751604  10c4  448b9d50ffffff       movl r11,[rbp-0xb0]
0x27c1a075160b  10cb  4181e3fffffeff       andl r11,0xfffeffff
0x27c1a0751612  10d2  8b9d50ffffff         movl rbx,[rbp-0xb0]
0x27c1a0751618  10d8  66f78550ffffff0020   testw [rbp-0xb0],0x2000
0x27c1a0751621  10e1  410f45db             cmovnzl rbx,r11
0x27c1a0751625  10e5  41bb00040000         movl r11,0x400
0x27c1a075162b  10eb  33c9                 xorl rcx,rcx
0x27c1a075162d  10ed  8b9570ffffff         movl rdx,[rbp-0x90]
0x27c1a0751633  10f3  e91b0e0000           jmp 0x27c1a0752453  <+0x1f13>
0x27c1a0751638  10f8  0f1f840000000000     nop
0x27c1a0751640  1100  418d7838             leal rdi,[r8+0x38]
0x27c1a0751644  1104  448b9d50ffffff       movl r11,[rbp-0xb0]
0x27c1a075164b  110b  4181e3fffffeff       andl r11,0xfffeffff
0x27c1a0751652  1112  8b9d50ffffff         movl rbx,[rbp-0xb0]
0x27c1a0751658  1118  66f78550ffffff0020   testw [rbp-0xb0],0x2000
0x27c1a0751661  1121  410f45db             cmovnzl rbx,r11
0x27c1a0751665  1125  41bb00040000         movl r11,0x400
0x27c1a075166b  112b  33c9                 xorl rcx,rcx
0x27c1a075166d  112d  8b9570ffffff         movl rdx,[rbp-0x90]
0x27c1a0751673  1133  e9db0d0000           jmp 0x27c1a0752453  <+0x1f13>
0x27c1a0751678  1138  0f1f840000000000     nop
0x27c1a0751680  1140  400fb6ff             movzxbl rdi,rdi
0x27c1a0751684  1144  83ff08               cmpl rdi,0x8
0x27c1a0751687  1147  0f836bf7ffff         jnc 0x27c1a0750df8  <+0x8b8>
0x27c1a075168d  114d  4c8d1594170000       REX.W leaq r10,[rip+0x1794]
0x27c1a0751694  1154  41ff24fa             jmp [r10+rdi*8]
0x27c1a0751698  1158  0f1f840000000000     nop
0x27c1a07516a0  1160  458bdf               movl r11,r15
0x27c1a07516a3  1163  448bbd48ffffff       movl r15,[rbp-0xb8]
0x27c1a07516aa  116a  4d89e0               REX.W movq r8,r12
0x27c1a07516ad  116d  4531e4               xorl r12,r12
0x27c1a07516b0  1170  4c894da0             REX.W movq [rbp-0x60],r9
0x27c1a07516b4  1174  488b7db8             REX.W movq rdi,[rbp-0x48]
0x27c1a07516b8  1178  e910efffff           jmp 0x27c1a07505cd  <+0x8d>
0x27c1a07516bd  117d  0f1f00               nop
0x27c1a07516c0  1180  438b7c0440           movl rdi,[r12+r8*1+0x40]
0x27c1a07516c5  1185  8b9d48ffffff         movl rbx,[rbp-0xb8]
0x27c1a07516cb  118b  41891c3c             movl [r12+rdi*1],rbx
0x27c1a07516cf  118f  458bdf               movl r11,r15
0x27c1a07516d2  1192  448bfb               movl r15,rbx
0x27c1a07516d5  1195  4d89e0               REX.W movq r8,r12
0x27c1a07516d8  1198  4531e4               xorl r12,r12
0x27c1a07516db  119b  4c894da0             REX.W movq [rbp-0x60],r9
0x27c1a07516df  119f  488b7db8             REX.W movq rdi,[rbp-0x48]
0x27c1a07516e3  11a3  e9e5eeffff           jmp 0x27c1a07505cd  <+0x8d>
0x27c1a07516e8  11a8  0f1f840000000000     nop
0x27c1a07516f0  11b0  478b5c0440           movl r11,[r12+r8*1+0x40]
0x27c1a07516f5  11b5  8bbd48ffffff         movl rdi,[rbp-0xb8]
0x27c1a07516fb  11bb  43893c1c             movl [r12+r11*1],rdi
0x27c1a07516ff  11bf  458bdf               movl r11,r15
0x27c1a0751702  11c2  448bff               movl r15,rdi
0x27c1a0751705  11c5  4d89e0               REX.W movq r8,r12
0x27c1a0751708  11c8  4531e4               xorl r12,r12
0x27c1a075170b  11cb  4c894da0             REX.W movq [rbp-0x60],r9
0x27c1a075170f  11cf  488b7db8             REX.W movq rdi,[rbp-0x48]
0x27c1a0751713  11d3  e9b5eeffff           jmp 0x27c1a07505cd  <+0x8d>
0x27c1a0751718  11d8  0f1f840000000000     nop
0x27c1a0751720  11e0  4863bd48ffffff       REX.W movsxlq rdi,[rbp-0xb8]
0x27c1a0751727  11e7  478b5c0440           movl r11,[r12+r8*1+0x40]
0x27c1a075172c  11ec  4b893c1c             REX.W movq [r12+r11*1],rdi
0x27c1a0751730  11f0  458bdf               movl r11,r15
0x27c1a0751733  11f3  448bbd48ffffff       movl r15,[rbp-0xb8]
0x27c1a075173a  11fa  4d89e0               REX.W movq r8,r12
0x27c1a075173d  11fd  4531e4               xorl r12,r12
0x27c1a0751740  1200  4c894da0             REX.W movq [rbp-0x60],r9
0x27c1a0751744  1204  488b7db8             REX.W movq rdi,[rbp-0x48]
0x27c1a0751748  1208  e980eeffff           jmp 0x27c1a07505cd  <+0x8d>
0x27c1a075174d  120d  0f1f00               nop
0x27c1a0751750  1210  478b5c0440           movl r11,[r12+r8*1+0x40]
0x27c1a0751755  1215  8bbd48ffffff         movl rdi,[rbp-0xb8]
0x27c1a075175b  121b  6643893c1c           movw [r12+r11*1],rdi
0x27c1a0751760  1220  458bdf               movl r11,r15
0x27c1a0751763  1223  448bff               movl r15,rdi
0x27c1a0751766  1226  4d89e0               REX.W movq r8,r12
0x27c1a0751769  1229  4531e4               xorl r12,r12
0x27c1a075176c  122c  4c894da0             REX.W movq [rbp-0x60],r9
0x27c1a0751770  1230  488b7db8             REX.W movq rdi,[rbp-0x48]
0x27c1a0751774  1234  e954eeffff           jmp 0x27c1a07505cd  <+0x8d>
0x27c1a0751779  1239  0f1f8000000000       nop
0x27c1a0751780  1240  478b5c0440           movl r11,[r12+r8*1+0x40]
0x27c1a0751785  1245  8bbd48ffffff         movl rdi,[rbp-0xb8]
0x27c1a075178b  124b  43883c1c             movb [r12+r11*1],dil
0x27c1a075178f  124f  458bdf               movl r11,r15
0x27c1a0751792  1252  448bff               movl r15,rdi
0x27c1a0751795  1255  4d89e0               REX.W movq r8,r12
0x27c1a0751798  1258  4531e4               xorl r12,r12
0x27c1a075179b  125b  4c894da0             REX.W movq [rbp-0x60],r9
0x27c1a075179f  125f  488b7db8             REX.W movq rdi,[rbp-0x48]
0x27c1a07517a3  1263  e925eeffff           jmp 0x27c1a07505cd  <+0x8d>
0x27c1a07517a8  1268  0f1f840000000000     nop
0x27c1a07517b0  1270  478b5c0440           movl r11,[r12+r8*1+0x40]
0x27c1a07517b5  1275  8bbd48ffffff         movl rdi,[rbp-0xb8]
0x27c1a07517bb  127b  43893c1c             movl [r12+r11*1],rdi
0x27c1a07517bf  127f  458bdf               movl r11,r15
0x27c1a07517c2  1282  448bff               movl r15,rdi
0x27c1a07517c5  1285  4d89e0               REX.W movq r8,r12
0x27c1a07517c8  1288  4531e4               xorl r12,r12
0x27c1a07517cb  128b  4c894da0             REX.W movq [rbp-0x60],r9
0x27c1a07517cf  128f  488b7db8             REX.W movq rdi,[rbp-0x48]
0x27c1a07517d3  1293  e9f5edffff           jmp 0x27c1a07505cd  <+0x8d>
0x27c1a07517d8  1298  0f1f840000000000     nop
0x27c1a07517e0  12a0  438b7c0440           movl rdi,[r12+r8*1+0x40]
0x27c1a07517e5  12a5  4c639d48ffffff       REX.W movsxlq r11,[rbp-0xb8]
0x27c1a07517ec  12ac  4d891c3c             REX.W movq [r12+rdi*1],r11
0x27c1a07517f0  12b0  458bdf               movl r11,r15
0x27c1a07517f3  12b3  448bbd48ffffff       movl r15,[rbp-0xb8]
0x27c1a07517fa  12ba  4d89e0               REX.W movq r8,r12
0x27c1a07517fd  12bd  4531e4               xorl r12,r12
0x27c1a0751800  12c0  4c894da0             REX.W movq [rbp-0x60],r9
0x27c1a0751804  12c4  488b7db8             REX.W movq rdi,[rbp-0x48]
0x27c1a0751808  12c8  e9c0edffff           jmp 0x27c1a07505cd  <+0x8d>
0x27c1a075180d  12cd  0f1f00               nop
0x27c1a0751810  12d0  418d7838             leal rdi,[r8+0x38]
0x27c1a0751814  12d4  4f8b5c0440           REX.W movq r11,[r12+r8*1+0x40]
0x27c1a0751819  12d9  4d85db               REX.W testq r11,r11
0x27c1a075181c  12dc  0f84db000000         jz 0x27c1a07518fd  <+0x13bd>
0x27c1a0751822  12e2  488b5db8             REX.W movq rbx,[rbp-0x48]
0x27c1a0751826  12e6  e919000000           jmp 0x27c1a0751844  <+0x1304>
0x27c1a075182b  12eb  660f1f840000000000   nop
0x27c1a0751834  12f4  660f1f840000000000   nop
0x27c1a075183d  12fd  0f1f00               nop
0x27c1a0751840  1300  49c1eb03             REX.W shrq r11, 3
0x27c1a0751844  1304  483b23               REX.W cmpq rsp,[rbx]
0x27c1a0751847  1307  0f86ca100000         jna 0x27c1a0752917  <+0x23d7>
0x27c1a075184d  130d  498bd3               REX.W movq rdx,r11
0x27c1a0751850  1310  83e207               andl rdx,0x7
0x27c1a0751853  1313  83ef01               subl rdi,0x1
0x27c1a0751856  1316  83ca30               orl rdx,0x30
0x27c1a0751859  1319  4188143c             movb [r12+rdi*1],dl
0x27c1a075185d  131d  4983fb07             REX.W cmpq r11,0x7
0x27c1a0751861  1321  0f8696000000         jna 0x27c1a07518fd  <+0x13bd>
0x27c1a0751867  1327  49c1eb03             REX.W shrq r11, 3
0x27c1a075186b  132b  498bd3               REX.W movq rdx,r11
0x27c1a075186e  132e  83e207               andl rdx,0x7
0x27c1a0751871  1331  83ef01               subl rdi,0x1
0x27c1a0751874  1334  83ca30               orl rdx,0x30
0x27c1a0751877  1337  4188143c             movb [r12+rdi*1],dl
0x27c1a075187b  133b  4983fb07             REX.W cmpq r11,0x7
0x27c1a075187f  133f  0f8678000000         jna 0x27c1a07518fd  <+0x13bd>
0x27c1a0751885  1345  49c1eb03             REX.W shrq r11, 3
0x27c1a0751889  1349  498bd3               REX.W movq rdx,r11
0x27c1a075188c  134c  83e207               andl rdx,0x7
0x27c1a075188f  134f  83ef01               subl rdi,0x1
0x27c1a0751892  1352  83ca30               orl rdx,0x30
0x27c1a0751895  1355  4188143c             movb [r12+rdi*1],dl
0x27c1a0751899  1359  4983fb07             REX.W cmpq r11,0x7
0x27c1a075189d  135d  0f865a000000         jna 0x27c1a07518fd  <+0x13bd>
0x27c1a07518a3  1363  49c1eb03             REX.W shrq r11, 3
0x27c1a07518a7  1367  498bd3               REX.W movq rdx,r11
0x27c1a07518aa  136a  83e207               andl rdx,0x7
0x27c1a07518ad  136d  83ef01               subl rdi,0x1
0x27c1a07518b0  1370  83ca30               orl rdx,0x30
0x27c1a07518b3  1373  4188143c             movb [r12+rdi*1],dl
0x27c1a07518b7  1377  4983fb07             REX.W cmpq r11,0x7
0x27c1a07518bb  137b  0f863c000000         jna 0x27c1a07518fd  <+0x13bd>
0x27c1a07518c1  1381  49c1eb03             REX.W shrq r11, 3
0x27c1a07518c5  1385  498bd3               REX.W movq rdx,r11
0x27c1a07518c8  1388  83e207               andl rdx,0x7
0x27c1a07518cb  138b  83ef01               subl rdi,0x1
0x27c1a07518ce  138e  83ca30               orl rdx,0x30
0x27c1a07518d1  1391  4188143c             movb [r12+rdi*1],dl
0x27c1a07518d5  1395  4983fb07             REX.W cmpq r11,0x7
0x27c1a07518d9  1399  0f861e000000         jna 0x27c1a07518fd  <+0x13bd>
0x27c1a07518df  139f  49c1eb03             REX.W shrq r11, 3
0x27c1a07518e3  13a3  498bd3               REX.W movq rdx,r11
0x27c1a07518e6  13a6  83e207               andl rdx,0x7
0x27c1a07518e9  13a9  83ef01               subl rdi,0x1
0x27c1a07518ec  13ac  83ca30               orl rdx,0x30
0x27c1a07518ef  13af  4188143c             movb [r12+rdi*1],dl
0x27c1a07518f3  13b3  4983fb07             REX.W cmpq r11,0x7
0x27c1a07518f7  13b7  0f8743ffffff         ja 0x27c1a0751840  <+0x1300>
0x27c1a07518fd  13bd  448b9d50ffffff       movl r11,[rbp-0xb0]
0x27c1a0751904  13c4  4181e3fffffeff       andl r11,0xfffeffff
0x27c1a075190b  13cb  8b9d50ffffff         movl rbx,[rbp-0xb0]
0x27c1a0751911  13d1  66f78550ffffff0020   testw [rbp-0xb0],0x2000
0x27c1a075191a  13da  410f45db             cmovnzl rbx,r11
0x27c1a075191e  13de  f6c308               testb rbx,0x8
0x27c1a0751921  13e1  0f8512000000         jnz 0x27c1a0751939  <+0x13f9>
0x27c1a0751927  13e7  41bb00040000         movl r11,0x400
0x27c1a075192d  13ed  8bcb                 movl rcx,rbx
0x27c1a075192f  13ef  33db                 xorl rbx,rbx
0x27c1a0751931  13f1  8b55d0               movl rdx,[rbp-0x30]
0x27c1a0751934  13f4  e97f0a0000           jmp 0x27c1a07523b8  <+0x1e78>
0x27c1a0751939  13f9  458d5838             leal r11,[r8+0x38]
0x27c1a075193d  13fd  442bdf               subl r11,rdi
0x27c1a0751940  1400  418d5301             leal rdx,[r11+0x1]
0x27c1a0751944  1404  443b5dd0             cmpl r11,[rbp-0x30]
0x27c1a0751948  1408  0f4c55d0             cmovll rdx,[rbp-0x30]
0x27c1a075194c  140c  8bcb                 movl rcx,rbx
0x27c1a075194e  140e  41bb00040000         movl r11,0x400
0x27c1a0751954  1414  33db                 xorl rbx,rbx
0x27c1a0751956  1416  e95d0a0000           jmp 0x27c1a07523b8  <+0x1e78>
0x27c1a075195b  141b  0f1f440000           nop
0x27c1a0751960  1420  8bbd50ffffff         movl rdi,[rbp-0xb0]
0x27c1a0751966  1426  81e7fffffeff         andl rdi,0xfffeffff
0x27c1a075196c  142c  448b9d50ffffff       movl r11,[rbp-0xb0]
0x27c1a0751973  1433  66f78550ffffff0020   testw [rbp-0xb0],0x2000
0x27c1a075197c  143c  440f45df             cmovnzl r11,rdi
0x27c1a0751980  1440  bf08000000           movl rdi,0x8
0x27c1a0751985  1445  8b55d0               movl rdx,[rbp-0x30]
0x27c1a0751988  1448  837dd008             cmpl [rbp-0x30],0x8
0x27c1a075198c  144c  0f46d7               cmovnal rdx,rdi
0x27c1a075198f  144f  4183cb08             orl r11,0x8
0x27c1a0751993  1453  bf78000000           movl rdi,0x78
0x27c1a0751998  1458  418bdb               movl rbx,r11
0x27c1a075199b  145b  4c8bdf               REX.W movq r11,rdi
0x27c1a075199e  145e  e99e080000           jmp 0x27c1a0752241  <+0x1d01>
0x27c1a07519a3  1463  660f1f840000000000   nop
0x27c1a07519ac  146c  0f1f4000             nop
0x27c1a07519b0  1470  418d7838             leal rdi,[r8+0x38]
0x27c1a07519b4  1474  448b9d50ffffff       movl r11,[rbp-0xb0]
0x27c1a07519bb  147b  4181e3fffffeff       andl r11,0xfffeffff
0x27c1a07519c2  1482  8b9d50ffffff         movl rbx,[rbp-0xb0]
0x27c1a07519c8  1488  66f78550ffffff0020   testw [rbp-0xb0],0x2000
0x27c1a07519d1  1491  410f45db             cmovnzl rbx,r11
0x27c1a07519d5  1495  41bb00040000         movl r11,0x400
0x27c1a07519db  149b  33c9                 xorl rcx,rcx
0x27c1a07519dd  149d  8b9570ffffff         movl rdx,[rbp-0x90]
0x27c1a07519e3  14a3  e96b0a0000           jmp 0x27c1a0752453  <+0x1f13>
0x27c1a07519e8  14a8  0f1f840000000000     nop
0x27c1a07519f0  14b0  418d7838             leal rdi,[r8+0x38]
0x27c1a07519f4  14b4  448b9d50ffffff       movl r11,[rbp-0xb0]
0x27c1a07519fb  14bb  4181e3fffffeff       andl r11,0xfffeffff
0x27c1a0751a02  14c2  8b9d50ffffff         movl rbx,[rbp-0xb0]
0x27c1a0751a08  14c8  66f78550ffffff0020   testw [rbp-0xb0],0x2000
0x27c1a0751a11  14d1  410f45db             cmovnzl rbx,r11
0x27c1a0751a15  14d5  41bb00040000         movl r11,0x400
0x27c1a0751a1b  14db  33c9                 xorl rcx,rcx
0x27c1a0751a1d  14dd  8b9570ffffff         movl rdx,[rbp-0x90]
0x27c1a0751a23  14e3  e92b0a0000           jmp 0x27c1a0752453  <+0x1f13>
0x27c1a0751a28  14e8  0f1f840000000000     nop
0x27c1a0751a30  14f0  438b7c0440           movl rdi,[r12+r8*1+0x40]
0x27c1a0751a35  14f5  41bb0a040000         movl r11,0x40a
0x27c1a0751a3b  14fb  85ff                 testl rdi,rdi
0x27c1a0751a3d  14fd  440f45df             cmovnzl r11,rdi
0x27c1a0751a41  1501  8b7dd0               movl rdi,[rbp-0x30]
0x27c1a0751a44  1504  bbffffff7f           movl rbx,0x7fffffff
0x27c1a0751a49  1509  817dd0ffffff7f       cmpl [rbp-0x30],0x7fffffff
0x27c1a0751a50  1510  0f43fb               cmovncl rdi,rbx
0x27c1a0751a53  1513  41f6c303             testb r11,0x3
0x27c1a0751a57  1517  0f8511000000         jnz 0x27c1a0751a6e  <+0x152e>
0x27c1a0751a5d  151d  33d2                 xorl rdx,rdx
0x27c1a0751a5f  151f  85ff                 testl rdi,rdi
0x27c1a0751a61  1521  0f95c2               setnzl dl
0x27c1a0751a64  1524  8bdf                 movl rbx,rdi
0x27c1a0751a66  1526  458bfb               movl r15,r11
0x27c1a0751a69  1529  e98d010000           jmp 0x27c1a0751bfb  <+0x16bb>
0x27c1a0751a6e  152e  85ff                 testl rdi,rdi
0x27c1a0751a70  1530  0f8511000000         jnz 0x27c1a0751a87  <+0x1547>
0x27c1a0751a76  1536  33d2                 xorl rdx,rdx
0x27c1a0751a78  1538  85ff                 testl rdi,rdi
0x27c1a0751a7a  153a  0f95c2               setnzl dl
0x27c1a0751a7d  153d  8bdf                 movl rbx,rdi
0x27c1a0751a7f  153f  458bfb               movl r15,r11
0x27c1a0751a82  1542  e974010000           jmp 0x27c1a0751bfb  <+0x16bb>
0x27c1a0751a87  1547  8bd7                 movl rdx,rdi
0x27c1a0751a89  1549  458bfb               movl r15,r11
0x27c1a0751a8c  154c  488b4db8             REX.W movq rcx,[rbp-0x48]
0x27c1a0751a90  1550  660f1f840000000000   nop
0x27c1a0751a99  1559  660f1f840000000000   nop
0x27c1a0751aa2  1562  660f1f840000000000   nop
0x27c1a0751aab  156b  660f1f840000000000   nop
0x27c1a0751ab4  1574  660f1f840000000000   nop
0x27c1a0751abd  157d  0f1f00               nop
0x27c1a0751ac0  1580  483b21               REX.W cmpq rsp,[rcx]
0x27c1a0751ac3  1583  0f868b0e0000         jna 0x27c1a0752954  <+0x2414>
0x27c1a0751ac9  1589  418bdf               movl rbx,r15
0x27c1a0751acc  158c  410fb61c1c           movzxbl rbx,[r12+rbx*1]
0x27c1a0751ad1  1591  85db                 testl rbx,rbx
0x27c1a0751ad3  1593  0f846b020000         jz 0x27c1a0751d44  <+0x1804>
0x27c1a0751ad9  1599  8d5aff               leal rbx,[rdx-0x1]
0x27c1a0751adc  159c  4183c701             addl r15,0x1
0x27c1a0751ae0  15a0  41f6c703             testb r15,0x3
0x27c1a0751ae4  15a4  0f847f000000         jz 0x27c1a0751b69  <+0x1629>
0x27c1a0751aea  15aa  85db                 testl rbx,rbx
0x27c1a0751aec  15ac  0f8485000000         jz 0x27c1a0751b77  <+0x1637>
0x27c1a0751af2  15b2  430fb6143c           movzxbl rdx,[r12+r15*1]
0x27c1a0751af7  15b7  85d2                 testl rdx,rdx
0x27c1a0751af9  15b9  0f8486000000         jz 0x27c1a0751b85  <+0x1645>
0x27c1a0751aff  15bf  8d53ff               leal rdx,[rbx-0x1]
0x27c1a0751b02  15c2  4183c701             addl r15,0x1
0x27c1a0751b06  15c6  41f6c703             testb r15,0x3
0x27c1a0751b0a  15ca  0f847c000000         jz 0x27c1a0751b8c  <+0x164c>
0x27c1a0751b10  15d0  85d2                 testl rdx,rdx
0x27c1a0751b12  15d2  0f848a000000         jz 0x27c1a0751ba2  <+0x1662>
0x27c1a0751b18  15d8  430fb61c3c           movzxbl rbx,[r12+r15*1]
0x27c1a0751b1d  15dd  85db                 testl rbx,rbx
0x27c1a0751b1f  15df  0f841f020000         jz 0x27c1a0751d44  <+0x1804>
0x27c1a0751b25  15e5  8d5aff               leal rbx,[rdx-0x1]
0x27c1a0751b28  15e8  4183c701             addl r15,0x1
0x27c1a0751b2c  15ec  41f6c703             testb r15,0x3
0x27c1a0751b30  15f0  0f8482000000         jz 0x27c1a0751bb8  <+0x1678>
0x27c1a0751b36  15f6  85db                 testl rbx,rbx
0x27c1a0751b38  15f8  0f8488000000         jz 0x27c1a0751bc6  <+0x1686>
0x27c1a0751b3e  15fe  430fb6143c           movzxbl rdx,[r12+r15*1]
0x27c1a0751b43  1603  85d2                 testl rdx,rdx
0x27c1a0751b45  1605  0f843a000000         jz 0x27c1a0751b85  <+0x1645>
0x27c1a0751b4b  160b  4183c701             addl r15,0x1
0x27c1a0751b4f  160f  8d53ff               leal rdx,[rbx-0x1]
0x27c1a0751b52  1612  41f6c703             testb r15,0x3
0x27c1a0751b56  1616  0f8478000000         jz 0x27c1a0751bd4  <+0x1694>
0x27c1a0751b5c  161c  85d2                 testl rdx,rdx
0x27c1a0751b5e  161e  0f855cffffff         jnz 0x27c1a0751ac0  <+0x1580>
0x27c1a0751b64  1624  e981000000           jmp 0x27c1a0751bea  <+0x16aa>
0x27c1a0751b69  1629  83fa01               cmpl rdx,0x1
0x27c1a0751b6c  162c  0f95c2               setnzl dl
0x27c1a0751b6f  162f  0fb6d2               movzxbl rdx,rdx
0x27c1a0751b72  1632  e984000000           jmp 0x27c1a0751bfb  <+0x16bb>
0x27c1a0751b77  1637  83fa01               cmpl rdx,0x1
0x27c1a0751b7a  163a  0f95c2               setnzl dl
0x27c1a0751b7d  163d  0fb6d2               movzxbl rdx,rdx
0x27c1a0751b80  1640  e976000000           jmp 0x27c1a0751bfb  <+0x16bb>
0x27c1a0751b85  1645  8bd3                 movl rdx,rbx
0x27c1a0751b87  1647  e9b8010000           jmp 0x27c1a0751d44  <+0x1804>
0x27c1a0751b8c  164c  83fb01               cmpl rbx,0x1
0x27c1a0751b8f  164f  0f95c3               setnzl bl
0x27c1a0751b92  1652  0fb6db               movzxbl rbx,rbx
0x27c1a0751b95  1655  4c8bd3               REX.W movq r10,rbx
0x27c1a0751b98  1658  8bda                 movl rbx,rdx
0x27c1a0751b9a  165a  418bd2               movl rdx,r10
0x27c1a0751b9d  165d  e959000000           jmp 0x27c1a0751bfb  <+0x16bb>
0x27c1a0751ba2  1662  83fb01               cmpl rbx,0x1
0x27c1a0751ba5  1665  0f95c3               setnzl bl
0x27c1a0751ba8  1668  0fb6db               movzxbl rbx,rbx
0x27c1a0751bab  166b  4c8bd3               REX.W movq r10,rbx
0x27c1a0751bae  166e  8bda                 movl rbx,rdx
0x27c1a0751bb0  1670  418bd2               movl rdx,r10
0x27c1a0751bb3  1673  e943000000           jmp 0x27c1a0751bfb  <+0x16bb>
0x27c1a0751bb8  1678  83fa01               cmpl rdx,0x1
0x27c1a0751bbb  167b  0f95c2               setnzl dl
0x27c1a0751bbe  167e  0fb6d2               movzxbl rdx,rdx
0x27c1a0751bc1  1681  e935000000           jmp 0x27c1a0751bfb  <+0x16bb>
0x27c1a0751bc6  1686  83fa01               cmpl rdx,0x1
0x27c1a0751bc9  1689  0f95c2               setnzl dl
0x27c1a0751bcc  168c  0fb6d2               movzxbl rdx,rdx
0x27c1a0751bcf  168f  e927000000           jmp 0x27c1a0751bfb  <+0x16bb>
0x27c1a0751bd4  1694  83fb01               cmpl rbx,0x1
0x27c1a0751bd7  1697  0f95c3               setnzl bl
0x27c1a0751bda  169a  0fb6db               movzxbl rbx,rbx
0x27c1a0751bdd  169d  4c8bd3               REX.W movq r10,rbx
0x27c1a0751be0  16a0  8bda                 movl rbx,rdx
0x27c1a0751be2  16a2  418bd2               movl rdx,r10
0x27c1a0751be5  16a5  e911000000           jmp 0x27c1a0751bfb  <+0x16bb>
0x27c1a0751bea  16aa  83fb01               cmpl rbx,0x1
0x27c1a0751bed  16ad  0f95c3               setnzl bl
0x27c1a0751bf0  16b0  0fb6db               movzxbl rbx,rbx
0x27c1a0751bf3  16b3  4c8bd3               REX.W movq r10,rbx
0x27c1a0751bf6  16b6  8bda                 movl rbx,rdx
0x27c1a0751bf8  16b8  418bd2               movl rdx,r10
0x27c1a0751bfb  16bb  85d2                 testl rdx,rdx
0x27c1a0751bfd  16bd  0f84cb010000         jz 0x27c1a0751dce  <+0x188e>
0x27c1a0751c03  16c3  418bd7               movl rdx,r15
0x27c1a0751c06  16c6  410fb61414           movzxbl rdx,[r12+rdx*1]
0x27c1a0751c0b  16cb  85d2                 testl rdx,rdx
0x27c1a0751c0d  16cd  0f84f5000000         jz 0x27c1a0751d08  <+0x17c8>
0x27c1a0751c13  16d3  83fb04               cmpl rbx,0x4
0x27c1a0751c16  16d6  0f82ec000000         jc 0x27c1a0751d08  <+0x17c8>
0x27c1a0751c1c  16dc  488b4db8             REX.W movq rcx,[rbp-0x48]
0x27c1a0751c20  16e0  660f1f840000000000   nop
0x27c1a0751c29  16e9  660f1f840000000000   nop
0x27c1a0751c32  16f2  660f1f840000000000   nop
0x27c1a0751c3b  16fb  0f1f440000           nop
0x27c1a0751c40  1700  483b21               REX.W cmpq rsp,[rcx]
0x27c1a0751c43  1703  0f86500d0000         jna 0x27c1a0752999  <+0x2459>
0x27c1a0751c49  1709  418bd7               movl rdx,r15
0x27c1a0751c4c  170c  418b1414             movl rdx,[r12+rdx*1]
0x27c1a0751c50  1710  8db2fffefefe         leal rsi,[rdx-0x1010101]
0x27c1a0751c56  1716  f7d2                 notl rdx
0x27c1a0751c58  1718  23f2                 andl rsi,rdx
0x27c1a0751c5a  171a  f7c680808080         testl rsi,0x80808080
0x27c1a0751c60  1720  0f8597000000         jnz 0x27c1a0751cfd  <+0x17bd>
0x27c1a0751c66  1726  4183c704             addl r15,0x4
0x27c1a0751c6a  172a  83eb04               subl rbx,0x4
0x27c1a0751c6d  172d  83fb03               cmpl rbx,0x3
0x27c1a0751c70  1730  0f867e000000         jna 0x27c1a0751cf4  <+0x17b4>
0x27c1a0751c76  1736  438b143c             movl rdx,[r12+r15*1]
0x27c1a0751c7a  173a  8db2fffefefe         leal rsi,[rdx-0x1010101]
0x27c1a0751c80  1740  f7d2                 notl rdx
0x27c1a0751c82  1742  23f2                 andl rsi,rdx
0x27c1a0751c84  1744  f7c680808080         testl rsi,0x80808080
0x27c1a0751c8a  174a  0f856d000000         jnz 0x27c1a0751cfd  <+0x17bd>
0x27c1a0751c90  1750  4183c704             addl r15,0x4
0x27c1a0751c94  1754  83eb04               subl rbx,0x4
0x27c1a0751c97  1757  83fb03               cmpl rbx,0x3
0x27c1a0751c9a  175a  0f8654000000         jna 0x27c1a0751cf4  <+0x17b4>
0x27c1a0751ca0  1760  438b143c             movl rdx,[r12+r15*1]
0x27c1a0751ca4  1764  8db2fffefefe         leal rsi,[rdx-0x1010101]
0x27c1a0751caa  176a  f7d2                 notl rdx
0x27c1a0751cac  176c  23f2                 andl rsi,rdx
0x27c1a0751cae  176e  f7c680808080         testl rsi,0x80808080
0x27c1a0751cb4  1774  0f8543000000         jnz 0x27c1a0751cfd  <+0x17bd>
0x27c1a0751cba  177a  4183c704             addl r15,0x4
0x27c1a0751cbe  177e  83eb04               subl rbx,0x4
0x27c1a0751cc1  1781  83fb03               cmpl rbx,0x3
0x27c1a0751cc4  1784  0f862a000000         jna 0x27c1a0751cf4  <+0x17b4>
0x27c1a0751cca  178a  438b143c             movl rdx,[r12+r15*1]
0x27c1a0751cce  178e  8db2fffefefe         leal rsi,[rdx-0x1010101]
0x27c1a0751cd4  1794  f7d2                 notl rdx
0x27c1a0751cd6  1796  23f2                 andl rsi,rdx
0x27c1a0751cd8  1798  f7c680808080         testl rsi,0x80808080
0x27c1a0751cde  179e  0f8519000000         jnz 0x27c1a0751cfd  <+0x17bd>
0x27c1a0751ce4  17a4  4183c704             addl r15,0x4
0x27c1a0751ce8  17a8  83eb04               subl rbx,0x4
0x27c1a0751ceb  17ab  83fb03               cmpl rbx,0x3
0x27c1a0751cee  17ae  0f874cffffff         ja 0x27c1a0751c40  <+0x1700>
0x27c1a0751cf4  17b4  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a0751cf8  17b8  e90b000000           jmp 0x27c1a0751d08  <+0x17c8>
0x27c1a0751cfd  17bd  8bd3                 movl rdx,rbx
0x27c1a0751cff  17bf  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a0751d03  17c3  e93c000000           jmp 0x27c1a0751d44  <+0x1804>
0x27c1a0751d08  17c8  85db                 testl rbx,rbx
0x27c1a0751d0a  17ca  0f84be000000         jz 0x27c1a0751dce  <+0x188e>
0x27c1a0751d10  17d0  8bd3                 movl rdx,rbx
0x27c1a0751d12  17d2  488b4db8             REX.W movq rcx,[rbp-0x48]
0x27c1a0751d16  17d6  e929000000           jmp 0x27c1a0751d44  <+0x1804>
0x27c1a0751d1b  17db  660f1f840000000000   nop
0x27c1a0751d24  17e4  660f1f840000000000   nop
0x27c1a0751d2d  17ed  660f1f840000000000   nop
0x27c1a0751d36  17f6  660f1f840000000000   nop
0x27c1a0751d3f  17ff  90                   nop
0x27c1a0751d40  1800  4183c701             addl r15,0x1
0x27c1a0751d44  1804  483b21               REX.W cmpq rsp,[rcx]
0x27c1a0751d47  1807  0f868d0c0000         jna 0x27c1a07529da  <+0x249a>
0x27c1a0751d4d  180d  418bdf               movl rbx,r15
0x27c1a0751d50  1810  410fb61c1c           movzxbl rbx,[r12+rbx*1]
0x27c1a0751d55  1815  85db                 testl rbx,rbx
0x27c1a0751d57  1817  0f8474000000         jz 0x27c1a0751dd1  <+0x1891>
0x27c1a0751d5d  181d  83c2ff               addl rdx,0xff
0x27c1a0751d60  1820  0f8468000000         jz 0x27c1a0751dce  <+0x188e>
0x27c1a0751d66  1826  4183c701             addl r15,0x1
0x27c1a0751d6a  182a  430fb61c3c           movzxbl rbx,[r12+r15*1]
0x27c1a0751d6f  182f  85db                 testl rbx,rbx
0x27c1a0751d71  1831  0f845a000000         jz 0x27c1a0751dd1  <+0x1891>
0x27c1a0751d77  1837  83c2ff               addl rdx,0xff
0x27c1a0751d7a  183a  0f844e000000         jz 0x27c1a0751dce  <+0x188e>
0x27c1a0751d80  1840  4183c701             addl r15,0x1
0x27c1a0751d84  1844  430fb61c3c           movzxbl rbx,[r12+r15*1]
0x27c1a0751d89  1849  85db                 testl rbx,rbx
0x27c1a0751d8b  184b  0f8440000000         jz 0x27c1a0751dd1  <+0x1891>
0x27c1a0751d91  1851  83c2ff               addl rdx,0xff
0x27c1a0751d94  1854  0f8434000000         jz 0x27c1a0751dce  <+0x188e>
0x27c1a0751d9a  185a  4183c701             addl r15,0x1
0x27c1a0751d9e  185e  430fb61c3c           movzxbl rbx,[r12+r15*1]
0x27c1a0751da3  1863  85db                 testl rbx,rbx
0x27c1a0751da5  1865  0f8426000000         jz 0x27c1a0751dd1  <+0x1891>
0x27c1a0751dab  186b  83c2ff               addl rdx,0xff
0x27c1a0751dae  186e  0f841a000000         jz 0x27c1a0751dce  <+0x188e>
0x27c1a0751db4  1874  4183c701             addl r15,0x1
0x27c1a0751db8  1878  430fb61c3c           movzxbl rbx,[r12+r15*1]
0x27c1a0751dbd  187d  85db                 testl rbx,rbx
0x27c1a0751dbf  187f  0f840c000000         jz 0x27c1a0751dd1  <+0x1891>
0x27c1a0751dc5  1885  83c2ff               addl rdx,0xff
0x27c1a0751dc8  1888  0f8572ffffff         jnz 0x27c1a0751d40  <+0x1800>
0x27c1a0751dce  188e  4533ff               xorl r15,r15
0x27c1a0751dd1  1891  418bdf               movl rbx,r15
0x27c1a0751dd4  1894  412bdb               subl rbx,r11
0x27c1a0751dd7  1897  4585ff               testl r15,r15
0x27c1a0751dda  189a  0f45fb               cmovnzl rdi,rbx
0x27c1a0751ddd  189d  468d3c1f             leal r15,[rdi+r11*1]
0x27c1a0751de1  18a1  837dd000             cmpl [rbp-0x30],0x0
0x27c1a0751de5  18a5  0f8d37000000         jge 0x27c1a0751e22  <+0x18e2>
0x27c1a0751deb  18ab  430fb61c3c           movzxbl rbx,[r12+r15*1]
0x27c1a0751df0  18b0  85db                 testl rbx,rbx
0x27c1a0751df2  18b2  0f8567090000         jnz 0x27c1a075275f  <+0x221f>
0x27c1a0751df8  18b8  8b9d50ffffff         movl rbx,[rbp-0xb0]
0x27c1a0751dfe  18be  81e3fffffeff         andl rbx,0xfffeffff
0x27c1a0751e04  18c4  48897dd0             REX.W movq [rbp-0x30],rdi
0x27c1a0751e08  18c8  418bff               movl rdi,r15
0x27c1a0751e0b  18cb  448bbd58ffffff       movl r15,[rbp-0xa8]
0x27c1a0751e12  18d2  33c9                 xorl rcx,rcx
0x27c1a0751e14  18d4  418bd3               movl rdx,r11
0x27c1a0751e17  18d7  41bb00040000         movl r11,0x400
0x27c1a0751e1d  18dd  e931060000           jmp 0x27c1a0752453  <+0x1f13>
0x27c1a0751e22  18e2  8b9d50ffffff         movl rbx,[rbp-0xb0]
0x27c1a0751e28  18e8  81e3fffffeff         andl rbx,0xfffeffff
0x27c1a0751e2e  18ee  48897dd0             REX.W movq [rbp-0x30],rdi
0x27c1a0751e32  18f2  418bff               movl rdi,r15
0x27c1a0751e35  18f5  448bbd58ffffff       movl r15,[rbp-0xa8]
0x27c1a0751e3c  18fc  33c9                 xorl rcx,rcx
0x27c1a0751e3e  18fe  418bd3               movl rdx,r11
0x27c1a0751e41  1901  41bb00040000         movl r11,0x400
0x27c1a0751e47  1907  e907060000           jmp 0x27c1a0752453  <+0x1f13>
0x27c1a0751e4c  190c  0f1f4000             nop
0x27c1a0751e50  1910  418d7838             leal rdi,[r8+0x38]
0x27c1a0751e54  1914  448b9d50ffffff       movl r11,[rbp-0xb0]
0x27c1a0751e5b  191b  4181e3fffffeff       andl r11,0xfffeffff
0x27c1a0751e62  1922  8b9d50ffffff         movl rbx,[rbp-0xb0]
0x27c1a0751e68  1928  66f78550ffffff0020   testw [rbp-0xb0],0x2000
0x27c1a0751e71  1931  410f45db             cmovnzl rbx,r11
0x27c1a0751e75  1935  41bb00040000         movl r11,0x400
0x27c1a0751e7b  193b  33c9                 xorl rcx,rcx
0x27c1a0751e7d  193d  8b9570ffffff         movl rdx,[rbp-0x90]
0x27c1a0751e83  1943  e9cb050000           jmp 0x27c1a0752453  <+0x1f13>
0x27c1a0751e88  1948  0f1f840000000000     nop
0x27c1a0751e90  1950  4b8b7c0440           REX.W movq rdi,[r12+r8*1+0x40]
0x27c1a0751e95  1955  41bb00040000         movl r11,0x400
0x27c1a0751e9b  195b  33db                 xorl rbx,rbx
0x27c1a0751e9d  195d  418d5038             leal rdx,[r8+0x38]
0x27c1a0751ea1  1961  48b90000000001000000 REX.W movq rcx,0x100000000
0x27c1a0751eab  196b  483bf9               REX.W cmpq rdi,rcx
0x27c1a0751eae  196e  0f8271010000         jc 0x27c1a0752025  <+0x1ae5>
0x27c1a0751eb4  1974  49bf6766666666666666 REX.W movq r15,0x6666666666666667
0x27c1a0751ebe  197e  48beffffffff09000000 REX.W movq rsi,0x9ffffffff
0x27c1a0751ec8  1988  488b4db8             REX.W movq rcx,[rbp-0x48]
0x27c1a0751ecc  198c  e937000000           jmp 0x27c1a0751f08  <+0x19c8>
0x27c1a0751ed1  1991  660f1f840000000000   nop
0x27c1a0751eda  199a  660f1f840000000000   nop
0x27c1a0751ee3  19a3  660f1f840000000000   nop
0x27c1a0751eec  19ac  660f1f840000000000   nop
0x27c1a0751ef5  19b5  660f1f840000000000   nop
0x27c1a0751efe  19be  6690                 nop
0x27c1a0751f00  19c0  4c8bd2               REX.W movq r10,rdx
0x27c1a0751f03  19c3  8bd7                 movl rdx,rdi
0x27c1a0751f05  19c5  498bfa               REX.W movq rdi,r10
0x27c1a0751f08  19c8  483b21               REX.W cmpq rsp,[rcx]
0x27c1a0751f0b  19cb  0f860e0b0000         jna 0x27c1a0752a1f  <+0x24df>
0x27c1a0751f11  19d1  4c8bcf               REX.W movq r9,rdi
0x27c1a0751f14  19d4  49d1e9               REX.W shrq r9, 1
0x27c1a0751f17  19d7  498bc1               REX.W movq rax,r9
0x27c1a0751f1a  19da  448bca               movl r9,rdx
0x27c1a0751f1d  19dd  49f7e7               REX.W mulq r15
0x27c1a0751f20  19e0  48d1ea               REX.W shrq rdx, 1
0x27c1a0751f23  19e3  486bc20a             REX.W imulq rax,rdx,0xa
0x27c1a0751f27  19e7  4c8bc7               REX.W movq r8,rdi
0x27c1a0751f2a  19ea  4c2bc0               REX.W subq r8,rax
0x27c1a0751f2d  19ed  4183e901             subl r9,0x1
0x27c1a0751f31  19f1  4183c830             orl r8,0x30
0x27c1a0751f35  19f5  4788040c             movb [r12+r9*1],r8l
0x27c1a0751f39  19f9  483bf7               REX.W cmpq rsi,rdi
0x27c1a0751f3c  19fc  0f83d8000000         jnc 0x27c1a075201a  <+0x1ada>
0x27c1a0751f42  1a02  488bfa               REX.W movq rdi,rdx
0x27c1a0751f45  1a05  48d1ef               REX.W shrq rdi, 1
0x27c1a0751f48  1a08  488bc7               REX.W movq rax,rdi
0x27c1a0751f4b  1a0b  488bfa               REX.W movq rdi,rdx
0x27c1a0751f4e  1a0e  49f7e7               REX.W mulq r15
0x27c1a0751f51  1a11  4c8bc2               REX.W movq r8,rdx
0x27c1a0751f54  1a14  49d1e8               REX.W shrq r8, 1
0x27c1a0751f57  1a17  496bc00a             REX.W imulq rax,r8,0xa
0x27c1a0751f5b  1a1b  488bd7               REX.W movq rdx,rdi
0x27c1a0751f5e  1a1e  482bd0               REX.W subq rdx,rax
0x27c1a0751f61  1a21  4183e901             subl r9,0x1
0x27c1a0751f65  1a25  83ca30               orl rdx,0x30
0x27c1a0751f68  1a28  4388140c             movb [r12+r9*1],dl
0x27c1a0751f6c  1a2c  483bf7               REX.W cmpq rsi,rdi
0x27c1a0751f6f  1a2f  0f8392000000         jnc 0x27c1a0752007  <+0x1ac7>
0x27c1a0751f75  1a35  498bf8               REX.W movq rdi,r8
0x27c1a0751f78  1a38  48d1ef               REX.W shrq rdi, 1
0x27c1a0751f7b  1a3b  488bc7               REX.W movq rax,rdi
0x27c1a0751f7e  1a3e  49f7e7               REX.W mulq r15
0x27c1a0751f81  1a41  488bfa               REX.W movq rdi,rdx
0x27c1a0751f84  1a44  48d1ef               REX.W shrq rdi, 1
0x27c1a0751f87  1a47  486bc70a             REX.W imulq rax,rdi,0xa
0x27c1a0751f8b  1a4b  498bd0               REX.W movq rdx,r8
0x27c1a0751f8e  1a4e  482bd0               REX.W subq rdx,rax
0x27c1a0751f91  1a51  4183e901             subl r9,0x1
0x27c1a0751f95  1a55  83ca30               orl rdx,0x30
0x27c1a0751f98  1a58  4388140c             movb [r12+r9*1],dl
0x27c1a0751f9c  1a5c  493bf0               REX.W cmpq rsi,r8
0x27c1a0751f9f  1a5f  0f836a000000         jnc 0x27c1a075200f  <+0x1acf>
0x27c1a0751fa5  1a65  4c8bc7               REX.W movq r8,rdi
0x27c1a0751fa8  1a68  49d1e8               REX.W shrq r8, 1
0x27c1a0751fab  1a6b  498bc0               REX.W movq rax,r8
0x27c1a0751fae  1a6e  49f7e7               REX.W mulq r15
0x27c1a0751fb1  1a71  4c8bc2               REX.W movq r8,rdx
0x27c1a0751fb4  1a74  49d1e8               REX.W shrq r8, 1
0x27c1a0751fb7  1a77  496bc00a             REX.W imulq rax,r8,0xa
0x27c1a0751fbb  1a7b  488bd7               REX.W movq rdx,rdi
0x27c1a0751fbe  1a7e  482bd0               REX.W subq rdx,rax
0x27c1a0751fc1  1a81  4183e901             subl r9,0x1
0x27c1a0751fc5  1a85  83ca30               orl rdx,0x30
0x27c1a0751fc8  1a88  4388140c             movb [r12+r9*1],dl
0x27c1a0751fcc  1a8c  483bf7               REX.W cmpq rsi,rdi
0x27c1a0751fcf  1a8f  0f8332000000         jnc 0x27c1a0752007  <+0x1ac7>
0x27c1a0751fd5  1a95  498bf8               REX.W movq rdi,r8
0x27c1a0751fd8  1a98  48d1ef               REX.W shrq rdi, 1
0x27c1a0751fdb  1a9b  488bc7               REX.W movq rax,rdi
0x27c1a0751fde  1a9e  49f7e7               REX.W mulq r15
0x27c1a0751fe1  1aa1  48d1ea               REX.W shrq rdx, 1
0x27c1a0751fe4  1aa4  486bfa0a             REX.W imulq rdi,rdx,0xa
0x27c1a0751fe8  1aa8  498bc0               REX.W movq rax,r8
0x27c1a0751feb  1aab  482bc7               REX.W subq rax,rdi
0x27c1a0751fee  1aae  418d79ff             leal rdi,[r9-0x1]
0x27c1a0751ff2  1ab2  83c830               orl rax,0x30
0x27c1a0751ff5  1ab5  4188043c             movb [r12+rdi*1],al
0x27c1a0751ff9  1ab9  493bf0               REX.W cmpq rsi,r8
0x27c1a0751ffc  1abc  0f82fefeffff         jc 0x27c1a0751f00  <+0x19c0>
0x27c1a0752002  1ac2  e910000000           jmp 0x27c1a0752017  <+0x1ad7>
0x27c1a0752007  1ac7  498bd0               REX.W movq rdx,r8
0x27c1a075200a  1aca  e90b000000           jmp 0x27c1a075201a  <+0x1ada>
0x27c1a075200f  1acf  488bd7               REX.W movq rdx,rdi
0x27c1a0752012  1ad2  e903000000           jmp 0x27c1a075201a  <+0x1ada>
0x27c1a0752017  1ad7  448bcf               movl r9,rdi
0x27c1a075201a  1ada  488bfa               REX.W movq rdi,rdx
0x27c1a075201d  1add  418bd1               movl rdx,r9
0x27c1a0752020  1ae0  e904000000           jmp 0x27c1a0752029  <+0x1ae9>
0x27c1a0752025  1ae5  488b4db8             REX.W movq rcx,[rbp-0x48]
0x27c1a0752029  1ae9  8bff                 movl rdi,rdi
0x27c1a075202b  1aeb  85ff                 testl rdi,rdi
0x27c1a075202d  1aed  0f8508000000         jnz 0x27c1a075203b  <+0x1afb>
0x27c1a0752033  1af3  448bc2               movl r8,rdx
0x27c1a0752036  1af6  e924010000           jmp 0x27c1a075215f  <+0x1c1f>
0x27c1a075203b  1afb  448bc2               movl r8,rdx
0x27c1a075203e  1afe  41bf67666666         movl r15,0x66666667
0x27c1a0752044  1b04  e939000000           jmp 0x27c1a0752082  <+0x1b42>
0x27c1a0752049  1b09  660f1f840000000000   nop
0x27c1a0752052  1b12  660f1f840000000000   nop
0x27c1a075205b  1b1b  660f1f840000000000   nop
0x27c1a0752064  1b24  660f1f840000000000   nop
0x27c1a075206d  1b2d  660f1f840000000000   nop
0x27c1a0752076  1b36  660f1f840000000000   nop
0x27c1a075207f  1b3f  90                   nop
0x27c1a0752080  1b40  8bfa                 movl rdi,rdx
0x27c1a0752082  1b42  483b21               REX.W cmpq rsp,[rcx]
0x27c1a0752085  1b45  0f86e4090000         jna 0x27c1a0752a6f  <+0x252f>
0x27c1a075208b  1b4b  8bc7                 movl rax,rdi
0x27c1a075208d  1b4d  d1e8                 shrl rax, 1
0x27c1a075208f  1b4f  41f7e7               mull r15
0x27c1a0752092  1b52  4c8bca               REX.W movq r9,rdx
0x27c1a0752095  1b55  41d1e9               shrl r9, 1
0x27c1a0752098  1b58  416bc10a             imull rax,r9,0xa
0x27c1a075209c  1b5c  8bd7                 movl rdx,rdi
0x27c1a075209e  1b5e  2bd0                 subl rdx,rax
0x27c1a07520a0  1b60  4183e801             subl r8,0x1
0x27c1a07520a4  1b64  83ca30               orl rdx,0x30
0x27c1a07520a7  1b67  43881404             movb [r12+r8*1],dl
0x27c1a07520ab  1b6b  8b7598               movl rsi,[rbp-0x68]
0x27c1a07520ae  1b6e  83ff09               cmpl rdi,0x9
0x27c1a07520b1  1b71  0f86a8000000         jna 0x27c1a075215f  <+0x1c1f>
0x27c1a07520b7  1b77  418bf9               movl rdi,r9
0x27c1a07520ba  1b7a  d1ef                 shrl rdi, 1
0x27c1a07520bc  1b7c  8bc7                 movl rax,rdi
0x27c1a07520be  1b7e  41f7e7               mull r15
0x27c1a07520c1  1b81  488bfa               REX.W movq rdi,rdx
0x27c1a07520c4  1b84  d1ef                 shrl rdi, 1
0x27c1a07520c6  1b86  6bc70a               imull rax,rdi,0xa
0x27c1a07520c9  1b89  418bd1               movl rdx,r9
0x27c1a07520cc  1b8c  2bd0                 subl rdx,rax
0x27c1a07520ce  1b8e  4183e801             subl r8,0x1
0x27c1a07520d2  1b92  83ca30               orl rdx,0x30
0x27c1a07520d5  1b95  43881404             movb [r12+r8*1],dl
0x27c1a07520d9  1b99  4183f909             cmpl r9,0x9
0x27c1a07520dd  1b9d  0f867c000000         jna 0x27c1a075215f  <+0x1c1f>
0x27c1a07520e3  1ba3  8bc7                 movl rax,rdi
0x27c1a07520e5  1ba5  d1e8                 shrl rax, 1
0x27c1a07520e7  1ba7  41f7e7               mull r15
0x27c1a07520ea  1baa  4c8bca               REX.W movq r9,rdx
0x27c1a07520ed  1bad  41d1e9               shrl r9, 1
0x27c1a07520f0  1bb0  416bc10a             imull rax,r9,0xa
0x27c1a07520f4  1bb4  8bd7                 movl rdx,rdi
0x27c1a07520f6  1bb6  2bd0                 subl rdx,rax
0x27c1a07520f8  1bb8  4183e801             subl r8,0x1
0x27c1a07520fc  1bbc  83ca30               orl rdx,0x30
0x27c1a07520ff  1bbf  43881404             movb [r12+r8*1],dl
0x27c1a0752103  1bc3  83ff09               cmpl rdi,0x9
0x27c1a0752106  1bc6  0f8653000000         jna 0x27c1a075215f  <+0x1c1f>
0x27c1a075210c  1bcc  418bf9               movl rdi,r9
0x27c1a075210f  1bcf  d1ef                 shrl rdi, 1
0x27c1a0752111  1bd1  8bc7                 movl rax,rdi
0x27c1a0752113  1bd3  41f7e7               mull r15
0x27c1a0752116  1bd6  488bfa               REX.W movq rdi,rdx
0x27c1a0752119  1bd9  d1ef                 shrl rdi, 1
0x27c1a075211b  1bdb  6bc70a               imull rax,rdi,0xa
0x27c1a075211e  1bde  418bd1               movl rdx,r9
0x27c1a0752121  1be1  2bd0                 subl rdx,rax
0x27c1a0752123  1be3  4183e801             subl r8,0x1
0x27c1a0752127  1be7  83ca30               orl rdx,0x30
0x27c1a075212a  1bea  43881404             movb [r12+r8*1],dl
0x27c1a075212e  1bee  4183f909             cmpl r9,0x9
0x27c1a0752132  1bf2  0f8627000000         jna 0x27c1a075215f  <+0x1c1f>
0x27c1a0752138  1bf8  8bc7                 movl rax,rdi
0x27c1a075213a  1bfa  d1e8                 shrl rax, 1
0x27c1a075213c  1bfc  41f7e7               mull r15
0x27c1a075213f  1bff  d1ea                 shrl rdx, 1
0x27c1a0752141  1c01  6bc20a               imull rax,rdx,0xa
0x27c1a0752144  1c04  448bcf               movl r9,rdi
0x27c1a0752147  1c07  442bc8               subl r9,rax
0x27c1a075214a  1c0a  4183e801             subl r8,0x1
0x27c1a075214e  1c0e  4183c930             orl r9,0x30
0x27c1a0752152  1c12  47880c04             movb [r12+r8*1],r9l
0x27c1a0752156  1c16  83ff09               cmpl rdi,0x9
0x27c1a0752159  1c19  0f8721ffffff         ja 0x27c1a0752080  <+0x1b40>
0x27c1a075215f  1c1f  8bbd50ffffff         movl rdi,[rbp-0xb0]
0x27c1a0752165  1c25  81e7fffffeff         andl rdi,0xfffeffff
0x27c1a075216b  1c2b  448bbd50ffffff       movl r15,[rbp-0xb0]
0x27c1a0752172  1c32  66f78550ffffff0020   testw [rbp-0xb0],0x2000
0x27c1a075217b  1c3b  440f45ff             cmovnzl r15,rdi
0x27c1a075217f  1c3f  418bf8               movl rdi,r8
0x27c1a0752182  1c42  448b4da0             movl r9,[rbp-0x60]
0x27c1a0752186  1c46  8b4598               movl rax,[rbp-0x68]
0x27c1a0752189  1c49  418bcf               movl rcx,r15
0x27c1a075218c  1c4c  8b55d0               movl rdx,[rbp-0x30]
0x27c1a075218f  1c4f  448b45e0             movl r8,[rbp-0x20]
0x27c1a0752193  1c53  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a0752197  1c57  e91c020000           jmp 0x27c1a07523b8  <+0x1e78>
0x27c1a075219c  1c5c  0f1f4000             nop
0x27c1a07521a0  1c60  418d7838             leal rdi,[r8+0x38]
0x27c1a07521a4  1c64  448b9d50ffffff       movl r11,[rbp-0xb0]
0x27c1a07521ab  1c6b  4181e3fffffeff       andl r11,0xfffeffff
0x27c1a07521b2  1c72  8b9d50ffffff         movl rbx,[rbp-0xb0]
0x27c1a07521b8  1c78  66f78550ffffff0020   testw [rbp-0xb0],0x2000
0x27c1a07521c1  1c81  410f45db             cmovnzl rbx,r11
0x27c1a07521c5  1c85  41bb00040000         movl r11,0x400
0x27c1a07521cb  1c8b  33c9                 xorl rcx,rcx
0x27c1a07521cd  1c8d  8b9570ffffff         movl rdx,[rbp-0x90]
0x27c1a07521d3  1c93  e97b020000           jmp 0x27c1a0752453  <+0x1f13>
0x27c1a07521d8  1c98  0f1f840000000000     nop
0x27c1a07521e0  1ca0  418d7838             leal rdi,[r8+0x38]
0x27c1a07521e4  1ca4  448b9d50ffffff       movl r11,[rbp-0xb0]
0x27c1a07521eb  1cab  4181e3fffffeff       andl r11,0xfffeffff
0x27c1a07521f2  1cb2  8b9d50ffffff         movl rbx,[rbp-0xb0]
0x27c1a07521f8  1cb8  66f78550ffffff0020   testw [rbp-0xb0],0x2000
0x27c1a0752201  1cc1  410f45db             cmovnzl rbx,r11
0x27c1a0752205  1cc5  41bb00040000         movl r11,0x400
0x27c1a075220b  1ccb  33c9                 xorl rcx,rcx
0x27c1a075220d  1ccd  8b9570ffffff         movl rdx,[rbp-0x90]
0x27c1a0752213  1cd3  e93b020000           jmp 0x27c1a0752453  <+0x1f13>
0x27c1a0752218  1cd8  0f1f840000000000     nop
0x27c1a0752220  1ce0  8bbd50ffffff         movl rdi,[rbp-0xb0]
0x27c1a0752226  1ce6  81e7fffffeff         andl rdi,0xfffeffff
0x27c1a075222c  1cec  8b9d50ffffff         movl rbx,[rbp-0xb0]
0x27c1a0752232  1cf2  66f78550ffffff0020   testw [rbp-0xb0],0x2000
0x27c1a075223b  1cfb  0f45df               cmovnzl rbx,rdi
0x27c1a075223e  1cfe  8b55d0               movl rdx,[rbp-0x30]
0x27c1a0752241  1d01  418d7838             leal rdi,[r8+0x38]
0x27c1a0752245  1d05  4b8b4c0440           REX.W movq rcx,[r12+r8*1+0x40]
0x27c1a075224a  1d0a  4885c9               REX.W testq rcx,rcx
0x27c1a075224d  1d0d  0f841e010000         jz 0x27c1a0752371  <+0x1e31>
0x27c1a0752253  1d13  458bfb               movl r15,r11
0x27c1a0752256  1d16  4183e720             andl r15,0x20
0x27c1a075225a  1d1a  448bcf               movl r9,rdi
0x27c1a075225d  1d1d  488bf9               REX.W movq rdi,rcx
0x27c1a0752260  1d20  e91f000000           jmp 0x27c1a0752284  <+0x1d44>
0x27c1a0752265  1d25  660f1f840000000000   nop
0x27c1a075226e  1d2e  660f1f840000000000   nop
0x27c1a0752277  1d37  660f1f840000000000   nop
0x27c1a0752280  1d40  48c1ef04             REX.W shrq rdi, 4
0x27c1a0752284  1d44  488b4db8             REX.W movq rcx,[rbp-0x48]
0x27c1a0752288  1d48  483b21               REX.W cmpq rsp,[rcx]
0x27c1a075228b  1d4b  0f8626080000         jna 0x27c1a0752ab7  <+0x2577>
0x27c1a0752291  1d51  488bc7               REX.W movq rax,rdi
0x27c1a0752294  1d54  83e00f               andl rax,0xf
0x27c1a0752297  1d57  0500060000           add rax,0x600
0x27c1a075229c  1d5c  410fb60404           movzxbl rax,[r12+rax*1]
0x27c1a07522a1  1d61  4183e901             subl r9,0x1
0x27c1a07522a5  1d65  410bc7               orl rax,r15
0x27c1a07522a8  1d68  4388040c             movb [r12+r9*1],al
0x27c1a07522ac  1d6c  4883ff0f             REX.W cmpq rdi,0xf
0x27c1a07522b0  1d70  0f86aa000000         jna 0x27c1a0752360  <+0x1e20>
0x27c1a07522b6  1d76  48c1ef04             REX.W shrq rdi, 4
0x27c1a07522ba  1d7a  488bc7               REX.W movq rax,rdi
0x27c1a07522bd  1d7d  83e00f               andl rax,0xf
0x27c1a07522c0  1d80  0500060000           add rax,0x600
0x27c1a07522c5  1d85  410fb60404           movzxbl rax,[r12+rax*1]
0x27c1a07522ca  1d8a  4183e901             subl r9,0x1
0x27c1a07522ce  1d8e  410bc7               orl rax,r15
0x27c1a07522d1  1d91  4388040c             movb [r12+r9*1],al
0x27c1a07522d5  1d95  4883ff0f             REX.W cmpq rdi,0xf
0x27c1a07522d9  1d99  0f8681000000         jna 0x27c1a0752360  <+0x1e20>
0x27c1a07522df  1d9f  48c1ef04             REX.W shrq rdi, 4
0x27c1a07522e3  1da3  488bc7               REX.W movq rax,rdi
0x27c1a07522e6  1da6  83e00f               andl rax,0xf
0x27c1a07522e9  1da9  0500060000           add rax,0x600
0x27c1a07522ee  1dae  410fb60404           movzxbl rax,[r12+rax*1]
0x27c1a07522f3  1db3  4183e901             subl r9,0x1
0x27c1a07522f7  1db7  410bc7               orl rax,r15
0x27c1a07522fa  1dba  4388040c             movb [r12+r9*1],al
0x27c1a07522fe  1dbe  4883ff0f             REX.W cmpq rdi,0xf
0x27c1a0752302  1dc2  0f8658000000         jna 0x27c1a0752360  <+0x1e20>
0x27c1a0752308  1dc8  48c1ef04             REX.W shrq rdi, 4
0x27c1a075230c  1dcc  488bc7               REX.W movq rax,rdi
0x27c1a075230f  1dcf  83e00f               andl rax,0xf
0x27c1a0752312  1dd2  0500060000           add rax,0x600
0x27c1a0752317  1dd7  410fb60404           movzxbl rax,[r12+rax*1]
0x27c1a075231c  1ddc  4183e901             subl r9,0x1
0x27c1a0752320  1de0  410bc7               orl rax,r15
0x27c1a0752323  1de3  4388040c             movb [r12+r9*1],al
0x27c1a0752327  1de7  4883ff0f             REX.W cmpq rdi,0xf
0x27c1a075232b  1deb  0f862f000000         jna 0x27c1a0752360  <+0x1e20>
0x27c1a0752331  1df1  48c1ef04             REX.W shrq rdi, 4
0x27c1a0752335  1df5  488bc7               REX.W movq rax,rdi
0x27c1a0752338  1df8  83e00f               andl rax,0xf
0x27c1a075233b  1dfb  0500060000           add rax,0x600
0x27c1a0752340  1e00  410fb60404           movzxbl rax,[r12+rax*1]
0x27c1a0752345  1e05  4183e901             subl r9,0x1
0x27c1a0752349  1e09  418bcf               movl rcx,r15
0x27c1a075234c  1e0c  0bc8                 orl rcx,rax
0x27c1a075234e  1e0e  43880c0c             movb [r12+r9*1],cl
0x27c1a0752352  1e12  4883ff0f             REX.W cmpq rdi,0xf
0x27c1a0752356  1e16  0f8724ffffff         ja 0x27c1a0752280  <+0x1d40>
0x27c1a075235c  1e1c  488b4db8             REX.W movq rcx,[rbp-0x48]
0x27c1a0752360  1e20  418bf9               movl rdi,r9
0x27c1a0752363  1e23  8b4598               movl rax,[rbp-0x68]
0x27c1a0752366  1e26  448bbd58ffffff       movl r15,[rbp-0xa8]
0x27c1a075236d  1e2d  448b4da0             movl r9,[rbp-0x60]
0x27c1a0752371  1e31  4b8b4c0440           REX.W movq rcx,[r12+r8*1+0x40]
0x27c1a0752376  1e36  4885c9               REX.W testq rcx,rcx
0x27c1a0752379  1e39  0f842f000000         jz 0x27c1a07523ae  <+0x1e6e>
0x27c1a075237f  1e3f  f6c308               testb rbx,0x8
0x27c1a0752382  1e42  0f850f000000         jnz 0x27c1a0752397  <+0x1e57>
0x27c1a0752388  1e48  41bb00040000         movl r11,0x400
0x27c1a075238e  1e4e  8bcb                 movl rcx,rbx
0x27c1a0752390  1e50  33db                 xorl rbx,rbx
0x27c1a0752392  1e52  e921000000           jmp 0x27c1a07523b8  <+0x1e78>
0x27c1a0752397  1e57  41c1eb04             shrl r11, 4
0x27c1a075239b  1e5b  4181c300040000       addl r11,0x400
0x27c1a07523a2  1e62  8bcb                 movl rcx,rbx
0x27c1a07523a4  1e64  bb02000000           movl rbx,0x2
0x27c1a07523a9  1e69  e90a000000           jmp 0x27c1a07523b8  <+0x1e78>
0x27c1a07523ae  1e6e  8bcb                 movl rcx,rbx
0x27c1a07523b0  1e70  41bb00040000         movl r11,0x400
0x27c1a07523b6  1e76  33db                 xorl rbx,rbx
0x27c1a07523b8  1e78  4533ff               xorl r15,r15
0x27c1a07523bb  1e7b  85d2                 testl rdx,rdx
0x27c1a07523bd  1e7d  440f4c7dc8           cmovll r15,[rbp-0x38]
0x27c1a07523c2  1e82  4585ff               testl r15,r15
0x27c1a07523c5  1e85  0f8594030000         jnz 0x27c1a075275f  <+0x221f>
0x27c1a07523cb  1e8b  458d7838             leal r15,[r8+0x38]
0x27c1a07523cf  1e8f  4b8b440440           REX.W movq rax,[r12+r8*1+0x40]
0x27c1a07523d4  1e94  4885c0               REX.W testq rax,rax
0x27c1a07523d7  1e97  0f94c0               setzl al
0x27c1a07523da  1e9a  0fb6c0               movzxbl rax,rax
0x27c1a07523dd  1e9d  448bc1               movl r8,rcx
0x27c1a07523e0  1ea0  4181e0fffffeff       andl r8,0xfffeffff
0x27c1a07523e7  1ea7  837dc800             cmpl [rbp-0x38],0x0
0x27c1a07523eb  1eab  410f45c8             cmovnzl rcx,r8
0x27c1a07523ef  1eaf  85c0                 testl rax,rax
0x27c1a07523f1  1eb1  0f842e000000         jz 0x27c1a0752425  <+0x1ee5>
0x27c1a07523f7  1eb7  85d2                 testl rdx,rdx
0x27c1a07523f9  1eb9  0f8526000000         jnz 0x27c1a0752425  <+0x1ee5>
0x27c1a07523ff  1ebf  418bff               movl rdi,r15
0x27c1a0752402  1ec2  48c745d000000000     REX.W movq [rbp-0x30],0x0
0x27c1a075240a  1eca  4c8bd3               REX.W movq r10,rbx
0x27c1a075240d  1ecd  488bd9               REX.W movq rbx,rcx
0x27c1a0752410  1ed0  498bca               REX.W movq rcx,r10
0x27c1a0752413  1ed3  418bd7               movl rdx,r15
0x27c1a0752416  1ed6  448bbd58ffffff       movl r15,[rbp-0xa8]
0x27c1a075241d  1edd  8b4598               movl rax,[rbp-0x68]
0x27c1a0752420  1ee0  e92e000000           jmp 0x27c1a0752453  <+0x1f13>
0x27c1a0752425  1ee5  458bc7               movl r8,r15
0x27c1a0752428  1ee8  442bc7               subl r8,rdi
0x27c1a075242b  1eeb  4403c0               addl r8,rax
0x27c1a075242e  1eee  418bc0               movl rax,r8
0x27c1a0752431  1ef1  443bc2               cmpl r8,rdx
0x27c1a0752434  1ef4  0f4cc2               cmovll rax,rdx
0x27c1a0752437  1ef7  8bd7                 movl rdx,rdi
0x27c1a0752439  1ef9  418bff               movl rdi,r15
0x27c1a075243c  1efc  488945d0             REX.W movq [rbp-0x30],rax
0x27c1a0752440  1f00  4c8bd3               REX.W movq r10,rbx
0x27c1a0752443  1f03  488bd9               REX.W movq rbx,rcx
0x27c1a0752446  1f06  498bca               REX.W movq rcx,r10
0x27c1a0752449  1f09  448bbd58ffffff       movl r15,[rbp-0xa8]
0x27c1a0752450  1f10  8b4598               movl rax,[rbp-0x68]
0x27c1a0752453  1f13  2bfa                 subl rdi,rdx
0x27c1a0752455  1f15  448bc7               movl r8,rdi
0x27c1a0752458  1f18  3b7dd0               cmpl rdi,[rbp-0x30]
0x27c1a075245b  1f1b  440f4c45d0           cmovll r8,[rbp-0x30]
0x27c1a0752460  1f20  48897d90             REX.W movq [rbp-0x70],rdi
0x27c1a0752464  1f24  8bf9                 movl rdi,rcx
0x27c1a0752466  1f26  81f7ffffff7f         xorl rdi,0x7fffffff
0x27c1a075246c  1f2c  48895dc8             REX.W movq [rbp-0x38],rbx
0x27c1a0752470  1f30  48899570ffffff       REX.W movq [rbp-0x90],rdx
0x27c1a0752477  1f37  4c899d68ffffff       REX.W movq [rbp-0x98],r11
0x27c1a075247e  1f3e  48898d60ffffff       REX.W movq [rbp-0xa0],rcx
0x27c1a0752485  1f45  4c894588             REX.W movq [rbp-0x78],r8
0x27c1a0752489  1f49  413bf8               cmpl rdi,r8
0x27c1a075248c  1f4c  0f8ccd020000         jl 0x27c1a075275f  <+0x221f>
0x27c1a0752492  1f52  418d3c08             leal rdi,[r8+rcx*1]
0x27c1a0752496  1f56  448bc7               movl r8,rdi
0x27c1a0752499  1f59  3bbd78ffffff         cmpl rdi,[rbp-0x88]
0x27c1a075249f  1f5f  440f4c8578ffffff     cmovll r8,[rbp-0x88]
0x27c1a07524a7  1f67  48897dd0             REX.W movq [rbp-0x30],rdi
0x27c1a07524ab  1f6b  4c898550ffffff       REX.W movq [rbp-0xb0],r8
0x27c1a07524b2  1f72  8b7d80               movl rdi,[rbp-0x80]
0x27c1a07524b5  1f75  413bf8               cmpl rdi,r8
0x27c1a07524b8  1f78  0f8ca1020000         jl 0x27c1a075275f  <+0x221f>
0x27c1a07524be  1f7e  448bcb               movl r9,rbx
0x27c1a07524c1  1f81  ba20000000           movl rdx,0x20
0x27c1a07524c6  1f86  418bc8               movl rcx,r8
0x27c1a07524c9  1f89  8b5dd0               movl rbx,[rbp-0x30]
0x27c1a07524cc  1f8c  488bfa               REX.W movq rdi,rdx
0x27c1a07524cf  1f8f  e86ccbffff           call 0x27c1a074f040  (jump table)    ;; internal wasm call
0x27c1a07524d4  1f94  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a07524d8  1f98  8b4598               movl rax,[rbp-0x68]
0x27c1a07524db  1f9b  8b9568ffffff         movl rdx,[rbp-0x98]
0x27c1a07524e1  1fa1  8b8d60ffffff         movl rcx,[rbp-0xa0]
0x27c1a07524e7  1fa7  e841cbffff           call 0x27c1a074f02d  (jump table)    ;; internal wasm call
0x27c1a07524ec  1fac  448b4dc8             movl r9,[rbp-0x38]
0x27c1a07524f0  1fb0  4181f100000100       xorl r9,0x10000
0x27c1a07524f7  1fb7  ba30000000           movl rdx,0x30
0x27c1a07524fc  1fbc  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a0752500  1fc0  8b4598               movl rax,[rbp-0x68]
0x27c1a0752503  1fc3  8b8d50ffffff         movl rcx,[rbp-0xb0]
0x27c1a0752509  1fc9  8b5dd0               movl rbx,[rbp-0x30]
0x27c1a075250c  1fcc  e82fcbffff           call 0x27c1a074f040  (jump table)    ;; internal wasm call
0x27c1a0752511  1fd1  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a0752515  1fd5  8b4598               movl rax,[rbp-0x68]
0x27c1a0752518  1fd8  ba30000000           movl rdx,0x30
0x27c1a075251d  1fdd  8b4d88               movl rcx,[rbp-0x78]
0x27c1a0752520  1fe0  8b5d90               movl rbx,[rbp-0x70]
0x27c1a0752523  1fe3  4533c9               xorl r9,r9
0x27c1a0752526  1fe6  e815cbffff           call 0x27c1a074f040  (jump table)    ;; internal wasm call
0x27c1a075252b  1feb  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a075252f  1fef  8b4598               movl rax,[rbp-0x68]
0x27c1a0752532  1ff2  8b9570ffffff         movl rdx,[rbp-0x90]
0x27c1a0752538  1ff8  8b4d90               movl rcx,[rbp-0x70]
0x27c1a075253b  1ffb  e8edcaffff           call 0x27c1a074f02d  (jump table)    ;; internal wasm call
0x27c1a0752540  2000  448b4dc8             movl r9,[rbp-0x38]
0x27c1a0752544  2004  4181f100200000       xorl r9,0x2000
0x27c1a075254b  200b  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a075254f  200f  8b4598               movl rax,[rbp-0x68]
0x27c1a0752552  2012  ba20000000           movl rdx,0x20
0x27c1a0752557  2017  8b8d50ffffff         movl rcx,[rbp-0xb0]
0x27c1a075255d  201d  8b5dd0               movl rbx,[rbp-0x30]
0x27c1a0752560  2020  e8dbcaffff           call 0x27c1a074f040  (jump table)    ;; internal wasm call
0x27c1a0752565  2025  448bbd48ffffff       movl r15,[rbp-0xb8]
0x27c1a075256c  202c  448ba550ffffff       movl r12,[rbp-0xb0]
0x27c1a0752573  2033  8b4598               movl rax,[rbp-0x68]
0x27c1a0752576  2036  448b9d58ffffff       movl r11,[rbp-0xa8]
0x27c1a075257d  203d  4c8b45d8             REX.W movq r8,[rbp-0x28]
0x27c1a0752581  2041  488b7db8             REX.W movq rdi,[rbp-0x48]
0x27c1a0752585  2045  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a0752589  2049  e93fe0ffff           jmp 0x27c1a07505cd  <+0x8d>
0x27c1a075258e  204e  85c0                 testl rax,rax
0x27c1a0752590  2050  0f853c010000         jnz 0x27c1a07526d2  <+0x2192>
0x27c1a0752596  2056  837da000             cmpl [rbp-0x60],0x0
0x27c1a075259a  205a  0f844d010000         jz 0x27c1a07526ed  <+0x21ad>
0x27c1a07525a0  2060  4d8be0               REX.W movq r12,r8
0x27c1a07525a3  2063  4c8bc7               REX.W movq r8,rdi
0x27c1a07525a6  2066  bf01000000           movl rdi,0x1
0x27c1a07525ab  206b  e922000000           jmp 0x27c1a07525d2  <+0x2092>
0x27c1a07525b0  2070  660f1f840000000000   nop
0x27c1a07525b9  2079  0f1f8000000000       nop
0x27c1a07525c0  2080  8b7dd0               movl rdi,[rbp-0x30]
0x27c1a07525c3  2083  83c701               addl rdi,0x1
0x27c1a07525c6  2086  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a07525ca  208a  4c8b65d8             REX.W movq r12,[rbp-0x28]
0x27c1a07525ce  208e  4c8b45b8             REX.W movq r8,[rbp-0x48]
0x27c1a07525d2  2092  448b5dc0             movl r11,[rbp-0x40]
0x27c1a07525d6  2096  448b7da8             movl r15,[rbp-0x58]
0x27c1a07525da  209a  493b20               REX.W cmpq rsp,[r8]
0x27c1a07525dd  209d  0f862e050000         jna 0x27c1a0752b11  <+0x25d1>
0x27c1a07525e3  20a3  418d04bb             leal rax,[r11+rdi*4]
0x27c1a07525e7  20a7  418b1404             movl rdx,[r12+rax*1]
0x27c1a07525eb  20ab  85d2                 testl rdx,rdx
0x27c1a07525ed  20ad  0f841c000000         jz 0x27c1a075260f  <+0x20cf>
0x27c1a07525f3  20b3  418d04ff             leal rax,[r15+rdi*8]
0x27c1a07525f7  20b7  48897dd0             REX.W movq [rbp-0x30],rdi
0x27c1a07525fb  20bb  8b4db0               movl rcx,[rbp-0x50]
0x27c1a07525fe  20be  e834caffff           call 0x27c1a074f037  (jump table)    ;; internal wasm call
0x27c1a0752603  20c3  837dd009             cmpl [rbp-0x30],0x9
0x27c1a0752607  20c7  0f84ae000000         jz 0x27c1a07526bb  <+0x217b>
0x27c1a075260d  20cd  ebb1                 jmp 0x27c1a07525c0  <+0x2080>
0x27c1a075260f  20cf  83ff0a               cmpl rdi,0xa
0x27c1a0752612  20d2  0f83a3000000         jnc 0x27c1a07526bb  <+0x217b>
0x27c1a0752618  20d8  e926000000           jmp 0x27c1a0752643  <+0x2103>
0x27c1a075261d  20dd  660f1f840000000000   nop
0x27c1a0752626  20e6  660f1f840000000000   nop
0x27c1a075262f  20ef  660f1f840000000000   nop
0x27c1a0752638  20f8  0f1f840000000000     nop
0x27c1a0752640  2100  83c701               addl rdi,0x1
0x27c1a0752643  2103  493b20               REX.W cmpq rsp,[r8]
0x27c1a0752646  2106  0f86ea040000         jna 0x27c1a0752b36  <+0x25f6>
0x27c1a075264c  210c  458d3cbb             leal r15,[r11+rdi*4]
0x27c1a0752650  2110  478b3c3c             movl r15,[r12+r15*1]
0x27c1a0752654  2114  4585ff               testl r15,r15
0x27c1a0752657  2117  0f856c000000         jnz 0x27c1a07526c9  <+0x2189>
0x27c1a075265d  211d  83ff09               cmpl rdi,0x9
0x27c1a0752660  2120  0f8455000000         jz 0x27c1a07526bb  <+0x217b>
0x27c1a0752666  2126  448d7f01             leal r15,[rdi+0x1]
0x27c1a075266a  212a  438d04bb             leal rax,[r11+r15*4]
0x27c1a075266e  212e  418b0404             movl rax,[r12+rax*1]
0x27c1a0752672  2132  85c0                 testl rax,rax
0x27c1a0752674  2134  0f854f000000         jnz 0x27c1a07526c9  <+0x2189>
0x27c1a075267a  213a  4183ff09             cmpl r15,0x9
0x27c1a075267e  213e  0f8437000000         jz 0x27c1a07526bb  <+0x217b>
0x27c1a0752684  2144  4183c701             addl r15,0x1
0x27c1a0752688  2148  438d04bb             leal rax,[r11+r15*4]
0x27c1a075268c  214c  418b0404             movl rax,[r12+rax*1]
0x27c1a0752690  2150  85c0                 testl rax,rax
0x27c1a0752692  2152  0f8531000000         jnz 0x27c1a07526c9  <+0x2189>
0x27c1a0752698  2158  83ff07               cmpl rdi,0x7
0x27c1a075269b  215b  0f841a000000         jz 0x27c1a07526bb  <+0x217b>
0x27c1a07526a1  2161  418d7f01             leal rdi,[r15+0x1]
0x27c1a07526a5  2165  418d04bb             leal rax,[r11+rdi*4]
0x27c1a07526a9  2169  418b0404             movl rax,[r12+rax*1]
0x27c1a07526ad  216d  85c0                 testl rax,rax
0x27c1a07526af  216f  0f8514000000         jnz 0x27c1a07526c9  <+0x2189>
0x27c1a07526b5  2175  4183ff08             cmpl r15,0x8
0x27c1a07526b9  2179  7585                 jnz 0x27c1a0752640  <+0x2100>
0x27c1a07526bb  217b  41bf01000000         movl r15,0x1
0x27c1a07526c1  2181  8b7de0               movl rdi,[rbp-0x20]
0x27c1a07526c4  2184  e9b0000000           jmp 0x27c1a0752779  <+0x2239>
0x27c1a07526c9  2189  448b45e0             movl r8,[rbp-0x20]
0x27c1a07526cd  218d  e980000000           jmp 0x27c1a0752752  <+0x2212>
0x27c1a07526d2  2192  8b7de0               movl rdi,[rbp-0x20]
0x27c1a07526d5  2195  e99f000000           jmp 0x27c1a0752779  <+0x2239>
0x27c1a07526da  219a  4c8b65d8             REX.W movq r12,[rbp-0x28]
0x27c1a07526de  219e  e97c000000           jmp 0x27c1a075275f  <+0x221f>
0x27c1a07526e3  21a3  bf1c000000           movl rdi,0x1c
0x27c1a07526e8  21a8  e97b000000           jmp 0x27c1a0752768  <+0x2228>
0x27c1a07526ed  21ad  4533ff               xorl r15,r15
0x27c1a07526f0  21b0  8b7de0               movl rdi,[rbp-0x20]
0x27c1a07526f3  21b3  e981000000           jmp 0x27c1a0752779  <+0x2239>
0x27c1a07526f8  21b8  bf3d000000           movl rdi,0x3d
0x27c1a07526fd  21bd  448b45e0             movl r8,[rbp-0x20]
0x27c1a0752701  21c1  4c8b65d8             REX.W movq r12,[rbp-0x28]
0x27c1a0752705  21c5  e95e000000           jmp 0x27c1a0752768  <+0x2228>
0x27c1a075270a  21ca  448b45e0             movl r8,[rbp-0x20]
0x27c1a075270e  21ce  e95d000000           jmp 0x27c1a0752770  <+0x2230>
0x27c1a0752713  21d3  33ff                 xorl rdi,rdi
0x27c1a0752715  21d5  837dd000             cmpl [rbp-0x30],0x0
0x27c1a0752719  21d9  0f4c7dc8             cmovll rdi,[rbp-0x38]
0x27c1a075271d  21dd  85ff                 testl rdi,rdi
0x27c1a075271f  21df  0f853a000000         jnz 0x27c1a075275f  <+0x221f>
0x27c1a0752725  21e5  418bf8               movl rdi,r8
0x27c1a0752728  21e8  c4c17b10443c40       vmovsd xmm0,[r12+rdi*1+0x40]
0x27c1a075272f  21ef  33ff                 xorl rdi,rdi
0x27c1a0752731  21f1  85ff                 testl rdi,rdi
0x27c1a0752733  21f3  0f841a040000         jz 0x27c1a0752b53  <+0x2613>
0x27c1a0752739  21f9  e921000000           jmp 0x27c1a075275f  <+0x221f>
0x27c1a075273e  21fe  bf1c000000           movl rdi,0x1c
0x27c1a0752743  2203  e920000000           jmp 0x27c1a0752768  <+0x2228>
0x27c1a0752748  2208  bf1c000000           movl rdi,0x1c
0x27c1a075274d  220d  e916000000           jmp 0x27c1a0752768  <+0x2228>
0x27c1a0752752  2212  bf1c000000           movl rdi,0x1c
0x27c1a0752757  2217  e90c000000           jmp 0x27c1a0752768  <+0x2228>
0x27c1a075275c  221c  4d8be0               REX.W movq r12,r8
0x27c1a075275f  221f  bf3d000000           movl rdi,0x3d
0x27c1a0752764  2224  448b45e0             movl r8,[rbp-0x20]
0x27c1a0752768  2228  4189bc24c40a0000     movl [r12+0xac4],rdi
0x27c1a0752770  2230  41bfffffffff         movl r15,0xffffffff
0x27c1a0752776  2236  418bf8               movl rdi,r8
0x27c1a0752779  2239  83c750               addl rdi,0x50
0x27c1a075277c  223c  4c8b45e8             REX.W movq r8,[rbp-0x18]
0x27c1a0752780  2240  418938               movl [r8],rdi
0x27c1a0752783  2243  418bc7               movl rax,r15
0x27c1a0752786  2246  488be5               REX.W movq rsp,rbp
0x27c1a0752789  2249  5d                   pop rbp
0x27c1a075278a  224a  c3                   retl
0x27c1a075278b  224b  e880cbffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a0752790  2250  8b5dc0               movl rbx,[rbp-0x40]
0x27c1a0752793  2253  488b7db8             REX.W movq rdi,[rbp-0x48]
0x27c1a0752797  2257  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a075279b  225b  8b55b0               movl rdx,[rbp-0x50]
0x27c1a075279e  225e  8b4da8               movl rcx,[rbp-0x58]
0x27c1a07527a1  2261  8b4598               movl rax,[rbp-0x68]
0x27c1a07527a4  2264  e9c6ddffff           jmp 0x27c1a075056f  <+0x2f>
0x27c1a07527a9  2269  4c89a550ffffff       REX.W movq [rbp-0xb0],r12
0x27c1a07527b0  2270  4c89bd48ffffff       REX.W movq [rbp-0xb8],r15
0x27c1a07527b7  2277  4c899d70ffffff       REX.W movq [rbp-0x90],r11
0x27c1a07527be  227e  e84dcbffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a07527c3  2283  4c8b45d8             REX.W movq r8,[rbp-0x28]
0x27c1a07527c7  2287  488b7db8             REX.W movq rdi,[rbp-0x48]
0x27c1a07527cb  228b  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a07527cf  228f  8b4598               movl rax,[rbp-0x68]
0x27c1a07527d2  2292  448b9d70ffffff       movl r11,[rbp-0x90]
0x27c1a07527d9  2299  448ba550ffffff       movl r12,[rbp-0xb0]
0x27c1a07527e0  22a0  448bbd48ffffff       movl r15,[rbp-0xb8]
0x27c1a07527e7  22a7  e9eaddffff           jmp 0x27c1a07505d6  <+0x96>
0x27c1a07527ec  22ac  4c8965d0             REX.W movq [rbp-0x30],r12
0x27c1a07527f0  22b0  48895dc8             REX.W movq [rbp-0x38],rbx
0x27c1a07527f4  22b4  4c899d70ffffff       REX.W movq [rbp-0x90],r11
0x27c1a07527fb  22bb  e810cbffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a0752800  22c0  4c8b45d8             REX.W movq r8,[rbp-0x28]
0x27c1a0752804  22c4  488b7db8             REX.W movq rdi,[rbp-0x48]
0x27c1a0752808  22c8  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a075280c  22cc  8b4598               movl rax,[rbp-0x68]
0x27c1a075280f  22cf  448b9d70ffffff       movl r11,[rbp-0x90]
0x27c1a0752816  22d6  448b65d0             movl r12,[rbp-0x30]
0x27c1a075281a  22da  8b5dc8               movl rbx,[rbp-0x38]
0x27c1a075281d  22dd  e931deffff           jmp 0x27c1a0750653  <+0x113>
0x27c1a0752822  22e2  4c8965d0             REX.W movq [rbp-0x30],r12
0x27c1a0752826  22e6  4c897dc8             REX.W movq [rbp-0x38],r15
0x27c1a075282a  22ea  4c899d70ffffff       REX.W movq [rbp-0x90],r11
0x27c1a0752831  22f1  e8dacaffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a0752836  22f6  4c8b45d8             REX.W movq r8,[rbp-0x28]
0x27c1a075283a  22fa  488b7db8             REX.W movq rdi,[rbp-0x48]
0x27c1a075283e  22fe  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a0752842  2302  8b4598               movl rax,[rbp-0x68]
0x27c1a0752845  2305  448b9d70ffffff       movl r11,[rbp-0x90]
0x27c1a075284c  230c  448b65d0             movl r12,[rbp-0x30]
0x27c1a0752850  2310  448b7dc8             movl r15,[rbp-0x38]
0x27c1a0752854  2314  e930deffff           jmp 0x27c1a0750689  <+0x149>
0x27c1a0752859  2319  4c895dd0             REX.W movq [rbp-0x30],r11
0x27c1a075285d  231d  48897dc8             REX.W movq [rbp-0x38],rdi
0x27c1a0752861  2321  48895588             REX.W movq [rbp-0x78],rdx
0x27c1a0752865  2325  e8a6caffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a075286a  232a  448b45e0             movl r8,[rbp-0x20]
0x27c1a075286e  232e  4c8b65d8             REX.W movq r12,[rbp-0x28]
0x27c1a0752872  2332  4c8b4db8             REX.W movq r9,[rbp-0x48]
0x27c1a0752876  2336  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a075287a  233a  8b4598               movl rax,[rbp-0x68]
0x27c1a075287d  233d  8b5d80               movl rbx,[rbp-0x80]
0x27c1a0752880  2340  448b5dd0             movl r11,[rbp-0x30]
0x27c1a0752884  2344  8b7dc8               movl rdi,[rbp-0x38]
0x27c1a0752887  2347  8b5588               movl rdx,[rbp-0x78]
0x27c1a075288a  234a  e9fddfffff           jmp 0x27c1a075088c  <+0x34c>
0x27c1a075288f  234f  48897d88             REX.W movq [rbp-0x78],rdi
0x27c1a0752893  2353  48899568ffffff       REX.W movq [rbp-0x98],rdx
0x27c1a075289a  235a  e871caffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a075289f  235f  448b45e0             movl r8,[rbp-0x20]
0x27c1a07528a3  2363  4c8b65d8             REX.W movq r12,[rbp-0x28]
0x27c1a07528a7  2367  8b4dc8               movl rcx,[rbp-0x38]
0x27c1a07528aa  236a  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a07528ae  236e  8b4598               movl rax,[rbp-0x68]
0x27c1a07528b1  2371  8b7d88               movl rdi,[rbp-0x78]
0x27c1a07528b4  2374  8b9568ffffff         movl rdx,[rbp-0x98]
0x27c1a07528ba  237a  448b4da0             movl r9,[rbp-0x60]
0x27c1a07528be  237e  e98ae3ffff           jmp 0x27c1a0750c4d  <+0x70d>
0x27c1a07528c3  2383  4c895d88             REX.W movq [rbp-0x78],r11
0x27c1a07528c7  2387  48895590             REX.W movq [rbp-0x70],rdx
0x27c1a07528cb  238b  e840caffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a07528d0  2390  448b45e0             movl r8,[rbp-0x20]
0x27c1a07528d4  2394  4c8b65d8             REX.W movq r12,[rbp-0x28]
0x27c1a07528d8  2398  488b4db8             REX.W movq rcx,[rbp-0x48]
0x27c1a07528dc  239c  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a07528e0  23a0  8b5dc8               movl rbx,[rbp-0x38]
0x27c1a07528e3  23a3  448b5d88             movl r11,[rbp-0x78]
0x27c1a07528e7  23a7  8b5590               movl rdx,[rbp-0x70]
0x27c1a07528ea  23aa  e9f3e6ffff           jmp 0x27c1a0750fe2  <+0xaa2>
0x27c1a07528ef  23af  4c895dd0             REX.W movq [rbp-0x30],r11
0x27c1a07528f3  23b3  4c896590             REX.W movq [rbp-0x70],r12
0x27c1a07528f7  23b7  e814caffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a07528fc  23bc  8b7de0               movl rdi,[rbp-0x20]
0x27c1a07528ff  23bf  4c8b45d8             REX.W movq r8,[rbp-0x28]
0x27c1a0752903  23c3  4c8b7db8             REX.W movq r15,[rbp-0x48]
0x27c1a0752907  23c7  8b4588               movl rax,[rbp-0x78]
0x27c1a075290a  23ca  448b5dd0             movl r11,[rbp-0x30]
0x27c1a075290e  23ce  448b6590             movl r12,[rbp-0x70]
0x27c1a0752912  23d2  e9c8e7ffff           jmp 0x27c1a07510df  <+0xb9f>
0x27c1a0752917  23d7  4c895d90             REX.W movq [rbp-0x70],r11
0x27c1a075291b  23db  4889bd70ffffff       REX.W movq [rbp-0x90],rdi
0x27c1a0752922  23e2  e8e9c9ffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a0752927  23e7  448b45e0             movl r8,[rbp-0x20]
0x27c1a075292b  23eb  4c8b65d8             REX.W movq r12,[rbp-0x28]
0x27c1a075292f  23ef  488b5db8             REX.W movq rbx,[rbp-0x48]
0x27c1a0752933  23f3  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a0752937  23f7  8b4598               movl rax,[rbp-0x68]
0x27c1a075293a  23fa  4c8b5d90             REX.W movq r11,[rbp-0x70]
0x27c1a075293e  23fe  8bbd70ffffff         movl rdi,[rbp-0x90]
0x27c1a0752944  2404  448bbd58ffffff       movl r15,[rbp-0xa8]
0x27c1a075294b  240b  448b4da0             movl r9,[rbp-0x60]
0x27c1a075294f  240f  e9f9eeffff           jmp 0x27c1a075184d  <+0x130d>
0x27c1a0752954  2414  4c899d70ffffff       REX.W movq [rbp-0x90],r11
0x27c1a075295b  241b  48897dc8             REX.W movq [rbp-0x38],rdi
0x27c1a075295f  241f  48895590             REX.W movq [rbp-0x70],rdx
0x27c1a0752963  2423  4c897d88             REX.W movq [rbp-0x78],r15
0x27c1a0752967  2427  e8a4c9ffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a075296c  242c  448b45e0             movl r8,[rbp-0x20]
0x27c1a0752970  2430  4c8b65d8             REX.W movq r12,[rbp-0x28]
0x27c1a0752974  2434  488b4db8             REX.W movq rcx,[rbp-0x48]
0x27c1a0752978  2438  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a075297c  243c  8b4598               movl rax,[rbp-0x68]
0x27c1a075297f  243f  448b9d70ffffff       movl r11,[rbp-0x90]
0x27c1a0752986  2446  8b7dc8               movl rdi,[rbp-0x38]
0x27c1a0752989  2449  8b5590               movl rdx,[rbp-0x70]
0x27c1a075298c  244c  448b7d88             movl r15,[rbp-0x78]
0x27c1a0752990  2450  448b4da0             movl r9,[rbp-0x60]
0x27c1a0752994  2454  e930f1ffff           jmp 0x27c1a0751ac9  <+0x1589>
0x27c1a0752999  2459  4c899d70ffffff       REX.W movq [rbp-0x90],r11
0x27c1a07529a0  2460  48897dc8             REX.W movq [rbp-0x38],rdi
0x27c1a07529a4  2464  48895d90             REX.W movq [rbp-0x70],rbx
0x27c1a07529a8  2468  4c897d88             REX.W movq [rbp-0x78],r15
0x27c1a07529ac  246c  e85fc9ffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a07529b1  2471  448b45e0             movl r8,[rbp-0x20]
0x27c1a07529b5  2475  4c8b65d8             REX.W movq r12,[rbp-0x28]
0x27c1a07529b9  2479  488b4db8             REX.W movq rcx,[rbp-0x48]
0x27c1a07529bd  247d  8b4598               movl rax,[rbp-0x68]
0x27c1a07529c0  2480  448b9d70ffffff       movl r11,[rbp-0x90]
0x27c1a07529c7  2487  8b7dc8               movl rdi,[rbp-0x38]
0x27c1a07529ca  248a  8b5d90               movl rbx,[rbp-0x70]
0x27c1a07529cd  248d  448b7d88             movl r15,[rbp-0x78]
0x27c1a07529d1  2491  448b4da0             movl r9,[rbp-0x60]
0x27c1a07529d5  2495  e96ff2ffff           jmp 0x27c1a0751c49  <+0x1709>
0x27c1a07529da  249a  4c899d70ffffff       REX.W movq [rbp-0x90],r11
0x27c1a07529e1  24a1  48897dc8             REX.W movq [rbp-0x38],rdi
0x27c1a07529e5  24a5  4c897d88             REX.W movq [rbp-0x78],r15
0x27c1a07529e9  24a9  48895590             REX.W movq [rbp-0x70],rdx
0x27c1a07529ed  24ad  e81ec9ffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a07529f2  24b2  448b45e0             movl r8,[rbp-0x20]
0x27c1a07529f6  24b6  4c8b65d8             REX.W movq r12,[rbp-0x28]
0x27c1a07529fa  24ba  488b4db8             REX.W movq rcx,[rbp-0x48]
0x27c1a07529fe  24be  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a0752a02  24c2  8b4598               movl rax,[rbp-0x68]
0x27c1a0752a05  24c5  448b9d70ffffff       movl r11,[rbp-0x90]
0x27c1a0752a0c  24cc  8b7dc8               movl rdi,[rbp-0x38]
0x27c1a0752a0f  24cf  448b7d88             movl r15,[rbp-0x78]
0x27c1a0752a13  24d3  8b5590               movl rdx,[rbp-0x70]
0x27c1a0752a16  24d6  448b4da0             movl r9,[rbp-0x60]
0x27c1a0752a1a  24da  e92ef3ffff           jmp 0x27c1a0751d4d  <+0x180d>
0x27c1a0752a1f  24df  4c899d68ffffff       REX.W movq [rbp-0x98],r11
0x27c1a0752a26  24e6  48899d60ffffff       REX.W movq [rbp-0xa0],rbx
0x27c1a0752a2d  24ed  48897d90             REX.W movq [rbp-0x70],rdi
0x27c1a0752a31  24f1  48899570ffffff       REX.W movq [rbp-0x90],rdx
0x27c1a0752a38  24f8  e8d3c8ffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a0752a3d  24fd  4c8b65d8             REX.W movq r12,[rbp-0x28]
0x27c1a0752a41  2501  488b4db8             REX.W movq rcx,[rbp-0x48]
0x27c1a0752a45  2505  448b9d68ffffff       movl r11,[rbp-0x98]
0x27c1a0752a4c  250c  8b9d60ffffff         movl rbx,[rbp-0xa0]
0x27c1a0752a52  2512  488b3567f4ffff       REX.W movq rsi,[rip+0xfffff467]
0x27c1a0752a59  2519  4c8b3d56f4ffff       REX.W movq r15,[rip+0xfffff456]
0x27c1a0752a60  2520  488b7d90             REX.W movq rdi,[rbp-0x70]
0x27c1a0752a64  2524  8b9570ffffff         movl rdx,[rbp-0x90]
0x27c1a0752a6a  252a  e9a2f4ffff           jmp 0x27c1a0751f11  <+0x19d1>
0x27c1a0752a6f  252f  4c899d68ffffff       REX.W movq [rbp-0x98],r11
0x27c1a0752a76  2536  48899d60ffffff       REX.W movq [rbp-0xa0],rbx
0x27c1a0752a7d  253d  48897d90             REX.W movq [rbp-0x70],rdi
0x27c1a0752a81  2541  4c898570ffffff       REX.W movq [rbp-0x90],r8
0x27c1a0752a88  2548  e883c8ffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a0752a8d  254d  4c8b65d8             REX.W movq r12,[rbp-0x28]
0x27c1a0752a91  2551  488b4db8             REX.W movq rcx,[rbp-0x48]
0x27c1a0752a95  2555  448b9d68ffffff       movl r11,[rbp-0x98]
0x27c1a0752a9c  255c  8b9d60ffffff         movl rbx,[rbp-0xa0]
0x27c1a0752aa2  2562  41bf67666666         movl r15,0x66666667
0x27c1a0752aa8  2568  8b7d90               movl rdi,[rbp-0x70]
0x27c1a0752aab  256b  448b8570ffffff       movl r8,[rbp-0x90]
0x27c1a0752ab2  2572  e9d4f5ffff           jmp 0x27c1a075208b  <+0x1b4b>
0x27c1a0752ab7  2577  48895dd0             REX.W movq [rbp-0x30],rbx
0x27c1a0752abb  257b  48895590             REX.W movq [rbp-0x70],rdx
0x27c1a0752abf  257f  4c895d88             REX.W movq [rbp-0x78],r11
0x27c1a0752ac3  2583  4c89bd68ffffff       REX.W movq [rbp-0x98],r15
0x27c1a0752aca  258a  4889bd60ffffff       REX.W movq [rbp-0xa0],rdi
0x27c1a0752ad1  2591  4c898d70ffffff       REX.W movq [rbp-0x90],r9
0x27c1a0752ad8  2598  e833c8ffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a0752add  259d  448b45e0             movl r8,[rbp-0x20]
0x27c1a0752ae1  25a1  4c8b65d8             REX.W movq r12,[rbp-0x28]
0x27c1a0752ae5  25a5  488b4db8             REX.W movq rcx,[rbp-0x48]
0x27c1a0752ae9  25a9  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a0752aed  25ad  8b5dd0               movl rbx,[rbp-0x30]
0x27c1a0752af0  25b0  8b5590               movl rdx,[rbp-0x70]
0x27c1a0752af3  25b3  448b5d88             movl r11,[rbp-0x78]
0x27c1a0752af7  25b7  448bbd68ffffff       movl r15,[rbp-0x98]
0x27c1a0752afe  25be  488bbd60ffffff       REX.W movq rdi,[rbp-0xa0]
0x27c1a0752b05  25c5  448b8d70ffffff       movl r9,[rbp-0x90]
0x27c1a0752b0c  25cc  e980f7ffff           jmp 0x27c1a0752291  <+0x1d51>
0x27c1a0752b11  25d1  48897dd0             REX.W movq [rbp-0x30],rdi
0x27c1a0752b15  25d5  e8f6c7ffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a0752b1a  25da  4c8b65d8             REX.W movq r12,[rbp-0x28]
0x27c1a0752b1e  25de  448b5dc0             movl r11,[rbp-0x40]
0x27c1a0752b22  25e2  4c8b45b8             REX.W movq r8,[rbp-0x48]
0x27c1a0752b26  25e6  8b7dd0               movl rdi,[rbp-0x30]
0x27c1a0752b29  25e9  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a0752b2d  25ed  448b7da8             movl r15,[rbp-0x58]
0x27c1a0752b31  25f1  e9adfaffff           jmp 0x27c1a07525e3  <+0x20a3>
0x27c1a0752b36  25f6  48897dd0             REX.W movq [rbp-0x30],rdi
0x27c1a0752b3a  25fa  e8d1c7ffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a0752b3f  25ff  4c8b65d8             REX.W movq r12,[rbp-0x28]
0x27c1a0752b43  2603  448b5dc0             movl r11,[rbp-0x40]
0x27c1a0752b47  2607  8b7dd0               movl rdi,[rbp-0x30]
0x27c1a0752b4a  260a  4c8b45b8             REX.W movq r8,[rbp-0x48]
0x27c1a0752b4e  260e  e9f9faffff           jmp 0x27c1a075264c  <+0x210c>
0x27c1a0752b53  2613  e828c5ffff           call 0x27c1a074f080  (jump table)    ;; wasm stub: ThrowWasmTrapUnreachable
0x27c1a0752b58  2618  e833c5ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752b5d  261d  e82ec5ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752b62  2622  e829c5ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752b67  2627  e824c5ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752b6c  262c  e81fc5ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752b71  2631  e81ac5ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752b76  2636  e815c5ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752b7b  263b  e810c5ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752b80  2640  e80bc5ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752b85  2645  e806c5ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752b8a  264a  e801c5ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752b8f  264f  e8fcc4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752b94  2654  e8f7c4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752b99  2659  e8f2c4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752b9e  265e  e8edc4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752ba3  2663  e8e8c4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752ba8  2668  e8e3c4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752bad  266d  e8dec4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752bb2  2672  e8d9c4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752bb7  2677  e8d4c4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752bbc  267c  e8cfc4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752bc1  2681  e8cac4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752bc6  2686  e8c5c4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752bcb  268b  e8c0c4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752bd0  2690  e8bbc4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752bd5  2695  e8b6c4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752bda  269a  e8b1c4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752bdf  269f  e8acc4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752be4  26a4  e8a7c4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752be9  26a9  e8a2c4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752bee  26ae  e89dc4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752bf3  26b3  e898c4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752bf8  26b8  e893c4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752bfd  26bd  e88ec4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752c02  26c2  e889c4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752c07  26c7  e884c4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752c0c  26cc  e87fc4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752c11  26d1  e87ac4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752c16  26d6  e875c4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752c1b  26db  e870c4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752c20  26e0  e86bc4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752c25  26e5  e866c4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752c2a  26ea  e861c4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752c2f  26ef  e85cc4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752c34  26f4  e857c4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752c39  26f9  e852c4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752c3e  26fe  e84dc4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752c43  2703  e848c4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752c48  2708  e843c4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752c4d  270d  e83ec4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752c52  2712  e839c4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752c57  2717  e834c4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752c5c  271c  e82fc4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752c61  2721  e82ac4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752c66  2726  e825c4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752c6b  272b  e820c4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752c70  2730  e81bc4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752c75  2735  e816c4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752c7a  273a  e811c4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752c7f  273f  e80cc4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752c84  2744  e807c4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752c89  2749  e802c4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752c8e  274e  e8fdc3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752c93  2753  e8f8c3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752c98  2758  e8f3c3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752c9d  275d  e8eec3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752ca2  2762  e8e9c3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752ca7  2767  e8e4c3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752cac  276c  e8dfc3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752cb1  2771  e8dac3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752cb6  2776  e8d5c3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752cbb  277b  e8d0c3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752cc0  2780  e8cbc3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752cc5  2785  e8c6c3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752cca  278a  e8c1c3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752ccf  278f  e8bcc3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752cd4  2794  e8b7c3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752cd9  2799  e8b2c3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752cde  279e  e8adc3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752ce3  27a3  e8a8c3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752ce8  27a8  e8a3c3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752ced  27ad  e89ec3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752cf2  27b2  e899c3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752cf7  27b7  e894c3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752cfc  27bc  e88fc3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752d01  27c1  e88ac3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752d06  27c6  e885c3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752d0b  27cb  e880c3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752d10  27d0  e87bc3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752d15  27d5  e876c3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752d1a  27da  e871c3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752d1f  27df  e86cc3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752d24  27e4  e867c3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752d29  27e9  e862c3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752d2e  27ee  e85dc3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752d33  27f3  e858c3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752d38  27f8  e853c3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752d3d  27fd  e84ec3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752d42  2802  e849c3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752d47  2807  e844c3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752d4c  280c  e83fc3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752d51  2811  e83ac3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752d56  2816  e835c3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752d5b  281b  e830c3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752d60  2820  e82bc3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752d65  2825  e826c3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752d6a  282a  e821c3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752d6f  282f  e81cc3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752d74  2834  e817c3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752d79  2839  e812c3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752d7e  283e  e80dc3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752d83  2843  e808c3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752d88  2848  e803c3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752d8d  284d  e8fec2ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752d92  2852  e8f9c2ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752d97  2857  e8f4c2ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752d9c  285c  e8efc2ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752da1  2861  e8eac2ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752da6  2866  e8e5c2ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752dab  286b  e8e0c2ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752db0  2870  e8dbc2ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752db5  2875  e8d6c2ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752dba  287a  e8d1c2ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752dbf  287f  e8ccc2ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752dc4  2884  e8c7c2ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752dc9  2889  e8c2c2ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752dce  288e  e8bdc2ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752dd3  2893  e8b8c2ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752dd8  2898  e8b3c2ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752ddd  289d  e8aec2ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752de2  28a2  e8a9c2ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752de7  28a7  e8a4c2ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752dec  28ac  e89fc2ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752df1  28b1  e89ac2ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752df6  28b6  e895c2ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752dfb  28bb  e890c2ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752e00  28c0  e88bc2ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752e05  28c5  e886c2ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752e0a  28ca  e881c2ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752e0f  28cf  e87cc2ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752e14  28d4  e877c2ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752e19  28d9  e872c2ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752e1e  28de  e86dc2ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0752e23  28e3  90                   nop
0x27c1a0752e24  28e4  0f1f4000             nop
0x27c1a0752e28  28e8  27c1a07516c0       jump table entry 4480    ;; internal reference
0x27c1a0752e30  28f0  27c1a07516f0       jump table entry 4528    ;; internal reference
0x27c1a0752e38  28f8  27c1a0751720       jump table entry 4576    ;; internal reference
0x27c1a0752e40  2900  27c1a0751750       jump table entry 4624    ;; internal reference
0x27c1a0752e48  2908  27c1a0751780       jump table entry 4672    ;; internal reference
0x27c1a0752e50  2910  27c1a0750df8       jump table entry 2232    ;; internal reference
0x27c1a0752e58  2918  27c1a07517b0       jump table entry 4720    ;; internal reference
0x27c1a0752e60  2920  27c1a07517e0       jump table entry 4768    ;; internal reference
0x27c1a0752e68  2928  27c1a0752713       jump table entry 8659    ;; internal reference
0x27c1a0752e70  2930  27c1a0750f20       jump table entry 2528    ;; internal reference
0x27c1a0752e78  2938  27c1a0750f60       jump table entry 2592    ;; internal reference
0x27c1a0752e80  2940  27c1a07511d0       jump table entry 3216    ;; internal reference
0x27c1a0752e88  2948  27c1a0752713       jump table entry 8659    ;; internal reference
0x27c1a0752e90  2950  27c1a0752713       jump table entry 8659    ;; internal reference
0x27c1a0752e98  2958  27c1a0752713       jump table entry 8659    ;; internal reference
0x27c1a0752ea0  2960  27c1a0751210       jump table entry 3280    ;; internal reference
0x27c1a0752ea8  2968  27c1a0751240       jump table entry 3328    ;; internal reference
0x27c1a0752eb0  2970  27c1a0751280       jump table entry 3392    ;; internal reference
0x27c1a0752eb8  2978  27c1a07512c0       jump table entry 3456    ;; internal reference
0x27c1a0752ec0  2980  27c1a0751300       jump table entry 3520    ;; internal reference
0x27c1a0752ec8  2988  27c1a0751340       jump table entry 3584    ;; internal reference
0x27c1a0752ed0  2990  27c1a0751380       jump table entry 3648    ;; internal reference
0x27c1a0752ed8  2998  27c1a07513c0       jump table entry 3712    ;; internal reference
0x27c1a0752ee0  29a0  27c1a0751400       jump table entry 3776    ;; internal reference
0x27c1a0752ee8  29a8  27c1a0752713       jump table entry 8659    ;; internal reference
0x27c1a0752ef0  29b0  27c1a0751440       jump table entry 3840    ;; internal reference
0x27c1a0752ef8  29b8  27c1a0751480       jump table entry 3904    ;; internal reference
0x27c1a0752f00  29c0  27c1a0751500       jump table entry 4032    ;; internal reference
0x27c1a0752f08  29c8  27c1a0752713       jump table entry 8659    ;; internal reference
0x27c1a0752f10  29d0  27c1a0752713       jump table entry 8659    ;; internal reference
0x27c1a0752f18  29d8  27c1a0752713       jump table entry 8659    ;; internal reference
0x27c1a0752f20  29e0  27c1a07514c0       jump table entry 3968    ;; internal reference
0x27c1a0752f28  29e8  27c1a0751500       jump table entry 4032    ;; internal reference
0x27c1a0752f30  29f0  27c1a0751580       jump table entry 4160    ;; internal reference
0x27c1a0752f38  29f8  27c1a07515c0       jump table entry 4224    ;; internal reference
0x27c1a0752f40  2a00  27c1a0751600       jump table entry 4288    ;; internal reference
0x27c1a0752f48  2a08  27c1a0751640       jump table entry 4352    ;; internal reference
0x27c1a0752f50  2a10  27c1a0751680       jump table entry 4416    ;; internal reference
0x27c1a0752f58  2a18  27c1a0751810       jump table entry 4816    ;; internal reference
0x27c1a0752f60  2a20  27c1a0751960       jump table entry 5152    ;; internal reference
0x27c1a0752f68  2a28  27c1a07519b0       jump table entry 5232    ;; internal reference
0x27c1a0752f70  2a30  27c1a07519f0       jump table entry 5296    ;; internal reference
0x27c1a0752f78  2a38  27c1a0751a30       jump table entry 5360    ;; internal reference
0x27c1a0752f80  2a40  27c1a0751e50       jump table entry 6416    ;; internal reference
0x27c1a0752f88  2a48  27c1a0751e90       jump table entry 6480    ;; internal reference
0x27c1a0752f90  2a50  27c1a07521a0       jump table entry 7264    ;; internal reference
0x27c1a0752f98  2a58  27c1a07521e0       jump table entry 7328    ;; internal reference
0x27c1a0752fa0  2a60  27c1a0752220       jump table entry 7392    ;; internal reference

Protected instructions:
 pc offset  land pad
      21e8      2618
      2169      261d
      214c      2622
      212e      2627
      2110      262c
      20a7      2631
      1e8f      2636
      1e31      263b
      1e0e      2640
      1e00      2645
      1de3      264a
      1dd7      264f
      1dba      2654
      1dae      2659
      1d91      265e
      1d85      2663
      1d68      2668
      1d5c      266d
      1d05      2672
      1c12      2677
      1bea      267c
      1bbf      2681
      1b95      2686
      1b67      268b
      1ab5      2690
      1a88      2695
      1a58      269a
      1a28      269f
      19f5      26a4
      1950      26a9
      18ab      26ae
      1878      26b3
      185e      26b8
      1844      26bd
      182a      26c2
      1810      26c7
      178a      26cc
      1760      26d1
      1736      26d6
      170c      26db
      16c6      26e0
      15fe      26e5
      15d8      26ea
      15b2      26ef
      158c      26f4
      14f0      26f9
      13af      26fe
      1391      2703
      1373      2708
      1355      270d
      1337      2712
      1319      2717
      12d4      271c
      12ac      2721
      12a0      2726
      127b      272b
      1270      2730
      124b      2735
      1240      273a
      121b      273f
      1210      2744
      11ec      2749
      11e7      274e
      11bb      2753
      11b0      2758
      118b      275d
      1180      2762
      1026      2767
       fc0      276c
       f55      2771
       f50      2776
       b9f      277b
       b4a      2780
       aa2      2785
       a37      278a
       a2e      278f
       a29      2794
       a20      2799
       9c1      279e
       8d8      27a3
       892      27a8
       88e      27ad
       88a      27b2
       805      27b7
       7be      27bc
       7a3      27c1
       78d      27c6
       770      27cb
       75b      27d0
       740      27d5
       72a      27da
       70d      27df
       6af      27e4
       6a4      27e9
       6a0      27ee
       698      27f3
       66a      27f8
       658      27fd
       650      2802
       63e      2807
       62f      280c
       61d      2811
       5e9      2816
       5d6      281b
       5c0      2820
       593      2825
       57b      282a
       56b      282f
       567      2834
       55f      2839
       549      283e
       51e      2843
       50c      2848
       504      284d
       4f3      2852
       4e3      2857
       4cf      285c
       4a0      2861
       3f9      2866
       3f4      286b
       3c5      2870
       3c0      2875
       390      287a
       38b      287f
       354      2884
       34f      2889
       2ef      288e
       2ea      2893
       2c1      2898
       29f      289d
       28b      28a2
       286      28a7
       1d6      28ac
       1be      28b1
       1ae      28b6
       197      28bb
       188      28c0
       170      28c5
       160      28ca
       149      28cf
       100      28d4
        ab      28d9
        4f      28de

Source positions:
 pc offset  position
        4f        25
        ab        87
       100      2393
       149       133
       160       157
       170       133
       188       157
       197       133
       1ae       157
       1be       133
       1d6       157
       244       211
       27c       222
       28b       240
       29f       253
       2c1       270
       2ea       287
       2ef       298
       34f       350
       354       362
       38b       350
       390       362
       3c0       350
       3c5       362
       3f4       350
       3f9       362
       489       585
       499       596
       4cf       412
       4e3       425
       4f3       435
       504       450
       50c       466
       51e       479
       549       505
       55f       523
       567       531
       56b       540
       57b       550
       593       614
       5c0       633
       5d6       783
       5db       792
       5e2       798
       61d       647
       62f       660
       63e       670
       650       685
       658       697
       66a       710
       698       739
       6a0       747
       6a4       752
       6af       762
       70d       822
       72a       851
       740       822
       75b       851
       770       822
       78d       851
       7a3       822
       7be       851
       805       870
       845       942
       88a       906
       88e       919
       892       922
       8d5      1033
       99c      2070
       9bb      2050
       a20      2079
       a29      2086
       a2e      2089
       a37      2101
       aa2      2123
       aae      2140
       b18      2210
       b43      2230
       b9f      2239
       bab      2254
       bd7      2277
       c3f      2310
       f50      2370
       f55      2373
       fc0      1496
      1026      1515
      1180      1181
      1185      1186
      11b0      1194
      11b5      1199
      11e7      1207
      11ec      1213
      1210      1221
      1215      1226
      1240      1234
      1245      1239
      1270      1247
      1275      1252
      12a0      1260
      12ac      1266
      12d4      1408
      1319      1436
      14f0      1811
      158c      1841
      16c6      1887
      170c      1904
      1810      1963
      18ab      2036
      1950      1132
      19f5      1613
      1b67      1670
      1d05      1303
      1d5c      1339
      1d68      1345
      1d85      1339
      1d91      1345
      1dae      1339
      1dba      1345
      1dd7      1339
      1de3      1345
      1e00      1339
      1e0e      1345
      1e31      1370
      1e8f      1725
      1f7e      2588
      1f94      2596
      1fb7      2613
      1fd1      2625
      1feb      2633
      200b      2650
      20a7      2433
      20b7      2452
      2110      2495
      21e5      2348
      224b         0
      2269        50
      22ac        94
      22e2       129
      2319       339
      234f       808
      2383      2119
      23af      2235
      23d7      1418
      2414      1837
      2459      1900
      249a      1957
      24df      1587
      252f      1645
      2577      1320
      25d1      2423
      25f6      2485
      2613      2364
      2618      2348
      261d      2495
      2631      2433
      2636      1725
      263b      1370
      2640      1345
      2645      1339
      264a      1345
      264f      1339
      2654      1345
      2659      1339
      265e      1345
      2663      1339
      2668      1345
      266d      1339
      2672      1303
      2677      1670
      2690      1613
      26a9      1132
      26ae      2036
      26b3      1963
      26cc      1904
      26e0      1887
      26e5      1841
      26f9      1811
      26fe      1436
      271c      1408
      2721      1266
      2726      1260
      272b      1252
      2730      1247
      2735      1239
      273a      1234
      273f      1226
      2744      1221
      2749      1213
      274e      1207
      2753      1199
      2758      1194
      275d      1186
      2762      1181
      2767      1515
      276c      1496
      2771      2373
      2776      2370
      277b      2239
      2780      2230
      2785      2123
      278a      2101
      278f      2089
      2794      2086
      2799      2079
      279e      2050
      27a3      1033
      27a8       922
      27ad       919
      27b2       906
      27b7       870
      27bc       851
      27c1       822
      27c6       851
      27cb       822
      27d0       851
      27d5       822
      27da       851
      27df       822
      27e4       762
      27e9       752
      27ee       747
      27f3       739
      27f8       710
      27fd       697
      2802       685
      2807       670
      280c       660
      2811       647
      2816       798
      281b       783
      2820       633
      2825       614
      282a       550
      282f       540
      2834       531
      2839       523
      283e       505
      2843       479
      2848       466
      284d       450
      2852       435
      2857       425
      285c       412
      2861       596
      2866       362
      286b       350
      2870       362
      2875       350
      287a       362
      287f       350
      2884       362
      2889       350
      288e       298
      2893       287
      2898       270
      289d       253
      28a2       240
      28a7       222
      28ac       157
      28b1       133
      28b6       157
      28bb       133
      28c0       157
      28c5       133
      28ca       157
      28cf       133
      28d4      2393
      28d9        87
      28de        25

Safepoints (entries = 1, byte size = 14)
0x27c1a075078f    24f  slots (sp->fp): 00000000000000000000000000000000

RelocInfo (size = 327)
0x27c1a075078b  internal wasm call
0x27c1a07509cd  internal wasm call
0x27c1a0750b1e  internal wasm call
0x27c1a0750d8e  internal wasm call
0x27c1a0750ef0  internal wasm call
0x27c1a0750ffb  internal wasm call
0x27c1a075106e  internal wasm call
0x27c1a07510fb  internal wasm call
0x27c1a0751124  internal wasm call
0x27c1a075119c  internal wasm call
0x27c1a07524d0  internal wasm call
0x27c1a07524e8  internal wasm call
0x27c1a075250d  internal wasm call
0x27c1a0752527  internal wasm call
0x27c1a075253c  internal wasm call
0x27c1a0752561  internal wasm call
0x27c1a07525ff  internal wasm call
0x27c1a075278c  wasm stub call
0x27c1a07527bf  wasm stub call
0x27c1a07527fc  wasm stub call
0x27c1a0752832  wasm stub call
0x27c1a0752866  wasm stub call
0x27c1a075289b  wasm stub call
0x27c1a07528cc  wasm stub call
0x27c1a07528f8  wasm stub call
0x27c1a0752923  wasm stub call
0x27c1a0752968  wasm stub call
0x27c1a07529ad  wasm stub call
0x27c1a07529ee  wasm stub call
0x27c1a0752a39  wasm stub call
0x27c1a0752a89  wasm stub call
0x27c1a0752ad9  wasm stub call
0x27c1a0752b16  wasm stub call
0x27c1a0752b3b  wasm stub call
0x27c1a0752b54  wasm stub call
0x27c1a0752b59  wasm stub call
0x27c1a0752b5e  wasm stub call
0x27c1a0752b63  wasm stub call
0x27c1a0752b68  wasm stub call
0x27c1a0752b6d  wasm stub call
0x27c1a0752b72  wasm stub call
0x27c1a0752b77  wasm stub call
0x27c1a0752b7c  wasm stub call
0x27c1a0752b81  wasm stub call
0x27c1a0752b86  wasm stub call
0x27c1a0752b8b  wasm stub call
0x27c1a0752b90  wasm stub call
0x27c1a0752b95  wasm stub call
0x27c1a0752b9a  wasm stub call
0x27c1a0752b9f  wasm stub call
0x27c1a0752ba4  wasm stub call
0x27c1a0752ba9  wasm stub call
0x27c1a0752bae  wasm stub call
0x27c1a0752bb3  wasm stub call
0x27c1a0752bb8  wasm stub call
0x27c1a0752bbd  wasm stub call
0x27c1a0752bc2  wasm stub call
0x27c1a0752bc7  wasm stub call
0x27c1a0752bcc  wasm stub call
0x27c1a0752bd1  wasm stub call
0x27c1a0752bd6  wasm stub call
0x27c1a0752bdb  wasm stub call
0x27c1a0752be0  wasm stub call
0x27c1a0752be5  wasm stub call
0x27c1a0752bea  wasm stub call
0x27c1a0752bef  wasm stub call
0x27c1a0752bf4  wasm stub call
0x27c1a0752bf9  wasm stub call
0x27c1a0752bfe  wasm stub call
0x27c1a0752c03  wasm stub call
0x27c1a0752c08  wasm stub call
0x27c1a0752c0d  wasm stub call
0x27c1a0752c12  wasm stub call
0x27c1a0752c17  wasm stub call
0x27c1a0752c1c  wasm stub call
0x27c1a0752c21  wasm stub call
0x27c1a0752c26  wasm stub call
0x27c1a0752c2b  wasm stub call
0x27c1a0752c30  wasm stub call
0x27c1a0752c35  wasm stub call
0x27c1a0752c3a  wasm stub call
0x27c1a0752c3f  wasm stub call
0x27c1a0752c44  wasm stub call
0x27c1a0752c49  wasm stub call
0x27c1a0752c4e  wasm stub call
0x27c1a0752c53  wasm stub call
0x27c1a0752c58  wasm stub call
0x27c1a0752c5d  wasm stub call
0x27c1a0752c62  wasm stub call
0x27c1a0752c67  wasm stub call
0x27c1a0752c6c  wasm stub call
0x27c1a0752c71  wasm stub call
0x27c1a0752c76  wasm stub call
0x27c1a0752c7b  wasm stub call
0x27c1a0752c80  wasm stub call
0x27c1a0752c85  wasm stub call
0x27c1a0752c8a  wasm stub call
0x27c1a0752c8f  wasm stub call
0x27c1a0752c94  wasm stub call
0x27c1a0752c99  wasm stub call
0x27c1a0752c9e  wasm stub call
0x27c1a0752ca3  wasm stub call
0x27c1a0752ca8  wasm stub call
0x27c1a0752cad  wasm stub call
0x27c1a0752cb2  wasm stub call
0x27c1a0752cb7  wasm stub call
0x27c1a0752cbc  wasm stub call
0x27c1a0752cc1  wasm stub call
0x27c1a0752cc6  wasm stub call
0x27c1a0752ccb  wasm stub call
0x27c1a0752cd0  wasm stub call
0x27c1a0752cd5  wasm stub call
0x27c1a0752cda  wasm stub call
0x27c1a0752cdf  wasm stub call
0x27c1a0752ce4  wasm stub call
0x27c1a0752ce9  wasm stub call
0x27c1a0752cee  wasm stub call
0x27c1a0752cf3  wasm stub call
0x27c1a0752cf8  wasm stub call
0x27c1a0752cfd  wasm stub call
0x27c1a0752d02  wasm stub call
0x27c1a0752d07  wasm stub call
0x27c1a0752d0c  wasm stub call
0x27c1a0752d11  wasm stub call
0x27c1a0752d16  wasm stub call
0x27c1a0752d1b  wasm stub call
0x27c1a0752d20  wasm stub call
0x27c1a0752d25  wasm stub call
0x27c1a0752d2a  wasm stub call
0x27c1a0752d2f  wasm stub call
0x27c1a0752d34  wasm stub call
0x27c1a0752d39  wasm stub call
0x27c1a0752d3e  wasm stub call
0x27c1a0752d43  wasm stub call
0x27c1a0752d48  wasm stub call
0x27c1a0752d4d  wasm stub call
0x27c1a0752d52  wasm stub call
0x27c1a0752d57  wasm stub call
0x27c1a0752d5c  wasm stub call
0x27c1a0752d61  wasm stub call
0x27c1a0752d66  wasm stub call
0x27c1a0752d6b  wasm stub call
0x27c1a0752d70  wasm stub call
0x27c1a0752d75  wasm stub call
0x27c1a0752d7a  wasm stub call
0x27c1a0752d7f  wasm stub call
0x27c1a0752d84  wasm stub call
0x27c1a0752d89  wasm stub call
0x27c1a0752d8e  wasm stub call
0x27c1a0752d93  wasm stub call
0x27c1a0752d98  wasm stub call
0x27c1a0752d9d  wasm stub call
0x27c1a0752da2  wasm stub call
0x27c1a0752da7  wasm stub call
0x27c1a0752dac  wasm stub call
0x27c1a0752db1  wasm stub call
0x27c1a0752db6  wasm stub call
0x27c1a0752dbb  wasm stub call
0x27c1a0752dc0  wasm stub call
0x27c1a0752dc5  wasm stub call
0x27c1a0752dca  wasm stub call
0x27c1a0752dcf  wasm stub call
0x27c1a0752dd4  wasm stub call
0x27c1a0752dd9  wasm stub call
0x27c1a0752dde  wasm stub call
0x27c1a0752de3  wasm stub call
0x27c1a0752de8  wasm stub call
0x27c1a0752ded  wasm stub call
0x27c1a0752df2  wasm stub call
0x27c1a0752df7  wasm stub call
0x27c1a0752dfc  wasm stub call
0x27c1a0752e01  wasm stub call
0x27c1a0752e06  wasm stub call
0x27c1a0752e0b  wasm stub call
0x27c1a0752e10  wasm stub call
0x27c1a0752e15  wasm stub call
0x27c1a0752e1a  wasm stub call
0x27c1a0752e1f  wasm stub call
0x27c1a0752e28  internal reference
0x27c1a0752e30  internal reference
0x27c1a0752e38  internal reference
0x27c1a0752e40  internal reference
0x27c1a0752e48  internal reference
0x27c1a0752e50  internal reference
0x27c1a0752e58  internal reference
0x27c1a0752e60  internal reference
0x27c1a0752e68  internal reference
0x27c1a0752e70  internal reference
0x27c1a0752e78  internal reference
0x27c1a0752e80  internal reference
0x27c1a0752e88  internal reference
0x27c1a0752e90  internal reference
0x27c1a0752e98  internal reference
0x27c1a0752ea0  internal reference
0x27c1a0752ea8  internal reference
0x27c1a0752eb0  internal reference
0x27c1a0752eb8  internal reference
0x27c1a0752ec0  internal reference
0x27c1a0752ec8  internal reference
0x27c1a0752ed0  internal reference
0x27c1a0752ed8  internal reference
0x27c1a0752ee0  internal reference
0x27c1a0752ee8  internal reference
0x27c1a0752ef0  internal reference
0x27c1a0752ef8  internal reference
0x27c1a0752f00  internal reference
0x27c1a0752f08  internal reference
0x27c1a0752f10  internal reference
0x27c1a0752f18  internal reference
0x27c1a0752f20  internal reference
0x27c1a0752f28  internal reference
0x27c1a0752f30  internal reference
0x27c1a0752f38  internal reference
0x27c1a0752f40  internal reference
0x27c1a0752f48  internal reference
0x27c1a0752f50  internal reference
0x27c1a0752f58  internal reference
0x27c1a0752f60  internal reference
0x27c1a0752f68  internal reference
0x27c1a0752f70  internal reference
0x27c1a0752f78  internal reference
0x27c1a0752f80  internal reference
0x27c1a0752f88  internal reference
0x27c1a0752f90  internal reference
0x27c1a0752f98  internal reference
0x27c1a0752fa0  internal reference

--- End code ---
--- WebAssembly code ---
name: wasm-function[12]
index: 12
kind: wasm function
compiler: TurboFan
Body (size = 384 = 372 + 12 padding)
Instructions (size = 360)
0x27c1a0752fc0     0  55                   push rbp
0x27c1a0752fc1     1  4889e5               REX.W movq rbp,rsp
0x27c1a0752fc4     4  6a08                 push 0x8
0x27c1a0752fc6     6  56                   push rsi
0x27c1a0752fc7     7  4883ec20             REX.W subq rsp,0x20
0x27c1a0752fcb     b  8bd8                 movl rbx,rax
0x27c1a0752fcd     d  488b561f             REX.W movq rdx,[rsi+0x1f]
0x27c1a0752fd1    11  48c1ea18             REX.W shrq rdx, 24
0x27c1a0752fd5    15  4903d6               REX.W addq rdx,r14
0x27c1a0752fd8    18  8b0c1a               movl rcx,[rdx+rbx*1]
0x27c1a0752fdb    1b  0fbe0c0a             movsxbl rcx,[rdx+rcx*1]
0x27c1a0752fdf    1f  83e930               subl rcx,0x30
0x27c1a0752fe2    22  83f90a               cmpl rcx,0xa
0x27c1a0752fe5    25  0f83d8000000         jnc 0x27c1a07530c3  <+0x103>
0x27c1a0752feb    2b  488b4e2f             REX.W movq rcx,[rsi+0x2f]
0x27c1a0752fef    2f  33c0                 xorl rax,rax
0x27c1a0752ff1    31  beffffffff           movl rsi,0xffffffff
0x27c1a0752ff6    36  e908000000           jmp 0x27c1a0753003  <+0x43>
0x27c1a0752ffb    3b  0f1f440000           nop
0x27c1a0753000    40  418bc0               movl rax,r8
0x27c1a0753003    43  483b21               REX.W cmpq rsp,[rcx]
0x27c1a0753006    46  0f86bb000000         jna 0x27c1a07530c7  <+0x107>
0x27c1a075300c    4c  8b3c1a               movl rdi,[rdx+rbx*1]
0x27c1a075300f    4f  3dcccccc0c           cmp rax,0xccccccc
0x27c1a0753014    54  0f8608000000         jna 0x27c1a0753022  <+0x62>
0x27c1a075301a    5a  4c8bc6               REX.W movq r8,rsi
0x27c1a075301d    5d  e924000000           jmp 0x27c1a0753046  <+0x86>
0x27c1a0753022    62  440fbe043a           movsxbl r8,[rdx+rdi*1]
0x27c1a0753027    67  446bc80a             imull r9,rax,0xa
0x27c1a075302b    6b  4183e830             subl r8,0x30
0x27c1a075302f    6f  458bd9               movl r11,r9
0x27c1a0753032    72  4181f3ffffff7f       xorl r11,0x7fffffff
0x27c1a0753039    79  4503c8               addl r9,r8
0x27c1a075303c    7c  453bd8               cmpl r11,r8
0x27c1a075303f    7f  440f4cce             cmovll r9,rsi
0x27c1a0753043    83  458bc1               movl r8,r9
0x27c1a0753046    86  448d4f01             leal r9,[rdi+0x1]
0x27c1a075304a    8a  44890c1a             movl [rdx+rbx*1],r9
0x27c1a075304e    8e  0fbe7c3a01           movsxbl rdi,[rdx+rdi*1+0x1]
0x27c1a0753053    93  83ef30               subl rdi,0x30
0x27c1a0753056    96  83ff0a               cmpl rdi,0xa
0x27c1a0753059    99  0f8357000000         jnc 0x27c1a07530b6  <+0xf6>
0x27c1a075305f    9f  8b3c1a               movl rdi,[rdx+rbx*1]
0x27c1a0753062    a2  4181f8cccccc0c       cmpl r8,0xccccccc
0x27c1a0753069    a9  0f8608000000         jna 0x27c1a0753077  <+0xb7>
0x27c1a075306f    af  4c8bc6               REX.W movq r8,rsi
0x27c1a0753072    b2  e921000000           jmp 0x27c1a0753098  <+0xd8>
0x27c1a0753077    b7  440fbe0c3a           movsxbl r9,[rdx+rdi*1]
0x27c1a075307c    bc  456bc00a             imull r8,r8,0xa
0x27c1a0753080    c0  4183e930             subl r9,0x30
0x27c1a0753084    c4  458bd8               movl r11,r8
0x27c1a0753087    c7  4181f3ffffff7f       xorl r11,0x7fffffff
0x27c1a075308e    ce  4503c1               addl r8,r9
0x27c1a0753091    d1  453bd9               cmpl r11,r9
0x27c1a0753094    d4  440f4cc6             cmovll r8,rsi
0x27c1a0753098    d8  448d4f01             leal r9,[rdi+0x1]
0x27c1a075309c    dc  44890c1a             movl [rdx+rbx*1],r9
0x27c1a07530a0    e0  0fbe7c3a01           movsxbl rdi,[rdx+rdi*1+0x1]
0x27c1a07530a5    e5  83ef30               subl rdi,0x30
0x27c1a07530a8    e8  83ff0a               cmpl rdi,0xa
0x27c1a07530ab    eb  0f824fffffff         jc 0x27c1a0753000  <+0x40>
0x27c1a07530b1    f1  e908000000           jmp 0x27c1a07530be  <+0xfe>
0x27c1a07530b6    f6  418bc0               movl rax,r8
0x27c1a07530b9    f9  488be5               REX.W movq rsp,rbp
0x27c1a07530bc    fc  5d                   pop rbp
0x27c1a07530bd    fd  c3                   retl
0x27c1a07530be    fe  418bc0               movl rax,r8
0x27c1a07530c1   101  ebf6                 jmp 0x27c1a07530b9  <+0xf9>
0x27c1a07530c3   103  33c0                 xorl rax,rax
0x27c1a07530c5   105  ebf2                 jmp 0x27c1a07530b9  <+0xf9>
0x27c1a07530c7   107  488955e8             REX.W movq [rbp-0x18],rdx
0x27c1a07530cb   10b  48895de0             REX.W movq [rbp-0x20],rbx
0x27c1a07530cf   10f  488945d8             REX.W movq [rbp-0x28],rax
0x27c1a07530d3   113  48894dd0             REX.W movq [rbp-0x30],rcx
0x27c1a07530d7   117  e834c2ffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a07530dc   11c  488b55e8             REX.W movq rdx,[rbp-0x18]
0x27c1a07530e0   120  488b5de0             REX.W movq rbx,[rbp-0x20]
0x27c1a07530e4   124  beffffffff           movl rsi,0xffffffff
0x27c1a07530e9   129  8b45d8               movl rax,[rbp-0x28]
0x27c1a07530ec   12c  488b4dd0             REX.W movq rcx,[rbp-0x30]
0x27c1a07530f0   130  e917ffffff           jmp 0x27c1a075300c  <+0x4c>
0x27c1a07530f5   135  e896bfffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07530fa   13a  e891bfffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07530ff   13f  e88cbfffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753104   144  e887bfffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753109   149  e882bfffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075310e   14e  e87dbfffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753113   153  e878bfffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753118   158  e873bfffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075311d   15d  e86ebfffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753122   162  e869bfffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753127   167  90                   nop

Protected instructions:
 pc offset  land pad
        e0       135
        dc       13a
        b7       13f
        9f       144
        8e       149
        8a       14e
        62       153
        4c       158
        1b       15d
        18       162

Source positions:
 pc offset  position
        18         5
        1b         8
        4c        27
        62        51
        8a        90
        8e        99
        9f        27
        b7        51
        dc        90
        e0        99
       107        23
       135        99
       13a        90
       13f        51
       144        27
       149        99
       14e        90
       153        51
       158        27
       15d         8
       162         5

Safepoints (entries = 1, byte size = 11)
0x27c1a07530dc    11c  slots (sp->fp): 00000000

RelocInfo (size = 13)
0x27c1a07530d8  wasm stub call
0x27c1a07530f6  wasm stub call
0x27c1a07530fb  wasm stub call
0x27c1a0753100  wasm stub call
0x27c1a0753105  wasm stub call
0x27c1a075310a  wasm stub call
0x27c1a075310f  wasm stub call
0x27c1a0753114  wasm stub call
0x27c1a0753119  wasm stub call
0x27c1a075311e  wasm stub call
0x27c1a0753123  wasm stub call

--- End code ---
--- WebAssembly code ---
name: wasm-function[8]
index: 8
kind: wasm function
compiler: TurboFan
Body (size = 192 = 160 + 32 padding)
Instructions (size = 148)
0x27c1a0753140     0  55                   push rbp
0x27c1a0753141     1  4889e5               REX.W movq rbp,rsp
0x27c1a0753144     4  6a08                 push 0x8
0x27c1a0753146     6  56                   push rsi
0x27c1a0753147     7  488b5e1f             REX.W movq rbx,[rsi+0x1f]
0x27c1a075314b     b  48c1eb18             REX.W shrq rbx, 24
0x27c1a075314f     f  4903de               REX.W addq rbx,r14
0x27c1a0753152    12  8bd0                 movl rdx,rax
0x27c1a0753154    14  8b4c1348             movl rcx,[rbx+rdx*1+0x48]
0x27c1a0753158    18  8d71ff               leal rsi,[rcx-0x1]
0x27c1a075315b    1b  0bf1                 orl rsi,rcx
0x27c1a075315d    1d  89741a48             movl [rdx+rbx*1+0x48],rsi
0x27c1a0753161    21  8b0c13               movl rcx,[rbx+rdx*1]
0x27c1a0753164    24  f6c108               testb rcx,0x8
0x27c1a0753167    27  0f8526000000         jnz 0x27c1a0753193  <+0x53>
0x27c1a075316d    2d  48c7441a0400000000   REX.W movq [rdx+rbx*1+0x4],0x0
0x27c1a0753176    36  8b4c132c             movl rcx,[rbx+rdx*1+0x2c]
0x27c1a075317a    3a  894c1a1c             movl [rdx+rbx*1+0x1c],rcx
0x27c1a075317e    3e  894c1a14             movl [rdx+rbx*1+0x14],rcx
0x27c1a0753182    42  8b741330             movl rsi,[rbx+rdx*1+0x30]
0x27c1a0753186    46  03ce                 addl rcx,rsi
0x27c1a0753188    48  894c1a10             movl [rdx+rbx*1+0x10],rcx
0x27c1a075318c    4c  33c0                 xorl rax,rax
0x27c1a075318e    4e  488be5               REX.W movq rsp,rbp
0x27c1a0753191    51  5d                   pop rbp
0x27c1a0753192    52  c3                   retl
0x27c1a0753193    53  83c920               orl rcx,0x20
0x27c1a0753196    56  890c13               movl [rbx+rdx*1],rcx
0x27c1a0753199    59  b8ffffffff           movl rax,0xffffffff
0x27c1a075319e    5e  ebee                 jmp 0x27c1a075318e  <+0x4e>
0x27c1a07531a0    60  e8ebbeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07531a5    65  e8e6beffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07531aa    6a  e8e1beffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07531af    6f  e8dcbeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07531b4    74  e8d7beffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07531b9    79  e8d2beffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07531be    7e  e8cdbeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07531c3    83  e8c8beffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07531c8    88  e8c3beffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07531cd    8d  e8bebeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07531d2    92  90                   nop
0x27c1a07531d3    93  90                   nop

Protected instructions:
 pc offset  land pad
        56        60
        48        65
        42        6a
        3e        6f
        3a        74
        36        79
        2d        7e
        21        83
        1d        88
        14        8d

Source positions:
 pc offset  position
        14         7
        1d        18
        21        23
        2d        51
        36        58
        3a        63
        3e        70
        42        79
        48        83
        56        40
        65        83
        6a        79
        6f        70
        74        63
        79        58
        7e        51
        83        23
        88        18
        8d         7

Safepoints (entries = 1, byte size = 10)
0x27c1a07531a5     65  slots (sp->fp): 00000000

RelocInfo (size = 12)
0x27c1a07531a1  wasm stub call
0x27c1a07531a6  wasm stub call
0x27c1a07531ab  wasm stub call
0x27c1a07531b0  wasm stub call
0x27c1a07531b5  wasm stub call
0x27c1a07531ba  wasm stub call
0x27c1a07531bf  wasm stub call
0x27c1a07531c4  wasm stub call
0x27c1a07531c9  wasm stub call
0x27c1a07531ce  wasm stub call

--- End code ---
--- WebAssembly code ---
name: wasm-function[11]
index: 11
kind: wasm function
compiler: TurboFan
Body (size = 2240 = 2236 + 4 padding)
Instructions (size = 2224)
0x27c1a0753200     0  55                   push rbp
0x27c1a0753201     1  4889e5               REX.W movq rbp,rsp
0x27c1a0753204     4  6a08                 push 0x8
0x27c1a0753206     6  56                   push rsi
0x27c1a0753207     7  4883ec48             REX.W subq rsp,0x48
0x27c1a075320b     b  488b5e2f             REX.W movq rbx,[rsi+0x2f]
0x27c1a075320f     f  488945e8             REX.W movq [rbp-0x18],rax
0x27c1a0753213    13  488955e0             REX.W movq [rbp-0x20],rdx
0x27c1a0753217    17  48894dd8             REX.W movq [rbp-0x28],rcx
0x27c1a075321b    1b  48895dc0             REX.W movq [rbp-0x40],rbx
0x27c1a075321f    1f  483b23               REX.W cmpq rsp,[rbx]
0x27c1a0753222    22  0f86a8050000         jna 0x27c1a07537d0  <+0x5d0>
0x27c1a0753228    28  8bf8                 movl rdi,rax
0x27c1a075322a    2a  4c8b461f             REX.W movq r8,[rsi+0x1f]
0x27c1a075322e    2e  49c1e818             REX.W shrq r8, 24
0x27c1a0753232    32  4d03c6               REX.W addq r8,r14
0x27c1a0753235    35  450fb60c38           movzxbl r9,[r8+rdi*1]
0x27c1a075323a    3a  48897dc8             REX.W movq [rbp-0x38],rdi
0x27c1a075323e    3e  4c8945d0             REX.W movq [rbp-0x30],r8
0x27c1a0753242    42  41f6c120             testb r9,0x20
0x27c1a0753246    46  0f857f050000         jnz 0x27c1a07537cb  <+0x5cb>
0x27c1a075324c    4c  458b4c3810           movl r9,[r8+rdi*1+0x10]
0x27c1a0753251    51  4585c9               testl r9,r9
0x27c1a0753254    54  0f852e000000         jnz 0x27c1a0753288  <+0x88>
0x27c1a075325a    5a  e8bfbdffff           call 0x27c1a074f01e  (jump table)    ;; internal wasm call
0x27c1a075325f    5f  85c0                 testl rax,rax
0x27c1a0753261    61  0f8564050000         jnz 0x27c1a07537cb  <+0x5cb>
0x27c1a0753267    67  488b5dd0             REX.W movq rbx,[rbp-0x30]
0x27c1a075326b    6b  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x27c1a075326f    6f  448b4c3b10           movl r9,[rbx+rdi*1+0x10]
0x27c1a0753274    74  4c8bc3               REX.W movq r8,rbx
0x27c1a0753277    77  488b5dc0             REX.W movq rbx,[rbp-0x40]
0x27c1a075327b    7b  8b45e8               movl rax,[rbp-0x18]
0x27c1a075327e    7e  8b55e0               movl rdx,[rbp-0x20]
0x27c1a0753281    81  8b4dd8               movl rcx,[rbp-0x28]
0x27c1a0753284    84  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a0753288    88  458b5c3814           movl r11,[r8+rdi*1+0x14]
0x27c1a075328d    8d  452bcb               subl r9,r11
0x27c1a0753290    90  443bc9               cmpl r9,rcx
0x27c1a0753293    93  0f82ef040000         jc 0x27c1a0753788  <+0x588>
0x27c1a0753299    99  458b4c3850           movl r9,[r8+rdi*1+0x50]
0x27c1a075329e    9e  4585c9               testl r9,r9
0x27c1a07532a1    a1  0f8ceb000000         jl 0x27c1a0753392  <+0x192>
0x27c1a07532a7    a7  4c8bce               REX.W movq r9,rsi
0x27c1a07532aa    aa  4d8b6137             REX.W movq r12,[r9+0x37]
0x27c1a07532ae    ae  4c8bfb               REX.W movq r15,rbx
0x27c1a07532b1    b1  8bd9                 movl rbx,rcx
0x27c1a07532b3    b3  660f1f840000000000   nop
0x27c1a07532bc    bc  0f1f4000             nop
0x27c1a07532c0    c0  493b27               REX.W cmpq rsp,[r15]
0x27c1a07532c3    c3  0f8622050000         jna 0x27c1a07537eb  <+0x5eb>
0x27c1a07532c9    c9  85db                 testl rbx,rbx
0x27c1a07532cb    cb  0f8434000000         jz 0x27c1a0753305  <+0x105>
0x27c1a07532d1    d1  8d73ff               leal rsi,[rbx-0x1]
0x27c1a07532d4    d4  8d0416               leal rax,[rsi+rdx*1]
0x27c1a07532d7    d7  410fb60400           movzxbl rax,[r8+rax*1]
0x27c1a07532dc    dc  83f80a               cmpl rax,0xa
0x27c1a07532df    df  0f842b000000         jz 0x27c1a0753310  <+0x110>
0x27c1a07532e5    e5  83fb01               cmpl rbx,0x1
0x27c1a07532e8    e8  0f8417000000         jz 0x27c1a0753305  <+0x105>
0x27c1a07532ee    ee  8d5eff               leal rbx,[rsi-0x1]
0x27c1a07532f1    f1  8d0413               leal rax,[rbx+rdx*1]
0x27c1a07532f4    f4  410fb60400           movzxbl rax,[r8+rax*1]
0x27c1a07532f9    f9  83f80a               cmpl rax,0xa
0x27c1a07532fc    fc  75c2                 jnz 0x27c1a07532c0  <+0xc0>
0x27c1a07532fe    fe  8bde                 movl rbx,rsi
0x27c1a0753300   100  e90b000000           jmp 0x27c1a0753310  <+0x110>
0x27c1a0753305   105  498bdf               REX.W movq rbx,r15
0x27c1a0753308   108  498bf1               REX.W movq rsi,r9
0x27c1a075330b   10b  e982000000           jmp 0x27c1a0753392  <+0x192>
0x27c1a0753310   110  458b5c3824           movl r11,[r8+rdi*1+0x24]
0x27c1a0753315   115  498b4147             REX.W movq rax,[r9+0x47]
0x27c1a0753319   119  498b713f             REX.W movq rsi,[r9+0x3f]
0x27c1a075331d   11d  48895db0             REX.W movq [rbp-0x50],rbx
0x27c1a0753321   121  418b590f             movl rbx,[r9+0xf]
0x27c1a0753325   125  4903de               REX.W addq rbx,r14
0x27c1a0753328   128  428d3c9d00000000     leal rdi,[r11*4+0x0]
0x27c1a0753330   130  4183fb04             cmpl r11,0x4
0x27c1a0753334   134  0f8347070000         jnc 0x27c1a0753a81  <+0x881>
0x27c1a075333a   13a  8b3c38               movl rdi,[rax+rdi*1]
0x27c1a075333d   13d  41393c24             cmpl [r12],rdi
0x27c1a0753341   141  0f8535070000         jnz 0x27c1a0753a7c  <+0x87c>
0x27c1a0753347   147  428b5c9b07           movl rbx,[rbx+r11*4+0x7]
0x27c1a075334c   14c  4903de               REX.W addq rbx,r14
0x27c1a075334f   14f  4a8b3cde             REX.W movq rdi,[rsi+r11*8]
0x27c1a0753353   153  488bf3               REX.W movq rsi,rbx
0x27c1a0753356   156  8b45e8               movl rax,[rbp-0x18]
0x27c1a0753359   159  8b4db0               movl rcx,[rbp-0x50]
0x27c1a075335c   15c  ffd7                 call rdi
0x27c1a075335e   15e  3b45b0               cmpl rax,[rbp-0x50]
0x27c1a0753361   161  0f8264040000         jc 0x27c1a07537cb  <+0x5cb>
0x27c1a0753367   167  8b55e0               movl rdx,[rbp-0x20]
0x27c1a075336a   16a  8b5db0               movl rbx,[rbp-0x50]
0x27c1a075336d   16d  03d3                 addl rdx,rbx
0x27c1a075336f   16f  488b7dd0             REX.W movq rdi,[rbp-0x30]
0x27c1a0753373   173  4c8b45c8             REX.W movq r8,[rbp-0x38]
0x27c1a0753377   177  468b5c0714           movl r11,[rdi+r8*1+0x14]
0x27c1a075337c   17c  8b4dd8               movl rcx,[rbp-0x28]
0x27c1a075337f   17f  2bcb                 subl rcx,rbx
0x27c1a0753381   181  488b5dc0             REX.W movq rbx,[rbp-0x40]
0x27c1a0753385   185  4c8bd7               REX.W movq r10,rdi
0x27c1a0753388   188  498bf8               REX.W movq rdi,r8
0x27c1a075338b   18b  4d8bc2               REX.W movq r8,r10
0x27c1a075338e   18e  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a0753392   192  48894dd8             REX.W movq [rbp-0x28],rcx
0x27c1a0753396   196  81f900020000         cmpl rcx,0x200
0x27c1a075339c   19c  0f83a1030000         jnc 0x27c1a0753743  <+0x543>
0x27c1a07533a2   1a2  458d0c0b             leal r9,[r11+rcx*1]
0x27c1a07533a6   1a6  458be3               movl r12,r11
0x27c1a07533a9   1a9  4433e2               xorl r12,rdx
0x27c1a07533ac   1ac  41f6c403             testb r12,0x3
0x27c1a07533b0   1b0  0f854e020000         jnz 0x27c1a0753604  <+0x404>
0x27c1a07533b6   1b6  41f6c303             testb r11,0x3
0x27c1a07533ba   1ba  0f84a6000000         jz 0x27c1a0753466  <+0x266>
0x27c1a07533c0   1c0  85c9                 testl rcx,rcx
0x27c1a07533c2   1c2  0f849e000000         jz 0x27c1a0753466  <+0x266>
0x27c1a07533c8   1c8  660f1f840000000000   nop
0x27c1a07533d1   1d1  660f1f840000000000   nop
0x27c1a07533da   1da  660f1f840000000000   nop
0x27c1a07533e3   1e3  660f1f840000000000   nop
0x27c1a07533ec   1ec  660f1f840000000000   nop
0x27c1a07533f5   1f5  660f1f840000000000   nop
0x27c1a07533fe   1fe  6690                 nop
0x27c1a0753400   200  483b23               REX.W cmpq rsp,[rbx]
0x27c1a0753403   203  0f8619040000         jna 0x27c1a0753822  <+0x622>
0x27c1a0753409   209  448d6201             leal r12,[rdx+0x1]
0x27c1a075340d   20d  448bfa               movl r15,rdx
0x27c1a0753410   210  470fb63c38           movzxbl r15,[r8+r15*1]
0x27c1a0753415   215  47883c18             movb [r8+r11*1],r15l
0x27c1a0753419   219  4183c301             addl r11,0x1
0x27c1a075341d   21d  41f6c303             testb r11,0x3
0x27c1a0753421   221  0f8432000000         jz 0x27c1a0753459  <+0x259>
0x27c1a0753427   227  453bd9               cmpl r11,r9
0x27c1a075342a   22a  0f8329000000         jnc 0x27c1a0753459  <+0x259>
0x27c1a0753430   230  418d542401           leal rdx,[r12+0x1]
0x27c1a0753435   235  470fb62420           movzxbl r12,[r8+r12*1]
0x27c1a075343a   23a  47882418             movb [r8+r11*1],r12l
0x27c1a075343e   23e  4183c301             addl r11,0x1
0x27c1a0753442   242  41f6c303             testb r11,0x3
0x27c1a0753446   246  0f840a000000         jz 0x27c1a0753456  <+0x256>
0x27c1a075344c   24c  453bd9               cmpl r11,r9
0x27c1a075344f   24f  72af                 jc 0x27c1a0753400  <+0x200>
0x27c1a0753451   251  e90b000000           jmp 0x27c1a0753461  <+0x261>
0x27c1a0753456   256  448be2               movl r12,rdx
0x27c1a0753459   259  4489e2               movl rdx,r12
0x27c1a075345c   25c  e905000000           jmp 0x27c1a0753466  <+0x266>
0x27c1a0753461   261  448be2               movl r12,rdx
0x27c1a0753464   264  ebf3                 jmp 0x27c1a0753459  <+0x259>
0x27c1a0753466   266  458be1               movl r12,r9
0x27c1a0753469   269  4183e4fc             andl r12,0xfc
0x27c1a075346d   26d  4183fc40             cmpl r12,0x40
0x27c1a0753471   271  0f8206010000         jc 0x27c1a075357d  <+0x37d>
0x27c1a0753477   277  458d7c24c0           leal r15,[r12-0x40]
0x27c1a075347c   27c  453bfb               cmpl r15,r11
0x27c1a075347f   27f  0f82f8000000         jc 0x27c1a075357d  <+0x37d>
0x27c1a0753485   285  e938000000           jmp 0x27c1a07534c2  <+0x2c2>
0x27c1a075348a   28a  660f1f840000000000   nop
0x27c1a0753493   293  660f1f840000000000   nop
0x27c1a075349c   29c  660f1f840000000000   nop
0x27c1a07534a5   2a5  660f1f840000000000   nop
0x27c1a07534ae   2ae  660f1f840000000000   nop
0x27c1a07534b7   2b7  660f1f840000000000   nop
0x27c1a07534c0   2c0  8bd0                 movl rdx,rax
0x27c1a07534c2   2c2  483b23               REX.W cmpq rsp,[rbx]
0x27c1a07534c5   2c5  0f8687030000         jna 0x27c1a0753852  <+0x652>
0x27c1a07534cb   2cb  8d4240               leal rax,[rdx+0x40]
0x27c1a07534ce   2ce  8bd2                 movl rdx,rdx
0x27c1a07534d0   2d0  418b3410             movl rsi,[r8+rdx*1]
0x27c1a07534d4   2d4  43893418             movl [r8+r11*1],rsi
0x27c1a07534d8   2d8  418b741004           movl rsi,[r8+rdx*1+0x4]
0x27c1a07534dd   2dd  4389740304           movl [r11+r8*1+0x4],rsi
0x27c1a07534e2   2e2  418b741008           movl rsi,[r8+rdx*1+0x8]
0x27c1a07534e7   2e7  4389740308           movl [r11+r8*1+0x8],rsi
0x27c1a07534ec   2ec  418b74100c           movl rsi,[r8+rdx*1+0xc]
0x27c1a07534f1   2f1  438974030c           movl [r11+r8*1+0xc],rsi
0x27c1a07534f6   2f6  418b741010           movl rsi,[r8+rdx*1+0x10]
0x27c1a07534fb   2fb  4389740310           movl [r11+r8*1+0x10],rsi
0x27c1a0753500   300  418b741014           movl rsi,[r8+rdx*1+0x14]
0x27c1a0753505   305  4389740314           movl [r11+r8*1+0x14],rsi
0x27c1a075350a   30a  418b741018           movl rsi,[r8+rdx*1+0x18]
0x27c1a075350f   30f  4389740318           movl [r11+r8*1+0x18],rsi
0x27c1a0753514   314  418b74101c           movl rsi,[r8+rdx*1+0x1c]
0x27c1a0753519   319  438974031c           movl [r11+r8*1+0x1c],rsi
0x27c1a075351e   31e  418b741020           movl rsi,[r8+rdx*1+0x20]
0x27c1a0753523   323  4389740320           movl [r11+r8*1+0x20],rsi
0x27c1a0753528   328  418b741024           movl rsi,[r8+rdx*1+0x24]
0x27c1a075352d   32d  4389740324           movl [r11+r8*1+0x24],rsi
0x27c1a0753532   332  418b741028           movl rsi,[r8+rdx*1+0x28]
0x27c1a0753537   337  4389740328           movl [r11+r8*1+0x28],rsi
0x27c1a075353c   33c  418b74102c           movl rsi,[r8+rdx*1+0x2c]
0x27c1a0753541   341  438974032c           movl [r11+r8*1+0x2c],rsi
0x27c1a0753546   346  418b741030           movl rsi,[r8+rdx*1+0x30]
0x27c1a075354b   34b  4389740330           movl [r11+r8*1+0x30],rsi
0x27c1a0753550   350  418b741034           movl rsi,[r8+rdx*1+0x34]
0x27c1a0753555   355  4389740334           movl [r11+r8*1+0x34],rsi
0x27c1a075355a   35a  418b741038           movl rsi,[r8+rdx*1+0x38]
0x27c1a075355f   35f  4389740338           movl [r11+r8*1+0x38],rsi
0x27c1a0753564   364  418b54103c           movl rdx,[r8+rdx*1+0x3c]
0x27c1a0753569   369  438954033c           movl [r11+r8*1+0x3c],rdx
0x27c1a075356e   36e  4183c340             addl r11,0x40
0x27c1a0753572   372  453bdf               cmpl r11,r15
0x27c1a0753575   375  0f8645ffffff         jna 0x27c1a07534c0  <+0x2c0>
0x27c1a075357b   37b  8bd0                 movl rdx,rax
0x27c1a075357d   37d  453be3               cmpl r12,r11
0x27c1a0753580   380  0f863f010000         jna 0x27c1a07536c5  <+0x4c5>
0x27c1a0753586   386  660f1f840000000000   nop
0x27c1a075358f   38f  660f1f840000000000   nop
0x27c1a0753598   398  660f1f840000000000   nop
0x27c1a07535a1   3a1  660f1f840000000000   nop
0x27c1a07535aa   3aa  660f1f840000000000   nop
0x27c1a07535b3   3b3  660f1f840000000000   nop
0x27c1a07535bc   3bc  0f1f4000             nop
0x27c1a07535c0   3c0  483b23               REX.W cmpq rsp,[rbx]
0x27c1a07535c3   3c3  0f86c9020000         jna 0x27c1a0753892  <+0x692>
0x27c1a07535c9   3c9  448d7a04             leal r15,[rdx+0x4]
0x27c1a07535cd   3cd  8bc2                 movl rax,rdx
0x27c1a07535cf   3cf  418b0400             movl rax,[r8+rax*1]
0x27c1a07535d3   3d3  43890418             movl [r8+r11*1],rax
0x27c1a07535d7   3d7  4183c304             addl r11,0x4
0x27c1a07535db   3db  4539e3               cmpl r11,r12
0x27c1a07535de   3de  0f8318000000         jnc 0x27c1a07535fc  <+0x3fc>
0x27c1a07535e4   3e4  418d5704             leal rdx,[r15+0x4]
0x27c1a07535e8   3e8  478b3c38             movl r15,[r8+r15*1]
0x27c1a07535ec   3ec  47893c18             movl [r8+r11*1],r15
0x27c1a07535f0   3f0  4183c304             addl r11,0x4
0x27c1a07535f4   3f4  4539e3               cmpl r11,r12
0x27c1a07535f7   3f7  72c7                 jc 0x27c1a07535c0  <+0x3c0>
0x27c1a07535f9   3f9  448bfa               movl r15,rdx
0x27c1a07535fc   3fc  418bd7               movl rdx,r15
0x27c1a07535ff   3ff  e9c1000000           jmp 0x27c1a07536c5  <+0x4c5>
0x27c1a0753604   404  4183f904             cmpl r9,0x4
0x27c1a0753608   408  0f82b7000000         jc 0x27c1a07536c5  <+0x4c5>
0x27c1a075360e   40e  458d61fc             leal r12,[r9-0x4]
0x27c1a0753612   412  453be3               cmpl r12,r11
0x27c1a0753615   415  0f82aa000000         jc 0x27c1a07536c5  <+0x4c5>
0x27c1a075361b   41b  660f1f840000000000   nop
0x27c1a0753624   424  660f1f840000000000   nop
0x27c1a075362d   42d  660f1f840000000000   nop
0x27c1a0753636   436  660f1f840000000000   nop
0x27c1a075363f   43f  90                   nop
0x27c1a0753640   440  483b23               REX.W cmpq rsp,[rbx]
0x27c1a0753643   443  0f8681020000         jna 0x27c1a07538ca  <+0x6ca>
0x27c1a0753649   449  448d7a04             leal r15,[rdx+0x4]
0x27c1a075364d   44d  8bc2                 movl rax,rdx
0x27c1a075364f   44f  410fb61400           movzxbl rdx,[r8+rax*1]
0x27c1a0753654   454  43881418             movb [r8+r11*1],dl
0x27c1a0753658   458  410fb6540001         movzxbl rdx,[r8+rax*1+0x1]
0x27c1a075365e   45e  4388540301           movb [r11+r8*1+0x1],dl
0x27c1a0753663   463  410fb6540002         movzxbl rdx,[r8+rax*1+0x2]
0x27c1a0753669   469  4388540302           movb [r11+r8*1+0x2],dl
0x27c1a075366e   46e  410fb6440003         movzxbl rax,[r8+rax*1+0x3]
0x27c1a0753674   474  4388440303           movb [r11+r8*1+0x3],al
0x27c1a0753679   479  4183c304             addl r11,0x4
0x27c1a075367d   47d  4539e3               cmpl r11,r12
0x27c1a0753680   480  0f8776ffffff         ja 0x27c1a07535fc  <+0x3fc>
0x27c1a0753686   486  418d5704             leal rdx,[r15+0x4]
0x27c1a075368a   48a  430fb60438           movzxbl rax,[r8+r15*1]
0x27c1a075368f   48f  43880418             movb [r8+r11*1],al
0x27c1a0753693   493  430fb6443801         movzxbl rax,[r8+r15*1+0x1]
0x27c1a0753699   499  4388440301           movb [r11+r8*1+0x1],al
0x27c1a075369e   49e  430fb6443802         movzxbl rax,[r8+r15*1+0x2]
0x27c1a07536a4   4a4  4388440302           movb [r11+r8*1+0x2],al
0x27c1a07536a9   4a9  470fb67c3803         movzxbl r15,[r8+r15*1+0x3]
0x27c1a07536af   4af  47887c0303           movb [r11+r8*1+0x3],r15l
0x27c1a07536b4   4b4  4183c304             addl r11,0x4
0x27c1a07536b8   4b8  4539e3               cmpl r11,r12
0x27c1a07536bb   4bb  7683                 jna 0x27c1a0753640  <+0x440>
0x27c1a07536bd   4bd  448bfa               movl r15,rdx
0x27c1a07536c0   4c0  e937ffffff           jmp 0x27c1a07535fc  <+0x3fc>
0x27c1a07536c5   4c5  453bd9               cmpl r11,r9
0x27c1a07536c8   4c8  0f8237000000         jc 0x27c1a0753705  <+0x505>
0x27c1a07536ce   4ce  e99b000000           jmp 0x27c1a075376e  <+0x56e>
0x27c1a07536d3   4d3  660f1f840000000000   nop
0x27c1a07536dc   4dc  660f1f840000000000   nop
0x27c1a07536e5   4e5  660f1f840000000000   nop
0x27c1a07536ee   4ee  660f1f840000000000   nop
0x27c1a07536f7   4f7  660f1f840000000000   nop
0x27c1a0753700   500  418d542401           leal rdx,[r12+0x1]
0x27c1a0753705   505  483b23               REX.W cmpq rsp,[rbx]
0x27c1a0753708   508  0f86f4010000         jna 0x27c1a0753902  <+0x702>
0x27c1a075370e   50e  448be2               movl r12,rdx
0x27c1a0753711   511  470fb62420           movzxbl r12,[r8+r12*1]
0x27c1a0753716   516  47882418             movb [r8+r11*1],r12l
0x27c1a075371a   51a  4183c301             addl r11,0x1
0x27c1a075371e   51e  453bd9               cmpl r11,r9
0x27c1a0753721   521  0f8447000000         jz 0x27c1a075376e  <+0x56e>
0x27c1a0753727   527  448d6201             leal r12,[rdx+0x1]
0x27c1a075372b   52b  470fb63c20           movzxbl r15,[r8+r12*1]
0x27c1a0753730   530  47883c18             movb [r8+r11*1],r15l
0x27c1a0753734   534  4183c301             addl r11,0x1
0x27c1a0753738   538  453bcb               cmpl r9,r11
0x27c1a075373b   53b  0f842d000000         jz 0x27c1a075376e  <+0x56e>
0x27c1a0753741   541  ebbd                 jmp 0x27c1a0753700  <+0x500>
0x27c1a0753743   543  488bde               REX.W movq rbx,rsi
0x27c1a0753746   546  448b4b0b             movl r9,[rbx+0xb]
0x27c1a075374a   54a  4d03ce               REX.W addq r9,r14
0x27c1a075374d   54d  418b710b             movl rsi,[r9+0xb]
0x27c1a0753751   551  4903f6               REX.W addq rsi,r14
0x27c1a0753754   554  8b5b17               movl rbx,[rbx+0x17]
0x27c1a0753757   557  4903de               REX.W addq rbx,r14
0x27c1a075375a   55a  488b5b0f             REX.W movq rbx,[rbx+0xf]
0x27c1a075375e   55e  418bc3               movl rax,r11
0x27c1a0753761   561  ffd3                 call rbx
0x27c1a0753763   563  4c8b45d0             REX.W movq r8,[rbp-0x30]
0x27c1a0753767   567  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x27c1a075376b   56b  8b4dd8               movl rcx,[rbp-0x28]
0x27c1a075376e   56e  4c8bd7               REX.W movq r10,rdi
0x27c1a0753771   571  498bf8               REX.W movq rdi,r8
0x27c1a0753774   574  4d8bc2               REX.W movq r8,r10
0x27c1a0753777   577  428b5c0714           movl rbx,[rdi+r8*1+0x14]
0x27c1a075377c   57c  03d9                 addl rbx,rcx
0x27c1a075377e   57e  41895c3814           movl [r8+rdi*1+0x14],rbx
0x27c1a0753783   583  e943000000           jmp 0x27c1a07537cb  <+0x5cb>
0x27c1a0753788   588  488b5e37             REX.W movq rbx,[rsi+0x37]
0x27c1a075378c   58c  8b1b                 movl rbx,[rbx]
0x27c1a075378e   58e  418b7c3824           movl rdi,[r8+rdi*1+0x24]
0x27c1a0753793   593  4c8b4647             REX.W movq r8,[rsi+0x47]
0x27c1a0753797   597  4c8b4e3f             REX.W movq r9,[rsi+0x3f]
0x27c1a075379b   59b  448b5e0f             movl r11,[rsi+0xf]
0x27c1a075379f   59f  4d03de               REX.W addq r11,r14
0x27c1a07537a2   5a2  448d24bd00000000     leal r12,[rdi*4+0x0]
0x27c1a07537aa   5aa  83ff04               cmpl rdi,0x4
0x27c1a07537ad   5ad  0f8384010000         jnc 0x27c1a0753937  <+0x737>
0x27c1a07537b3   5b3  43391c20             cmpl [r8+r12*1],rbx
0x27c1a07537b7   5b7  0f8575010000         jnz 0x27c1a0753932  <+0x732>
0x27c1a07537bd   5bd  418b74bb07           movl rsi,[r11+rdi*4+0x7]
0x27c1a07537c2   5c2  4903f6               REX.W addq rsi,r14
0x27c1a07537c5   5c5  498b1cf9             REX.W movq rbx,[r9+rdi*8]
0x27c1a07537c9   5c9  ffd3                 call rbx
0x27c1a07537cb   5cb  488be5               REX.W movq rsp,rbp
0x27c1a07537ce   5ce  5d                   pop rbp
0x27c1a07537cf   5cf  c3                   retl
0x27c1a07537d0   5d0  e83bbbffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a07537d5   5d5  8b45e8               movl rax,[rbp-0x18]
0x27c1a07537d8   5d8  8b55e0               movl rdx,[rbp-0x20]
0x27c1a07537db   5db  8b4dd8               movl rcx,[rbp-0x28]
0x27c1a07537de   5de  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a07537e2   5e2  488b5dc0             REX.W movq rbx,[rbp-0x40]
0x27c1a07537e6   5e6  e93dfaffff           jmp 0x27c1a0753228  <+0x28>
0x27c1a07537eb   5eb  4c895da8             REX.W movq [rbp-0x58],r11
0x27c1a07537ef   5ef  4c8965b8             REX.W movq [rbp-0x48],r12
0x27c1a07537f3   5f3  48895db0             REX.W movq [rbp-0x50],rbx
0x27c1a07537f7   5f7  e814bbffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a07537fc   5fc  8b55e0               movl rdx,[rbp-0x20]
0x27c1a07537ff   5ff  8b4dd8               movl rcx,[rbp-0x28]
0x27c1a0753802   602  4c8b4df0             REX.W movq r9,[rbp-0x10]
0x27c1a0753806   606  4c8b45d0             REX.W movq r8,[rbp-0x30]
0x27c1a075380a   60a  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x27c1a075380e   60e  4c8b7dc0             REX.W movq r15,[rbp-0x40]
0x27c1a0753812   612  448b5da8             movl r11,[rbp-0x58]
0x27c1a0753816   616  4c8b65b8             REX.W movq r12,[rbp-0x48]
0x27c1a075381a   61a  8b5db0               movl rbx,[rbp-0x50]
0x27c1a075381d   61d  e9a7faffff           jmp 0x27c1a07532c9  <+0xc9>
0x27c1a0753822   622  4c894de8             REX.W movq [rbp-0x18],r9
0x27c1a0753826   626  4c895da8             REX.W movq [rbp-0x58],r11
0x27c1a075382a   62a  488955e0             REX.W movq [rbp-0x20],rdx
0x27c1a075382e   62e  e8ddbaffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a0753833   633  4c8b45d0             REX.W movq r8,[rbp-0x30]
0x27c1a0753837   637  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x27c1a075383b   63b  8b4dd8               movl rcx,[rbp-0x28]
0x27c1a075383e   63e  448b4de8             movl r9,[rbp-0x18]
0x27c1a0753842   642  488b5dc0             REX.W movq rbx,[rbp-0x40]
0x27c1a0753846   646  448b5da8             movl r11,[rbp-0x58]
0x27c1a075384a   64a  8b55e0               movl rdx,[rbp-0x20]
0x27c1a075384d   64d  e9b7fbffff           jmp 0x27c1a0753409  <+0x209>
0x27c1a0753852   652  4c894de8             REX.W movq [rbp-0x18],r9
0x27c1a0753856   656  4c8965e0             REX.W movq [rbp-0x20],r12
0x27c1a075385a   65a  4c897db8             REX.W movq [rbp-0x48],r15
0x27c1a075385e   65e  4c895da8             REX.W movq [rbp-0x58],r11
0x27c1a0753862   662  488955b0             REX.W movq [rbp-0x50],rdx
0x27c1a0753866   666  e8a5baffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a075386b   66b  4c8b45d0             REX.W movq r8,[rbp-0x30]
0x27c1a075386f   66f  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x27c1a0753873   673  8b4dd8               movl rcx,[rbp-0x28]
0x27c1a0753876   676  448b4de8             movl r9,[rbp-0x18]
0x27c1a075387a   67a  488b5dc0             REX.W movq rbx,[rbp-0x40]
0x27c1a075387e   67e  448b65e0             movl r12,[rbp-0x20]
0x27c1a0753882   682  448b7db8             movl r15,[rbp-0x48]
0x27c1a0753886   686  448b5da8             movl r11,[rbp-0x58]
0x27c1a075388a   68a  8b55b0               movl rdx,[rbp-0x50]
0x27c1a075388d   68d  e939fcffff           jmp 0x27c1a07534cb  <+0x2cb>
0x27c1a0753892   692  4c894de8             REX.W movq [rbp-0x18],r9
0x27c1a0753896   696  4c8965e0             REX.W movq [rbp-0x20],r12
0x27c1a075389a   69a  4c895da8             REX.W movq [rbp-0x58],r11
0x27c1a075389e   69e  488955b8             REX.W movq [rbp-0x48],rdx
0x27c1a07538a2   6a2  e869baffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a07538a7   6a7  4c8b45d0             REX.W movq r8,[rbp-0x30]
0x27c1a07538ab   6ab  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x27c1a07538af   6af  8b4dd8               movl rcx,[rbp-0x28]
0x27c1a07538b2   6b2  448b4de8             movl r9,[rbp-0x18]
0x27c1a07538b6   6b6  488b5dc0             REX.W movq rbx,[rbp-0x40]
0x27c1a07538ba   6ba  448b65e0             movl r12,[rbp-0x20]
0x27c1a07538be   6be  448b5da8             movl r11,[rbp-0x58]
0x27c1a07538c2   6c2  8b55b8               movl rdx,[rbp-0x48]
0x27c1a07538c5   6c5  e9fffcffff           jmp 0x27c1a07535c9  <+0x3c9>
0x27c1a07538ca   6ca  4c894de8             REX.W movq [rbp-0x18],r9
0x27c1a07538ce   6ce  4c8965e0             REX.W movq [rbp-0x20],r12
0x27c1a07538d2   6d2  4c895da8             REX.W movq [rbp-0x58],r11
0x27c1a07538d6   6d6  488955b8             REX.W movq [rbp-0x48],rdx
0x27c1a07538da   6da  e831baffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a07538df   6df  4c8b45d0             REX.W movq r8,[rbp-0x30]
0x27c1a07538e3   6e3  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x27c1a07538e7   6e7  8b4dd8               movl rcx,[rbp-0x28]
0x27c1a07538ea   6ea  448b4de8             movl r9,[rbp-0x18]
0x27c1a07538ee   6ee  488b5dc0             REX.W movq rbx,[rbp-0x40]
0x27c1a07538f2   6f2  448b65e0             movl r12,[rbp-0x20]
0x27c1a07538f6   6f6  448b5da8             movl r11,[rbp-0x58]
0x27c1a07538fa   6fa  8b55b8               movl rdx,[rbp-0x48]
0x27c1a07538fd   6fd  e947fdffff           jmp 0x27c1a0753649  <+0x449>
0x27c1a0753902   702  4c894de8             REX.W movq [rbp-0x18],r9
0x27c1a0753906   706  488955e0             REX.W movq [rbp-0x20],rdx
0x27c1a075390a   70a  4c895da8             REX.W movq [rbp-0x58],r11
0x27c1a075390e   70e  e8fdb9ffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a0753913   713  4c8b45d0             REX.W movq r8,[rbp-0x30]
0x27c1a0753917   717  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x27c1a075391b   71b  8b4dd8               movl rcx,[rbp-0x28]
0x27c1a075391e   71e  448b4de8             movl r9,[rbp-0x18]
0x27c1a0753922   722  8b55e0               movl rdx,[rbp-0x20]
0x27c1a0753925   725  448b5da8             movl r11,[rbp-0x58]
0x27c1a0753929   729  488b5dc0             REX.W movq rbx,[rbp-0x40]
0x27c1a075392d   72d  e9dcfdffff           jmp 0x27c1a075370e  <+0x50e>
0x27c1a0753932   732  e8b9b7ffff           call 0x27c1a074f0f0  (jump table)    ;; wasm stub: ThrowWasmTrapFuncSigMismatch
0x27c1a0753937   737  e8e4b7ffff           call 0x27c1a074f120  (jump table)    ;; wasm stub: ThrowWasmTrapTableOutOfBounds
0x27c1a075393c   73c  e84fb7ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753941   741  e84ab7ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753946   746  e845b7ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075394b   74b  e840b7ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753950   750  e83bb7ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753955   755  e836b7ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075395a   75a  e831b7ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075395f   75f  e82cb7ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753964   764  e827b7ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753969   769  e822b7ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075396e   76e  e81db7ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753973   773  e818b7ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753978   778  e813b7ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075397d   77d  e80eb7ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753982   782  e809b7ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753987   787  e804b7ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075398c   78c  e8ffb6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753991   791  e8fab6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753996   796  e8f5b6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075399b   79b  e8f0b6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07539a0   7a0  e8ebb6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07539a5   7a5  e8e6b6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07539aa   7aa  e8e1b6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07539af   7af  e8dcb6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07539b4   7b4  e8d7b6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07539b9   7b9  e8d2b6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07539be   7be  e8cdb6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07539c3   7c3  e8c8b6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07539c8   7c8  e8c3b6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07539cd   7cd  e8beb6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07539d2   7d2  e8b9b6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07539d7   7d7  e8b4b6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07539dc   7dc  e8afb6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07539e1   7e1  e8aab6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07539e6   7e6  e8a5b6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07539eb   7eb  e8a0b6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07539f0   7f0  e89bb6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07539f5   7f5  e896b6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07539fa   7fa  e891b6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07539ff   7ff  e88cb6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753a04   804  e887b6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753a09   809  e882b6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753a0e   80e  e87db6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753a13   813  e878b6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753a18   818  e873b6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753a1d   81d  e86eb6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753a22   822  e869b6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753a27   827  e864b6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753a2c   82c  e85fb6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753a31   831  e85ab6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753a36   836  e855b6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753a3b   83b  e850b6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753a40   840  e84bb6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753a45   845  e846b6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753a4a   84a  e841b6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753a4f   84f  e83cb6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753a54   854  e837b6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753a59   859  e832b6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753a5e   85e  e82db6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753a63   863  e828b6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753a68   868  e823b6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753a6d   86d  e81eb6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753a72   872  e819b6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753a77   877  e814b6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753a7c   87c  e86fb6ffff           call 0x27c1a074f0f0  (jump table)    ;; wasm stub: ThrowWasmTrapFuncSigMismatch
0x27c1a0753a81   881  e89ab6ffff           call 0x27c1a074f120  (jump table)    ;; wasm stub: ThrowWasmTrapTableOutOfBounds
0x27c1a0753a86   886  e805b6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753a8b   88b  e800b6ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753a90   890  e8fbb5ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753a95   895  e8f6b5ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753a9a   89a  e8f1b5ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753a9f   89f  e8ecb5ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753aa4   8a4  e8e7b5ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753aa9   8a9  e8e2b5ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753aae   8ae  90                   nop
0x27c1a0753aaf   8af  90                   nop

Protected instructions:
 pc offset  land pad
       58e       73c
       57e       741
       577       746
       530       74b
       52b       750
       516       755
       511       75a
       4af       75f
       4a9       764
       4a4       769
       49e       76e
       499       773
       493       778
       48f       77d
       48a       782
       474       787
       46e       78c
       469       791
       463       796
       45e       79b
       458       7a0
       454       7a5
       44f       7aa
       3ec       7af
       3e8       7b4
       3d3       7b9
       3cf       7be
       369       7c3
       364       7c8
       35f       7cd
       35a       7d2
       355       7d7
       350       7dc
       34b       7e1
       346       7e6
       341       7eb
       33c       7f0
       337       7f5
       332       7fa
       32d       7ff
       328       804
       323       809
       31e       80e
       319       813
       314       818
       30f       81d
       30a       822
       305       827
       300       82c
       2fb       831
       2f6       836
       2f1       83b
       2ec       840
       2e7       845
       2e2       84a
       2dd       84f
       2d8       854
       2d4       859
       2d0       85e
       23a       863
       235       868
       215       86d
       210       872
       177       877
       110       886
        f4       88b
        d7       890
        99       895
        88       89a
        6f       89f
        4c       8a4
        35       8a9

Source positions:
 pc offset  position
        35         5
        4c        22
        5a        34
        67        40
        88        46
        99        77
        d7       108
       110       125
       153       128
       16f       152
       210       224
       215       227
       235       224
       23a       227
       2d0       292
       2d4       295
       2d8       302
       2dd       305
       2e2       312
       2e7       315
       2ec       322
       2f1       325
       2f6       332
       2fb       335
       300       342
       305       345
       30a       352
       30f       355
       314       362
       319       365
       31e       372
       323       375
       328       382
       32d       385
       332       392
       337       395
       33c       402
       341       405
       346       412
       34b       415
       350       422
       355       425
       35a       432
       35f       435
       364       442
       369       445
       3cf       482
       3d3       485
       3e8       482
       3ec       485
       44f       536
       454       539
       458       546
       45e       549
       463       556
       469       559
       46e       566
       474       569
       48a       536
       48f       539
       493       546
       499       549
       49e       556
       4a4       559
       4a9       566
       4af       569
       511       606
       516       609
       52b       606
       530       609
       55e       178
       56e       638
       57e       644
       58e        63
       5c9        66
       5d0         0
       5eb        89
       622       218
       652       286
       692       476
       6ca       530
       702       600
       732        66
       73c        63
       741       644
       746       638
       74b       609
       750       606
       755       609
       75a       606
       75f       569
       764       566
       769       559
       76e       556
       773       549
       778       546
       77d       539
       782       536
       787       569
       78c       566
       791       559
       796       556
       79b       549
       7a0       546
       7a5       539
       7aa       536
       7af       485
       7b4       482
       7b9       485
       7be       482
       7c3       445
       7c8       442
       7cd       435
       7d2       432
       7d7       425
       7dc       422
       7e1       415
       7e6       412
       7eb       405
       7f0       402
       7f5       395
       7fa       392
       7ff       385
       804       382
       809       375
       80e       372
       813       365
       818       362
       81d       355
       822       352
       827       345
       82c       342
       831       335
       836       332
       83b       325
       840       322
       845       315
       84a       312
       84f       305
       854       302
       859       295
       85e       292
       863       227
       868       224
       86d       227
       872       224
       877       152
       87c       128
       886       125
       88b       108
       895        77
       89a        46
       89f        40
       8a4        22
       8a9         5

Safepoints (entries = 1, byte size = 11)
0x27c1a075325f     5f  slots (sp->fp): 0000000000000000

RelocInfo (size = 89)
0x27c1a075325b  internal wasm call
0x27c1a07537d1  wasm stub call
0x27c1a07537f8  wasm stub call
0x27c1a075382f  wasm stub call
0x27c1a0753867  wasm stub call
0x27c1a07538a3  wasm stub call
0x27c1a07538db  wasm stub call
0x27c1a075390f  wasm stub call
0x27c1a0753933  wasm stub call
0x27c1a0753938  wasm stub call
0x27c1a075393d  wasm stub call
0x27c1a0753942  wasm stub call
0x27c1a0753947  wasm stub call
0x27c1a075394c  wasm stub call
0x27c1a0753951  wasm stub call
0x27c1a0753956  wasm stub call
0x27c1a075395b  wasm stub call
0x27c1a0753960  wasm stub call
0x27c1a0753965  wasm stub call
0x27c1a075396a  wasm stub call
0x27c1a075396f  wasm stub call
0x27c1a0753974  wasm stub call
0x27c1a0753979  wasm stub call
0x27c1a075397e  wasm stub call
0x27c1a0753983  wasm stub call
0x27c1a0753988  wasm stub call
0x27c1a075398d  wasm stub call
0x27c1a0753992  wasm stub call
0x27c1a0753997  wasm stub call
0x27c1a075399c  wasm stub call
0x27c1a07539a1  wasm stub call
0x27c1a07539a6  wasm stub call
0x27c1a07539ab  wasm stub call
0x27c1a07539b0  wasm stub call
0x27c1a07539b5  wasm stub call
0x27c1a07539ba  wasm stub call
0x27c1a07539bf  wasm stub call
0x27c1a07539c4  wasm stub call
0x27c1a07539c9  wasm stub call
0x27c1a07539ce  wasm stub call
0x27c1a07539d3  wasm stub call
0x27c1a07539d8  wasm stub call
0x27c1a07539dd  wasm stub call
0x27c1a07539e2  wasm stub call
0x27c1a07539e7  wasm stub call
0x27c1a07539ec  wasm stub call
0x27c1a07539f1  wasm stub call
0x27c1a07539f6  wasm stub call
0x27c1a07539fb  wasm stub call
0x27c1a0753a00  wasm stub call
0x27c1a0753a05  wasm stub call
0x27c1a0753a0a  wasm stub call
0x27c1a0753a0f  wasm stub call
0x27c1a0753a14  wasm stub call
0x27c1a0753a19  wasm stub call
0x27c1a0753a1e  wasm stub call
0x27c1a0753a23  wasm stub call
0x27c1a0753a28  wasm stub call
0x27c1a0753a2d  wasm stub call
0x27c1a0753a32  wasm stub call
0x27c1a0753a37  wasm stub call
0x27c1a0753a3c  wasm stub call
0x27c1a0753a41  wasm stub call
0x27c1a0753a46  wasm stub call
0x27c1a0753a4b  wasm stub call
0x27c1a0753a50  wasm stub call
0x27c1a0753a55  wasm stub call
0x27c1a0753a5a  wasm stub call
0x27c1a0753a5f  wasm stub call
0x27c1a0753a64  wasm stub call
0x27c1a0753a69  wasm stub call
0x27c1a0753a6e  wasm stub call
0x27c1a0753a73  wasm stub call
0x27c1a0753a78  wasm stub call
0x27c1a0753a7d  wasm stub call
0x27c1a0753a82  wasm stub call
0x27c1a0753a87  wasm stub call
0x27c1a0753a8c  wasm stub call
0x27c1a0753a91  wasm stub call
0x27c1a0753a96  wasm stub call
0x27c1a0753a9b  wasm stub call
0x27c1a0753aa0  wasm stub call
0x27c1a0753aa5  wasm stub call
0x27c1a0753aaa  wasm stub call

--- End code ---
--- WebAssembly code ---
name: wasm-function[13]
index: 13
kind: wasm function
compiler: TurboFan
Body (size = 640 = 636 + 4 padding)
Instructions (size = 624)
0x27c1a0753ac0     0  55                   push rbp
0x27c1a0753ac1     1  4889e5               REX.W movq rbp,rsp
0x27c1a0753ac4     4  6a08                 push 0x8
0x27c1a0753ac6     6  56                   push rsi
0x27c1a0753ac7     7  8d5af7               leal rbx,[rdx-0x9]
0x27c1a0753aca     a  488b561f             REX.W movq rdx,[rsi+0x1f]
0x27c1a0753ace     e  48c1ea18             REX.W shrq rdx, 24
0x27c1a0753ad2    12  4903d6               REX.W addq rdx,r14
0x27c1a0753ad5    15  83fb12               cmpl rbx,0x12
0x27c1a0753ad8    18  0f830b000000         jnc 0x27c1a0753ae9  <+0x29>
0x27c1a0753ade    1e  4c8d15bb010000       REX.W leaq r10,[rip+0x1bb]
0x27c1a0753ae5    25  41ff24da             jmp [r10+rbx*8]
0x27c1a0753ae9    29  488be5               REX.W movq rsp,rbp
0x27c1a0753aec    2c  5d                   pop rbp
0x27c1a0753aed    2d  c3                   retl
0x27c1a0753aee    2e  8bd9                 movl rbx,rcx
0x27c1a0753af0    30  8bc0                 movl rax,rax
0x27c1a0753af2    32  8b0c1a               movl rcx,[rdx+rbx*1]
0x27c1a0753af5    35  8d7104               leal rsi,[rcx+0x4]
0x27c1a0753af8    38  89341a               movl [rdx+rbx*1],rsi
0x27c1a0753afb    3b  8b1c0a               movl rbx,[rdx+rcx*1]
0x27c1a0753afe    3e  891c02               movl [rdx+rax*1],rbx
0x27c1a0753b01    41  ebe6                 jmp 0x27c1a0753ae9  <+0x29>
0x27c1a0753b03    43  8bd9                 movl rbx,rcx
0x27c1a0753b05    45  8bc0                 movl rax,rax
0x27c1a0753b07    47  8b0c1a               movl rcx,[rdx+rbx*1]
0x27c1a0753b0a    4a  8d7104               leal rsi,[rcx+0x4]
0x27c1a0753b0d    4d  89341a               movl [rdx+rbx*1],rsi
0x27c1a0753b10    50  0fbf1c0a             movsxwl rbx,[rdx+rcx*1]
0x27c1a0753b14    54  4863db               REX.W movsxlq rbx,rbx
0x27c1a0753b17    57  48891c02             REX.W movq [rdx+rax*1],rbx
0x27c1a0753b1b    5b  ebcc                 jmp 0x27c1a0753ae9  <+0x29>
0x27c1a0753b1d    5d  8bd9                 movl rbx,rcx
0x27c1a0753b1f    5f  8bc0                 movl rax,rax
0x27c1a0753b21    61  8b0c1a               movl rcx,[rdx+rbx*1]
0x27c1a0753b24    64  8d7104               leal rsi,[rcx+0x4]
0x27c1a0753b27    67  89341a               movl [rdx+rbx*1],rsi
0x27c1a0753b2a    6a  0fb71c0a             movzxwl rbx,[rdx+rcx*1]
0x27c1a0753b2e    6e  48891c02             REX.W movq [rdx+rax*1],rbx
0x27c1a0753b32    72  ebb5                 jmp 0x27c1a0753ae9  <+0x29>
0x27c1a0753b34    74  8bd9                 movl rbx,rcx
0x27c1a0753b36    76  8bc0                 movl rax,rax
0x27c1a0753b38    78  8b0c1a               movl rcx,[rdx+rbx*1]
0x27c1a0753b3b    7b  8d7104               leal rsi,[rcx+0x4]
0x27c1a0753b3e    7e  89341a               movl [rdx+rbx*1],rsi
0x27c1a0753b41    81  0fbe1c0a             movsxbl rbx,[rdx+rcx*1]
0x27c1a0753b45    85  4863db               REX.W movsxlq rbx,rbx
0x27c1a0753b48    88  48891c02             REX.W movq [rdx+rax*1],rbx
0x27c1a0753b4c    8c  eb9b                 jmp 0x27c1a0753ae9  <+0x29>
0x27c1a0753b4e    8e  8bd9                 movl rbx,rcx
0x27c1a0753b50    90  8bc0                 movl rax,rax
0x27c1a0753b52    92  8b0c1a               movl rcx,[rdx+rbx*1]
0x27c1a0753b55    95  8d7104               leal rsi,[rcx+0x4]
0x27c1a0753b58    98  89341a               movl [rdx+rbx*1],rsi
0x27c1a0753b5b    9b  0fb61c0a             movzxbl rbx,[rdx+rcx*1]
0x27c1a0753b5f    9f  48891c02             REX.W movq [rdx+rax*1],rbx
0x27c1a0753b63    a3  eb84                 jmp 0x27c1a0753ae9  <+0x29>
0x27c1a0753b65    a5  8bd9                 movl rbx,rcx
0x27c1a0753b67    a7  8b0c1a               movl rcx,[rdx+rbx*1]
0x27c1a0753b6a    aa  83c107               addl rcx,0x7
0x27c1a0753b6d    ad  83e1f8               andl rcx,0xf8
0x27c1a0753b70    b0  8d7108               leal rsi,[rcx+0x8]
0x27c1a0753b73    b3  89341a               movl [rdx+rbx*1],rsi
0x27c1a0753b76    b6  488b1c0a             REX.W movq rbx,[rdx+rcx*1]
0x27c1a0753b7a    ba  8bc0                 movl rax,rax
0x27c1a0753b7c    bc  48891c02             REX.W movq [rdx+rax*1],rbx
0x27c1a0753b80    c0  e964ffffff           jmp 0x27c1a0753ae9  <+0x29>
0x27c1a0753b85    c5  8bd9                 movl rbx,rcx
0x27c1a0753b87    c7  8bc0                 movl rax,rax
0x27c1a0753b89    c9  8b0c1a               movl rcx,[rdx+rbx*1]
0x27c1a0753b8c    cc  8d7104               leal rsi,[rcx+0x4]
0x27c1a0753b8f    cf  89341a               movl [rdx+rbx*1],rsi
0x27c1a0753b92    d2  8b1c0a               movl rbx,[rdx+rcx*1]
0x27c1a0753b95    d5  4863db               REX.W movsxlq rbx,rbx
0x27c1a0753b98    d8  48891c02             REX.W movq [rdx+rax*1],rbx
0x27c1a0753b9c    dc  e948ffffff           jmp 0x27c1a0753ae9  <+0x29>
0x27c1a0753ba1    e1  8bd9                 movl rbx,rcx
0x27c1a0753ba3    e3  8bc0                 movl rax,rax
0x27c1a0753ba5    e5  8b0c1a               movl rcx,[rdx+rbx*1]
0x27c1a0753ba8    e8  8d7104               leal rsi,[rcx+0x4]
0x27c1a0753bab    eb  89341a               movl [rdx+rbx*1],rsi
0x27c1a0753bae    ee  8b1c0a               movl rbx,[rdx+rcx*1]
0x27c1a0753bb1    f1  48891c02             REX.W movq [rdx+rax*1],rbx
0x27c1a0753bb5    f5  e92fffffff           jmp 0x27c1a0753ae9  <+0x29>
0x27c1a0753bba    fa  8bd9                 movl rbx,rcx
0x27c1a0753bbc    fc  8bc0                 movl rax,rax
0x27c1a0753bbe    fe  8b0c1a               movl rcx,[rdx+rbx*1]
0x27c1a0753bc1   101  83c107               addl rcx,0x7
0x27c1a0753bc4   104  83e1f8               andl rcx,0xf8
0x27c1a0753bc7   107  8d7108               leal rsi,[rcx+0x8]
0x27c1a0753bca   10a  89341a               movl [rdx+rbx*1],rsi
0x27c1a0753bcd   10d  c5fb10040a           vmovsd xmm0,[rdx+rcx*1]
0x27c1a0753bd2   112  c5fb110402           vmovsd [rdx+rax*1],xmm0
0x27c1a0753bd7   117  e90dffffff           jmp 0x27c1a0753ae9  <+0x29>
0x27c1a0753bdc   11c  33c0                 xorl rax,rax
0x27c1a0753bde   11e  85c0                 testl rax,rax
0x27c1a0753be0   120  0f8400000000         jz 0x27c1a0753be6  <+0x126>
0x27c1a0753be6   126  e895b4ffff           call 0x27c1a074f080  (jump table)    ;; wasm stub: ThrowWasmTrapUnreachable
0x27c1a0753beb   12b  e8a0b4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753bf0   130  e89bb4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753bf5   135  e896b4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753bfa   13a  e891b4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753bff   13f  e88cb4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753c04   144  e887b4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753c09   149  e882b4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753c0e   14e  e87db4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753c13   153  e878b4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753c18   158  e873b4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753c1d   15d  e86eb4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753c22   162  e869b4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753c27   167  e864b4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753c2c   16c  e85fb4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753c31   171  e85ab4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753c36   176  e855b4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753c3b   17b  e850b4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753c40   180  e84bb4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753c45   185  e846b4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753c4a   18a  e841b4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753c4f   18f  e83cb4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753c54   194  e837b4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753c59   199  e832b4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753c5e   19e  e82db4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753c63   1a3  e828b4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753c68   1a8  e823b4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753c6d   1ad  e81eb4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753c72   1b2  e819b4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753c77   1b7  e814b4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753c7c   1bc  e80fb4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753c81   1c1  e80ab4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753c86   1c6  e805b4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753c8b   1cb  e800b4ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753c90   1d0  e8fbb3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753c95   1d5  e8f6b3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753c9a   1da  e8f1b3ffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0753c9f   1df  90                   nop
0x27c1a0753ca0   1e0  27c1a0753aee       jump table entry   46    ;; internal reference
0x27c1a0753ca8   1e8  27c1a0753b85       jump table entry  197    ;; internal reference
0x27c1a0753cb0   1f0  27c1a0753ba1       jump table entry  225    ;; internal reference
0x27c1a0753cb8   1f8  27c1a0753b65       jump table entry  165    ;; internal reference
0x27c1a0753cc0   200  27c1a0753b85       jump table entry  197    ;; internal reference
0x27c1a0753cc8   208  27c1a0753ba1       jump table entry  225    ;; internal reference
0x27c1a0753cd0   210  27c1a0753b03       jump table entry   67    ;; internal reference
0x27c1a0753cd8   218  27c1a0753b1d       jump table entry   93    ;; internal reference
0x27c1a0753ce0   220  27c1a0753b34       jump table entry  116    ;; internal reference
0x27c1a0753ce8   228  27c1a0753b4e       jump table entry  142    ;; internal reference
0x27c1a0753cf0   230  27c1a0753b65       jump table entry  165    ;; internal reference
0x27c1a0753cf8   238  27c1a0753ba1       jump table entry  225    ;; internal reference
0x27c1a0753d00   240  27c1a0753b65       jump table entry  165    ;; internal reference
0x27c1a0753d08   248  27c1a0753b65       jump table entry  165    ;; internal reference
0x27c1a0753d10   250  27c1a0753b85       jump table entry  197    ;; internal reference
0x27c1a0753d18   258  27c1a0753ba1       jump table entry  225    ;; internal reference
0x27c1a0753d20   260  27c1a0753bba       jump table entry  250    ;; internal reference
0x27c1a0753d28   268  27c1a0753bdc       jump table entry  284    ;; internal reference

Protected instructions:
 pc offset  land pad
       112       12b
       10d       130
       10a       135
        fe       13a
        f1       13f
        ee       144
        eb       149
        e5       14e
        d8       153
        d2       158
        cf       15d
        c9       162
        bc       167
        b6       16c
        b3       171
        a7       176
        9f       17b
        9b       180
        98       185
        92       18a
        88       18f
        81       194
        7e       199
        78       19e
        6e       1a3
        6a       1a8
        67       1ad
        61       1b2
        57       1b7
        50       1bc
        4d       1c1
        47       1c6
        3e       1cb
        3b       1d0
        38       1d5
        32       1da

Source positions:
 pc offset  position
        32        54
        38        62
        3b        69
        3e        72
        47        81
        4d        89
        50        96
        57        99
        61       108
        67       116
        6a       123
        6e       126
        78       135
        7e       143
        81       150
        88       153
        92       162
        98       170
        9b       177
        9f       180
        a7       286
        b3       300
        b6       307
        bc       310
        c9       232
        cf       240
        d2       247
        d8       250
        e5       259
        eb       267
        ee       274
        f1       277
        fe       189
       10a       203
       10d       210
       112       213
       126       224
       12b       213
       130       210
       135       203
       13a       189
       13f       277
       144       274
       149       267
       14e       259
       153       250
       158       247
       15d       240
       162       232
       167       310
       16c       307
       171       300
       176       286
       17b       180
       180       177
       185       170
       18a       162
       18f       153
       194       150
       199       143
       19e       135
       1a3       126
       1a8       123
       1ad       116
       1b2       108
       1b7        99
       1bc        96
       1c1        89
       1c6        81
       1cb        72
       1d0        69
       1d5        62
       1da        54

Safepoints (entries = 1, byte size = 11)
0x27c1a0753beb    12b  slots (sp->fp): 00000000

RelocInfo (size = 75)
0x27c1a0753be7  wasm stub call
0x27c1a0753bec  wasm stub call
0x27c1a0753bf1  wasm stub call
0x27c1a0753bf6  wasm stub call
0x27c1a0753bfb  wasm stub call
0x27c1a0753c00  wasm stub call
0x27c1a0753c05  wasm stub call
0x27c1a0753c0a  wasm stub call
0x27c1a0753c0f  wasm stub call
0x27c1a0753c14  wasm stub call
0x27c1a0753c19  wasm stub call
0x27c1a0753c1e  wasm stub call
0x27c1a0753c23  wasm stub call
0x27c1a0753c28  wasm stub call
0x27c1a0753c2d  wasm stub call
0x27c1a0753c32  wasm stub call
0x27c1a0753c37  wasm stub call
0x27c1a0753c3c  wasm stub call
0x27c1a0753c41  wasm stub call
0x27c1a0753c46  wasm stub call
0x27c1a0753c4b  wasm stub call
0x27c1a0753c50  wasm stub call
0x27c1a0753c55  wasm stub call
0x27c1a0753c5a  wasm stub call
0x27c1a0753c5f  wasm stub call
0x27c1a0753c64  wasm stub call
0x27c1a0753c69  wasm stub call
0x27c1a0753c6e  wasm stub call
0x27c1a0753c73  wasm stub call
0x27c1a0753c78  wasm stub call
0x27c1a0753c7d  wasm stub call
0x27c1a0753c82  wasm stub call
0x27c1a0753c87  wasm stub call
0x27c1a0753c8c  wasm stub call
0x27c1a0753c91  wasm stub call
0x27c1a0753c96  wasm stub call
0x27c1a0753c9b  wasm stub call
0x27c1a0753ca0  internal reference
0x27c1a0753ca8  internal reference
0x27c1a0753cb0  internal reference
0x27c1a0753cb8  internal reference
0x27c1a0753cc0  internal reference
0x27c1a0753cc8  internal reference
0x27c1a0753cd0  internal reference
0x27c1a0753cd8  internal reference
0x27c1a0753ce0  internal reference
0x27c1a0753ce8  internal reference
0x27c1a0753cf0  internal reference
0x27c1a0753cf8  internal reference
0x27c1a0753d00  internal reference
0x27c1a0753d08  internal reference
0x27c1a0753d10  internal reference
0x27c1a0753d18  internal reference
0x27c1a0753d20  internal reference
0x27c1a0753d28  internal reference

--- End code ---
--- WebAssembly code ---
name: wasm-function[14]
index: 14
kind: wasm function
compiler: TurboFan
Body (size = 384 = 372 + 12 padding)
Instructions (size = 360)
0x27c1a0753d40     0  55                   push rbp
0x27c1a0753d41     1  4889e5               REX.W movq rbp,rsp
0x27c1a0753d44     4  6a08                 push 0x8
0x27c1a0753d46     6  56                   push rsi
0x27c1a0753d47     7  4883ec40             REX.W subq rsp,0x40
0x27c1a0753d4b     b  488b7e2f             REX.W movq rdi,[rsi+0x2f]
0x27c1a0753d4f     f  488945d8             REX.W movq [rbp-0x28],rax
0x27c1a0753d53    13  48897dc8             REX.W movq [rbp-0x38],rdi
0x27c1a0753d57    17  483b27               REX.W cmpq rsp,[rdi]
0x27c1a0753d5a    1a  0f8604010000         jna 0x27c1a0753e64  <+0x124>
0x27c1a0753d60    20  4c8b464f             REX.W movq r8,[rsi+0x4f]
0x27c1a0753d64    24  49c1e818             REX.W shrq r8, 24
0x27c1a0753d68    28  4d03c6               REX.W addq r8,r14
0x27c1a0753d6b    2b  458b18               movl r11,[r8]
0x27c1a0753d6e    2e  4181eb00010000       subl r11,0x100
0x27c1a0753d75    35  458918               movl [r8],r11
0x27c1a0753d78    38  4c8945e8             REX.W movq [rbp-0x18],r8
0x27c1a0753d7c    3c  4c895de0             REX.W movq [rbp-0x20],r11
0x27c1a0753d80    40  3bcb                 cmpl rcx,rbx
0x27c1a0753d82    42  0f8ec9000000         jle 0x27c1a0753e51  <+0x111>
0x27c1a0753d88    48  41f7c100200100       testl r9,0x12000
0x27c1a0753d8f    4f  0f85bc000000         jnz 0x27c1a0753e51  <+0x111>
0x27c1a0753d95    55  2bcb                 subl rcx,rbx
0x27c1a0753d97    57  33db                 xorl rbx,rbx
0x27c1a0753d99    59  81f900010000         cmpl rcx,0x100
0x27c1a0753d9f    5f  0f92c3               setcl bl
0x27c1a0753da2    62  41bc00010000         movl r12,0x100
0x27c1a0753da8    68  85db                 testl rbx,rbx
0x27c1a0753daa    6a  440f45e1             cmovnzl r12,rcx
0x27c1a0753dae    6e  0fb6d2               movzxbl rdx,rdx
0x27c1a0753db1    71  48894dd0             REX.W movq [rbp-0x30],rcx
0x27c1a0753db5    75  41b900010000         movl r9,0x100
0x27c1a0753dbb    7b  48895dc0             REX.W movq [rbp-0x40],rbx
0x27c1a0753dbf    7f  418bc3               movl rax,r11
0x27c1a0753dc2    82  4489e1               movl rcx,r12
0x27c1a0753dc5    85  e84fb2ffff           call 0x27c1a074f019  (jump table)    ;; internal wasm call
0x27c1a0753dca    8a  837dc000             cmpl [rbp-0x40],0x0
0x27c1a0753dce    8e  0f8563000000         jnz 0x27c1a0753e37  <+0xf7>
0x27c1a0753dd4    94  660f1f840000000000   nop
0x27c1a0753ddd    9d  660f1f840000000000   nop
0x27c1a0753de6    a6  660f1f840000000000   nop
0x27c1a0753def    af  660f1f840000000000   nop
0x27c1a0753df8    b8  0f1f840000000000     nop
0x27c1a0753e00    c0  8b4dd0               movl rcx,[rbp-0x30]
0x27c1a0753e03    c3  488b5dc8             REX.W movq rbx,[rbp-0x38]
0x27c1a0753e07    c7  483b23               REX.W cmpq rsp,[rbx]
0x27c1a0753e0a    ca  0f8686000000         jna 0x27c1a0753e96  <+0x156>
0x27c1a0753e10    d0  81e900010000         subl rcx,0x100
0x27c1a0753e16    d6  48894dd0             REX.W movq [rbp-0x30],rcx
0x27c1a0753e1a    da  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a0753e1e    de  8b45d8               movl rax,[rbp-0x28]
0x27c1a0753e21    e1  8b55e0               movl rdx,[rbp-0x20]
0x27c1a0753e24    e4  b900010000           movl rcx,0x100
0x27c1a0753e29    e9  e8ffb1ffff           call 0x27c1a074f02d  (jump table)    ;; internal wasm call
0x27c1a0753e2e    ee  817dd0ff000000       cmpl [rbp-0x30],0xff
0x27c1a0753e35    f5  77c9                 ja 0x27c1a0753e00  <+0xc0>
0x27c1a0753e37    f7  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a0753e3b    fb  8b45d8               movl rax,[rbp-0x28]
0x27c1a0753e3e    fe  8b55e0               movl rdx,[rbp-0x20]
0x27c1a0753e41   101  8b4dd0               movl rcx,[rbp-0x30]
0x27c1a0753e44   104  e8e4b1ffff           call 0x27c1a074f02d  (jump table)    ;; internal wasm call
0x27c1a0753e49   109  4c8b45e8             REX.W movq r8,[rbp-0x18]
0x27c1a0753e4d   10d  448b5de0             movl r11,[rbp-0x20]
0x27c1a0753e51   111  418bdb               movl rbx,r11
0x27c1a0753e54   114  81c300010000         addl rbx,0x100
0x27c1a0753e5a   11a  498bf8               REX.W movq rdi,r8
0x27c1a0753e5d   11d  891f                 movl [rdi],rbx
0x27c1a0753e5f   11f  488be5               REX.W movq rsp,rbp
0x27c1a0753e62   122  5d                   pop rbp
0x27c1a0753e63   123  c3                   retl
0x27c1a0753e64   124  488955b8             REX.W movq [rbp-0x48],rdx
0x27c1a0753e68   128  48894dd0             REX.W movq [rbp-0x30],rcx
0x27c1a0753e6c   12c  48895dc0             REX.W movq [rbp-0x40],rbx
0x27c1a0753e70   130  4c894db0             REX.W movq [rbp-0x50],r9
0x27c1a0753e74   134  e897b4ffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a0753e79   139  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a0753e7d   13d  8b45d8               movl rax,[rbp-0x28]
0x27c1a0753e80   140  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x27c1a0753e84   144  8b55b8               movl rdx,[rbp-0x48]
0x27c1a0753e87   147  8b4dd0               movl rcx,[rbp-0x30]
0x27c1a0753e8a   14a  8b5dc0               movl rbx,[rbp-0x40]
0x27c1a0753e8d   14d  448b4db0             movl r9,[rbp-0x50]
0x27c1a0753e91   151  e9cafeffff           jmp 0x27c1a0753d60  <+0x20>
0x27c1a0753e96   156  48894dd0             REX.W movq [rbp-0x30],rcx
0x27c1a0753e9a   15a  e871b4ffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a0753e9f   15f  8b4dd0               movl rcx,[rbp-0x30]
0x27c1a0753ea2   162  e969ffffff           jmp 0x27c1a0753e10  <+0xd0>
0x27c1a0753ea7   167  90                   nop

Source positions:
 pc offset  position
        71        58
        d6        74
        f7        98
       124         0
       156        65

Safepoints (entries = 1, byte size = 11)
0x27c1a0753dca     8a  slots (sp->fp): 0000000000000000

RelocInfo (size = 12)
0x27c1a0753dc6  internal wasm call
0x27c1a0753e2a  internal wasm call
0x27c1a0753e45  internal wasm call
0x27c1a0753e75  wasm stub call
0x27c1a0753e9b  wasm stub call

--- End code ---
--- WebAssembly code ---
name: wasm-function[4]
index: 4
kind: wasm function
compiler: TurboFan
Body (size = 1024 = 972 + 52 padding)
Instructions (size = 952)
0x27c1a0753ec0     0  55                   push rbp
0x27c1a0753ec1     1  4889e5               REX.W movq rbp,rsp
0x27c1a0753ec4     4  6a08                 push 0x8
0x27c1a0753ec6     6  56                   push rsi
0x27c1a0753ec7     7  4883ec70             REX.W subq rsp,0x70
0x27c1a0753ecb     b  488b7e2f             REX.W movq rdi,[rsi+0x2f]
0x27c1a0753ecf     f  48894dd8             REX.W movq [rbp-0x28],rcx
0x27c1a0753ed3    13  48897d80             REX.W movq [rbp-0x80],rdi
0x27c1a0753ed7    17  483b27               REX.W cmpq rsp,[rdi]
0x27c1a0753eda    1a  0f86d1020000         jna 0x27c1a07541b1  <+0x2f1>
0x27c1a0753ee0    20  448bc0               movl r8,rax
0x27c1a0753ee3    23  4c8b4e1f             REX.W movq r9,[rsi+0x1f]
0x27c1a0753ee7    27  49c1e918             REX.W shrq r9, 24
0x27c1a0753eeb    2b  4d03ce               REX.W addq r9,r14
0x27c1a0753eee    2e  4c8b5e4f             REX.W movq r11,[rsi+0x4f]
0x27c1a0753ef2    32  49c1eb18             REX.W shrq r11, 24
0x27c1a0753ef6    36  4d03de               REX.W addq r11,r14
0x27c1a0753ef9    39  458b23               movl r12,[r11]
0x27c1a0753efc    3c  4183ec20             subl r12,0x20
0x27c1a0753f00    40  458923               movl [r11],r12
0x27c1a0753f03    43  478b7c011c           movl r15,[r9+r8*1+0x1c]
0x27c1a0753f08    48  47897c0c10           movl [r12+r9*1+0x10],r15
0x27c1a0753f0d    4d  438b440114           movl rax,[r9+r8*1+0x14]
0x27c1a0753f12    52  412bc7               subl rax,r15
0x27c1a0753f15    55  448b7e0b             movl r15,[rsi+0xb]
0x27c1a0753f19    59  4d03fe               REX.W addq r15,r14
0x27c1a0753f1c    5c  8b5e17               movl rbx,[rsi+0x17]
0x27c1a0753f1f    5f  4903de               REX.W addq rbx,r14
0x27c1a0753f22    62  418d74240c           leal rsi,[r12+0xc]
0x27c1a0753f27    67  43894c0c1c           movl [r12+r9*1+0x1c],rcx
0x27c1a0753f2c    6c  4389540c18           movl [r12+r9*1+0x18],rdx
0x27c1a0753f31    71  4389440c14           movl [r12+r9*1+0x14],rax
0x27c1a0753f36    76  438b54013c           movl rdx,[r9+r8*1+0x3c]
0x27c1a0753f3b    7b  418b7f07             movl rdi,[r15+0x7]
0x27c1a0753f3f    7f  4903fe               REX.W addq rdi,r14
0x27c1a0753f42    82  48897da8             REX.W movq [rbp-0x58],rdi
0x27c1a0753f46    86  488b7b07             REX.W movq rdi,[rbx+0x7]
0x27c1a0753f4a    8a  48897db0             REX.W movq [rbp-0x50],rdi
0x27c1a0753f4e    8e  418d7c2410           leal rdi,[r12+0x10]
0x27c1a0753f53    93  4c8945d0             REX.W movq [rbp-0x30],r8
0x27c1a0753f57    97  4c894dc8             REX.W movq [rbp-0x38],r9
0x27c1a0753f5b    9b  4c895de8             REX.W movq [rbp-0x18],r11
0x27c1a0753f5f    9f  4c8965e0             REX.W movq [rbp-0x20],r12
0x27c1a0753f63    a3  488945c0             REX.W movq [rbp-0x40],rax
0x27c1a0753f67    a7  4c897d88             REX.W movq [rbp-0x78],r15
0x27c1a0753f6b    ab  48895d90             REX.W movq [rbp-0x70],rbx
0x27c1a0753f6f    af  48897598             REX.W movq [rbp-0x68],rsi
0x27c1a0753f73    b3  48897db8             REX.W movq [rbp-0x48],rdi
0x27c1a0753f77    b7  8bde                 movl rbx,rsi
0x27c1a0753f79    b9  488b75a8             REX.W movq rsi,[rbp-0x58]
0x27c1a0753f7d    bd  8bc2                 movl rax,rdx
0x27c1a0753f7f    bf  8bd7                 movl rdx,rdi
0x27c1a0753f81    c1  b902000000           movl rcx,0x2
0x27c1a0753f86    c6  4c8b45b0             REX.W movq r8,[rbp-0x50]
0x27c1a0753f8a    ca  41ffd0               call r8
0x27c1a0753f8d    cd  85c0                 testl rax,rax
0x27c1a0753f8f    cf  0f8508000000         jnz 0x27c1a0753f9d  <+0xdd>
0x27c1a0753f95    d5  4533c0               xorl r8,r8
0x27c1a0753f98    d8  e910000000           jmp 0x27c1a0753fad  <+0xed>
0x27c1a0753f9d    dd  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x27c1a0753fa1    e1  8987c40a0000         movl [rdi+0xac4],rax
0x27c1a0753fa7    e7  41b8ffffffff         movl r8,0xffffffff
0x27c1a0753fad    ed  448b4dc0             movl r9,[rbp-0x40]
0x27c1a0753fb1    f1  8b4dd8               movl rcx,[rbp-0x28]
0x27c1a0753fb4    f4  4403c9               addl r9,rcx
0x27c1a0753fb7    f7  33ff                 xorl rdi,rdi
0x27c1a0753fb9    f9  4585c0               testl r8,r8
0x27c1a0753fbc    fc  0f8559010000         jnz 0x27c1a075411b  <+0x25b>
0x27c1a0753fc2   102  448b45b8             movl r8,[rbp-0x48]
0x27c1a0753fc6   106  48c745c002000000     REX.W movq [rbp-0x40],0x2
0x27c1a0753fce   10e  458bd9               movl r11,r9
0x27c1a0753fd1   111  e92e000000           jmp 0x27c1a0754004  <+0x144>
0x27c1a0753fd6   116  660f1f840000000000   nop
0x27c1a0753fdf   11f  660f1f840000000000   nop
0x27c1a0753fe8   128  660f1f840000000000   nop
0x27c1a0753ff1   131  660f1f840000000000   nop
0x27c1a0753ffa   13a  660f1f440000         nop
0x27c1a0754000   140  448b45b0             movl r8,[rbp-0x50]
0x27c1a0754004   144  448b7de0             movl r15,[rbp-0x20]
0x27c1a0754008   148  488b5dd0             REX.W movq rbx,[rbp-0x30]
0x27c1a075400c   14c  488b7590             REX.W movq rsi,[rbp-0x70]
0x27c1a0754010   150  488b5588             REX.W movq rdx,[rbp-0x78]
0x27c1a0754014   154  b80c000000           movl rax,0xc
0x27c1a0754019   159  4c8b6580             REX.W movq r12,[rbp-0x80]
0x27c1a075401d   15d  493b2424             REX.W cmpq rsp,[r12]
0x27c1a0754021   161  0f86a9010000         jna 0x27c1a07541d0  <+0x310>
0x27c1a0754027   167  4c8b4dc8             REX.W movq r9,[rbp-0x38]
0x27c1a075402b   16b  478b64390c           movl r12,[r9+r15*1+0xc]
0x27c1a0754030   170  4c8965a0             REX.W movq [rbp-0x60],r12
0x27c1a0754034   174  4539e3               cmpl r11,r12
0x27c1a0754037   177  0f84d6000000         jz 0x27c1a0754113  <+0x253>
0x27c1a075403d   17d  4585e4               testl r12,r12
0x27c1a0754040   180  0f8cbc000000         jl 0x27c1a0754102  <+0x242>
0x27c1a0754046   186  4c895da8             REX.W movq [rbp-0x58],r11
0x27c1a075404a   18a  478b5c0104           movl r11,[r9+r8*1+0x4]
0x27c1a075404f   18f  4533ff               xorl r15,r15
0x27c1a0754052   192  4539e3               cmpl r11,r12
0x27c1a0754055   195  410f92c7             setcl r15l
0x27c1a0754059   199  478d24f8             leal r12,[r8+r15*8]
0x27c1a075405d   19d  33c9                 xorl rcx,rcx
0x27c1a075405f   19f  4585ff               testl r15,r15
0x27c1a0754062   1a2  410f45cb             cmovnzl rcx,r11
0x27c1a0754066   1a6  478b1c21             movl r11,[r9+r12*1]
0x27c1a075406a   1aa  8b7da0               movl rdi,[rbp-0x60]
0x27c1a075406d   1ad  2bf9                 subl rdi,rcx
0x27c1a075406f   1af  b904000000           movl rcx,0x4
0x27c1a0754074   1b4  4585ff               testl r15,r15
0x27c1a0754077   1b7  0f45c8               cmovnzl rcx,rax
0x27c1a075407a   1ba  4403df               addl r11,rdi
0x27c1a075407d   1bd  4403c1               addl r8,rcx
0x27c1a0754080   1c0  47891c21             movl [r9+r12*1],r11
0x27c1a0754084   1c4  478b1c01             movl r11,[r9+r8*1]
0x27c1a0754088   1c8  442bdf               subl r11,rdi
0x27c1a075408b   1cb  47891c01             movl [r9+r8*1],r11
0x27c1a075408f   1cf  418b7c193c           movl rdi,[r9+rbx*1+0x3c]
0x27c1a0754094   1d4  448b4207             movl r8,[rdx+0x7]
0x27c1a0754098   1d8  4d03c6               REX.W addq r8,r14
0x27c1a075409b   1db  4c8b5e07             REX.W movq r11,[rsi+0x7]
0x27c1a075409f   1df  8b4dc0               movl rcx,[rbp-0x40]
0x27c1a07540a2   1e2  412bcf               subl rcx,r15
0x27c1a07540a5   1e5  4c8965b0             REX.W movq [rbp-0x50],r12
0x27c1a07540a9   1e9  48894dc0             REX.W movq [rbp-0x40],rcx
0x27c1a07540ad   1ed  498bf0               REX.W movq rsi,r8
0x27c1a07540b0   1f0  8bc7                 movl rax,rdi
0x27c1a07540b2   1f2  4489e2               movl rdx,r12
0x27c1a07540b5   1f5  8b5d98               movl rbx,[rbp-0x68]
0x27c1a07540b8   1f8  41ffd3               call r11
0x27c1a07540bb   1fb  85c0                 testl rax,rax
0x27c1a07540bd   1fd  0f850c000000         jnz 0x27c1a07540cf  <+0x20f>
0x27c1a07540c3   203  4533c0               xorl r8,r8
0x27c1a07540c6   206  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x27c1a07540ca   20a  e910000000           jmp 0x27c1a07540df  <+0x21f>
0x27c1a07540cf   20f  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x27c1a07540d3   213  8987c40a0000         movl [rdi+0xac4],rax
0x27c1a07540d9   219  41b8ffffffff         movl r8,0xffffffff
0x27c1a07540df   21f  448b5da8             movl r11,[rbp-0x58]
0x27c1a07540e3   223  442b5da0             subl r11,[rbp-0x60]
0x27c1a07540e7   227  4585c0               testl r8,r8
0x27c1a07540ea   22a  0f8410ffffff         jz 0x27c1a0754000  <+0x140>
0x27c1a07540f0   230  448b45b0             movl r8,[rbp-0x50]
0x27c1a07540f4   234  448b4dc0             movl r9,[rbp-0x40]
0x27c1a07540f8   238  33ff                 xorl rdi,rdi
0x27c1a07540fa   23a  8b4dd8               movl rcx,[rbp-0x28]
0x27c1a07540fd   23d  e926000000           jmp 0x27c1a0754128  <+0x268>
0x27c1a0754102   242  4d8bd9               REX.W movq r11,r9
0x27c1a0754105   245  448b4dc0             movl r9,[rbp-0x40]
0x27c1a0754109   249  8b4dd8               movl rcx,[rbp-0x28]
0x27c1a075410c   24c  33ff                 xorl rdi,rdi
0x27c1a075410e   24e  e923000000           jmp 0x27c1a0754136  <+0x276>
0x27c1a0754113   253  498bf9               REX.W movq rdi,r9
0x27c1a0754116   256  e961000000           jmp 0x27c1a075417c  <+0x2bc>
0x27c1a075411b   25b  448b45b8             movl r8,[rbp-0x48]
0x27c1a075411f   25f  458bd9               movl r11,r9
0x27c1a0754122   262  41b902000000         movl r9,0x2
0x27c1a0754128   268  4183fbff             cmpl r11,0xff
0x27c1a075412c   26c  0f843e000000         jz 0x27c1a0754170  <+0x2b0>
0x27c1a0754132   272  4c8b5dc8             REX.W movq r11,[rbp-0x38]
0x27c1a0754136   276  4c8b65d0             REX.W movq r12,[rbp-0x30]
0x27c1a075413a   27a  43c7441c1c00000000   movl [r12+r11*1+0x1c],0x0
0x27c1a0754143   283  4bc7441c1000000000   REX.W movq [r12+r11*1+0x10],0x0
0x27c1a075414c   28c  478b3c23             movl r15,[r11+r12*1]
0x27c1a0754150   290  4183cf20             orl r15,0x20
0x27c1a0754154   294  47893c23             movl [r11+r12*1],r15
0x27c1a0754158   298  4183f902             cmpl r9,0x2
0x27c1a075415c   29c  0f8439000000         jz 0x27c1a075419b  <+0x2db>
0x27c1a0754162   2a2  438b7c0304           movl rdi,[r11+r8*1+0x4]
0x27c1a0754167   2a7  2bcf                 subl rcx,rdi
0x27c1a0754169   2a9  8bf9                 movl rdi,rcx
0x27c1a075416b   2ab  e92b000000           jmp 0x27c1a075419b  <+0x2db>
0x27c1a0754170   2b0  448b7de0             movl r15,[rbp-0x20]
0x27c1a0754174   2b4  488b5dd0             REX.W movq rbx,[rbp-0x30]
0x27c1a0754178   2b8  488b7dc8             REX.W movq rdi,[rbp-0x38]
0x27c1a075417c   2bc  448b441f2c           movl r8,[rdi+rbx*1+0x2c]
0x27c1a0754181   2c1  4489443b1c           movl [rbx+rdi*1+0x1c],r8
0x27c1a0754186   2c6  4489443b14           movl [rbx+rdi*1+0x14],r8
0x27c1a075418b   2cb  448b4c1f30           movl r9,[rdi+rbx*1+0x30]
0x27c1a0754190   2d0  4503c1               addl r8,r9
0x27c1a0754193   2d3  4489443b10           movl [rbx+rdi*1+0x10],r8
0x27c1a0754198   2d8  8b7dd8               movl rdi,[rbp-0x28]
0x27c1a075419b   2db  448b45e0             movl r8,[rbp-0x20]
0x27c1a075419f   2df  4183c020             addl r8,0x20
0x27c1a07541a3   2e3  4c8b4de8             REX.W movq r9,[rbp-0x18]
0x27c1a07541a7   2e7  458901               movl [r9],r8
0x27c1a07541aa   2ea  8bc7                 movl rax,rdi
0x27c1a07541ac   2ec  488be5               REX.W movq rsp,rbp
0x27c1a07541af   2ef  5d                   pop rbp
0x27c1a07541b0   2f0  c3                   retl
0x27c1a07541b1   2f1  488955b8             REX.W movq [rbp-0x48],rdx
0x27c1a07541b5   2f5  488945e8             REX.W movq [rbp-0x18],rax
0x27c1a07541b9   2f9  e852b1ffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a07541be   2fe  8b4dd8               movl rcx,[rbp-0x28]
0x27c1a07541c1   301  8b55b8               movl rdx,[rbp-0x48]
0x27c1a07541c4   304  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a07541c8   308  8b45e8               movl rax,[rbp-0x18]
0x27c1a07541cb   30b  e910fdffff           jmp 0x27c1a0753ee0  <+0x20>
0x27c1a07541d0   310  4c8945b8             REX.W movq [rbp-0x48],r8
0x27c1a07541d4   314  4c895da8             REX.W movq [rbp-0x58],r11
0x27c1a07541d8   318  e833b1ffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a07541dd   31d  448b7de0             movl r15,[rbp-0x20]
0x27c1a07541e1   321  488b5dd0             REX.W movq rbx,[rbp-0x30]
0x27c1a07541e5   325  b80c000000           movl rax,0xc
0x27c1a07541ea   32a  448b45b8             movl r8,[rbp-0x48]
0x27c1a07541ee   32e  448b5da8             movl r11,[rbp-0x58]
0x27c1a07541f2   332  488b7590             REX.W movq rsi,[rbp-0x70]
0x27c1a07541f6   336  488b5588             REX.W movq rdx,[rbp-0x78]
0x27c1a07541fa   33a  e928feffff           jmp 0x27c1a0754027  <+0x167>
0x27c1a07541ff   33f  e88caeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0754204   344  e887aeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0754209   349  e882aeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075420e   34e  e87daeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0754213   353  e878aeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0754218   358  e873aeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075421d   35d  e86eaeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0754222   362  e869aeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0754227   367  e864aeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075422c   36c  e85faeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0754231   371  e85aaeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0754236   376  e855aeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075423b   37b  e850aeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0754240   380  e84baeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0754245   385  e846aeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075424a   38a  e841aeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075424f   38f  e83caeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0754254   394  e837aeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0754259   399  e832aeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075425e   39e  e82daeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0754263   3a3  e828aeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0754268   3a8  e823aeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075426d   3ad  e81eaeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0754272   3b2  e819aeffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0754277   3b7  90                   nop

Protected instructions:
 pc offset  land pad
       2d3       33f
       2cb       344
       2c6       349
       2c1       34e
       2bc       353
       2a2       358
       294       35d
       28c       362
       283       367
       27a       36c
       1cf       371
       1cb       376
       1c4       37b
       1c0       380
       1a6       385
       18a       38a
       16b       38f
        76       394
        71       399
        6c       39e
        67       3a3
        4d       3a8
        48       3ad
        43       3b2

Source positions:
 pc offset  position
        43        16
        48        21
        4d        26
        67        35
        6c        42
        71        54
        76        78
        93        95
       167       130
       186       158
       1a6       186
       1c0       190
       1c4       207
       1cb       213
       1cf       225
       1e5       244
       276       318
       283       325
       28c       332
       294       338
       2a2       355
       2bc       281
       2c1       286
       2c6       293
       2cb       302
       2d3       306
       2f1         0
       310       124
       33f       306
       344       302
       349       293
       34e       286
       353       281
       358       355
       35d       338
       362       332
       367       325
       36c       318
       371       225
       376       213
       37b       207
       380       190
       385       186
       38a       158
       38f       130
       394        78
       399        54
       39e        42
       3a3        35
       3a8        26
       3ad        21
       3b2        16

Safepoints (entries = 4, byte size = 20)
0x27c1a0753f8d     cd  slots (sp->fp): 01100000
0x27c1a07541be    2fe  slots (sp->fp): 00000000
0x27c1a07541dd    31d  slots (sp->fp): 01100000
0x27c1a0754204    344  slots (sp->fp): 00000000

RelocInfo (size = 28)
0x27c1a07541ba  wasm stub call
0x27c1a07541d9  wasm stub call
0x27c1a0754200  wasm stub call
0x27c1a0754205  wasm stub call
0x27c1a075420a  wasm stub call
0x27c1a075420f  wasm stub call
0x27c1a0754214  wasm stub call
0x27c1a0754219  wasm stub call
0x27c1a075421e  wasm stub call
0x27c1a0754223  wasm stub call
0x27c1a0754228  wasm stub call
0x27c1a075422d  wasm stub call
0x27c1a0754232  wasm stub call
0x27c1a0754237  wasm stub call
0x27c1a075423c  wasm stub call
0x27c1a0754241  wasm stub call
0x27c1a0754246  wasm stub call
0x27c1a075424b  wasm stub call
0x27c1a0754250  wasm stub call
0x27c1a0754255  wasm stub call
0x27c1a075425a  wasm stub call
0x27c1a075425f  wasm stub call
0x27c1a0754264  wasm stub call
0x27c1a0754269  wasm stub call
0x27c1a075426e  wasm stub call
0x27c1a0754273  wasm stub call

--- End code ---
array[9998]: 100
--- WebAssembly code ---
name: wasm-function[23]
index: 23
kind: wasm function
compiler: TurboFan
Body (size = 768 = 756 + 12 padding)
Instructions (size = 744)
0x27c1a07542c0     0  55                   push rbp
0x27c1a07542c1     1  4889e5               REX.W movq rbp,rsp
0x27c1a07542c4     4  6a08                 push 0x8
0x27c1a07542c6     6  56                   push rsi
0x27c1a07542c7     7  4883ec28             REX.W subq rsp,0x28
0x27c1a07542cb     b  488b5e2f             REX.W movq rbx,[rsi+0x2f]
0x27c1a07542cf     f  488945d0             REX.W movq [rbp-0x30],rax
0x27c1a07542d3    13  48895dc8             REX.W movq [rbp-0x38],rbx
0x27c1a07542d7    17  483b23               REX.W cmpq rsp,[rbx]
0x27c1a07542da    1a  0f862b020000         jna 0x27c1a075450b  <+0x24b>
0x27c1a07542e0    20  488b7e1f             REX.W movq rdi,[rsi+0x1f]
0x27c1a07542e4    24  48c1ef18             REX.W shrq rdi, 24
0x27c1a07542e8    28  4903fe               REX.W addq rdi,r14
0x27c1a07542eb    2b  48897dd8             REX.W movq [rbp-0x28],rdi
0x27c1a07542ef    2f  85c0                 testl rax,rax
0x27c1a07542f1    31  0f85d9000000         jnz 0x27c1a07543d0  <+0x110>
0x27c1a07542f7    37  83bfa006000000       cmpl [rdi+0x6a0],0x0
0x27c1a07542fe    3e  0f850a000000         jnz 0x27c1a075430e  <+0x4e>
0x27c1a0754304    44  33c0                 xorl rax,rax
0x27c1a0754306    46  488bc8               REX.W movq rcx,rax
0x27c1a0754309    49  e917000000           jmp 0x27c1a0754325  <+0x65>
0x27c1a075430e    4e  8b87a0060000         movl rax,[rdi+0x6a0]
0x27c1a0754314    54  e854adffff           call 0x27c1a074f06d  (jump table)    ;; internal wasm call
0x27c1a0754319    59  488b5dc8             REX.W movq rbx,[rbp-0x38]
0x27c1a075431d    5d  488b7dd8             REX.W movq rdi,[rbp-0x28]
0x27c1a0754321    61  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a0754325    65  488945e8             REX.W movq [rbp-0x18],rax
0x27c1a0754329    69  83bfc00a000000       cmpl [rdi+0xac0],0x0
0x27c1a0754330    70  0f841e000000         jz 0x27c1a0754354  <+0x94>
0x27c1a0754336    76  448b87c00a0000       movl r8,[rdi+0xac0]
0x27c1a075433d    7d  418bc0               movl rax,r8
0x27c1a0754340    80  e828adffff           call 0x27c1a074f06d  (jump table)    ;; internal wasm call
0x27c1a0754345    85  0b45e8               orl rax,[rbp-0x18]
0x27c1a0754348    88  488b5dc8             REX.W movq rbx,[rbp-0x38]
0x27c1a075434c    8c  488b7dd8             REX.W movq rdi,[rbp-0x28]
0x27c1a0754350    90  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a0754354    94  448b87bc0a0000       movl r8,[rdi+0xabc]
0x27c1a075435b    9b  4585c0               testl r8,r8
0x27c1a075435e    9e  0f851c000000         jnz 0x27c1a0754380  <+0xc0>
0x27c1a0754364    a4  488be5               REX.W movq rsp,rbp
0x27c1a0754367    a7  5d                   pop rbp
0x27c1a0754368    a8  c3                   retl
0x27c1a0754369    a9  660f1f840000000000   nop
0x27c1a0754372    b2  660f1f840000000000   nop
0x27c1a075437b    bb  0f1f440000           nop
0x27c1a0754380    c0  483b23               REX.W cmpq rsp,[rbx]
0x27c1a0754383    c3  0f8697010000         jna 0x27c1a0754520  <+0x260>
0x27c1a0754389    c9  468b4c074c           movl r9,[rdi+r8*1+0x4c]
0x27c1a075438e    ce  468b4c0714           movl r9,[rdi+r8*1+0x14]
0x27c1a0754393    d3  468b5c071c           movl r11,[rdi+r8*1+0x1c]
0x27c1a0754398    d8  453bcb               cmpl r9,r11
0x27c1a075439b    db  0f8423000000         jz 0x27c1a07543c4  <+0x104>
0x27c1a07543a1    e1  488945e8             REX.W movq [rbp-0x18],rax
0x27c1a07543a5    e5  4c8945e0             REX.W movq [rbp-0x20],r8
0x27c1a07543a9    e9  418bc0               movl rax,r8
0x27c1a07543ac    ec  e8bcacffff           call 0x27c1a074f06d  (jump table)    ;; internal wasm call
0x27c1a07543b1    f1  0b45e8               orl rax,[rbp-0x18]
0x27c1a07543b4    f4  488b5dc8             REX.W movq rbx,[rbp-0x38]
0x27c1a07543b8    f8  488b7dd8             REX.W movq rdi,[rbp-0x28]
0x27c1a07543bc    fc  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a07543c0   100  448b45e0             movl r8,[rbp-0x20]
0x27c1a07543c4   104  468b440738           movl r8,[rdi+r8*1+0x38]
0x27c1a07543c9   109  4585c0               testl r8,r8
0x27c1a07543cc   10c  75b2                 jnz 0x27c1a0754380  <+0xc0>
0x27c1a07543ce   10e  eb94                 jmp 0x27c1a0754364  <+0xa4>
0x27c1a07543d0   110  8bd8                 movl rbx,rax
0x27c1a07543d2   112  448b441f4c           movl r8,[rdi+rbx*1+0x4c]
0x27c1a07543d7   117  448b4c1f14           movl r9,[rdi+rbx*1+0x14]
0x27c1a07543dc   11c  448b5c1f1c           movl r11,[rdi+rbx*1+0x1c]
0x27c1a07543e1   121  48895de0             REX.W movq [rbp-0x20],rbx
0x27c1a07543e5   125  4c8945e8             REX.W movq [rbp-0x18],r8
0x27c1a07543e9   129  453bcb               cmpl r9,r11
0x27c1a07543ec   12c  0f846e000000         jz 0x27c1a0754460  <+0x1a0>
0x27c1a07543f2   132  4c8bce               REX.W movq r9,rsi
0x27c1a07543f5   135  4d8b5937             REX.W movq r11,[r9+0x37]
0x27c1a07543f9   139  448b641f24           movl r12,[rdi+rbx*1+0x24]
0x27c1a07543fe   13e  4d8b7947             REX.W movq r15,[r9+0x47]
0x27c1a0754402   142  498b513f             REX.W movq rdx,[r9+0x3f]
0x27c1a0754406   146  418b490f             movl rcx,[r9+0xf]
0x27c1a075440a   14a  4903ce               REX.W addq rcx,r14
0x27c1a075440d   14d  428d34a500000000     leal rsi,[r12*4+0x0]
0x27c1a0754415   155  4183fc04             cmpl r12,0x4
0x27c1a0754419   159  0f8358010000         jnc 0x27c1a0754577  <+0x2b7>
0x27c1a075441f   15f  458b3c37             movl r15,[r15+rsi*1]
0x27c1a0754423   163  45393b               cmpl [r11],r15
0x27c1a0754426   166  0f8546010000         jnz 0x27c1a0754572  <+0x2b2>
0x27c1a075442c   16c  428b74a107           movl rsi,[rcx+r12*4+0x7]
0x27c1a0754431   171  4903f6               REX.W addq rsi,r14
0x27c1a0754434   174  4e8b1ce2             REX.W movq r11,[rdx+r12*8]
0x27c1a0754438   178  33c9                 xorl rcx,rcx
0x27c1a075443a   17a  488bd1               REX.W movq rdx,rcx
0x27c1a075443d   17d  41ffd3               call r11
0x27c1a0754440   180  488b5de0             REX.W movq rbx,[rbp-0x20]
0x27c1a0754444   184  488b7dd8             REX.W movq rdi,[rbp-0x28]
0x27c1a0754448   188  448b441f14           movl r8,[rdi+rbx*1+0x14]
0x27c1a075444d   18d  4585c0               testl r8,r8
0x27c1a0754450   190  0f850a000000         jnz 0x27c1a0754460  <+0x1a0>
0x27c1a0754456   196  b8ffffffff           movl rax,0xffffffff
0x27c1a075445b   19b  e904ffffff           jmp 0x27c1a0754364  <+0xa4>
0x27c1a0754460   1a0  448b441f04           movl r8,[rdi+rbx*1+0x4]
0x27c1a0754465   1a5  448b4c1f08           movl r9,[rdi+rbx*1+0x8]
0x27c1a075446a   1aa  453bc1               cmpl r8,r9
0x27c1a075446d   1ad  0f8466000000         jz 0x27c1a07544d9  <+0x219>
0x27c1a0754473   1b3  448b5c1f28           movl r11,[rdi+rbx*1+0x28]
0x27c1a0754478   1b8  4c8b65f0             REX.W movq r12,[rbp-0x10]
0x27c1a075447c   1bc  4d8b7c2447           REX.W movq r15,[r12+0x47]
0x27c1a0754481   1c1  498b44243f           REX.W movq rax,[r12+0x3f]
0x27c1a0754486   1c6  418b54240f           movl rdx,[r12+0xf]
0x27c1a075448b   1cb  4903d6               REX.W addq rdx,r14
0x27c1a075448e   1ce  428d0c9d00000000     leal rcx,[r11*4+0x0]
0x27c1a0754496   1d6  4d8b642437           REX.W movq r12,[r12+0x37]
0x27c1a075449b   1db  4183fb04             cmpl r11,0x4
0x27c1a075449f   1df  0f83b4000000         jnc 0x27c1a0754559  <+0x299>
0x27c1a07544a5   1e5  458b642410           movl r12,[r12+0x10]
0x27c1a07544aa   1ea  4539240f             cmpl [r15+rcx*1],r12
0x27c1a07544ae   1ee  0f85a0000000         jnz 0x27c1a0754554  <+0x294>
0x27c1a07544b4   1f4  428b749a07           movl rsi,[rdx+r11*4+0x7]
0x27c1a07544b9   1f9  4903f6               REX.W addq rsi,r14
0x27c1a07544bc   1fc  452bc1               subl r8,r9
0x27c1a07544bf   1ff  4e8b0cd8             REX.W movq r9,[rax+r11*8]
0x27c1a07544c3   203  4963d0               REX.W movsxlq rdx,r8
0x27c1a07544c6   206  b901000000           movl rcx,0x1
0x27c1a07544cb   20b  8b45d0               movl rax,[rbp-0x30]
0x27c1a07544ce   20e  41ffd1               call r9
0x27c1a07544d1   211  488b5de0             REX.W movq rbx,[rbp-0x20]
0x27c1a07544d5   215  488b7dd8             REX.W movq rdi,[rbp-0x28]
0x27c1a07544d9   219  c7443b1c00000000     movl [rbx+rdi*1+0x1c],0x0
0x27c1a07544e1   221  48c7443b1000000000   REX.W movq [rbx+rdi*1+0x10],0x0
0x27c1a07544ea   22a  48c7443b0400000000   REX.W movq [rbx+rdi*1+0x4],0x0
0x27c1a07544f3   233  837de800             cmpl [rbp-0x18],0x0
0x27c1a07544f7   237  0f8d07000000         jge 0x27c1a0754504  <+0x244>
0x27c1a07544fd   23d  33c0                 xorl rax,rax
0x27c1a07544ff   23f  e960feffff           jmp 0x27c1a0754364  <+0xa4>
0x27c1a0754504   244  33c0                 xorl rax,rax
0x27c1a0754506   246  e959feffff           jmp 0x27c1a0754364  <+0xa4>
0x27c1a075450b   24b  e800aeffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a0754510   250  8b45d0               movl rax,[rbp-0x30]
0x27c1a0754513   253  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a0754517   257  488b5dc8             REX.W movq rbx,[rbp-0x38]
0x27c1a075451b   25b  e9c0fdffff           jmp 0x27c1a07542e0  <+0x20>
0x27c1a0754520   260  488945e8             REX.W movq [rbp-0x18],rax
0x27c1a0754524   264  4c8945e0             REX.W movq [rbp-0x20],r8
0x27c1a0754528   268  e8e3adffff           call 0x27c1a074f310  (jump table)    ;; wasm stub: WasmStackGuard
0x27c1a075452d   26d  488b7dd8             REX.W movq rdi,[rbp-0x28]
0x27c1a0754531   271  488b75f0             REX.W movq rsi,[rbp-0x10]
0x27c1a0754535   275  8b45e8               movl rax,[rbp-0x18]
0x27c1a0754538   278  448b45e0             movl r8,[rbp-0x20]
0x27c1a075453c   27c  488b5dc8             REX.W movq rbx,[rbp-0x38]
0x27c1a0754540   280  e944feffff           jmp 0x27c1a0754389  <+0xc9>
0x27c1a0754545   285  e846abffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075454a   28a  e841abffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075454f   28f  e83cabffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0754554   294  e897abffff           call 0x27c1a074f0f0  (jump table)    ;; wasm stub: ThrowWasmTrapFuncSigMismatch
0x27c1a0754559   299  e8c2abffff           call 0x27c1a074f120  (jump table)    ;; wasm stub: ThrowWasmTrapTableOutOfBounds
0x27c1a075455e   29e  e82dabffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0754563   2a3  e828abffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0754568   2a8  e823abffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075456d   2ad  e81eabffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0754572   2b2  e879abffff           call 0x27c1a074f0f0  (jump table)    ;; wasm stub: ThrowWasmTrapFuncSigMismatch
0x27c1a0754577   2b7  e8a4abffff           call 0x27c1a074f120  (jump table)    ;; wasm stub: ThrowWasmTrapTableOutOfBounds
0x27c1a075457c   2bc  e80fabffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0754581   2c1  e80aabffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0754586   2c6  e805abffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075458b   2cb  e800abffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0754590   2d0  e8fbaaffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a0754595   2d5  e8f6aaffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075459a   2da  e8f1aaffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a075459f   2df  e8ecaaffff           call 0x27c1a074f090  (jump table)    ;; wasm stub: ThrowWasmTrapMemOutOfBounds
0x27c1a07545a4   2e4  90                   nop
0x27c1a07545a5   2e5  0f1f00               nop

Protected instructions:
 pc offset  land pad
       22a       285
       221       28a
       219       28f
       1b3       29e
       1a5       2a3
       1a0       2a8
       188       2ad
       139       2bc
       11c       2c1
       117       2c6
       112       2cb
       104       2d0
        d3       2d5
        ce       2da
        c9       2df

Source positions:
 pc offset  position
        54        22
        7d        41
        c9        63
        ce        69
        d3        74
        e1        82
       104        92
       112       107
       117       121
       11c       126
       139       140
       178       143
       180       149
       1a0       163
       1a5       170
       1b3       190
       206       193
       219       206
       221       213
       22a       220
       24b         0
       260        59
       285       220
       28a       213
       28f       206
       294       193
       29e       190
       2a3       170
       2a8       163
       2ad       149
       2b2       143
       2bc       140
       2c1       126
       2c6       121
       2cb       107
       2d0        92
       2d5        74
       2da        69
       2df        63

Safepoints (entries = 1, byte size = 11)
0x27c1a0754319     59  slots (sp->fp): 0000000000000000

RelocInfo (size = 33)
0x27c1a0754315  internal wasm call
0x27c1a0754341  internal wasm call
0x27c1a07543ad  internal wasm call
0x27c1a075450c  wasm stub call
0x27c1a0754529  wasm stub call
0x27c1a0754546  wasm stub call
0x27c1a075454b  wasm stub call
0x27c1a0754550  wasm stub call
0x27c1a0754555  wasm stub call
0x27c1a075455a  wasm stub call
0x27c1a075455f  wasm stub call
0x27c1a0754564  wasm stub call
0x27c1a0754569  wasm stub call
0x27c1a075456e  wasm stub call
0x27c1a0754573  wasm stub call
0x27c1a0754578  wasm stub call
0x27c1a075457d  wasm stub call
0x27c1a0754582  wasm stub call
0x27c1a0754587  wasm stub call
0x27c1a075458c  wasm stub call
0x27c1a0754591  wasm stub call
0x27c1a0754596  wasm stub call
0x27c1a075459b  wasm stub call
0x27c1a07545a0  wasm stub call

--- End code ---
