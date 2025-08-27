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
lw   $r0 $fp i73              ; [function selection]: load input function selector
load $r1 data_NonConfigurable_3; [function selection]: load function poke_storage_1 selector for comparison
eq   $r2 $r0 $r1              ; [function selection]: compare function poke_storage_1 selector with input selector
jnzf $r2 $zero i8             ; [function selection]: jump to selected contract function
load $r1 data_NonConfigurable_4; [function selection]: load function poke_storage_2 selector for comparison
eq   $r2 $r0 $r1              ; [function selection]: compare function poke_storage_2 selector with input selector
jnzf $r2 $zero i46            ; [function selection]: jump to selected contract function
load $r1 data_NonConfigurable_5; [function selection]: load function poke_storage_in_a_loop selector for comparison
eq   $r2 $r0 $r1              ; [function selection]: compare function poke_storage_in_a_loop selector with input selector
jnzf $r2 $zero i84            ; [function selection]: jump to selected contract function
movi $$tmp i123               ; [function selection]: load revert code for mismatched function selector
rvrt $$tmp                    ; [function selection]: revert if no selectors have matched
move $$locbase $sp            ; save locals base register for function poke_storage_1
cfei i432                     ; allocate 432 bytes for locals and 0 slots for call arguments
load $r0 data_NonConfigurable_0; get local constant
load $r1 data_NonConfigurable_0; get local constant
load $r2 data_NonConfigurable_1; get local constant
load $r3 data_NonConfigurable_1; get local constant
load $r4 data_NonConfigurable_2; get local constant
load $r5 data_NonConfigurable_2; get local constant
mcpi $$locbase $r0 i32        ; copy memory
sw   $$locbase $zero i4       ; store word
addi $r0 $$locbase i40        ; get offset to aggregate element
mcpi $r0 $r1 i32              ; copy memory
addi $r0 $$locbase i216       ; get offset to local
mcpi $r0 $$locbase i72        ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
jal  $$reta $pc i82           ; [call]: call poke_2
addi $r0 $$locbase i72        ; get offset to local
mcpi $r0 $r2 i32              ; copy memory
sw   $$locbase $zero i13      ; store word
addi $r1 $r0 i40              ; get offset to aggregate element
mcpi $r1 $r3 i32              ; copy memory
addi $r1 $$locbase i288       ; get offset to local
mcpi $r1 $r0 i72              ; copy memory
move $$arg0 $r1               ; [call]: pass argument 0
jal  $$reta $pc i73           ; [call]: call poke_2
addi $r0 $$locbase i144       ; get offset to local
mcpi $r0 $r4 i32              ; copy memory
sw   $$locbase $zero i22      ; store word
addi $r1 $r0 i40              ; get offset to aggregate element
mcpi $r1 $r5 i32              ; copy memory
addi $r1 $$locbase i360       ; get offset to local
mcpi $r1 $r0 i72              ; copy memory
move $$arg0 $r1               ; [call]: pass argument 0
jal  $$reta $pc i64           ; [call]: call poke_2
ret  $zero                    ; return unit as zero
move $$locbase $sp            ; save locals base register for function poke_storage_2
cfei i432                     ; allocate 432 bytes for locals and 0 slots for call arguments
load $r0 data_NonConfigurable_0; get local constant
load $r1 data_NonConfigurable_0; get local constant
load $r2 data_NonConfigurable_1; get local constant
load $r3 data_NonConfigurable_1; get local constant
load $r4 data_NonConfigurable_2; get local constant
load $r5 data_NonConfigurable_2; get local constant
mcpi $$locbase $r0 i32        ; copy memory
sw   $$locbase $zero i4       ; store word
addi $r0 $$locbase i40        ; get offset to aggregate element
mcpi $r0 $r1 i32              ; copy memory
addi $r0 $$locbase i216       ; get offset to local
mcpi $r0 $$locbase i72        ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
jal  $$reta $pc i41           ; [call]: call poke_2
addi $r0 $$locbase i72        ; get offset to local
mcpi $r0 $r2 i32              ; copy memory
sw   $$locbase $zero i13      ; store word
addi $r1 $r0 i40              ; get offset to aggregate element
mcpi $r1 $r3 i32              ; copy memory
addi $r1 $$locbase i288       ; get offset to local
mcpi $r1 $r0 i72              ; copy memory
move $$arg0 $r1               ; [call]: pass argument 0
jal  $$reta $pc i32           ; [call]: call poke_2
addi $r0 $$locbase i144       ; get offset to local
mcpi $r0 $r4 i32              ; copy memory
sw   $$locbase $zero i22      ; store word
addi $r1 $r0 i40              ; get offset to aggregate element
mcpi $r1 $r5 i32              ; copy memory
addi $r1 $$locbase i360       ; get offset to local
mcpi $r1 $r0 i72              ; copy memory
move $$arg0 $r1               ; [call]: pass argument 0
jal  $$reta $pc i23           ; [call]: call poke_2
ret  $zero                    ; return unit as zero
move $$locbase $sp            ; save locals base register for function poke_storage_in_a_loop
cfei i144                     ; allocate 144 bytes for locals and 0 slots for call arguments
move $r2 $zero                ; move parameter from branch to block argument
movi $r0 i10                  ; initialize constant into register
lt   $r0 $r2 $r0
jnzf $r0 $zero i1
ret  $zero                    ; return unit as zero
load $r0 data_NonConfigurable_0; get local constant
load $r1 data_NonConfigurable_0; get local constant
mcpi $$locbase $r0 i32        ; copy memory
sw   $$locbase $zero i4       ; store word
addi $r0 $$locbase i40        ; get offset to aggregate element
mcpi $r0 $r1 i32              ; copy memory
addi $r0 $$locbase i72        ; get offset to local
mcpi $r0 $$locbase i72        ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
jal  $$reta $pc i3            ; [call]: call poke_2
add  $r2 $r2 $one
jmpb $zero i16
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function poke_2
move $$retv $zero             ; set return value
poph i524288                  ; restore registers 40..64
jal  $zero $$reta i0          ; return from call
.data:
data_NonConfigurable_0 .bytes[32] 9e 0e 87 be f2 e4 4d 97 71 eb 12 cf c8 1e 34 e4 dd 6c aa d5 53 85 35 47 57 a8 89 8a 2c 80 8b 61  ......M.q.....4..l..S.5GW...,..a
data_NonConfigurable_1 .bytes[32] 82 2b 67 d5 a2 c7 f6 a1 b6 a4 8c 25 3b e4 36 eb 6c 57 de 0c 39 fc 8b 0e 27 bf b6 69 33 78 8a f3  .+g........%;.6.lW..9...'..i3x..
data_NonConfigurable_2 .bytes[32] 8c 1f b8 3c 6f 6b fc fa 3e b4 5a 6a fb 8f 3b c6 3d ed db 27 a0 fa bd 75 4c 5e d6 77 41 7e 4a 34  ...<ok..>.Zj..;.=..'...uL^.wA~J4
data_NonConfigurable_3 .word 1927491372
data_NonConfigurable_4 .word 2603291103
data_NonConfigurable_5 .word 3394234452
