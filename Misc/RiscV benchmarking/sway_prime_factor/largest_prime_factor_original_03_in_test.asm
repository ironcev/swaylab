// test bench_largest_prime_factor_in_test ... ok (85.822µs, 3720 gas)

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
move $$locbase $sp            ; save locals base register for function bench_largest_prime_factor_in_test
movi $r1 i262142              ; initialize constant into register
move $r4 $zero                ; move parameter from branch to block argument
movi $r0 i2                   ; initialize constant into register
mod  $r0 $r1 $r0
eq   $r0 $r0 $zero
move $r3 $r1                  ; move parameter from branch to block argument
movi $r2 i3                   ; initialize constant into register
jnzf $r0 $zero i15
mul  $r0 $r2 $r2
lt   $r1 $r0 $r3
jnzf $r1 $zero i1
eq   $r1 $r0 $r3
jnzf $r1 $zero i1
ret  $zero                    ; return unit as zero
mod  $r0 $r3 $r2
eq   $r0 $r0 $zero
jnzf $r0 $zero i3
movi $r0 i2                   ; initialize constant into register
add  $r2 $r2 $r0
jmpb $zero i10
div  $r3 $r3 $r2
move $r4 $r2                  ; move parameter from branch to block argument
jmpb $zero i7
movi $r0 i2                   ; initialize constant into register
div  $r1 $r1 $r0
movi $r4 i2                   ; initialize constant into register
jmpb $zero i23
.data:

