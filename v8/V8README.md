# V8README

## source -> wasm
```
emcc -O3 -msimd128 -s ASSERTIONS -s ENVIRONMENT=shell loop.c -o loop.html
```

## build v8
```
alias gm=/path/to/v8/tools/dev/gm.py
gm x64.release # or 
out/x64.release/d8 loop.js --print-wasm-code
```
