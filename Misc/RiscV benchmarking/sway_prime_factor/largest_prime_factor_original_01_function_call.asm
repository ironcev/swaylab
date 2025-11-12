// test bench_largest_prime_factor ... ok (104.112µs, 3765 gas)
// 35 instructions.

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
move $$locbase $sp            ; save locals base register for function bench_largest_prime_factor
movi $r0 i262142              ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
jal  $$reta $pc i2            ; [call]: call largest_prime_factor_0
ret  $zero                    ; return unit as zero
pshl i63                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function largest_prime_factor_0
move $r1 $$arg0               ; save argument 0 (n)
move $r2 $$reta               ; save return address
lt   $r0 $$arg0 $one
jnzf $r0 $zero i1
eq   $r0 $$arg0 $one
move $r5 $zero                ; move parameter from branch to block argument
jnzf $r0 $zero i30
movi $r0 i2                   ; initialize constant into register
mod  $r0 $r1 $r0
eq   $r0 $r0 $zero
move $r4 $r1                  ; move parameter from branch to block argument
movi $r3 i3                   ; initialize constant into register
jnzf $r0 $zero i20
mul  $r0 $r3 $r3
lt   $r1 $r0 $r4
jnzf $r1 $zero i1
eq   $r1 $r0 $r4
jnzf $r1 $zero i6
gt   $r0 $r4 $one
jnzf $r0 $zero i1
jmpf $zero i1
move $r5 $r4                  ; move parameter from branch to block argument
move $$retv $r5               ; set return value
jmpf $zero i14
mod  $r0 $r4 $r3
eq   $r0 $r0 $zero
jnzf $r0 $zero i3
movi $r0 i2                   ; initialize constant into register
add  $r3 $r3 $r0
jmpb $zero i15
div  $r4 $r4 $r3
move $r5 $r3                  ; move parameter from branch to block argument
jmpb $zero i7
movi $r0 i2                   ; initialize constant into register
div  $r1 $r1 $r0
movi $r5 i2                   ; initialize constant into register
jmpb $zero i28
move $$retv $r1               ; set return value
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i63                      ; restore registers 16..40
jal  $zero $$reta i0          ; return from call
.data:

