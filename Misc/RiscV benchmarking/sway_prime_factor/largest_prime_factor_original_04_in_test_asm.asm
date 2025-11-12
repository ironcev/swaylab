// test bench_largest_prime_factor_in_test_asm ... ok (66.594µs, 3720 gas)

;; ASM: Final program
;; Program kind: Library
.program:
move $$tmp $pc
jmpf $zero i4
DATA_SECTION_OFFSET[0..32]
DATA_SECTION_OFFSET[32..64]
CONFIGURABLES_OFFSET[0..32]
CONFIGURABLES_OFFSET[32..64]
lw   $$ds $$tmp i1
add  $$ds $$ds $$tmp
cfei i0                       ; allocate stack space for globals
move $$locbase $sp            ; save locals base register for function bench_largest_prime_factor_in_test_asm
cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments
movi $r1 i262142              ; movi r1 i262142
move $r0 $zero                ; move r4 zero
movi $r0 i2                   ; movi r0 i2
mod  $r0 $r1 $r0              ; mod  r0 r1 r0
eq   $r0 $r0 $zero            ; eq   r0 r0 zero
move $r3 $r1                  ; move r3 r1
movi $r2 i3                   ; movi r2 i3
jnzf $r0 $zero i15            ; jnzf r0 zero i15
mul  $r0 $r2 $r2              ; mul  r0 r2 r2
lt   $r1 $r0 $r3              ; lt   r1 r0 r3
jnzf $r1 $zero i1             ; jnzf r1 zero i1
eq   $r1 $r0 $r3              ; eq   r1 r0 r3
jnzf $r1 $zero i1             ; jnzf r1 zero i1
ret  $zero                    ; ret  zero
mod  $r0 $r3 $r2              ; mod  r0 r3 r2
eq   $r0 $r0 $zero            ; eq   r0 r0 zero
jnzf $r0 $zero i3             ; jnzf r0 zero i3
movi $r0 i2                   ; movi r0 i2
add  $r2 $r2 $r0              ; add  r2 r2 r0
jmpb $zero i10                ; jmpb zero i10
div  $r3 $r3 $r2              ; div  r3 r3 r2
move $r0 $r2                  ; move r4 r2
jmpb $zero i7                 ; jmpb zero i7
movi $r0 i2                   ; movi r0 i2
div  $r1 $r1 $r0              ; div  r1 r1 r0
movi $r0 i2                   ; movi r4 i2
jmpb $zero i23                ; jmpb zero i23
move $r0 $zero                ; return unit value from ASM block without return register
ret  $zero                    ; return unit as zero
.data:
