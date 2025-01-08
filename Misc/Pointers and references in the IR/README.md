# Pointers and references in the IR

Useful CLI:

```
clang -S -emit-llvm -Xclang -disable-O0-optnone -o PlayXY.ll PlayXY.cpp

llvm-as PlayXY.ll

lli PlayXY.bc
```
