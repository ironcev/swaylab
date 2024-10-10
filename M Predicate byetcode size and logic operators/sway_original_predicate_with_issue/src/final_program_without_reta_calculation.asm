;; ASM: Final program
;; Program kind: Predicate
.program:
move $$tmp $pc
jmpf $zero i2
DATA_SECTION_OFFSET[0..32]
DATA_SECTION_OFFSET[32..64]
lw   $$ds $$tmp i1
add  $$ds $$ds $$tmp
cfei i313                     ; allocate stack space for globals
addr $$arg0 data_0            ; get pointer to configurable BASE_ASSET default value
addi $$arg1 $zero i32         ; get length of configurable BASE_ASSET default value
addi $$arg2 $ssp i0           ; get pointer to configurable BASE_ASSET stack address
creta
jmpf $zero i91                ; decode configurable BASE_ASSET
addr $$arg0 data_1            ; get pointer to configurable COMMISSION_PERCENTAGE default value
addi $$arg1 $zero i8          ; get length of configurable COMMISSION_PERCENTAGE default value
addi $$arg2 $ssp i32          ; get pointer to configurable COMMISSION_PERCENTAGE stack address
creta
jmpf $zero i138               ; decode configurable COMMISSION_PERCENTAGE
addr $$arg0 data_2            ; get pointer to configurable IS_YES default value
addi $$arg1 $zero i1          ; get length of configurable IS_YES default value
addi $$arg2 $ssp i40          ; get pointer to configurable IS_YES stack address
creta
jmpf $zero i159               ; decode configurable IS_YES
addr $$arg0 data_3            ; get pointer to configurable NO default value
addi $$arg1 $zero i32         ; get length of configurable NO default value
addi $$arg2 $ssp i41          ; get pointer to configurable NO stack address
creta
jmpf $zero i70                ; decode configurable NO
addr $$arg0 data_4            ; get pointer to configurable NO_PRICE default value
addi $$arg1 $zero i8          ; get length of configurable NO_PRICE default value
addi $$arg2 $ssp i73          ; get pointer to configurable NO_PRICE stack address
creta
jmpf $zero i117               ; decode configurable NO_PRICE
addr $$arg0 data_5            ; get pointer to configurable ORACLE default value
addi $$arg1 $zero i32         ; get length of configurable ORACLE default value
addi $$arg2 $ssp i81          ; get pointer to configurable ORACLE stack address
creta
jmpf $zero i174               ; decode configurable ORACLE
addr $$arg0 data_6            ; get pointer to configurable REDEMPTION_NO default value
addi $$arg1 $zero i32         ; get length of configurable REDEMPTION_NO default value
addi $$arg2 $ssp i113         ; get pointer to configurable REDEMPTION_NO stack address
creta
jmpf $zero i167               ; decode configurable REDEMPTION_NO
addr $$arg0 data_7            ; get pointer to configurable REDEMPTION_YES default value
addi $$arg1 $zero i32         ; get length of configurable REDEMPTION_YES default value
addi $$arg2 $ssp i145         ; get pointer to configurable REDEMPTION_YES stack address
creta
jmpf $zero i160               ; decode configurable REDEMPTION_YES
addr $$arg0 data_8            ; get pointer to configurable TTD default value
addi $$arg1 $zero i32         ; get length of configurable TTD default value
addi $$arg2 $ssp i177         ; get pointer to configurable TTD stack address
creta
jmpf $zero i35                ; decode configurable TTD
addr $$arg0 data_9            ; get pointer to configurable USER default value
addi $$arg1 $zero i32         ; get length of configurable USER default value
addi $$arg2 $ssp i209         ; get pointer to configurable USER stack address
creta
jmpf $zero i146               ; decode configurable USER
addr $$arg0 data_10           ; get pointer to configurable VRF default value
addi $$arg1 $zero i32         ; get length of configurable VRF default value
addi $$arg2 $ssp i241         ; get pointer to configurable VRF stack address
creta
jmpf $zero i21                ; decode configurable VRF
addr $$arg0 data_11           ; get pointer to configurable YES default value
addi $$arg1 $zero i32         ; get length of configurable YES default value
addi $$arg2 $ssp i273         ; get pointer to configurable YES stack address
creta
jmpf $zero i14                ; decode configurable YES
addr $$arg0 data_12           ; get pointer to configurable YES_PRICE default value
addi $$arg1 $zero i8          ; get length of configurable YES_PRICE default value
addi $$arg2 $ssp i305         ; get pointer to configurable YES_PRICE stack address
creta
jmpf $zero i61                ; decode configurable YES_PRICE
move $$locbase $sp            ; save locals base register for function __entry
cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments
creta
jmpf $zero i190               ; [call]: call main_17
move $r0 $$retv               ; [call]: copy the return value
ret  $r0
pshl i31                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function abi_decode_in_place_0
cfei i112                     ; allocate 112 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (ptr)
move $r1 $$arg1               ; save argument 1 (len)
move $r2 $$arg2               ; save argument 2 (target)
move $r3 $$reta               ; save return address
addi $r4 $$locbase i32        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $r4               ; [call]: pass argument 2
creta
jmpf $zero i26                ; [call]: call from_parts_1
move $r0 $$retv               ; [call]: copy the return value
lw   $r0 $r0 i0               ; load word
sw   $$locbase $r0 i9         ; store word
addi $r1 $$locbase i72        ; get offset to local
addi $r0 $$locbase i40        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
creta
jmpf $zero i133               ; [call]: call abi_decode_16
move $r0 $$retv               ; [call]: copy the return value
movi $r1 i32                  ; get data length for memory copy
mcp  $$locbase $r0 $r1        ; copy memory
addi $r0 $$locbase i80        ; get offset to local
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $$locbase $r1        ; copy memory
addi $r0 $$locbase i80        ; get offset to local
movi $r1 i32                  ; initialize constant into register
mcp  $r2 $r0 $r1              ; mcp target temp size
move $$retv $zero             ; set return value
cfsi i112                     ; free 112 bytes for locals and 0 slots for extra call arguments
move $$reta $r3               ; restore return address
poph i524288                  ; restore registers 40..64
popl i31                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i7                       ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function from_parts_1
cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (ptr)
move $r1 $$arg2               ; save argument 2 (__ret_value)
move $r2 $$reta               ; save return address
sw   $r1 $r0 i0               ; store word
move $$retv $r1               ; set return value
cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i7                       ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i15                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function abi_decode_in_place_6
cfei i16                      ; allocate 16 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (ptr)
move $r1 $$arg1               ; save argument 1 (len)
move $r2 $$arg2               ; save argument 2 (target)
move $r3 $$reta               ; save return address
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $$locbase         ; [call]: pass argument 2
creta
jmpb $zero i25                ; [call]: call from_parts_1
move $r0 $$retv               ; [call]: copy the return value
lw   $r0 $r0 i0               ; load word
lw   $r0 $r0 i0               ; lw val ptr i0
sw   $$locbase $r0 i1         ; store word
addi $r0 $$locbase i8         ; get offset to local
movi $r1 i8                   ; initialize constant into register
mcp  $r2 $r0 $r1              ; mcp target temp size
move $$retv $zero             ; set return value
cfsi i16                      ; free 16 bytes for locals and 0 slots for extra call arguments
move $$reta $r3               ; restore return address
poph i524288                  ; restore registers 40..64
popl i15                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i31                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function abi_decode_in_place_9
cfei i16                      ; allocate 16 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (ptr)
move $r1 $$arg1               ; save argument 1 (len)
move $r2 $$arg2               ; save argument 2 (target)
move $r3 $$reta               ; save return address
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $$locbase         ; [call]: pass argument 2
creta
jmpb $zero i53                ; [call]: call from_parts_1
move $r0 $$retv               ; [call]: copy the return value
lw   $r0 $r0 i0               ; load word
lb   $r0 $r0 i0               ; lb val ptr i0
eq   $r1 $r0 $zero
move $r4 $zero                ; move parameter from branch to block argument
jnzf $r1 $zero i4
eq   $r0 $r0 $one
move $r4 $one                 ; move parameter from branch to block argument
jnzf $r0 $zero i1
rvrt $zero
addi $r0 $$locbase i8         ; get offset to local
sb   $r0 $r4 i0               ; store byte
addi $r0 $$locbase i8         ; get offset to local
move $r1 $one                 ; copy ASM block argument's constant initial value to register
mcp  $r2 $r0 $r1              ; mcp target temp size
move $$retv $zero             ; set return value
cfsi i16                      ; free 16 bytes for locals and 0 slots for extra call arguments
move $$reta $r3               ; restore return address
poph i524288                  ; restore registers 40..64
popl i31                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i31                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function abi_decode_in_place_15
cfei i112                     ; allocate 112 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (ptr)
move $r1 $$arg1               ; save argument 1 (len)
move $r2 $$arg2               ; save argument 2 (target)
move $r3 $$reta               ; save return address
addi $r4 $$locbase i32        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $r4               ; [call]: pass argument 2
creta
jmpb $zero i90                ; [call]: call from_parts_1
move $r0 $$retv               ; [call]: copy the return value
lw   $r0 $r0 i0               ; load word
sw   $$locbase $r0 i9         ; store word
addi $r0 $$locbase i72        ; get offset to local
addi $r1 $$locbase i40        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
creta
jmpf $zero i15                ; [call]: call abi_decode_16
move $r0 $$retv               ; [call]: copy the return value
movi $r1 i32                  ; get data length for memory copy
mcp  $$locbase $r0 $r1        ; copy memory
addi $r0 $$locbase i80        ; get offset to local
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $$locbase $r1        ; copy memory
addi $r0 $$locbase i80        ; get offset to local
movi $r1 i32                  ; initialize constant into register
mcp  $r2 $r0 $r1              ; mcp target temp size
move $$retv $zero             ; set return value
cfsi i112                     ; free 112 bytes for locals and 0 slots for extra call arguments
move $$reta $r3               ; restore return address
poph i524288                  ; restore registers 40..64
popl i31                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i31                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function abi_decode_16
cfei i96                      ; allocate 96 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (buffer)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
lw   $r3 $r0 i0               ; load word
movi $r4 i32                  ; get data length for memory copy
mcp  $$locbase $r3 $r4        ; copy memory
addi $r3 $$locbase i64        ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $$locbase $r4        ; copy memory
lw   $r3 $r0 i0               ; load word
movi $r4 i32                  ; initialize constant into register
add  $r3 $r3 $r4
sw   $r0 $r3 i0               ; store word
addi $r0 $$locbase i32        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $$locbase $r3        ; copy memory
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
move $$retv $r1               ; set return value
cfsi i96                      ; free 96 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i31                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i127                     ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function main_17
cfei i3992                    ; allocate 3992 bytes for locals and 0 slots for call arguments
move $r4 $$reta               ; save return address
gm   $r3 i3                   ; gm r1 i3
addi $r0 $$locbase i1384      ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
creta
jmpf $zero i1520              ; [call]: call input_type_21
move $r0 $$retv               ; [call]: copy the return value
movi $r1 i16                  ; get data length for memory copy
mcp  $$locbase $r0 $r1        ; copy memory
addi $r0 $$locbase i3976      ; get offset to local
movi $r1 i16                  ; get data length for memory copy
mcp  $r0 $$locbase $r1        ; copy memory
addi $r1 $$locbase i936       ; get offset to local
movi $r0 i16                  ; get data length for memory copy
mcp  $r1 $$locbase $r0        ; copy memory
lw   $r0 $$locbase i0         ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i1
jmpf $zero i2
lw   $r0 $$locbase i118       ; load word
eq   $r0 $r0 $zero
jnzf $r0 $zero i72
lw   $r0 $$locbase i117       ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i1
jmpf $zero i3
lw   $r0 $$locbase i118       ; load word
movi $r1 i2                   ; initialize constant into register
eq   $r0 $r0 $r1
jnzf $r0 $zero i6
addi $r0 $$locbase i632       ; get offset to local
sw   $$locbase $zero i79      ; store word
addi $r3 $$locbase i3784      ; get offset to local
movi $r1 i40                  ; get data length for memory copy
mcp  $r3 $r0 $r1              ; copy memory
jmpf $zero i54
addi $r0 $$locbase i1400      ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
creta
jmpf $zero i1483              ; [call]: call input_type_21
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i56        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i904       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
lw   $r0 $$locbase i7         ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i1
jmpf $zero i3
lw   $r0 $$locbase i114       ; load word
movi $r1 i2                   ; initialize constant into register
eq   $r0 $r0 $r1
jnzf $r0 $zero i6
addi $r0 $$locbase i784       ; get offset to local
sw   $$locbase $zero i98      ; store word
addi $r2 $$locbase i3744      ; get offset to local
movi $r1 i40                  ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
jmpf $zero i23
addi $r0 $$locbase i672       ; get offset to local
sw   $$locbase $one i84       ; store word
gtf  $r1 $r3 i577             ; get transaction field
addi $r2 $$locbase i2144      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
addi $r1 $$locbase i1064      ; get offset to local
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
creta
jmpf $zero i1677              ; [call]: call from_28
move $r1 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i288       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
addi $r1 $r0 i8               ; get offset to aggregate element
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r2 $r3              ; copy memory
addi $r2 $$locbase i3744      ; get offset to local
movi $r1 i40                  ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
addi $r3 $$locbase i3784      ; get offset to local
movi $r0 i40                  ; get data length for memory copy
mcp  $r3 $r2 $r0              ; copy memory
addi $r2 $$locbase i3824      ; get offset to local
movi $r0 i40                  ; get data length for memory copy
mcp  $r2 $r3 $r0              ; copy memory
jmpf $zero i14
addi $r0 $$locbase i1448      ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
creta
jmpf $zero i1589              ; [call]: call input_coin_owner_27
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i16        ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r2 $$locbase i3824      ; get offset to local
movi $r0 i40                  ; get data length for memory copy
mcp  $r2 $r1 $r0              ; copy memory
addi $r0 $$locbase i1568      ; get offset to local
movi $r1 i40                  ; get data length for memory copy
mcp  $r0 $r2 $r1              ; copy memory
addi $r1 $$locbase i968       ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
creta
jmpf $zero i1386              ; [call]: call unwrap_18
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i432       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i3944      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
creta
jmpf $zero i1485              ; [call]: call input_count_25
move $r0 $$retv               ; [call]: copy the return value
eq   $r0 $r0 $zero
move $r1 $zero                ; move parameter from branch to block argument
jnzf $r0 $zero i234
addi $r0 $$locbase i1416      ; get offset to local
move $$arg0 $zero             ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
creta
jmpf $zero i1386              ; [call]: call input_type_21
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i464       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i920       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
lw   $r0 $$locbase i58        ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i1
rvrt $zero
lw   $r0 $$locbase i116       ; load word
eq   $r1 $r0 $zero
jnzf $r1 $zero i1
jmpf $zero i1
eq   $r1 $zero $zero
move $r2 $one                 ; move parameter from branch to block argument
jnzf $r1 $zero i15
eq   $r1 $r0 $one
jnzf $r1 $zero i1
jmpf $zero i1
eq   $r1 $zero $one
move $r2 $one                 ; move parameter from branch to block argument
jnzf $r1 $zero i9
movi $r1 i2                   ; initialize constant into register
eq   $r0 $r0 $r1
jnzf $r0 $zero i1
jmpf $zero i2
movi $r0 i2                   ; initialize constant into register
eq   $r0 $zero $r0
move $r2 $one                 ; move parameter from branch to block argument
jnzf $r0 $zero i1
move $r2 $zero                ; move parameter from branch to block argument
eq   $r0 $r2 $zero
move $r1 $zero                ; move parameter from branch to block argument
jnzf $r0 $zero i191
addi $r0 $$locbase i1432      ; get offset to local
move $$arg0 $zero             ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
creta
jmpf $zero i1343              ; [call]: call input_type_21
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i480       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i952       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
lw   $r0 $$locbase i60        ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i1
jmpf $zero i2
lw   $r0 $$locbase i120       ; load word
eq   $r0 $r0 $zero
jnzf $r0 $zero i33
lw   $r0 $$locbase i119       ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i1
jmpf $zero i3
lw   $r0 $$locbase i120       ; load word
movi $r1 i2                   ; initialize constant into register
eq   $r0 $r0 $r1
jnzf $r0 $zero i6
addi $r0 $$locbase i864       ; get offset to local
sw   $$locbase $zero i108     ; store word
addi $r2 $$locbase i3864      ; get offset to local
movi $r1 i40                  ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
jmpf $zero i15
addi $r0 $$locbase i824       ; get offset to local
sw   $$locbase $one i103      ; store word
gm   $r1 i6                   ; gm r1 i6
addi $r2 $$locbase i528       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
addi $r1 $$locbase i712       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r2 $r3              ; copy memory
addi $r2 $r0 i8               ; get offset to aggregate element
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
addi $r2 $$locbase i3864      ; get offset to local
movi $r1 i40                  ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
addi $r1 $$locbase i3904      ; get offset to local
movi $r0 i40                  ; get data length for memory copy
mcp  $r1 $r2 $r0              ; copy memory
jmpf $zero i23
addi $r0 $$locbase i744       ; get offset to local
sw   $$locbase $one i93       ; store word
gtf  $r1 $zero i517           ; get transaction field
addi $r2 $$locbase i2496      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
addi $r1 $$locbase i1096      ; get offset to local
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
creta
jmpf $zero i1511              ; [call]: call from_28
move $r1 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i496       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
addi $r1 $r0 i8               ; get offset to aggregate element
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r2 $r3              ; copy memory
addi $r1 $$locbase i3904      ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i1608      ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r1 $$locbase i1000      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
creta
jmpf $zero i1241              ; [call]: call unwrap_18
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i560       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $ssp i241            ; get address of configurable VRF
addi $r2 $$locbase i2848      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
addi $r1 $$locbase i3200      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
creta
jmpf $zero i1491              ; [call]: call eq_43
move $r0 $$retv               ; [call]: copy the return value
eq   $r0 $r0 $zero
move $r1 $zero                ; move parameter from branch to block argument
jnzf $r0 $zero i83
addi $r0 $$locbase i1488      ; get offset to local
move $$arg0 $zero             ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
creta
jmpf $zero i1399              ; [call]: call input_coin_owner_27
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i592       ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i1648      ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r1 $$locbase i1032      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
creta
jmpf $zero i1199              ; [call]: call unwrap_18
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i72        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $ssp i81             ; get address of configurable ORACLE
addi $r2 $$locbase i3552      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
addi $r1 $$locbase i3680      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
creta
jmpf $zero i1449              ; [call]: call eq_43
move $r0 $$retv               ; [call]: copy the return value
move $r1 $one                 ; move parameter from branch to block argument
jnzf $r0 $zero i42
addi $r0 $$locbase i1528      ; get offset to local
move $$arg0 $zero             ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
creta
jmpf $zero i1358              ; [call]: call input_coin_owner_27
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i104       ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i1864      ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r1 $$locbase i1256      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
creta
jmpf $zero i1158              ; [call]: call unwrap_18
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i144       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $ssp i209            ; get address of configurable USER
addi $r2 $$locbase i3712      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
addi $r1 $$locbase i1688      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
creta
jmpf $zero i1408              ; [call]: call eq_43
move $r0 $$retv               ; [call]: copy the return value
movi $r1 i2                   ; initialize constant into register
jnzf $r0 $zero i1
movi $r1 i3                   ; initialize constant into register
creta
jmpf $zero i1419              ; [call]: call output_count_44
move $r3 $$retv               ; [call]: copy the return value
eq   $r0 $r1 $one
jnzf $r0 $zero i512
movi $r0 i2                   ; initialize constant into register
eq   $r0 $r1 $r0
jnzf $r0 $zero i298
movi $r0 i3                   ; initialize constant into register
eq   $r0 $r1 $r0
jnzf $r0 $zero i1
jmpf $zero i511
addi $r5 $$locbase i3944      ; get offset to local
addi $r0 $ssp i241            ; get address of configurable VRF
addi $r1 $$locbase i2880      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
move $$arg0 $zero             ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
movi $r0 i2                   ; initialize constant into register
move $$arg2 $r0               ; [call]: pass argument 2
creta
jmpf $zero i1797              ; [call]: call validate_output_55
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i13
addi $r0 $ssp i41             ; get address of configurable NO
addi $r1 $$locbase i2912      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
move $$arg0 $one              ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
movi $r0 i2                   ; initialize constant into register
move $$arg2 $r0               ; [call]: pass argument 2
creta
jmpf $zero i1782              ; [call]: call validate_output_55
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i14
addi $r0 $ssp i273            ; get address of configurable YES
addi $r1 $$locbase i2944      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i2                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
movi $r0 i2                   ; initialize constant into register
move $$arg2 $r0               ; [call]: pass argument 2
creta
jmpf $zero i1766              ; [call]: call validate_output_55
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i13
addi $r0 $ssp i273            ; get address of configurable YES
addi $r1 $$locbase i2976      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i3                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $zero             ; [call]: pass argument 2
creta
jmpf $zero i1751              ; [call]: call validate_output_55
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i13
addi $r0 $ssp i41             ; get address of configurable NO
addi $r1 $$locbase i3008      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i4                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $zero             ; [call]: pass argument 2
creta
jmpf $zero i1736              ; [call]: call validate_output_55
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i14
addi $r0 $ssp i0              ; get address of configurable BASE_ASSET
addi $r1 $$locbase i3040      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i5                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
movi $r0 i2                   ; initialize constant into register
move $$arg2 $r0               ; [call]: pass argument 2
creta
jmpf $zero i1720              ; [call]: call validate_output_55
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i58
addi $r0 $ssp i40             ; get address of configurable IS_YES
lb   $r0 $r0 i0               ; load byte
jnzf $r0 $zero i1
jmpf $zero i12
addi $r0 $$locbase i3520      ; get offset to local
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $r5 $r1              ; copy memory
move $$arg0 $one              ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
movi $r0 i2                   ; initialize constant into register
move $$arg2 $r0               ; [call]: pass argument 2
creta
jmpf $zero i1831              ; [call]: call validate_output_to_57
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i12
addi $r0 $$locbase i3584      ; get offset to local
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $r5 $r1              ; copy memory
movi $r1 i3                   ; initialize constant into register
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $zero             ; [call]: pass argument 2
creta
jmpf $zero i1817              ; [call]: call validate_output_to_57
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i27
addi $r0 $$locbase i3616      ; get offset to local
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $r5 $r1              ; copy memory
movi $r1 i2                   ; initialize constant into register
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
movi $r0 i2                   ; initialize constant into register
move $$arg2 $r0               ; [call]: pass argument 2
creta
jmpf $zero i1803              ; [call]: call validate_output_to_57
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i12
addi $r0 $$locbase i3648      ; get offset to local
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $r5 $r1              ; copy memory
movi $r1 i4                   ; initialize constant into register
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $zero             ; [call]: pass argument 2
creta
jmpf $zero i1789              ; [call]: call validate_output_to_57
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i13
addi $r0 $ssp i305            ; get address of configurable YES_PRICE
lw   $r0 $r0 i0               ; load word
addi $r1 $ssp i73             ; get address of configurable NO_PRICE
lw   $r1 $r1 i0               ; load word
add  $r0 $r0 $r1
move $$arg0 $r0               ; [call]: pass argument 0
movi $r0 i100                 ; initialize constant into register
move $$arg1 $r0               ; [call]: pass argument 1
creta
jmpf $zero i1054              ; [call]: call ge_22
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i120
addi $r0 $ssp i40             ; get address of configurable IS_YES
lb   $r0 $r0 i0               ; load byte
jnzf $r0 $zero i1
jmpf $zero i55
addi $r0 $ssp i305            ; get address of configurable YES_PRICE
lw   $r0 $r0 i0               ; load word
addi $r1 $$locbase i1320      ; get offset to local
movi $r2 i3                   ; initialize constant into register
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
creta
jmpf $zero i1287              ; [call]: call output_amount_47
move $r1 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i368       ; get offset to local
movi $r5 i16                  ; get data length for memory copy
mcp  $r2 $r1 $r5              ; copy memory
addi $r1 $$locbase i1920      ; get offset to local
movi $r5 i16                  ; get data length for memory copy
mcp  $r1 $r2 $r5              ; copy memory
move $$arg0 $r1               ; [call]: pass argument 0
creta
jmpf $zero i1256              ; [call]: call unwrap_46
move $r1 $$retv               ; [call]: copy the return value
mul  $r0 $r0 $r1
addi $r1 $ssp i73             ; get address of configurable NO_PRICE
lw   $r1 $r1 i0               ; load word
addi $r2 $$locbase i1336      ; get offset to local
movi $r5 i4                   ; initialize constant into register
move $$arg0 $r5               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
creta
jmpf $zero i1263              ; [call]: call output_amount_47
move $r2 $$retv               ; [call]: copy the return value
addi $r5 $$locbase i384       ; get offset to local
movi $r6 i16                  ; get data length for memory copy
mcp  $r5 $r2 $r6              ; copy memory
addi $r2 $$locbase i1936      ; get offset to local
movi $r6 i16                  ; get data length for memory copy
mcp  $r2 $r5 $r6              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
creta
jmpf $zero i1232              ; [call]: call unwrap_46
move $r2 $$retv               ; [call]: copy the return value
mul  $r1 $r1 $r2
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
creta
jmpf $zero i993               ; [call]: call ge_22
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i60
addi $r0 $ssp i40             ; get address of configurable IS_YES
lb   $r0 $r0 i0               ; load byte
eq   $r0 $r0 $zero
jnzf $r0 $zero i1
jmpf $zero i55
addi $r0 $ssp i73             ; get address of configurable NO_PRICE
lw   $r0 $r0 i0               ; load word
addi $r1 $$locbase i1352      ; get offset to local
movi $r2 i4                   ; initialize constant into register
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
creta
jmpf $zero i1226              ; [call]: call output_amount_47
move $r1 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i400       ; get offset to local
movi $r5 i16                  ; get data length for memory copy
mcp  $r2 $r1 $r5              ; copy memory
addi $r1 $$locbase i1952      ; get offset to local
movi $r5 i16                  ; get data length for memory copy
mcp  $r1 $r2 $r5              ; copy memory
move $$arg0 $r1               ; [call]: pass argument 0
creta
jmpf $zero i1195              ; [call]: call unwrap_46
move $r1 $$retv               ; [call]: copy the return value
mul  $r0 $r0 $r1
addi $r1 $ssp i305            ; get address of configurable YES_PRICE
lw   $r1 $r1 i0               ; load word
addi $r2 $$locbase i1368      ; get offset to local
movi $r5 i3                   ; initialize constant into register
move $$arg0 $r5               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
creta
jmpf $zero i1202              ; [call]: call output_amount_47
move $r2 $$retv               ; [call]: copy the return value
addi $r5 $$locbase i416       ; get offset to local
movi $r6 i16                  ; get data length for memory copy
mcp  $r5 $r2 $r6              ; copy memory
addi $r2 $$locbase i1968      ; get offset to local
movi $r6 i16                  ; get data length for memory copy
mcp  $r2 $r5 $r6              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
creta
jmpf $zero i1171              ; [call]: call unwrap_46
move $r2 $$retv               ; [call]: copy the return value
mul  $r1 $r1 $r2
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
creta
jmpf $zero i932               ; [call]: call ge_22
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i2
movi $r0 i6                   ; initialize constant into register
eq   $r0 $r3 $r0
move $$retv $r0               ; set return value
jmpf $zero i824
addi $r0 $$locbase i1240      ; get offset to local
movi $r1 i4                   ; initialize constant into register
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
creta
jmpf $zero i1167              ; [call]: call output_amount_47
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i320       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i1832      ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
creta
jmpf $zero i1136              ; [call]: call unwrap_46
move $r5 $$retv               ; [call]: copy the return value
addi $r0 $ssp i241            ; get address of configurable VRF
addi $r1 $$locbase i2592      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
move $$arg0 $zero             ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
movi $r0 i2                   ; initialize constant into register
move $$arg2 $r0               ; [call]: pass argument 2
creta
jmpf $zero i1483              ; [call]: call validate_output_55
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i13
addi $r0 $ssp i177            ; get address of configurable TTD
addi $r1 $$locbase i2624      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
move $$arg0 $one              ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
movi $r0 i2                   ; initialize constant into register
move $$arg2 $r0               ; [call]: pass argument 2
creta
jmpf $zero i1468              ; [call]: call validate_output_55
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i14
addi $r0 $ssp i273            ; get address of configurable YES
addi $r1 $$locbase i2656      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i2                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
movi $r0 i2                   ; initialize constant into register
move $$arg2 $r0               ; [call]: pass argument 2
creta
jmpf $zero i1452              ; [call]: call validate_output_55
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i14
addi $r0 $ssp i41             ; get address of configurable NO
addi $r1 $$locbase i2688      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i3                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
movi $r0 i2                   ; initialize constant into register
move $$arg2 $r0               ; [call]: pass argument 2
creta
jmpf $zero i1436              ; [call]: call validate_output_55
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i13
addi $r0 $ssp i177            ; get address of configurable TTD
addi $r1 $$locbase i2720      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i4                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $zero             ; [call]: pass argument 2
creta
jmpf $zero i1421              ; [call]: call validate_output_55
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i13
addi $r0 $ssp i273            ; get address of configurable YES
addi $r1 $$locbase i2752      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i5                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $zero             ; [call]: pass argument 2
creta
jmpf $zero i1406              ; [call]: call validate_output_55
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i13
addi $r0 $ssp i41             ; get address of configurable NO
addi $r1 $$locbase i2784      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i6                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $zero             ; [call]: pass argument 2
creta
jmpf $zero i1391              ; [call]: call validate_output_55
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i14
addi $r0 $ssp i0              ; get address of configurable BASE_ASSET
addi $r1 $$locbase i2816      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i7                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
movi $r0 i2                   ; initialize constant into register
move $$arg2 $r0               ; [call]: pass argument 2
creta
jmpf $zero i1375              ; [call]: call validate_output_55
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i13
addi $r0 $ssp i209            ; get address of configurable USER
addi $r1 $$locbase i3488      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i4                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $zero             ; [call]: pass argument 2
creta
jmpf $zero i1489              ; [call]: call validate_output_to_57
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i22
addi $r0 $$locbase i1288      ; get offset to local
movi $r1 i5                   ; initialize constant into register
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
creta
jmpf $zero i1008              ; [call]: call output_amount_47
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i336       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i1848      ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
creta
jmpf $zero i977               ; [call]: call unwrap_46
move $r0 $$retv               ; [call]: copy the return value
eq   $r0 $r5 $r0
jnzf $r0 $zero i1
jmpf $zero i22
addi $r0 $$locbase i1304      ; get offset to local
movi $r1 i6                   ; initialize constant into register
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
creta
jmpf $zero i984               ; [call]: call output_amount_47
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i352       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i1904      ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
creta
jmpf $zero i953               ; [call]: call unwrap_46
move $r0 $$retv               ; [call]: copy the return value
eq   $r0 $r5 $r0
jnzf $r0 $zero i1
jmpf $zero i2
movi $r0 i8                   ; initialize constant into register
eq   $r0 $r3 $r0
move $$retv $r0               ; set return value
jmpf $zero i613
movi $r0 i7                   ; initialize constant into register
eq   $r0 $r3 $r0
jnzf $r0 $zero i358
movi $r0 i9                   ; initialize constant into register
eq   $r0 $r3 $r0
jnzf $r0 $zero i2
move $$retv $zero             ; set return value
jmpf $zero i605
addi $r0 $$locbase i1176      ; get offset to local
movi $r1 i4                   ; initialize constant into register
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
creta
jmpf $zero i948               ; [call]: call output_amount_47
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i224       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i1768      ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
creta
jmpf $zero i917               ; [call]: call unwrap_46
move $r3 $$retv               ; [call]: copy the return value
addi $r0 $$locbase i1192      ; get offset to local
movi $r1 i5                   ; initialize constant into register
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
creta
jmpf $zero i927               ; [call]: call output_amount_47
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i240       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i1784      ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
creta
jmpf $zero i896               ; [call]: call unwrap_46
move $r0 $$retv               ; [call]: copy the return value
gt   $r0 $r3 $r0
jnzf $r0 $zero i1
jmpf $zero i21
addi $r0 $$locbase i1208      ; get offset to local
movi $r1 i5                   ; initialize constant into register
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
creta
jmpf $zero i903               ; [call]: call output_amount_47
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i256       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i1800      ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
creta
jmpf $zero i872               ; [call]: call unwrap_46
move $r3 $$retv               ; [call]: copy the return value
addi $r0 $ssp i241            ; get address of configurable VRF
addi $r1 $$locbase i2272      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
move $$arg0 $zero             ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
movi $r0 i2                   ; initialize constant into register
move $$arg2 $r0               ; [call]: pass argument 2
creta
jmpf $zero i1219              ; [call]: call validate_output_55
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i13
addi $r0 $ssp i273            ; get address of configurable YES
addi $r1 $$locbase i2304      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
move $$arg0 $one              ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
movi $r0 i2                   ; initialize constant into register
move $$arg2 $r0               ; [call]: pass argument 2
creta
jmpf $zero i1204              ; [call]: call validate_output_55
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i14
addi $r0 $ssp i41             ; get address of configurable NO
addi $r1 $$locbase i2336      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i2                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
movi $r0 i2                   ; initialize constant into register
move $$arg2 $r0               ; [call]: pass argument 2
creta
jmpf $zero i1188              ; [call]: call validate_output_55
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i14
addi $r0 $ssp i177            ; get address of configurable TTD
addi $r1 $$locbase i2368      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i3                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
movi $r0 i2                   ; initialize constant into register
move $$arg2 $r0               ; [call]: pass argument 2
creta
jmpf $zero i1172              ; [call]: call validate_output_55
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i13
addi $r0 $ssp i273            ; get address of configurable YES
addi $r1 $$locbase i2400      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i4                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $zero             ; [call]: pass argument 2
creta
jmpf $zero i1157              ; [call]: call validate_output_55
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i13
addi $r0 $ssp i41             ; get address of configurable NO
addi $r1 $$locbase i2432      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i5                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $zero             ; [call]: pass argument 2
creta
jmpf $zero i1142              ; [call]: call validate_output_55
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i13
addi $r0 $ssp i177            ; get address of configurable TTD
addi $r1 $$locbase i2464      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i6                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $zero             ; [call]: pass argument 2
creta
jmpf $zero i1127              ; [call]: call validate_output_55
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i13
addi $r0 $ssp i177            ; get address of configurable TTD
addi $r1 $$locbase i2528      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i7                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $zero             ; [call]: pass argument 2
creta
jmpf $zero i1112              ; [call]: call validate_output_55
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i14
addi $r0 $ssp i0              ; get address of configurable BASE_ASSET
addi $r1 $$locbase i2560      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i8                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
movi $r0 i2                   ; initialize constant into register
move $$arg2 $r0               ; [call]: pass argument 2
creta
jmpf $zero i1096              ; [call]: call validate_output_55
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i29
addi $r0 $ssp i145            ; get address of configurable REDEMPTION_YES
addi $r1 $$locbase i3232      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i3                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
movi $r0 i2                   ; initialize constant into register
move $$arg2 $r0               ; [call]: pass argument 2
creta
jmpf $zero i1209              ; [call]: call validate_output_to_57
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i14
addi $r0 $ssp i113            ; get address of configurable REDEMPTION_NO
addi $r1 $$locbase i3264      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i3                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
movi $r0 i2                   ; initialize constant into register
move $$arg2 $r0               ; [call]: pass argument 2
creta
jmpf $zero i1194              ; [call]: call validate_output_to_57
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i27
addi $r0 $ssp i145            ; get address of configurable REDEMPTION_YES
addi $r1 $$locbase i3296      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i4                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $zero             ; [call]: pass argument 2
creta
jmpf $zero i1179              ; [call]: call validate_output_to_57
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i13
addi $r0 $ssp i113            ; get address of configurable REDEMPTION_NO
addi $r1 $$locbase i3328      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i4                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $zero             ; [call]: pass argument 2
creta
jmpf $zero i1165              ; [call]: call validate_output_to_57
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i27
addi $r0 $ssp i145            ; get address of configurable REDEMPTION_YES
addi $r1 $$locbase i3360      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i5                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $zero             ; [call]: pass argument 2
creta
jmpf $zero i1150              ; [call]: call validate_output_to_57
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i13
addi $r0 $ssp i113            ; get address of configurable REDEMPTION_NO
addi $r1 $$locbase i3392      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i5                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $zero             ; [call]: pass argument 2
creta
jmpf $zero i1136              ; [call]: call validate_output_to_57
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i13
addi $r0 $ssp i209            ; get address of configurable USER
addi $r1 $$locbase i3424      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i6                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $zero             ; [call]: pass argument 2
creta
jmpf $zero i1121              ; [call]: call validate_output_to_57
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i13
addi $r0 $ssp i81             ; get address of configurable ORACLE
addi $r1 $$locbase i3456      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i7                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $zero             ; [call]: pass argument 2
creta
jmpf $zero i1106              ; [call]: call validate_output_to_57
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i28
addi $r0 $$locbase i1224      ; get offset to local
movi $r1 i6                   ; initialize constant into register
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
creta
jmpf $zero i625               ; [call]: call output_amount_47
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i272       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i1816      ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
creta
jmpf $zero i594               ; [call]: call unwrap_46
move $r0 $$retv               ; [call]: copy the return value
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
creta
jmpf $zero i356               ; [call]: call ge_22
move $r0 $$retv               ; [call]: copy the return value
move $$retv $r0               ; set return value
jmpf $zero i252
addi $r0 $$locbase i1128      ; get offset to local
movi $r1 i3                   ; initialize constant into register
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
creta
jmpf $zero i595               ; [call]: call output_amount_47
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i176       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i1720      ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
creta
jmpf $zero i564               ; [call]: call unwrap_46
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $ssp i4              ; load word
mul  $r1 $r1 $r0
movi $r2 i100                 ; initialize constant into register
div  $r3 $r1 $r2
sub  $r5 $r0 $r3
addi $r0 $ssp i241            ; get address of configurable VRF
addi $r1 $$locbase i1984      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
move $$arg0 $zero             ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
movi $r0 i2                   ; initialize constant into register
move $$arg2 $r0               ; [call]: pass argument 2
creta
jmpf $zero i906               ; [call]: call validate_output_55
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i27
addi $r0 $ssp i273            ; get address of configurable YES
addi $r1 $$locbase i2016      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
move $$arg0 $one              ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
movi $r0 i2                   ; initialize constant into register
move $$arg2 $r0               ; [call]: pass argument 2
creta
jmpf $zero i891               ; [call]: call validate_output_55
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i13
addi $r0 $ssp i41             ; get address of configurable NO
addi $r1 $$locbase i2048      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
move $$arg0 $one              ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
movi $r0 i2                   ; initialize constant into register
move $$arg2 $r0               ; [call]: pass argument 2
creta
jmpf $zero i877               ; [call]: call validate_output_55
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i14
addi $r0 $ssp i177            ; get address of configurable TTD
addi $r1 $$locbase i2080      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i2                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
movi $r0 i2                   ; initialize constant into register
move $$arg2 $r0               ; [call]: pass argument 2
creta
jmpf $zero i861               ; [call]: call validate_output_55
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i27
addi $r0 $ssp i273            ; get address of configurable YES
addi $r1 $$locbase i2112      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i3                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $zero             ; [call]: pass argument 2
creta
jmpf $zero i846               ; [call]: call validate_output_55
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i13
addi $r0 $ssp i41             ; get address of configurable NO
addi $r1 $$locbase i2176      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i3                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $zero             ; [call]: pass argument 2
creta
jmpf $zero i832               ; [call]: call validate_output_55
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i13
addi $r0 $ssp i177            ; get address of configurable TTD
addi $r1 $$locbase i2208      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i4                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $zero             ; [call]: pass argument 2
creta
jmpf $zero i817               ; [call]: call validate_output_55
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i14
addi $r0 $ssp i0              ; get address of configurable BASE_ASSET
addi $r1 $$locbase i2240      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i6                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
movi $r0 i2                   ; initialize constant into register
move $$arg2 $r0               ; [call]: pass argument 2
creta
jmpf $zero i801               ; [call]: call validate_output_55
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i13
addi $r0 $ssp i209            ; get address of configurable USER
addi $r1 $$locbase i3072      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i4                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $zero             ; [call]: pass argument 2
creta
jmpf $zero i915               ; [call]: call validate_output_to_57
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i27
addi $r0 $ssp i145            ; get address of configurable REDEMPTION_YES
addi $r1 $$locbase i3104      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i3                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $zero             ; [call]: pass argument 2
creta
jmpf $zero i900               ; [call]: call validate_output_to_57
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i13
addi $r0 $ssp i113            ; get address of configurable REDEMPTION_NO
addi $r1 $$locbase i3136      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i3                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $zero             ; [call]: pass argument 2
creta
jmpf $zero i886               ; [call]: call validate_output_to_57
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i13
addi $r0 $ssp i81             ; get address of configurable ORACLE
addi $r1 $$locbase i3168      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i5                   ; initialize constant into register
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $zero             ; [call]: pass argument 2
creta
jmpf $zero i871               ; [call]: call validate_output_to_57
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i22
addi $r0 $$locbase i1144      ; get offset to local
movi $r1 i4                   ; initialize constant into register
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
creta
jmpf $zero i390               ; [call]: call output_amount_47
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i192       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i1736      ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
creta
jmpf $zero i359               ; [call]: call unwrap_46
move $r0 $$retv               ; [call]: copy the return value
eq   $r0 $r0 $r5
jnzf $r0 $zero i1
jmpf $zero i22
addi $r0 $$locbase i1160      ; get offset to local
movi $r1 i5                   ; initialize constant into register
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
creta
jmpf $zero i366               ; [call]: call output_amount_47
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i208       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i1752      ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
creta
jmpf $zero i335               ; [call]: call unwrap_46
move $r0 $$retv               ; [call]: copy the return value
eq   $r0 $r0 $r3
move $$retv $r0               ; set return value
cfsi i3992                    ; free 3992 bytes for locals and 0 slots for extra call arguments
move $$reta $r4               ; restore return address
poph i524288                  ; restore registers 40..64
popl i127                     ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i15                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function unwrap_18
cfei i40                      ; allocate 40 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
movi $r3 i40                  ; get data length for memory copy
mcp  $$locbase $r0 $r3        ; copy memory
lw   $r0 $r0 i0               ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i1
rvrt $zero
addi $r0 $$locbase i8         ; get offset to aggregate element
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
move $$retv $r1               ; set return value
cfsi i40                      ; free 40 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i15                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i31                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function input_type_21
cfei i128                     ; allocate 128 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (index)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
creta
jmpf $zero i77                ; [call]: call input_count_25
move $r3 $$retv               ; [call]: copy the return value
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
creta
jmpf $zero i56                ; [call]: call ge_22
move $r3 $$retv               ; [call]: copy the return value
jnzf $r3 $zero i45
gtf  $r0 $r0 i512             ; get transaction field
eq   $r3 $r0 $zero
jnzf $r3 $zero i32
eq   $r3 $r0 $one
jnzf $r3 $zero i20
movi $r3 i2                   ; initialize constant into register
eq   $r0 $r0 $r3
jnzf $r0 $zero i6
addi $r0 $$locbase i64        ; get offset to local
sw   $$locbase $zero i8       ; store word
addi $r4 $$locbase i80        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r4 $r0 $r3              ; copy memory
jmpf $zero i7
addi $r0 $$locbase i48        ; get offset to local
sw   $$locbase $one i6        ; store word
movi $r3 i2                   ; initialize constant into register
sw   $$locbase $r3 i7         ; store word
addi $r4 $$locbase i80        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r4 $r0 $r3              ; copy memory
addi $r3 $$locbase i96        ; get offset to local
movi $r0 i16                  ; get data length for memory copy
mcp  $r3 $r4 $r0              ; copy memory
jmpf $zero i6
addi $r0 $$locbase i32        ; get offset to local
sw   $$locbase $one i4        ; store word
sw   $$locbase $one i5        ; store word
addi $r3 $$locbase i96        ; get offset to local
movi $r4 i16                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
addi $r4 $$locbase i112       ; get offset to local
movi $r0 i16                  ; get data length for memory copy
mcp  $r4 $r3 $r0              ; copy memory
jmpf $zero i6
addi $r0 $$locbase i16        ; get offset to local
sw   $$locbase $one i2        ; store word
sw   $$locbase $zero i3       ; store word
addi $r4 $$locbase i112       ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r4 $r0 $r3              ; copy memory
movi $r0 i16                  ; get data length for memory copy
mcp  $r1 $r4 $r0              ; copy memory
move $$retv $r1               ; set return value
jmpf $zero i4
sw   $$locbase $zero i0       ; store word
movi $r0 i16                  ; get data length for memory copy
mcp  $r1 $$locbase $r0        ; copy memory
move $$retv $r1               ; set return value
cfsi i128                     ; free 128 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i31                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i15                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function ge_22
cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (other)
move $r2 $$reta               ; save return address
gt   $r3 $r0 $r1
jnzf $r3 $zero i1
eq   $r3 $r0 $r1
move $$retv $r3               ; set return value
cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i15                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i7                       ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function input_count_25
cfei i8                       ; allocate 8 bytes for locals and 0 slots for call arguments
move $r0 $$reta               ; save return address
move $$arg0 $$locbase         ; [call]: pass argument 0
creta
jmpf $zero i31                ; [call]: call tx_type_26
move $r1 $$retv               ; [call]: copy the return value
lw   $r1 $r1 i0               ; load word
eq   $r2 $r1 $zero
jnzf $r2 $zero i20
eq   $r2 $r1 $one
jnzf $r2 $zero i16
movi $r2 i3                   ; initialize constant into register
eq   $r2 $r1 $r2
jnzf $r2 $zero i11
movi $r2 i4                   ; initialize constant into register
eq   $r2 $r1 $r2
jnzf $r2 $zero i6
movi $r2 i5                   ; initialize constant into register
eq   $r1 $r1 $r2
jnzf $r1 $zero i1
rvrt $zero
gtf  $r1 $zero i5             ; get transaction field
jmpf $zero i1
gtf  $r1 $zero i5             ; get transaction field
jmpf $zero i1
gtf  $r1 $zero i5             ; get transaction field
jmpf $zero i1
gtf  $r1 $zero i259           ; get transaction field
jmpf $zero i1
gtf  $r1 $zero i5             ; get transaction field
move $$retv $r1               ; set return value
cfsi i8                       ; free 8 bytes for locals and 0 slots for extra call arguments
move $$reta $r0               ; restore return address
poph i524288                  ; restore registers 40..64
popl i7                       ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i15                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function tx_type_26
cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (__ret_value)
move $r1 $$reta               ; save return address
gtf  $r2 $zero i1             ; get transaction field
eq   $r3 $r2 $zero
jnzf $r3 $zero i20
eq   $r3 $r2 $one
jnzf $r3 $zero i16
movi $r3 i3                   ; initialize constant into register
eq   $r3 $r2 $r3
jnzf $r3 $zero i11
movi $r3 i4                   ; initialize constant into register
eq   $r3 $r2 $r3
jnzf $r3 $zero i6
movi $r3 i5                   ; initialize constant into register
eq   $r2 $r2 $r3
jnzf $r2 $zero i1
rvrt $zero
movi $r2 i5                   ; initialize constant into register
jmpf $zero i1
movi $r2 i4                   ; initialize constant into register
jmpf $zero i1
movi $r2 i3                   ; initialize constant into register
jmpf $zero i1
move $r2 $one                 ; move parameter from branch to block argument
jmpf $zero i1
move $r2 $zero                ; move parameter from branch to block argument
sw   $r0 $r2 i0               ; store word
move $$retv $r0               ; set return value
cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments
move $$reta $r1               ; restore return address
poph i524288                  ; restore registers 40..64
popl i15                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i63                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function input_coin_owner_27
cfei i264                     ; allocate 264 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (index)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
addi $r3 $$locbase i144       ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
creta
jmpb $zero i176               ; [call]: call input_type_21
move $r3 $$retv               ; [call]: copy the return value
movi $r4 i16                  ; get data length for memory copy
mcp  $$locbase $r3 $r4        ; copy memory
addi $r3 $$locbase i128       ; get offset to local
movi $r4 i16                  ; get data length for memory copy
mcp  $r3 $$locbase $r4        ; copy memory
lw   $r3 $$locbase i0         ; load word
eq   $r3 $r3 $one
jnzf $r3 $zero i1
jmpf $zero i2
lw   $r3 $$locbase i17        ; load word
eq   $r3 $r3 $zero
jnzf $r3 $zero i6
addi $r0 $$locbase i88        ; get offset to local
sw   $$locbase $zero i11      ; store word
addi $r4 $$locbase i224       ; get offset to local
movi $r3 i40                  ; get data length for memory copy
mcp  $r4 $r0 $r3              ; copy memory
jmpf $zero i23
addi $r3 $$locbase i48        ; get offset to local
sw   $$locbase $one i6        ; store word
gtf  $r0 $r0 i515             ; get transaction field
addi $r4 $$locbase i192       ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r0 $r5              ; copy memory
addi $r0 $$locbase i160       ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
creta
jmpf $zero i18                ; [call]: call from_28
move $r0 $$retv               ; [call]: copy the return value
addi $r4 $$locbase i16        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r0 $r5              ; copy memory
addi $r0 $r3 i8               ; get offset to aggregate element
movi $r5 i32                  ; get data length for memory copy
mcp  $r0 $r4 $r5              ; copy memory
addi $r4 $$locbase i224       ; get offset to local
movi $r0 i40                  ; get data length for memory copy
mcp  $r4 $r3 $r0              ; copy memory
movi $r0 i40                  ; get data length for memory copy
mcp  $r1 $r4 $r0              ; copy memory
move $$retv $r1               ; set return value
cfsi i264                     ; free 264 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i63                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i15                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function from_28
cfei i32                      ; allocate 32 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (bits)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
movi $r3 i32                  ; get data length for memory copy
mcp  $$locbase $r0 $r3        ; copy memory
movi $r0 i32                  ; get data length for memory copy
mcp  $r1 $$locbase $r0        ; copy memory
move $$retv $r1               ; set return value
cfsi i32                      ; free 32 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i15                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i15                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function eq_43
cfei i64                      ; allocate 64 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (other)
move $r2 $$reta               ; save return address
movi $r3 i32                  ; get data length for memory copy
mcp  $$locbase $r0 $r3        ; copy memory
addi $r0 $$locbase i32        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r3              ; copy memory
wqcm $r0 $$locbase $r0 i32
move $$retv $r0               ; set return value
cfsi i64                      ; free 64 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i15                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i7                       ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function output_count_44
cfei i8                       ; allocate 8 bytes for locals and 0 slots for call arguments
move $r0 $$reta               ; save return address
move $$arg0 $$locbase         ; [call]: pass argument 0
creta
jmpb $zero i143               ; [call]: call tx_type_26
move $r1 $$retv               ; [call]: copy the return value
lw   $r1 $r1 i0               ; load word
eq   $r2 $r1 $zero
jnzf $r2 $zero i20
eq   $r2 $r1 $one
jnzf $r2 $zero i16
movi $r2 i3                   ; initialize constant into register
eq   $r2 $r1 $r2
jnzf $r2 $zero i11
movi $r2 i4                   ; initialize constant into register
eq   $r2 $r1 $r2
jnzf $r2 $zero i6
movi $r2 i5                   ; initialize constant into register
eq   $r1 $r1 $r2
jnzf $r1 $zero i1
rvrt $zero
gtf  $r1 $zero i6             ; get transaction field
jmpf $zero i1
gtf  $r1 $zero i6             ; get transaction field
jmpf $zero i1
gtf  $r1 $zero i6             ; get transaction field
jmpf $zero i1
gtf  $r1 $zero i260           ; get transaction field
jmpf $zero i1
gtf  $r1 $zero i6             ; get transaction field
move $$retv $r1               ; set return value
cfsi i8                       ; free 8 bytes for locals and 0 slots for extra call arguments
move $$reta $r0               ; restore return address
poph i524288                  ; restore registers 40..64
popl i7                       ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i7                       ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function unwrap_46
cfei i16                      ; allocate 16 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$reta               ; save return address
movi $r2 i16                  ; get data length for memory copy
mcp  $$locbase $r0 $r2        ; copy memory
lw   $r0 $r0 i0               ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i1
rvrt $zero
lw   $r0 $$locbase i1         ; load word
move $$retv $r0               ; set return value
cfsi i16                      ; free 16 bytes for locals and 0 slots for extra call arguments
move $$reta $r1               ; restore return address
poph i524288                  ; restore registers 40..64
popl i7                       ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i63                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function output_amount_47
cfei i504                     ; allocate 504 bytes for locals and 0 slots for call arguments
move $r5 $$arg0               ; save argument 0 (index)
move $r4 $$arg1               ; save argument 1 (__ret_value)
move $r3 $$reta               ; save return address
addi $r0 $$locbase i280       ; get offset to local
move $$arg0 $r5               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
creta
jmpf $zero i225               ; [call]: call output_type_48
move $r0 $$retv               ; [call]: copy the return value
movi $r1 i16                  ; get data length for memory copy
mcp  $$locbase $r0 $r1        ; copy memory
addi $r0 $$locbase i256       ; get offset to local
movi $r1 i16                  ; get data length for memory copy
mcp  $r0 $$locbase $r1        ; copy memory
lw   $r0 $$locbase i0         ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i1
jmpf $zero i2
lw   $r0 $$locbase i33        ; load word
eq   $r0 $r0 $zero
jnzf $r0 $zero i197
lw   $r0 $$locbase i32        ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i1
jmpf $zero i2
lw   $r0 $$locbase i33        ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i181
lw   $r0 $$locbase i32        ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i1
jmpf $zero i3
lw   $r0 $$locbase i33        ; load word
movi $r1 i2                   ; initialize constant into register
eq   $r0 $r0 $r1
jnzf $r0 $zero i163
lw   $r0 $$locbase i32        ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i1
jmpf $zero i3
lw   $r0 $$locbase i33        ; load word
movi $r1 i3                   ; initialize constant into register
eq   $r0 $r0 $r1
jnzf $r0 $zero i28
lw   $r0 $$locbase i32        ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i1
jmpf $zero i3
lw   $r0 $$locbase i33        ; load word
movi $r1 i4                   ; initialize constant into register
eq   $r0 $r0 $r1
jnzf $r0 $zero i11
lw   $r0 $$locbase i32        ; load word
eq   $r0 $r0 $zero
jnzf $r0 $zero i2
load $r0 data_13              ; load constant from data section
rvrt $r0
addi $r0 $$locbase i192       ; get offset to local
sw   $$locbase $zero i24      ; store word
addi $r2 $$locbase i424       ; get offset to local
movi $r1 i16                  ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
jmpf $zero i5
addi $r0 $$locbase i160       ; get offset to local
sw   $$locbase $zero i20      ; store word
addi $r2 $$locbase i424       ; get offset to local
movi $r1 i16                  ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
addi $r5 $$locbase i440       ; get offset to local
movi $r0 i16                  ; get data length for memory copy
mcp  $r5 $r2 $r0              ; copy memory
jmpf $zero i123
addi $r0 $$locbase i296       ; get offset to local
move $$arg0 $r5               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
creta
jmpf $zero i154               ; [call]: call output_type_48
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i16        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i240       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
lw   $r0 $$locbase i2         ; load word
eq   $r0 $r0 $one
move $r1 $zero                ; move parameter from branch to block argument
jnzf $r0 $zero i1
move $r1 $one                 ; move parameter from branch to block argument
jnzf $r1 $zero i82
addi $r0 $$locbase i272       ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
creta
jmpb $zero i297               ; [call]: call tx_type_26
move $r0 $$retv               ; [call]: copy the return value
lw   $r0 $r0 i0               ; load word
eq   $r1 $r0 $zero
jnzf $r1 $zero i61
eq   $r1 $r0 $one
jnzf $r1 $zero i48
movi $r1 i3                   ; initialize constant into register
eq   $r1 $r0 $r1
jnzf $r1 $zero i34
movi $r1 i4                   ; initialize constant into register
eq   $r1 $r0 $r1
jnzf $r1 $zero i20
movi $r1 i5                   ; initialize constant into register
eq   $r0 $r0 $r1
jnzf $r0 $zero i6
addi $r0 $$locbase i224       ; get offset to local
sw   $$locbase $zero i28      ; store word
addi $r2 $$locbase i328       ; get offset to local
movi $r1 i16                  ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
jmpf $zero i7
addi $r0 $$locbase i208       ; get offset to local
sw   $$locbase $one i26       ; store word
gtf  $r1 $r5 i12              ; get transaction field
sw   $$locbase $r1 i27        ; store word
addi $r2 $$locbase i328       ; get offset to local
movi $r1 i16                  ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
addi $r1 $$locbase i344       ; get offset to local
movi $r0 i16                  ; get data length for memory copy
mcp  $r1 $r2 $r0              ; copy memory
jmpf $zero i7
addi $r0 $$locbase i176       ; get offset to local
sw   $$locbase $one i22       ; store word
gtf  $r1 $r5 i12              ; get transaction field
sw   $$locbase $r1 i23        ; store word
addi $r1 $$locbase i344       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r2 $$locbase i360       ; get offset to local
movi $r0 i16                  ; get data length for memory copy
mcp  $r2 $r1 $r0              ; copy memory
jmpf $zero i7
addi $r0 $$locbase i144       ; get offset to local
sw   $$locbase $one i18       ; store word
gtf  $r1 $r5 i12              ; get transaction field
sw   $$locbase $r1 i19        ; store word
addi $r2 $$locbase i360       ; get offset to local
movi $r1 i16                  ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
addi $r1 $$locbase i376       ; get offset to local
movi $r0 i16                  ; get data length for memory copy
mcp  $r1 $r2 $r0              ; copy memory
jmpf $zero i7
addi $r0 $$locbase i112       ; get offset to local
sw   $$locbase $one i14       ; store word
gtf  $r1 $r5 i265             ; get transaction field
sw   $$locbase $r1 i15        ; store word
addi $r1 $$locbase i376       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r2 $$locbase i392       ; get offset to local
movi $r0 i16                  ; get data length for memory copy
mcp  $r2 $r1 $r0              ; copy memory
jmpf $zero i7
addi $r0 $$locbase i80        ; get offset to local
sw   $$locbase $one i10       ; store word
gtf  $r1 $r5 i12              ; get transaction field
sw   $$locbase $r1 i11        ; store word
addi $r2 $$locbase i392       ; get offset to local
movi $r1 i16                  ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
addi $r1 $$locbase i408       ; get offset to local
movi $r0 i16                  ; get data length for memory copy
mcp  $r1 $r2 $r0              ; copy memory
jmpf $zero i5
addi $r0 $$locbase i48        ; get offset to local
sw   $$locbase $zero i6       ; store word
addi $r1 $$locbase i408       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i312       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
creta
jmpb $zero i210               ; [call]: call unwrap_46
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i128       ; get offset to local
sw   $$locbase $one i16       ; store word
lw   $r0 $r0 i5               ; lw r1 r2 i0
sw   $$locbase $r0 i17        ; store word
addi $r5 $$locbase i440       ; get offset to local
movi $r0 i16                  ; get data length for memory copy
mcp  $r5 $r1 $r0              ; copy memory
addi $r1 $$locbase i456       ; get offset to local
movi $r0 i16                  ; get data length for memory copy
mcp  $r1 $r5 $r0              ; copy memory
jmpf $zero i6
addi $r0 $$locbase i96        ; get offset to local
sw   $$locbase $one i12       ; store word
sw   $$locbase $zero i13      ; store word
addi $r1 $$locbase i456       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r2 $$locbase i472       ; get offset to local
movi $r0 i16                  ; get data length for memory copy
mcp  $r2 $r1 $r0              ; copy memory
jmpf $zero i5
addi $r0 $$locbase i64        ; get offset to local
sw   $$locbase $zero i8       ; store word
addi $r2 $$locbase i472       ; get offset to local
movi $r1 i16                  ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
addi $r1 $$locbase i488       ; get offset to local
movi $r0 i16                  ; get data length for memory copy
mcp  $r1 $r2 $r0              ; copy memory
jmpf $zero i7
addi $r0 $$locbase i32        ; get offset to local
sw   $$locbase $one i4        ; store word
gtf  $r1 $r5 i770             ; get transaction field
sw   $$locbase $r1 i5         ; store word
addi $r1 $$locbase i488       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i16                  ; get data length for memory copy
mcp  $r4 $r1 $r0              ; copy memory
move $$retv $r4               ; set return value
cfsi i504                     ; free 504 bytes for locals and 0 slots for extra call arguments
move $$reta $r3               ; restore return address
poph i524288                  ; restore registers 40..64
popl i63                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i31                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function output_type_48
cfei i192                     ; allocate 192 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (index)
move $r4 $$arg1               ; save argument 1 (__ret_value)
move $r3 $$reta               ; save return address
creta
jmpb $zero i308               ; [call]: call output_count_44
move $r1 $$retv               ; [call]: copy the return value
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
creta
jmpb $zero i505               ; [call]: call ge_22
move $r1 $$retv               ; [call]: copy the return value
jnzf $r1 $zero i73
gtf  $r0 $r0 i768             ; get transaction field
eq   $r1 $r0 $zero
jnzf $r1 $zero i60
eq   $r1 $r0 $one
jnzf $r1 $zero i48
movi $r1 i2                   ; initialize constant into register
eq   $r1 $r0 $r1
jnzf $r1 $zero i34
movi $r1 i3                   ; initialize constant into register
eq   $r1 $r0 $r1
jnzf $r1 $zero i20
movi $r1 i4                   ; initialize constant into register
eq   $r0 $r0 $r1
jnzf $r0 $zero i6
addi $r0 $$locbase i32        ; get offset to local
sw   $$locbase $zero i4       ; store word
addi $r2 $$locbase i112       ; get offset to local
movi $r1 i16                  ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
jmpf $zero i7
addi $r0 $$locbase i96        ; get offset to local
sw   $$locbase $one i12       ; store word
movi $r1 i4                   ; initialize constant into register
sw   $$locbase $r1 i13        ; store word
addi $r2 $$locbase i112       ; get offset to local
movi $r1 i16                  ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
addi $r1 $$locbase i128       ; get offset to local
movi $r0 i16                  ; get data length for memory copy
mcp  $r1 $r2 $r0              ; copy memory
jmpf $zero i7
addi $r0 $$locbase i80        ; get offset to local
sw   $$locbase $one i10       ; store word
movi $r1 i3                   ; initialize constant into register
sw   $$locbase $r1 i11        ; store word
addi $r1 $$locbase i128       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r2 $$locbase i144       ; get offset to local
movi $r0 i16                  ; get data length for memory copy
mcp  $r2 $r1 $r0              ; copy memory
jmpf $zero i7
addi $r0 $$locbase i64        ; get offset to local
sw   $$locbase $one i8        ; store word
movi $r1 i2                   ; initialize constant into register
sw   $$locbase $r1 i9         ; store word
addi $r2 $$locbase i144       ; get offset to local
movi $r1 i16                  ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
addi $r1 $$locbase i160       ; get offset to local
movi $r0 i16                  ; get data length for memory copy
mcp  $r1 $r2 $r0              ; copy memory
jmpf $zero i6
addi $r0 $$locbase i48        ; get offset to local
sw   $$locbase $one i6        ; store word
sw   $$locbase $one i7        ; store word
addi $r1 $$locbase i160       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r2 $$locbase i176       ; get offset to local
movi $r0 i16                  ; get data length for memory copy
mcp  $r2 $r1 $r0              ; copy memory
jmpf $zero i6
addi $r0 $$locbase i16        ; get offset to local
sw   $$locbase $one i2        ; store word
sw   $$locbase $zero i3       ; store word
addi $r2 $$locbase i176       ; get offset to local
movi $r1 i16                  ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
movi $r0 i16                  ; get data length for memory copy
mcp  $r4 $r2 $r0              ; copy memory
move $$retv $r4               ; set return value
jmpf $zero i4
sw   $$locbase $zero i0       ; store word
movi $r0 i16                  ; get data length for memory copy
mcp  $r4 $$locbase $r0        ; copy memory
move $$retv $r4               ; set return value
cfsi i192                     ; free 192 bytes for locals and 0 slots for extra call arguments
move $$reta $r3               ; restore return address
poph i524288                  ; restore registers 40..64
popl i31                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i63                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function validate_output_55
cfei i304                     ; allocate 304 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (index)
move $r1 $$arg1               ; save argument 1 (expected_asset_id)
move $r2 $$arg2               ; save argument 2 (expected_asset_type)
move $r3 $$reta               ; save return address
addi $r4 $$locbase i96        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
creta
jmpb $zero i115               ; [call]: call output_type_48
move $r4 $$retv               ; [call]: copy the return value
movi $r5 i16                  ; get data length for memory copy
mcp  $$locbase $r4 $r5        ; copy memory
addi $r4 $$locbase i80        ; get offset to local
movi $r5 i16                  ; get data length for memory copy
mcp  $r4 $$locbase $r5        ; copy memory
lw   $r4 $$locbase i0         ; load word
eq   $r4 $r4 $one
jnzf $r4 $zero i1
jmpf $zero i2
lw   $r4 $$locbase i11        ; load word
eq   $r4 $r4 $zero
jnzf $r4 $zero i39
lw   $r4 $$locbase i10        ; load word
eq   $r4 $r4 $one
jnzf $r4 $zero i1
jmpf $zero i3
lw   $r4 $$locbase i11        ; load word
movi $r5 i2                   ; initialize constant into register
eq   $r4 $r4 $r5
move $r5 $zero                ; move parameter from branch to block argument
jnzf $r4 $zero i1
jmpf $zero i28
addi $r4 $$locbase i144       ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
creta
jmpf $zero i55                ; [call]: call output_asset_id_56
move $r0 $$retv               ; [call]: copy the return value
addi $r4 $$locbase i48        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r0 $r5              ; copy memory
addi $r0 $$locbase i240       ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r0 $r4 $r5              ; copy memory
addi $r4 $$locbase i272       ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r1 $r5              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
creta
jmpb $zero i479               ; [call]: call eq_43
move $r5 $$retv               ; [call]: copy the return value
jnzf $r5 $zero i1
jmpf $zero i2
movi $r0 i2                   ; initialize constant into register
eq   $r5 $r2 $r0
jmpf $zero i27
addi $r4 $$locbase i112       ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
creta
jmpf $zero i26                ; [call]: call output_asset_id_56
move $r0 $$retv               ; [call]: copy the return value
addi $r4 $$locbase i16        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r0 $r5              ; copy memory
addi $r0 $$locbase i176       ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r0 $r4 $r5              ; copy memory
addi $r4 $$locbase i208       ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r1 $r5              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
creta
jmpb $zero i508               ; [call]: call eq_43
move $r5 $$retv               ; [call]: copy the return value
jnzf $r5 $zero i1
jmpf $zero i1
eq   $r5 $r2 $zero
move $$retv $r5               ; set return value
cfsi i304                     ; free 304 bytes for locals and 0 slots for extra call arguments
move $$reta $r3               ; restore return address
poph i524288                  ; restore registers 40..64
popl i63                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i31                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function output_asset_id_56
cfei i96                      ; allocate 96 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (index)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
gtf  $r0 $r0 i771             ; get transaction field
addi $r3 $$locbase i64        ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
addi $r0 $$locbase i32        ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
creta
jmpb $zero i553               ; [call]: call from_28
move $r0 $$retv               ; [call]: copy the return value
movi $r3 i32                  ; get data length for memory copy
mcp  $$locbase $r0 $r3        ; copy memory
movi $r0 i32                  ; get data length for memory copy
mcp  $r1 $$locbase $r0        ; copy memory
move $$retv $r1               ; set return value
cfsi i96                      ; free 96 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i31                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i63                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function validate_output_to_57
cfei i304                     ; allocate 304 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (index)
move $r1 $$arg1               ; save argument 1 (expected_address_to)
move $r2 $$arg2               ; save argument 2 (expected_asset_type)
move $r3 $$reta               ; save return address
addi $r4 $$locbase i96        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
creta
jmpb $zero i244               ; [call]: call output_type_48
move $r4 $$retv               ; [call]: copy the return value
movi $r5 i16                  ; get data length for memory copy
mcp  $$locbase $r4 $r5        ; copy memory
addi $r4 $$locbase i80        ; get offset to local
movi $r5 i16                  ; get data length for memory copy
mcp  $r4 $$locbase $r5        ; copy memory
lw   $r4 $$locbase i0         ; load word
eq   $r4 $r4 $one
jnzf $r4 $zero i1
jmpf $zero i2
lw   $r4 $$locbase i11        ; load word
eq   $r4 $r4 $zero
jnzf $r4 $zero i39
lw   $r4 $$locbase i10        ; load word
eq   $r4 $r4 $one
jnzf $r4 $zero i1
jmpf $zero i3
lw   $r4 $$locbase i11        ; load word
movi $r5 i2                   ; initialize constant into register
eq   $r4 $r4 $r5
move $r5 $zero                ; move parameter from branch to block argument
jnzf $r4 $zero i1
jmpf $zero i28
addi $r4 $$locbase i144       ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
creta
jmpf $zero i55                ; [call]: call output_asset_to_58
move $r0 $$retv               ; [call]: copy the return value
addi $r4 $$locbase i48        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r0 $r5              ; copy memory
addi $r0 $$locbase i240       ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r0 $r4 $r5              ; copy memory
addi $r4 $$locbase i272       ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r1 $r5              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
creta
jmpb $zero i608               ; [call]: call eq_43
move $r5 $$retv               ; [call]: copy the return value
jnzf $r5 $zero i1
jmpf $zero i2
movi $r0 i2                   ; initialize constant into register
eq   $r5 $r2 $r0
jmpf $zero i27
addi $r4 $$locbase i112       ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
creta
jmpf $zero i26                ; [call]: call output_asset_to_58
move $r0 $$retv               ; [call]: copy the return value
addi $r4 $$locbase i16        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r0 $r5              ; copy memory
addi $r0 $$locbase i176       ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r0 $r4 $r5              ; copy memory
addi $r4 $$locbase i208       ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r1 $r5              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
creta
jmpb $zero i637               ; [call]: call eq_43
move $r5 $$retv               ; [call]: copy the return value
jnzf $r5 $zero i1
jmpf $zero i1
eq   $r5 $r2 $zero
move $$retv $r5               ; set return value
cfsi i304                     ; free 304 bytes for locals and 0 slots for extra call arguments
move $$reta $r3               ; restore return address
poph i524288                  ; restore registers 40..64
popl i63                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i31                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function output_asset_to_58
cfei i96                      ; allocate 96 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (index)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
gtf  $r0 $r0 i769             ; get transaction field
addi $r3 $$locbase i64        ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
addi $r0 $$locbase i32        ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
creta
jmpb $zero i682               ; [call]: call from_28
move $r0 $$retv               ; [call]: copy the return value
movi $r3 i32                  ; get data length for memory copy
mcp  $$locbase $r0 $r3        ; copy memory
movi $r0 i32                  ; get data length for memory copy
mcp  $r1 $$locbase $r0        ; copy memory
move $$retv $r1               ; set return value
cfsi i96                      ; free 96 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i31                      ; restore registers 16..40
jmp $$reta                    ; return from call
.data:
data_0 .bytes[32] f8 f8 b6 28 3d 7f a5 b6 72 b5 30 cb b8 4f cc cb 4f f8 dc 40 f8 17 6e f4 54 4d db 1f 19 52 ad 07  ...(=...r.0..O..O..@..n.TM...R..
data_1 .bytes[8] 00 00 00 00 00 00 00 00  ........
data_2 .bytes[1] 01  .
data_3 .bytes[32] 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01  ................................
data_4 .bytes[8] 00 00 00 00 00 00 00 03  ........
data_5 .bytes[32] 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01  ................................
data_6 .bytes[32] 6b 63 80 4c fb f9 85 6e 68 e5 b6 e7 ae f2 38 dc 83 11 ec 55 be c0 4d f7 74 00 3a 2c 96 e0 41 8e  kc.L...nh.....8....U..M.t.:,..A.
data_7 .bytes[32] 6b 63 80 4c fb f9 85 6e 68 e5 b6 e7 ae f2 38 dc 83 11 ec 55 be c0 4d f7 74 00 3a 2c 96 e0 41 8e  kc.L...nh.....8....U..M.t.:,..A.
data_8 .bytes[32] 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01  ................................
data_9 .bytes[32] 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01  ................................
data_10 .bytes[32] 86 4b 23 e3 bf 2d 3d 0c c9 7c 54 9d 22 12 a4 00 68 2f 40 cd 86 05 b9 10 02 74 3c 48 73 cd 90 74  .K#..-=..|T."...h/@......t<Hs..t
data_11 .bytes[32] 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01  ................................
data_12 .bytes[8] 00 00 00 00 00 00 00 07  ........
data_13 .word 14757395258967588866
