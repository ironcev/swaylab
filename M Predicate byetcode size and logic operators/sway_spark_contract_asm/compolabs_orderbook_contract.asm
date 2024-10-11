.program:
move $$tmp $pc
jmpf $zero i2
DATA_SECTION_OFFSET[0..32]
DATA_SECTION_OFFSET[32..64]
lw   $$ds $$tmp i1
add  $$ds $$ds $$tmp
cfei i48                      ; allocate stack space for globals
addr $$arg0 data_0            ; get pointer to configurable PRICE_DECIMALS default value
addi $$arg1 $zero i4          ; get length of configurable PRICE_DECIMALS default value
addi $$arg2 $ssp i0           ; get pointer to configurable PRICE_DECIMALS stack address
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; set new return address
jmpf $zero i3487              ; decode configurable PRICE_DECIMALS
addr $$arg0 data_1            ; get pointer to configurable QUOTE_TOKEN default value
addi $$arg1 $zero i32         ; get length of configurable QUOTE_TOKEN default value
addi $$arg2 $ssp i8           ; get pointer to configurable QUOTE_TOKEN stack address
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; set new return address
jmpf $zero i3591              ; decode configurable QUOTE_TOKEN
addr $$arg0 data_2            ; get pointer to configurable QUOTE_TOKEN_DECIMALS default value
addi $$arg1 $zero i4          ; get length of configurable QUOTE_TOKEN_DECIMALS default value
addi $$arg2 $ssp i40          ; get pointer to configurable QUOTE_TOKEN_DECIMALS stack address
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; set new return address
jmpf $zero i3473              ; decode configurable QUOTE_TOKEN_DECIMALS
jmpf $zero i0                 ; jump to ABI function selector
move $$locbase $sp            ; save locals base register for function __entry
cfei i20560                   ; allocate 20560 bytes for locals and 0 slots for call arguments
load $r4 data_4               ; get local constant
move $r0 $fp                  ; return value from ASM block with return register fp
movi $r1 i592                 ; initialize constant into register
add  $r0 $r0 $r1
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3666              ; [call]: call read_17
move $r0 $$retv               ; [call]: copy the return value
sw   $$locbase $r0 i2321      ; store word
move $r0 $fp                  ; return value from ASM block with return register fp
movi $r1 i584                 ; initialize constant into register
add  $r0 $r0 $r1
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3656              ; [call]: call read_17
move $r0 $$retv               ; [call]: copy the return value
sw   $$locbase $r0 i2411      ; store word
movi $r0 i19288               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3658              ; [call]: call read_8_bytes_21
move $r1 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i3880      ; get offset to local
movi $r3 i8                   ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
sw   $$locbase $r1 i486       ; store word
movi $r3 i16                  ; get data length for memory copy
mcp  $$locbase $r2 $r3        ; copy memory
movi $r2 i20304               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r2 $$locbase $r3        ; copy memory
lw   $r2 $r0 i0               ; load word
add  $r2 $r2 $r1
sw   $r0 $r2 i0               ; store word
movi $r0 i10712               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $$locbase $r2        ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3651              ; [call]: call ptr_23
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i3864      ; get offset to local
sw   $$locbase $r0 i483       ; store word
sw   $$locbase $r1 i484       ; store word
addi $r0 $$locbase i16        ; get offset to local
movi $r1 i16                  ; get data length for memory copy
mcp  $r0 $r2 $r1              ; copy memory
movi $r1 i18576               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r1 $$locbase i3848      ; get offset to local
sw   $$locbase $r4 i481       ; store word
movi $r2 i12                  ; initialize constant into register
sw   $$locbase $r2 i482       ; store word
movi $r2 i4784                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i16272               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
movi $r0 i16976               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3634              ; [call]: call eq_25
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i3352
load $r0 data_5               ; get local constant
movi $r1 i18576               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i5968                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
sw   $$locbase $r0 i746       ; store word
movi $r0 i13                  ; initialize constant into register
sw   $$locbase $r0 i747       ; store word
movi $r0 i6128                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
movi $r2 i17592               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i10760               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3605              ; [call]: call eq_25
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i2905
load $r0 data_17              ; get local constant
movi $r1 i18576               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i6336                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
sw   $$locbase $r0 i792       ; store word
movi $r0 i17                  ; initialize constant into register
sw   $$locbase $r0 i793       ; store word
movi $r0 i6424                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
movi $r2 i11112               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i11480               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3576              ; [call]: call eq_25
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i2744
load $r0 data_18              ; get local constant
movi $r1 i18576               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i6520                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
sw   $$locbase $r0 i815       ; store word
movi $r0 i16                  ; initialize constant into register
sw   $$locbase $r0 i816       ; store word
movi $r0 i6536                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
movi $r2 i11992               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i12832               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3547              ; [call]: call eq_25
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i2579
load $r0 data_19              ; get local constant
movi $r1 i18576               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i6552                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
sw   $$locbase $r0 i819       ; store word
movi $r0 i32                  ; initialize constant into register
sw   $$locbase $r0 i820       ; store word
movi $r0 i6640                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
movi $r2 i13608               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i14016               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3518              ; [call]: call eq_25
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i2343
load $r0 data_20              ; get local constant
movi $r1 i18576               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i4800                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
sw   $$locbase $r0 i600       ; store word
movi $r0 i13                  ; initialize constant into register
sw   $$locbase $r0 i601       ; store word
movi $r0 i4856                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
movi $r2 i14256               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i14576               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3489              ; [call]: call eq_25
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i2133
load $r0 data_7               ; get local constant
movi $r1 i18576               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i5696                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
sw   $$locbase $r0 i712       ; store word
movi $r0 i12                  ; initialize constant into register
sw   $$locbase $r0 i713       ; store word
movi $r0 i5784                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
movi $r2 i14672               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i14704               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3460              ; [call]: call eq_25
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i2051
load $r0 data_8               ; get local constant
movi $r1 i18576               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i5872                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
sw   $$locbase $r0 i734       ; store word
movi $r0 i17                  ; initialize constant into register
sw   $$locbase $r0 i735       ; store word
movi $r0 i5888                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
movi $r2 i14720               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i14736               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3431              ; [call]: call eq_25
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1978
load $r0 data_9               ; get local constant
movi $r1 i18576               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i5904                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
sw   $$locbase $r0 i738       ; store word
movi $r0 i10                  ; initialize constant into register
sw   $$locbase $r0 i739       ; store word
movi $r0 i5920                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
movi $r2 i14752               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i14768               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3402              ; [call]: call eq_25
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i499
load $r0 data_15              ; get local constant
movi $r1 i18576               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i5936                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
sw   $$locbase $r0 i742       ; store word
movi $r0 i11                  ; initialize constant into register
sw   $$locbase $r0 i743       ; store word
movi $r0 i5952                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
movi $r2 i14784               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i14800               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3373              ; [call]: call eq_25
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i355
load $r0 data_16              ; get local constant
movi $r1 i18576               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i5984                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
sw   $$locbase $r0 i748       ; store word
movi $r0 i16                  ; initialize constant into register
sw   $$locbase $r0 i749       ; store word
movi $r0 i6000                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
movi $r2 i14816               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i14832               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3344              ; [call]: call eq_25
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i2
movi $r0 i123                 ; initialize constant into register
rvrt $r0
load $r0 data_12              ; get local constant
load $r1 data_12              ; get local constant
movi $r2 i18568               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i10344               ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i10765             ; [call]: call abi_decode_284
move $r2 $$retv               ; [call]: copy the return value
addi $r3 $$locbase i3816      ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $r2 $r4              ; copy memory
movi $r2 i19192               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r2 $r3 $r4              ; copy memory
movi $r2 i19192               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
addi $r3 $$locbase i3968      ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
sw   $$locbase $zero i500     ; store word
addi $r0 $r3 i40              ; get offset to aggregate element
movi $r4 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r4              ; copy memory
movi $r0 i17848               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i72                  ; get data length for memory copy
mcp  $r0 $r3 $r1              ; copy memory
movi $r1 i17920               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r2 $r3              ; copy memory
movi $r2 i9072                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i5925              ; [call]: call get_130
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i224       ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r2 $$locbase i104       ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i12760               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
movi $r2 i9856                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i9995              ; [call]: call field_id_251
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i176       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i10904               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
movi $r2 i9224                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $zero             ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i8160              ; [call]: call read_178
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i208       ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i11360               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $zero             ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i8496              ; [call]: call unwrap_or_194
move $r0 $$retv               ; [call]: copy the return value
eq   $r2 $r0 $zero
jnzf $r2 $zero i71
movi $r2 i32                  ; initialize constant into register
mul  $r0 $r0 $r2
movi $r2 i31                  ; initialize constant into register
add  $r2 $r0 $r2
movi $r3 i5                   ; initialize constant into register
srl  $r2 $r2 $r3
movi $r3 i32                  ; initialize constant into register
mul  $r3 $r2 $r3
aloc $r3                      ; aloc size
move $r3 $hp                  ; return value from ASM block with return register hp
movi $r4 i12848               ; get offset to local
add  $r4 $$locbase $r4        ; get offset to local
movi $r5 i72                  ; get data length for memory copy
mcp  $r4 $r1 $r5              ; copy memory
movi $r1 i9888                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i9939              ; [call]: call field_id_251
move $r1 $$retv               ; [call]: copy the return value
addi $r4 $$locbase i296       ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r1 $r5              ; copy memory
movi $r1 i11448               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r1 $r4 $r5              ; copy memory
movi $r4 i9640                ; get offset to local
add  $r4 $$locbase $r4        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i8699              ; [call]: call sha256_209
move $r1 $$retv               ; [call]: copy the return value
addi $r4 $$locbase i328       ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r1 $r5              ; copy memory
movi $r1 i19640               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r1 $r4 $r5              ; copy memory
srwq $r3 $r1 $r1 $r2          ; read sequence of storage slots
movi $r1 i5680                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
sw   $$locbase $r3 i710       ; store word
sw   $$locbase $r0 i711       ; store word
addi $r0 $$locbase i360       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r1 i14464               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i10496               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i12276             ; [call]: call from_366
move $r0 $$retv               ; [call]: copy the return value
lw   $r4 $r0 i0               ; load word
lw   $r5 $r0 i1               ; load word
lw   $r6 $r0 i2               ; load word
jmpf $zero i5
move $r0 $zero                ; copy ASM block argument's constant initial value to register
aloc $r0                      ; aloc size
move $r4 $hp                  ; move ptr hp
move $r6 $zero                ; move parameter from branch to block argument
move $r5 $zero                ; move parameter from branch to block argument
movi $r0 i7248                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3477              ; [call]: call new_39
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
movi $r3 i15736               ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
sw   $$locbase $r4 i1967      ; store word
sw   $$locbase $r5 i1968      ; store word
sw   $$locbase $r6 i1969      ; store word
move $$arg0 $r3               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i4054              ; [call]: call len_78
move $r7 $$retv               ; [call]: copy the return value
movi $r3 i14912               ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
sw   $$locbase $r1 i1864      ; store word
sw   $$locbase $r2 i1865      ; store word
sw   $$locbase $r0 i1866      ; store word
movi $r0 i10016               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r7               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3399              ; [call]: call abi_encode_38
move $r0 $$retv               ; [call]: copy the return value
lw   $r10 $r0 i0              ; load word
lw   $r9 $r0 i1               ; load word
lw   $r8 $r0 i2               ; load word
move $r11 $zero               ; move parameter from branch to block argument
lt   $r0 $r11 $r7
jnzf $r0 $zero i42
movi $r0 i15104               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
sw   $$locbase $r10 i1888     ; store word
sw   $$locbase $r9 i1889      ; store word
sw   $$locbase $r8 i1890      ; store word
movi $r1 i7416                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3455              ; [call]: call as_raw_slice_40
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i480       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i18960               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r0 i15824               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3074              ; [call]: call ptr_23
move $r0 $$retv               ; [call]: copy the return value
movi $r2 i14288               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i10503             ; [call]: call len_282
move $r1 $$retv               ; [call]: copy the return value
retd  $r0 $r1
movi $r0 i14368               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
sw   $$locbase $r4 i1796      ; store word
sw   $$locbase $r5 i1797      ; store word
sw   $$locbase $r6 i1798      ; store word
movi $r1 i10424               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r11              ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i12025             ; [call]: call get_334
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i408       ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i11376               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r1 i9512                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i8326              ; [call]: call unwrap_200
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i448       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i19544               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r0 i13552               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r1 i13584               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
sw   $$locbase $r10 i1698     ; store word
sw   $$locbase $r9 i1699      ; store word
sw   $$locbase $r8 i1700      ; store word
movi $r2 i9992                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i10063             ; [call]: call abi_encode_256
move $r0 $$retv               ; [call]: copy the return value
lw   $r10 $r0 i0              ; load word
lw   $r9 $r0 i1               ; load word
lw   $r8 $r0 i2               ; load word
add  $r11 $r11 $one
jmpb $zero i104
movi $r0 i18568               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i8824                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3100              ; [call]: call decode_30
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i3640      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i19160               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r0 i19160               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i14640               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i10584               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i12973             ; [call]: call order_by_id
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i3672      ; get offset to local
movi $r2 i128                 ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i18816               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i128                 ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r0 i7224                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3290              ; [call]: call new_39
move $r0 $$retv               ; [call]: copy the return value
lw   $r2 $r0 i0               ; load word
lw   $r3 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
movi $r4 i13792               ; get offset to local
add  $r4 $$locbase $r4        ; get offset to local
movi $r5 i128                 ; get data length for memory copy
mcp  $r4 $r1 $r5              ; copy memory
movi $r1 i13920               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
sw   $$locbase $r2 i1740      ; store word
sw   $$locbase $r3 i1741      ; store word
sw   $$locbase $r0 i1742      ; store word
movi $r0 i10112               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i10078             ; [call]: call abi_encode_261
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
movi $r3 i15080               ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
sw   $$locbase $r1 i1885      ; store word
sw   $$locbase $r2 i1886      ; store word
sw   $$locbase $r0 i1887      ; store word
movi $r0 i7400                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3278              ; [call]: call as_raw_slice_40
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i3800      ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i18944               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r0 i15624               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i2897              ; [call]: call ptr_23
move $r0 $$retv               ; [call]: copy the return value
movi $r2 i14272               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i10326             ; [call]: call len_282
move $r1 $$retv               ; [call]: copy the return value
retd  $r0 $r1
movi $r0 i18568               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i7040                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i2795              ; [call]: call abi_decode_11
move $r1 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i1456      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i2850              ; [call]: call read_8_bytes_21
move $r1 $$retv               ; [call]: copy the return value
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i2723              ; [call]: call read_4
move $r3 $$retv               ; [call]: copy the return value
eq   $r4 $r3 $zero
move $r5 $zero                ; move parameter from branch to block argument
jnzf $r4 $zero i4
eq   $r3 $r3 $one
move $r5 $one                 ; move parameter from branch to block argument
jnzf $r3 $zero i1
rvrt $zero
load $r3 data_6               ; get local constant
load $r4 data_6               ; get local constant
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i2827              ; [call]: call read_8_bytes_21
move $r0 $$retv               ; [call]: copy the return value
movi $r6 i4728                ; get offset to local
add  $r6 $$locbase $r6        ; get offset to local
movi $r7 i32                  ; get data length for memory copy
mcp  $r6 $r2 $r7              ; copy memory
addi $r2 $r6 i32              ; get offset to aggregate element
sw   $$locbase $r1 i595       ; store word
addi $r1 $r2 i8               ; get offset to aggregate element
sb   $r1 $r5 i0               ; store byte
sw   $$locbase $r0 i597       ; store word
movi $r0 i19104               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i56                  ; get data length for memory copy
mcp  $r0 $r6 $r1              ; copy memory
movi $r6 i19104               ; get offset to local
add  $r6 $$locbase $r6        ; get offset to local
movi $r0 i19104               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
addi $r7 $r0 i32              ; get offset to aggregate element
movi $r0 i19104               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
addi $r8 $r0 i48              ; get offset to aggregate element
lw   $r5 $$locbase i2394      ; load word
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i2954              ; [call]: call reentrancy_guard_33
addi $r0 $$locbase i3896      ; get offset to local
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $r3 $r1              ; copy memory
sw   $$locbase $zero i491     ; store word
addi $r1 $r0 i40              ; get offset to aggregate element
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r4 $r2              ; copy memory
movi $r1 i17416               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i17488               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r6 $r2              ; copy memory
movi $r2 i8752                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i5441              ; [call]: call get_130
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i1592      ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r2 $$locbase i1520      ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i17136               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
movi $r2 i8576                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i5409              ; [call]: call slot_128
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i1664      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i15640               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r0 $r1 $r3              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3391              ; [call]: call offset_67
move $r0 $$retv               ; [call]: copy the return value
movi $r1 i16912               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r2 $r3              ; copy memory
movi $r2 i8416                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i5223              ; [call]: call read_125
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i1696      ; get offset to local
movi $r2 i48                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i19672               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i48                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
lw   $r0 $r7 i0               ; load word
eq   $r0 $r0 $zero
eq   $r0 $r0 $zero
movi $r1 i15792               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i10                  ; initialize constant into register
sw   $$locbase $r2 i1974      ; store word
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3849              ; [call]: call require_97
lw   $r0 $$locbase i2459      ; load word
eq   $r0 $r0 $one
move $r1 $one                 ; move parameter from branch to block argument
jnzf $r0 $zero i1
move $r1 $zero                ; move parameter from branch to block argument
movi $r0 i15800               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i2                   ; initialize constant into register
sw   $$locbase $r2 i1975      ; store word
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3834              ; [call]: call require_97
eq   $r0 $r5 $zero
eq   $r0 $r0 $zero
movi $r1 i15808               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i9                   ; initialize constant into register
sw   $$locbase $r2 i1976      ; store word
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3822              ; [call]: call require_97
movi $r0 i19672               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i16800               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i48                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i8248                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i5139              ; [call]: call unwrap_123
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i1744      ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i19720               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r4 $r7 i8               ; get offset to aggregate element
lb   $r0 $r4 i0               ; load byte
jnzf $r0 $zero i69
move $r0 $bal                 ; return value from ASM block with return register bal
lw   $r1 $r7 i0               ; load word
lw   $r2 $$locbase i2469      ; load word
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
move $$arg2 $r5               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i5383              ; [call]: call base_size_to_quote_amount_136
move $r1 $$retv               ; [call]: copy the return value
eq   $r0 $r0 $r1
movi $r1 i15848               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i8                   ; initialize constant into register
sw   $$locbase $r2 i1981      ; store word
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3775              ; [call]: call require_97
addi $r0 $fp i32              ; addi asset_id fp i32
addi $r1 $$locbase i1848      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i16208               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r1 i7992                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i4844              ; [call]: call from_115
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i1880      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $ssp i8              ; get address of configurable QUOTE_TOKEN
movi $r2 i15272               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i15304               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3024              ; [call]: call eq_50
move $r0 $$retv               ; [call]: copy the return value
movi $r1 i15856               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i7                   ; initialize constant into register
sw   $$locbase $r2 i1982      ; store word
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3729              ; [call]: call require_97
jmpf $zero i58
move $r0 $bal                 ; return value from ASM block with return register bal
lw   $r1 $r7 i0               ; load word
eq   $r0 $r0 $r1
movi $r1 i15816               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i8                   ; initialize constant into register
sw   $$locbase $r2 i1977      ; store word
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3715              ; [call]: call require_97
addi $r0 $fp i32              ; addi asset_id fp i32
addi $r1 $$locbase i1784      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i16176               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r1 i7960                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i4784              ; [call]: call from_115
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i1816      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i15208               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r1 i15240               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r6 $r2              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i2965              ; [call]: call eq_50
move $r0 $$retv               ; [call]: copy the return value
movi $r1 i15840               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i7                   ; initialize constant into register
sw   $$locbase $r2 i1980      ; store word
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3670              ; [call]: call require_97
load $r0 data_10              ; get local constant
load $r1 data_10              ; get local constant
movi $r2 i7808                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r2               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i4135              ; [call]: call msg_sender_address_103
move $r2 $$retv               ; [call]: copy the return value
addi $r3 $$locbase i1912      ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r3 $r2 $r5              ; copy memory
movi $r2 i19760               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r2 $r3 $r5              ; copy memory
movi $r2 i4104                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r2 $r3 $r5              ; copy memory
addi $r3 $r2 i32              ; get offset to aggregate element
movi $r5 i32                  ; get data length for memory copy
mcp  $r3 $r6 $r5              ; copy memory
addi $r3 $r2 i64              ; get offset to aggregate element
movi $r5 i8                   ; get data length for memory copy
mcp  $r3 $r8 $r5              ; copy memory
movi $r3 i14392               ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
movi $r5 i72                  ; get data length for memory copy
mcp  $r3 $r2 $r5              ; copy memory
movi $r2 i10464               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i11555             ; [call]: call sha256_349
move $r2 $$retv               ; [call]: copy the return value
addi $r3 $$locbase i1992      ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r3 $r2 $r5              ; copy memory
movi $r2 i20192               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r2 $r3 $r5              ; copy memory
movi $r2 i6568                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r5              ; copy memory
sw   $$locbase $zero i825     ; store word
addi $r0 $r2 i40              ; get offset to aggregate element
movi $r5 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r5              ; copy memory
movi $r0 i10936               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i72                  ; get data length for memory copy
mcp  $r0 $r2 $r1              ; copy memory
movi $r1 i11008               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r3 $r2              ; copy memory
movi $r2 i9264                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i7544              ; [call]: call get_182
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i2024      ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i15336               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r1 i7432                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i2883              ; [call]: call try_read_52
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i2096      ; get offset to local
movi $r2 i128                 ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i19824               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i128                 ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r0 i15872               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i128                 ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i4002              ; [call]: call is_some_101
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i352
load $r0 data_10              ; get local constant
load $r1 data_10              ; get local constant
load $r14 data_12             ; get local constant
load $r13 data_12             ; get local constant
load $r12 data_13             ; get local constant
load $r11 data_13             ; get local constant
load $r10 data_12             ; get local constant
load $r9 data_12              ; get local constant
movi $r2 i20192               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i19760               ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
movi $r4 i5200                ; get offset to local
add  $r4 $$locbase $r4        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r2 $r5              ; copy memory
addi $r2 $r4 i32              ; get offset to aggregate element
movi $r5 i32                  ; get data length for memory copy
mcp  $r2 $r3 $r5              ; copy memory
addi $r2 $r4 i64              ; get offset to aggregate element
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r6 $r3              ; copy memory
addi $r2 $r4 i96              ; get offset to aggregate element
movi $r3 i16                  ; get data length for memory copy
mcp  $r2 $r7 $r3              ; copy memory
addi $r2 $r4 i112             ; get offset to aggregate element
movi $r3 i8                   ; get data length for memory copy
mcp  $r2 $r8 $r3              ; copy memory
movi $r2 i20072               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i120                 ; get data length for memory copy
mcp  $r2 $r4 $r3              ; copy memory
movi $r4 i20072               ; get offset to local
add  $r4 $$locbase $r4        ; get offset to local
movi $r2 i4176                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
sw   $$locbase $zero i526     ; store word
addi $r0 $r2 i40              ; get offset to aggregate element
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r3              ; copy memory
movi $r0 i11696               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i72                  ; get data length for memory copy
mcp  $r0 $r2 $r1              ; copy memory
movi $r1 i11768               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r4 $r2              ; copy memory
movi $r2 i11800               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i120                 ; get data length for memory copy
mcp  $r2 $r4 $r3              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i8271              ; [call]: call insert_225
movi $r0 i5360                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $r14 $r1             ; copy memory
sw   $$locbase $zero i674     ; store word
addi $r1 $r0 i40              ; get offset to aggregate element
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r13 $r2             ; copy memory
addi $r5 $r4 i32              ; get offset to aggregate element
movi $r1 i17520               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i17608               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r5 $r2              ; copy memory
movi $r2 i8856                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i4991              ; [call]: call get_130
move $r0 $$retv               ; [call]: copy the return value
addi $r6 $$locbase i2856      ; get offset to local
movi $r1 i72                  ; get data length for memory copy
mcp  $r6 $r0 $r1              ; copy memory
addi $r1 $$locbase i2720      ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r2 $$locbase i2600      ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i12472               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
movi $r2 i9728                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i9058              ; [call]: call field_id_251
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i2672      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i10840               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
movi $r2 i9192                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $zero             ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i7223              ; [call]: call read_178
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i2704      ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i11328               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $zero             ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i7559              ; [call]: call unwrap_or_194
move $r0 $$retv               ; [call]: copy the return value
movi $r2 i12544               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i9760                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i9014              ; [call]: call field_id_251
move $r1 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i2792      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i11416               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r2 $r3              ; copy memory
movi $r2 i9608                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i7774              ; [call]: call sha256_209
move $r1 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i2824      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i19576               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r2 $r3              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i7813              ; [call]: call offset_calculator_210
move $r1 $$retv               ; [call]: copy the return value
movi $r3 i11496               ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
movi $r7 i32                  ; get data length for memory copy
mcp  $r3 $r2 $r7              ; copy memory
movi $r2 i11528               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r7 i32                  ; get data length for memory copy
mcp  $r2 $r4 $r7              ; copy memory
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i7945              ; [call]: call write_216
movi $r1 i12616               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r6 $r2              ; copy memory
movi $r2 i9792                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i8957              ; [call]: call field_id_251
move $r1 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i2960      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
add  $r0 $r0 $one
movi $r1 i11560               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r2 $r3              ; copy memory
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $zero             ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i7996              ; [call]: call write_218
movi $r0 i6056                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $r12 $r1             ; copy memory
sw   $$locbase $zero i761     ; store word
addi $r1 $r0 i40              ; get offset to aggregate element
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r11 $r2             ; copy memory
movi $r1 i17640               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i17712               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r5 $r2              ; copy memory
movi $r2 i8928                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i4827              ; [call]: call get_130
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i3112      ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i6264                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r10 $r2             ; copy memory
sw   $$locbase $zero i787     ; store word
addi $r2 $r0 i40              ; get offset to aggregate element
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r9 $r3              ; copy memory
movi $r2 i17744               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i17816               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r5 $r3              ; copy memory
movi $r3 i9000                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r3               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i4798              ; [call]: call get_130
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i2992      ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i12688               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
movi $r2 i9824                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i8871              ; [call]: call field_id_251
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i3064      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i10872               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
movi $r2 i9208                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $zero             ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i7036              ; [call]: call read_178
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i3096      ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i11344               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $zero             ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i7372              ; [call]: call unwrap_or_194
move $r0 $$retv               ; [call]: copy the return value
movi $r2 i11592               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i11664               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r4 $r3              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i7929              ; [call]: call insert_220
jmpf $zero i397
load $r0 data_11              ; get local constant
movi $r1 i19824               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i16000               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i128                 ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i7688                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3647              ; [call]: call unwrap_102
move $r1 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i2224      ; get offset to local
movi $r3 i120                 ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i19952               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i120                 ; get data length for memory copy
mcp  $r1 $r2 $r3              ; copy memory
movi $r6 i19952               ; get offset to local
add  $r6 $$locbase $r6        ; get offset to local
addi $r5 $r6 i96              ; get offset to aggregate element
lw   $r1 $$locbase i2506      ; load word
eq   $r1 $r1 $zero
eq   $r1 $r1 $zero
movi $r2 i15864               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i10                  ; initialize constant into register
sw   $$locbase $r3 i1983      ; store word
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3169              ; [call]: call require_97
movi $r1 i16240               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r2 i8024                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i4242              ; [call]: call from_115
move $r1 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i2344      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i5320                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r2 $r3              ; copy memory
sw   $$locbase $zero i669     ; store word
movi $r2 i16288               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i8056                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i4221              ; [call]: call from_115
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i2376      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i6016                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
sw   $$locbase $zero i756     ; store word
movi $r2 i6184                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i40                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
addi $r1 $r2 i40              ; get offset to aggregate element
movi $r3 i40                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
movi $r0 i20224               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i80                  ; get data length for memory copy
mcp  $r0 $r2 $r1              ; copy memory
movi $r0 i10792               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i16                  ; get data length for memory copy
mcp  $r0 $r7 $r1              ; copy memory
movi $r1 i9144                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i6759              ; [call]: call flip_170
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
addi $r0 $r0 i8               ; get offset to aggregate element
lb   $r0 $r0 i0               ; load byte
movi $r2 i18088               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r2 $r5 $r3              ; copy memory
movi $r3 i10776               ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
sw   $$locbase $r1 i1347      ; store word
addi $r1 $r3 i8               ; get offset to aggregate element
sb   $r1 $r0 i0               ; store byte
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i6719              ; [call]: call eq_169
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i110
addi $r0 $r5 i8               ; get offset to aggregate element
lb   $r1 $r0 i0               ; load byte
jnzf $r1 $zero i1
jmpf $zero i1
lb   $r1 $r4 i0               ; load byte
jnzf $r1 $zero i6
lb   $r0 $r0 i0               ; load byte
eq   $r1 $r0 $zero
jnzf $r1 $zero i1
jmpf $zero i2
lb   $r0 $r4 i0               ; load byte
eq   $r1 $r0 $zero
eq   $r0 $r1 $zero
jnzf $r0 $zero i1
jmpf $zero i80
movi $r0 i20440               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i120                 ; get data length for memory copy
mcp  $r0 $r6 $r1              ; copy memory
lw   $r0 $r5 i0               ; load word
lw   $r1 $r7 i0               ; load word
lt   $r2 $r0 $r1
jnzf $r2 $zero i1
move $r0 $r1                  ; move parameter from branch to block argument
sw   $$locbase $r0 i2567      ; store word
movi $r0 i20440               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i16560               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i120                 ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i8168                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i4239              ; [call]: call order_return_asset_amount_122
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i2520      ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i20224               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r0 i20440               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
addi $r0 $r0 i96              ; get offset to aggregate element
movi $r1 i10824               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i9176                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i6676              ; [call]: call flip_170
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
addi $r0 $r0 i8               ; get offset to aggregate element
lb   $r0 $r0 i0               ; load byte
movi $r2 i20440               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
addi $r2 $r2 i96              ; get offset to aggregate element
sw   $$locbase $r1 i2567      ; store word
addi $r1 $r2 i8               ; get offset to aggregate element
sb   $r1 $r0 i0               ; store byte
movi $r0 i20440               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i16680               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i120                 ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i8208                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i4192              ; [call]: call order_return_asset_amount_122
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i2560      ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i20224               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
addi $r0 $r0 i40              ; get offset to aggregate element
movi $r2 i40                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r0 i17952               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i120                 ; get data length for memory copy
mcp  $r0 $r6 $r1              ; copy memory
movi $r1 i18072               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r7 $r2              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i5258              ; [call]: call remove_update_order_internal_168
jmpf $zero i72
movi $r0 i20320               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i120                 ; get data length for memory copy
mcp  $r0 $r6 $r1              ; copy memory
movi $r0 i16320               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i120                 ; get data length for memory copy
mcp  $r0 $r6 $r1              ; copy memory
movi $r1 i8088                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i4081              ; [call]: call cancel_order_internal_121
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i2408      ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i20224               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r0 i20320               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
addi $r0 $r0 i96              ; get offset to aggregate element
movi $r1 i10808               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i9160                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i6589              ; [call]: call flip_170
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
addi $r0 $r0 i8               ; get offset to aggregate element
lb   $r0 $r0 i0               ; load byte
movi $r2 i20320               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
addi $r2 $r2 i96              ; get offset to aggregate element
sw   $$locbase $r1 i2552      ; store word
addi $r1 $r2 i8               ; get offset to aggregate element
sb   $r1 $r0 i0               ; store byte
movi $r0 i20320               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i16440               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i120                 ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i8128                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i4105              ; [call]: call order_return_asset_amount_122
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i2448      ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i20224               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
addi $r0 $r0 i40              ; get offset to aggregate element
movi $r2 i40                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r0 i20224               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i18360               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i80                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i18488               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i20224               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r0 i18488               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i19224               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
lw   $r4 $$locbase i2315      ; load word
movi $r0 i18528               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i20224               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
addi $r1 $r1 i40              ; get offset to aggregate element
movi $r2 i40                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r0 i18528               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i19256               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
lw   $r5 $$locbase i2320      ; load word
gt   $r0 $r4 $zero
jnzf $r0 $zero i1
jmpf $zero i25
movi $r3 i6656                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
sw   $$locbase $zero i832     ; store word
movi $r2 i19760               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
addi $r0 $r3 i8               ; get offset to aggregate element
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $r2 $r1              ; copy memory
movi $r0 i19224               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i11920               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r1 $r3 $r2              ; copy memory
movi $r2 i11960               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
move $$arg2 $r4               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i7714              ; [call]: call transfer_228
gt   $r0 $r5 $zero
jnzf $r0 $zero i1
jmpf $zero i25
movi $r0 i4816                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
sw   $$locbase $zero i602     ; store word
movi $r1 i19760               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
addi $r2 $r0 i8               ; get offset to aggregate element
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i19256               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i12008               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i40                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i12048               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r3              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r5               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i7686              ; [call]: call transfer_228
load $r0 data_10              ; get local constant
load $r1 data_10              ; get local constant
load $r6 data_14              ; get local constant
load $r5 data_14              ; get local constant
movi $r4 i20192               ; get offset to local
add  $r4 $$locbase $r4        ; get offset to local
movi $r2 i5712                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
sw   $$locbase $zero i718     ; store word
addi $r0 $r2 i40              ; get offset to aggregate element
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r3              ; copy memory
movi $r0 i20192               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i11040               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r1 $r2 $r3              ; copy memory
movi $r2 i11128               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i9336                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i6723              ; [call]: call get_182
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i3184      ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i15408               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r1 i7560                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i2062              ; [call]: call try_read_52
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i3376      ; get offset to local
movi $r2 i128                 ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i7912                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3295              ; [call]: call msg_sender_105
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i3256      ; get offset to local
movi $r3 i48                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i16128               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i48                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
movi $r2 i7840                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3257              ; [call]: call unwrap_104
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i3304      ; get offset to local
movi $r3 i40                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
bhei $r0                      ; bhei height
time $r0 $r0                  ; time timestamp height
move $r3 $zero                ; copy ASM block argument's constant initial value to register
movi $r7 i9576                ; get offset to local
add  $r7 $$locbase $r7        ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r7               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i7076              ; [call]: call read_203
move $r3 $$retv               ; [call]: copy the return value
addi $r7 $$locbase i3344      ; get offset to local
movi $r8 i32                  ; get data length for memory copy
mcp  $r7 $r3 $r8              ; copy memory
movi $r3 i5432                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
movi $r8 i32                  ; get data length for memory copy
mcp  $r3 $r4 $r8              ; copy memory
addi $r4 $r3 i32              ; get offset to aggregate element
movi $r8 i40                  ; get data length for memory copy
mcp  $r4 $r2 $r8              ; copy memory
sw   $$locbase $r0 i688       ; store word
sw   $$locbase $zero i689     ; store word
addi $r0 $r3 i88              ; get offset to aggregate element
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r7 $r2              ; copy memory
addi $r0 $r3 i120             ; get offset to aggregate element
movi $r2 i128                 ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r0 i5800                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $r6 $r1              ; copy memory
sw   $$locbase $zero i729     ; store word
addi $r1 $r0 i40              ; get offset to aggregate element
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r5 $r2              ; copy memory
movi $r1 i20192               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i11160               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i11232               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r3              ; copy memory
movi $r1 i9408                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i6619              ; [call]: call get_182
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i3552      ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i5432                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i12080               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i12152               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i248                 ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i8048              ; [call]: call push_244
movi $r0 i5432                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i12920               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i248                 ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
move $$arg0 $r1               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i8268              ; [call]: call log_253
movi $r0 i20192               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i18768               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r1 i7200                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1840              ; [call]: call new_39
move $r1 $$retv               ; [call]: copy the return value
lw   $r2 $r1 i0               ; load word
lw   $r3 $r1 i1               ; load word
lw   $r1 $r1 i2               ; load word
movi $r4 i13496               ; get offset to local
add  $r4 $$locbase $r4        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r0 $r5              ; copy memory
movi $r0 i13528               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
sw   $$locbase $r2 i1691      ; store word
sw   $$locbase $r3 i1692      ; store word
sw   $$locbase $r1 i1693      ; store word
movi $r1 i9968                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i8538              ; [call]: call abi_encode_256
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
movi $r3 i15056               ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
sw   $$locbase $r1 i1882      ; store word
sw   $$locbase $r2 i1883      ; store word
sw   $$locbase $r0 i1884      ; store word
movi $r0 i7384                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1828              ; [call]: call as_raw_slice_40
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i3624      ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i18800               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r0 i15128               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1447              ; [call]: call ptr_23
move $r0 $$retv               ; [call]: copy the return value
movi $r2 i14240               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i8876              ; [call]: call len_282
move $r1 $$retv               ; [call]: copy the return value
retd  $r0 $r1
movi $r0 i18568               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i10376               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i10269             ; [call]: call abi_decode_320
move $r1 $$retv               ; [call]: copy the return value
lw   $r2 $r1 i0               ; load word
lw   $r3 $r1 i1               ; load word
lw   $r1 $r1 i2               ; load word
movi $r4 i10400               ; get offset to local
add  $r4 $$locbase $r4        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i10257             ; [call]: call abi_decode_320
move $r0 $$retv               ; [call]: copy the return value
lw   $r4 $r0 i0               ; load word
lw   $r5 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
movi $r6 i14592               ; get offset to local
add  $r6 $$locbase $r6        ; get offset to local
sw   $$locbase $r2 i1824      ; store word
sw   $$locbase $r3 i1825      ; store word
sw   $$locbase $r1 i1826      ; store word
movi $r1 i14616               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
sw   $$locbase $r4 i1827      ; store word
sw   $$locbase $r5 i1828      ; store word
sw   $$locbase $r0 i1829      ; store word
move $$arg0 $r6               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i11157             ; [call]: call match_orders_many
move $r0 $zero                ; return value from ASM block with return register zero
retd  $r0 $zero
movi $r0 i18568               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i7072                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1329              ; [call]: call abi_decode_13
move $r1 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i1392      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i7320                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1317              ; [call]: call abi_decode_13
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i1424      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
movi $r0 i4664                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
addi $r0 $r0 i32              ; get offset to aggregate element
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r3              ; copy memory
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1492              ; [call]: call reentrancy_guard_33
movi $r0 i14304               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
movi $r2 i14336               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i8893              ; [call]: call match_orders_311
move $r0 $zero                ; return value from ASM block with return register zero
retd  $r0 $zero
load $r0 data_6               ; get local constant
load $r1 data_6               ; get local constant
movi $r2 i18568               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i10312               ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i8779              ; [call]: call abi_decode_284
move $r2 $$retv               ; [call]: copy the return value
addi $r3 $$locbase i1048      ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $r2 $r4              ; copy memory
movi $r2 i19072               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r2 $r3 $r4              ; copy memory
movi $r2 i19072               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i4592                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
sw   $$locbase $zero i578     ; store word
addi $r0 $r3 i40              ; get offset to aggregate element
movi $r4 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r4              ; copy memory
movi $r0 i17312               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i72                  ; get data length for memory copy
mcp  $r0 $r3 $r1              ; copy memory
movi $r1 i17384               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r2 $r3              ; copy memory
movi $r2 i8680                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3938              ; [call]: call get_130
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i1152      ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r2 $$locbase i1080      ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i17064               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
movi $r2 i8544                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3906              ; [call]: call slot_128
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i1296      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i15552               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r0 $r1 $r3              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1888              ; [call]: call offset_67
move $r0 $$retv               ; [call]: copy the return value
movi $r1 i16880               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r2 $r3              ; copy memory
movi $r2 i8368                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3720              ; [call]: call read_125
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i1328      ; get offset to local
movi $r2 i48                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i14032               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i48                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i8600              ; [call]: call is_none_271
move $r0 $$retv               ; [call]: copy the return value
eq   $r0 $r0 $zero
movi $r1 i7176                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1558              ; [call]: call new_39
move $r1 $$retv               ; [call]: copy the return value
lw   $r2 $r1 i0               ; load word
lw   $r3 $r1 i1               ; load word
lw   $r1 $r1 i2               ; load word
movi $r4 i13944               ; get offset to local
add  $r4 $$locbase $r4        ; get offset to local
sw   $$locbase $r2 i1743      ; store word
sw   $$locbase $r3 i1744      ; store word
sw   $$locbase $r1 i1745      ; store word
movi $r1 i10136               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i8525              ; [call]: call abi_encode_265
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
movi $r3 i15032               ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
sw   $$locbase $r1 i1879      ; store word
sw   $$locbase $r2 i1880      ; store word
sw   $$locbase $r0 i1881      ; store word
movi $r0 i7368                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1550              ; [call]: call as_raw_slice_40
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i1376      ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i18752               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r0 i14872               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1169              ; [call]: call ptr_23
move $r0 $$retv               ; [call]: copy the return value
movi $r2 i14224               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i8598              ; [call]: call len_282
move $r1 $$retv               ; [call]: copy the return value
retd  $r0 $r1
movi $r0 i18568               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i8288                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1257              ; [call]: call decode_30
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i752       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i19040               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r0 i19040               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i14544               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i10560               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i10733             ; [call]: call get_order_change_events_by_order
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
sw   $$locbase $r1 i2339      ; store word
sw   $$locbase $r2 i2340      ; store word
sw   $$locbase $r0 i2341      ; store word
movi $r5 i18712               ; get offset to local
add  $r5 $$locbase $r5        ; get offset to local
movi $r0 i7152                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1446              ; [call]: call new_39
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
movi $r3 i15712               ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
movi $r4 i24                  ; get data length for memory copy
mcp  $r3 $r5 $r4              ; copy memory
move $$arg0 $r3               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i2024              ; [call]: call len_78
move $r4 $$retv               ; [call]: copy the return value
movi $r3 i14888               ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
sw   $$locbase $r1 i1861      ; store word
sw   $$locbase $r2 i1862      ; store word
sw   $$locbase $r0 i1863      ; store word
movi $r0 i9704                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1369              ; [call]: call abi_encode_38
move $r0 $$retv               ; [call]: copy the return value
lw   $r8 $r0 i0               ; load word
lw   $r7 $r0 i1               ; load word
lw   $r6 $r0 i2               ; load word
move $r9 $zero                ; move parameter from branch to block argument
lt   $r0 $r9 $r4
jnzf $r0 $zero i42
movi $r0 i15008               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
sw   $$locbase $r8 i1876      ; store word
sw   $$locbase $r7 i1877      ; store word
sw   $$locbase $r6 i1878      ; store word
movi $r1 i7352                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1425              ; [call]: call as_raw_slice_40
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i1032      ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i18736               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r0 i14688               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1044              ; [call]: call ptr_23
move $r0 $$retv               ; [call]: copy the return value
movi $r2 i14208               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i8473              ; [call]: call len_282
move $r1 $$retv               ; [call]: copy the return value
retd  $r0 $r1
lw   $r0 $r5 i2               ; load word
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r9               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i6525              ; [call]: call le_208
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i27
movi $r0 i15760               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i16                  ; get data length for memory copy
mcp  $r0 $r5 $r1              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1974              ; [call]: call ptr_86
move $r0 $$retv               ; [call]: copy the return value
movi $r1 i248                 ; initialize constant into register
mul  $r1 $r1 $r9
add  $r0 $r0 $r1
movi $r1 i4944                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
sw   $$locbase $one i618      ; store word
addi $r2 $$locbase i784       ; get offset to local
movi $r3 i248                 ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
addi $r0 $r1 i8               ; get offset to aggregate element
movi $r3 i248                 ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
movi $r2 i18104               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r0 i256                 ; get data length for memory copy
mcp  $r2 $r1 $r0              ; copy memory
jmpf $zero i7
movi $r0 i4336                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
sw   $$locbase $zero i542     ; store word
movi $r2 i18104               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r1 i256                 ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
movi $r0 i6752                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i256                 ; get data length for memory copy
mcp  $r0 $r2 $r1              ; copy memory
lw   $r0 $$locbase i2263      ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i1
rvrt $zero
movi $r0 i6752                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
addi $r0 $r0 i8               ; get offset to aggregate element
movi $r1 i19296               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i248                 ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r1 i13168               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i248                 ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i13416               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
sw   $$locbase $r8 i1677      ; store word
sw   $$locbase $r7 i1678      ; store word
sw   $$locbase $r6 i1679      ; store word
movi $r2 i9920                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i7770              ; [call]: call abi_encode_255
move $r0 $$retv               ; [call]: copy the return value
lw   $r8 $r0 i0               ; load word
lw   $r7 $r0 i1               ; load word
lw   $r6 $r0 i2               ; load word
add  $r9 $r9 $one
jmpb $zero i124
movi $r0 i18568               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i10256               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i8395              ; [call]: call abi_decode_284
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i592       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i19008               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r0 i19008               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i14512               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i10520               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i10428             ; [call]: call get_market_by_id
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i624       ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i18656               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r0 i18656               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i7128                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1238              ; [call]: call new_39
move $r1 $$retv               ; [call]: copy the return value
lw   $r2 $r1 i0               ; load word
lw   $r3 $r1 i1               ; load word
lw   $r1 $r1 i2               ; load word
movi $r4 i13736               ; get offset to local
add  $r4 $$locbase $r4        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r0 $r5              ; copy memory
movi $r5 i13768               ; get offset to local
add  $r5 $$locbase $r5        ; get offset to local
sw   $$locbase $r2 i1721      ; store word
sw   $$locbase $r3 i1722      ; store word
sw   $$locbase $r1 i1723      ; store word
movi $r1 i10088               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r5               ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i7992              ; [call]: call abi_encode_258
move $r1 $$retv               ; [call]: copy the return value
lw   $r2 $r1 i0               ; load word
lw   $r3 $r1 i1               ; load word
lw   $r1 $r1 i2               ; load word
lw   $r0 $r0 i4               ; load word
movi $r4 i14152               ; get offset to local
add  $r4 $$locbase $r4        ; get offset to local
sw   $$locbase $r2 i1769      ; store word
sw   $$locbase $r3 i1770      ; store word
sw   $$locbase $r1 i1771      ; store word
movi $r1 i10232               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i8245              ; [call]: call abi_encode_278
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
movi $r3 i14984               ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
sw   $$locbase $r1 i1873      ; store word
sw   $$locbase $r2 i1874      ; store word
sw   $$locbase $r0 i1875      ; store word
movi $r0 i7304                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1207              ; [call]: call as_raw_slice_40
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i664       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i18696               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r0 i10744               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i826               ; [call]: call ptr_23
move $r0 $$retv               ; [call]: copy the return value
movi $r2 i14192               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i8255              ; [call]: call len_282
move $r1 $$retv               ; [call]: copy the return value
retd  $r0 $r1
addi $r0 $ssp i8              ; get address of configurable QUOTE_TOKEN
addi $r1 $ssp i40             ; get address of configurable QUOTE_TOKEN_DECIMALS
addi $r2 $ssp i0              ; get address of configurable PRICE_DECIMALS
movi $r3 i4288                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
addi $r0 $r3 i32              ; get offset to aggregate element
movi $r4 i8                   ; get data length for memory copy
mcp  $r0 $r1 $r4              ; copy memory
addi $r0 $r3 i40              ; get offset to aggregate element
movi $r1 i8                   ; get data length for memory copy
mcp  $r0 $r2 $r1              ; copy memory
movi $r0 i18592               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i48                  ; get data length for memory copy
mcp  $r0 $r3 $r1              ; copy memory
movi $r0 i18592               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i7104                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1125              ; [call]: call new_39
move $r1 $$retv               ; [call]: copy the return value
lw   $r2 $r1 i0               ; load word
lw   $r3 $r1 i1               ; load word
lw   $r1 $r1 i2               ; load word
movi $r4 i13680               ; get offset to local
add  $r4 $$locbase $r4        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r0 $r5              ; copy memory
movi $r5 i13712               ; get offset to local
add  $r5 $$locbase $r5        ; get offset to local
sw   $$locbase $r2 i1714      ; store word
sw   $$locbase $r3 i1715      ; store word
sw   $$locbase $r1 i1716      ; store word
movi $r1 i10064               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r5               ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i7879              ; [call]: call abi_encode_258
move $r1 $$retv               ; [call]: copy the return value
lw   $r2 $r1 i0               ; load word
lw   $r3 $r1 i1               ; load word
lw   $r1 $r1 i2               ; load word
lw   $r4 $r0 i4               ; load word
movi $r5 i14104               ; get offset to local
add  $r5 $$locbase $r5        ; get offset to local
sw   $$locbase $r2 i1763      ; store word
sw   $$locbase $r3 i1764      ; store word
sw   $$locbase $r1 i1765      ; store word
movi $r1 i10184               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r5               ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i8132              ; [call]: call abi_encode_278
move $r1 $$retv               ; [call]: copy the return value
lw   $r2 $r1 i0               ; load word
lw   $r3 $r1 i1               ; load word
lw   $r1 $r1 i2               ; load word
lw   $r0 $r0 i5               ; load word
movi $r4 i14128               ; get offset to local
add  $r4 $$locbase $r4        ; get offset to local
sw   $$locbase $r2 i1766      ; store word
sw   $$locbase $r3 i1767      ; store word
sw   $$locbase $r1 i1768      ; store word
movi $r1 i10208               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i8113              ; [call]: call abi_encode_278
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
movi $r3 i14960               ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
sw   $$locbase $r1 i1870      ; store word
sw   $$locbase $r2 i1871      ; store word
sw   $$locbase $r0 i1872      ; store word
movi $r0 i7288                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1075              ; [call]: call as_raw_slice_40
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i576       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i18640               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r0 i10728               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i694               ; [call]: call ptr_23
move $r0 $$retv               ; [call]: copy the return value
movi $r2 i14176               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i8123              ; [call]: call len_282
move $r1 $$retv               ; [call]: copy the return value
retd  $r0 $r1
load $r0 data_6               ; get local constant
load $r1 data_6               ; get local constant
load $r7 data_6               ; get local constant
load $r6 data_6               ; get local constant
movi $r2 i18568               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i7008                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i584               ; [call]: call abi_decode_11
move $r3 $$retv               ; [call]: copy the return value
addi $r8 $$locbase i544       ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r8 $r3 $r4              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i469               ; [call]: call abi_decode_2
move $r2 $$retv               ; [call]: copy the return value
movi $r3 i4248                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $r8 $r4              ; copy memory
sw   $$locbase $r2 i535       ; store word
addi $r9 $$locbase i376       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r9 $r8 $r2              ; copy memory
movi $r2 i4248                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
addi $r11 $r2 i32             ; get offset to aggregate element
lw   $r10 $$locbase i535      ; load word
addi $r2 $ssp i8              ; get address of configurable QUOTE_TOKEN
movi $r3 i15144               ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $r8 $r4              ; copy memory
movi $r4 i15176               ; get offset to local
add  $r4 $$locbase $r4        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r2 $r5              ; copy memory
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1035              ; [call]: call eq_50
move $r2 $$retv               ; [call]: copy the return value
eq   $r2 $r2 $zero
movi $r3 i15776               ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
movi $r4 i7                   ; initialize constant into register
sw   $$locbase $r4 i1972      ; store word
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1739              ; [call]: call require_97
movi $r2 i4872                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
sw   $$locbase $zero i613     ; store word
addi $r0 $r2 i40              ; get offset to aggregate element
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r3              ; copy memory
movi $r0 i17208               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i72                  ; get data length for memory copy
mcp  $r0 $r2 $r1              ; copy memory
movi $r1 i17280               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r8 $r2              ; copy memory
movi $r2 i8608                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3239              ; [call]: call get_130
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i1224      ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r2 $$locbase i680       ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i16992               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
movi $r2 i8512                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3207              ; [call]: call slot_128
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i1488      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i15480               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r0 $r1 $r3              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1189              ; [call]: call offset_67
move $r0 $$retv               ; [call]: copy the return value
movi $r1 i16848               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r2 $r3              ; copy memory
movi $r2 i8320                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3021              ; [call]: call read_125
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i1944      ; get offset to local
movi $r2 i48                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i13968               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i48                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i7901              ; [call]: call is_none_271
move $r0 $$retv               ; [call]: copy the return value
movi $r1 i15784               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i6                   ; initialize constant into register
sw   $$locbase $r2 i1973      ; store word
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1644              ; [call]: call require_97
movi $r0 i6144                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $r8 $r1              ; copy memory
addi $r0 $r0 i32              ; get offset to aggregate element
movi $r1 i8                   ; get data length for memory copy
mcp  $r0 $r11 $r1             ; copy memory
movi $r0 i6352                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $r7 $r1              ; copy memory
sw   $$locbase $zero i798     ; store word
addi $r1 $r0 i40              ; get offset to aggregate element
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r6 $r2              ; copy memory
movi $r1 i6144                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
addi $r4 $$locbase i64        ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r4 $r1 $r2              ; copy memory
movi $r1 i12400               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i9672                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i7226              ; [call]: call field_id_251
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i2488      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i4040      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r8 $r2              ; copy memory
addi $r2 $r0 i32              ; get offset to aggregate element
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i11264               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i64                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i9480                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i5609              ; [call]: call sha256_186
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i2928      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i19608               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r0 i16944               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r1 i8464                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $zero             ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i2989              ; [call]: call slot_calculator_126
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i3504      ; get offset to local
movi $r2 i48                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i18440               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i48                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r0 i19792               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
addi $r1 $$locbase i3504      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
lw   $r0 $$locbase i442       ; load word
lw   $r1 $$locbase i443       ; load word
movi $r2 i32                  ; initialize constant into register
mul  $r2 $r0 $r2
movi $r3 i8                   ; initialize constant into register
mul  $r2 $r3 $r2
aloc $r2                      ; aloc size
move $r2 $hp                  ; move ptr hp
movi $r3 i19792               ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
srwq $r2 $r3 $r3 $r0          ; read sequence of storage slots
movi $r3 i8                   ; initialize constant into register
mul  $r1 $r3 $r1
add  $r1 $r2 $r1
movi $r3 i6696                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
movi $r5 i40                  ; get data length for memory copy
mcp  $r3 $r4 $r5              ; copy memory
movi $r4 i40                  ; initialize constant into register
mcp  $r1 $r3 $r4              ; mcp dst src count
movi $r1 i19792               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
swwq $r1 $r0 $r2 $r0          ; write sequence of storage slots
bhei $r0                      ; bhei height
time $r0 $r0                  ; time timestamp height
move $r1 $zero                ; copy ASM block argument's constant initial value to register
movi $r2 i9544                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i5881              ; [call]: call read_203
move $r1 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i496       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i6440                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r9 $r3              ; copy memory
sw   $$locbase $r10 i809      ; store word
sw   $$locbase $r0 i810       ; store word
addi $r0 $r1 i48              ; get offset to aggregate element
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
movi $r0 i10288               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i715               ; [call]: call new_39
move $r0 $$retv               ; [call]: copy the return value
lw   $r2 $r0 i0               ; load word
lw   $r3 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
movi $r4 i13624               ; get offset to local
add  $r4 $$locbase $r4        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r1 $r5              ; copy memory
movi $r5 i13656               ; get offset to local
add  $r5 $$locbase $r5        ; get offset to local
sw   $$locbase $r2 i1707      ; store word
sw   $$locbase $r3 i1708      ; store word
sw   $$locbase $r0 i1709      ; store word
movi $r0 i10040               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r5               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i7469              ; [call]: call abi_encode_258
move $r0 $$retv               ; [call]: copy the return value
lw   $r2 $r0 i0               ; load word
lw   $r3 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
lw   $r4 $r1 i4               ; load word
movi $r5 i14080               ; get offset to local
add  $r5 $$locbase $r5        ; get offset to local
sw   $$locbase $r2 i1760      ; store word
sw   $$locbase $r3 i1761      ; store word
sw   $$locbase $r0 i1762      ; store word
movi $r0 i10160               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r5               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i7722              ; [call]: call abi_encode_278
move $r0 $$retv               ; [call]: copy the return value
lw   $r2 $r0 i0               ; load word
lw   $r3 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
lw   $r4 $r1 i5               ; load word
movi $r5 i14848               ; get offset to local
add  $r5 $$locbase $r5        ; get offset to local
sw   $$locbase $r2 i1856      ; store word
sw   $$locbase $r3 i1857      ; store word
sw   $$locbase $r0 i1858      ; store word
movi $r0 i9240                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r5               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i606               ; [call]: call abi_encode_38
move $r0 $$retv               ; [call]: copy the return value
lw   $r2 $r0 i0               ; load word
lw   $r3 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
addi $r1 $r1 i48              ; get offset to aggregate element
movi $r4 i13440               ; get offset to local
add  $r4 $$locbase $r4        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r1 $r5              ; copy memory
movi $r1 i13472               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
sw   $$locbase $r2 i1684      ; store word
sw   $$locbase $r3 i1685      ; store word
sw   $$locbase $r0 i1686      ; store word
movi $r0 i9944                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i7352              ; [call]: call abi_encode_256
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
movi $r3 i14936               ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
sw   $$locbase $r1 i1867      ; store word
sw   $$locbase $r2 i1868      ; store word
sw   $$locbase $r0 i1869      ; store word
movi $r0 i7272                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i642               ; [call]: call as_raw_slice_40
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i528       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i6736                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
load $r0 data_21              ; load constant from data section
lw   $r1 $$locbase i842       ; load slice pointer for logging data
lw   $r2 $$locbase i843       ; load slice size for logging data
logd $zero $r0 $r1 $r2        ; log slice
move $r0 $zero                ; return value from ASM block with return register zero
retd  $r0 $zero
movi $r0 i18568               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i7880                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i364               ; [call]: call decode_30
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i32        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i18976               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r0 i18976               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i14480               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
move $$arg0 $r1               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i9428              ; [call]: call cancel_order
move $r0 $zero                ; return value from ASM block with return register zero
retd  $r0 $zero
pshl i15                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function abi_decode_in_place_0
cfei i24                      ; allocate 24 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (ptr)
move $r1 $$arg1               ; save argument 1 (len)
move $r2 $$arg2               ; save argument 2 (target)
move $r3 $$reta               ; save return address
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $$locbase         ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i20                ; [call]: call from_parts_1
move $r0 $$retv               ; [call]: copy the return value
lw   $r0 $r0 i0               ; load word
sw   $$locbase $r0 i1         ; store word
addi $r0 $$locbase i8         ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i23                ; [call]: call abi_decode_2
move $r0 $$retv               ; [call]: copy the return value
sw   $$locbase $r0 i2         ; store word
addi $r0 $$locbase i16        ; get offset to local
movi $r1 i8                   ; initialize constant into register
mcp  $r2 $r0 $r1              ; mcp target temp size
move $$retv $zero             ; set return value
cfsi i24                      ; free 24 bytes for locals and 0 slots for extra call arguments
move $$reta $r3               ; restore return address
poph i524288                  ; restore registers 40..64
popl i15                      ; restore registers 16..40
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
pshl i63                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function abi_decode_2
cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (buffer)
move $r1 $$reta               ; save return address
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i39                ; [call]: call read_4
move $r2 $$retv               ; [call]: copy the return value
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i33                ; [call]: call read_4
move $r3 $$retv               ; [call]: copy the return value
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i27                ; [call]: call read_4
move $r4 $$retv               ; [call]: copy the return value
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i21                ; [call]: call read_4
move $r0 $$retv               ; [call]: copy the return value
movi $r5 i24                  ; initialize constant into register
sll  $r2 $r2 $r5
load $r5 data_3               ; load constant from data section
and  $r2 $r2 $r5
movi $r5 i16                  ; initialize constant into register
sll  $r3 $r3 $r5
load $r5 data_3               ; load constant from data section
and  $r3 $r3 $r5
or   $r2 $r2 $r3
movi $r3 i8                   ; initialize constant into register
sll  $r3 $r4 $r3
load $r4 data_3               ; load constant from data section
and  $r3 $r3 $r4
or   $r2 $r2 $r3
or   $r0 $r2 $r0
move $$retv $r0               ; set return value
cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments
move $$reta $r1               ; restore return address
poph i524288                  ; restore registers 40..64
popl i63                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i15                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function read_4
cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$reta               ; save return address
lw   $r2 $r0 i0               ; load word
lb   $r2 $r2 i0               ; lb val ptr i0
lw   $r3 $r0 i0               ; load word
add  $r3 $r3 $one
sw   $r0 $r3 i0               ; store word
move $$retv $r2               ; set return value
cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments
move $$reta $r1               ; restore return address
poph i524288                  ; restore registers 40..64
popl i15                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i31                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function abi_decode_in_place_10
cfei i112                     ; allocate 112 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (ptr)
move $r1 $$arg1               ; save argument 1 (len)
move $r2 $$arg2               ; save argument 2 (target)
move $r3 $$reta               ; save return address
addi $r4 $$locbase i32        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $r4               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i90                ; [call]: call from_parts_1
move $r0 $$retv               ; [call]: copy the return value
lw   $r0 $r0 i0               ; load word
sw   $$locbase $r0 i9         ; store word
addi $r0 $$locbase i72        ; get offset to local
addi $r1 $$locbase i40        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i15                ; [call]: call abi_decode_11
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
pshl i15                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function abi_decode_11
cfei i96                      ; allocate 96 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (buffer)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
addi $r3 $$locbase i64        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i14                ; [call]: call abi_decode_13
move $r0 $$retv               ; [call]: copy the return value
movi $r3 i32                  ; get data length for memory copy
mcp  $$locbase $r0 $r3        ; copy memory
addi $r0 $$locbase i32        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $$locbase $r3        ; copy memory
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
move $$retv $r1               ; set return value
cfsi i96                      ; free 96 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i15                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i31                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function abi_decode_13
cfei i64                      ; allocate 64 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (buffer)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
lw   $r3 $r0 i0               ; load word
movi $r4 i32                  ; get data length for memory copy
mcp  $$locbase $r3 $r4        ; copy memory
addi $r3 $$locbase i32        ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $$locbase $r4        ; copy memory
lw   $r3 $r0 i0               ; load word
movi $r4 i32                  ; initialize constant into register
add  $r3 $r3 $r4
sw   $r0 $r3 i0               ; store word
movi $r0 i32                  ; get data length for memory copy
mcp  $r1 $$locbase $r0        ; copy memory
move $$retv $r1               ; set return value
cfsi i64                      ; free 64 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i31                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i3                       ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function read_17
cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$reta               ; save return address
lw   $r0 $r0 i0               ; lw val ptr i0
move $$retv $r0               ; set return value
cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments
move $$reta $r1               ; restore return address
poph i524288                  ; restore registers 40..64
popl i3                       ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i31                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function read_8_bytes_21
cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$reta               ; save return address
lw   $r2 $r0 i0               ; load word
lw   $r2 $r2 i0               ; lw val ptr i0
lw   $r3 $r0 i0               ; load word
movi $r4 i8                   ; initialize constant into register
add  $r3 $r3 $r4
sw   $r0 $r3 i0               ; store word
move $$retv $r2               ; set return value
cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments
move $$reta $r1               ; restore return address
poph i524288                  ; restore registers 40..64
popl i31                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i7                       ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function ptr_23
cfei i16                      ; allocate 16 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$reta               ; save return address
movi $r2 i16                  ; get data length for memory copy
mcp  $$locbase $r0 $r2        ; copy memory
move $r0 $$locbase            ; copy ASM block argument's constant initial value to register
lw   $r0 $r0 i0               ; load word
move $$retv $r0               ; set return value
cfsi i16                      ; free 16 bytes for locals and 0 slots for extra call arguments
move $$reta $r1               ; restore return address
poph i524288                  ; restore registers 40..64
popl i7                       ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i63                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function eq_25
cfei i80                      ; allocate 80 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (other)
move $r2 $$reta               ; save return address
movi $r3 i16                  ; get data length for memory copy
mcp  $$locbase $r0 $r3        ; copy memory
move $$arg0 $$locbase         ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i48                ; [call]: call len_28
move $r3 $$retv               ; [call]: copy the return value
addi $r4 $$locbase i16        ; get offset to local
movi $r5 i16                  ; get data length for memory copy
mcp  $r4 $r1 $r5              ; copy memory
move $$arg0 $r4               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i39                ; [call]: call len_28
move $r4 $$retv               ; [call]: copy the return value
eq   $r3 $r3 $r4
eq   $r3 $r3 $zero
move $r4 $zero                ; move parameter from branch to block argument
jnzf $r3 $zero i28
addi $r3 $$locbase i48        ; get offset to local
movi $r4 i16                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
move $$arg0 $r3               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i42                ; [call]: call as_ptr_29
move $r3 $$retv               ; [call]: copy the return value
addi $r4 $$locbase i64        ; get offset to local
movi $r5 i16                  ; get data length for memory copy
mcp  $r4 $r1 $r5              ; copy memory
move $$arg0 $r4               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i33                ; [call]: call as_ptr_29
move $r1 $$retv               ; [call]: copy the return value
addi $r4 $$locbase i32        ; get offset to local
movi $r5 i16                  ; get data length for memory copy
mcp  $r4 $r0 $r5              ; copy memory
move $$arg0 $r4               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i8                 ; [call]: call len_28
move $r0 $$retv               ; [call]: copy the return value
meq  $r4 $r3 $r1 $r0          ; meq r4 r1 r2 r3
move $$retv $r4               ; set return value
cfsi i80                      ; free 80 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i63                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i7                       ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function len_28
cfei i16                      ; allocate 16 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$reta               ; save return address
movi $r2 i16                  ; get data length for memory copy
mcp  $$locbase $r0 $r2        ; copy memory
move $r0 $$locbase            ; copy ASM block argument's constant initial value to register
lw   $r0 $r0 i1               ; load word
move $$retv $r0               ; set return value
cfsi i16                      ; free 16 bytes for locals and 0 slots for extra call arguments
move $$reta $r1               ; restore return address
poph i524288                  ; restore registers 40..64
popl i7                       ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i7                       ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function as_ptr_29
cfei i16                      ; allocate 16 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$reta               ; save return address
movi $r2 i16                  ; get data length for memory copy
mcp  $$locbase $r0 $r2        ; copy memory
move $r0 $$locbase            ; copy ASM block argument's constant initial value to register
lw   $r0 $r0 i0               ; load word
move $$retv $r0               ; set return value
cfsi i16                      ; free 16 bytes for locals and 0 slots for extra call arguments
move $$reta $r1               ; restore return address
poph i524288                  ; restore registers 40..64
popl i7                       ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i15                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function decode_30
cfei i96                      ; allocate 96 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
addi $r3 $$locbase i64        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i174               ; [call]: call abi_decode_13
move $r0 $$retv               ; [call]: copy the return value
movi $r3 i32                  ; get data length for memory copy
mcp  $$locbase $r0 $r3        ; copy memory
addi $r0 $$locbase i32        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $$locbase $r3        ; copy memory
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
move $$retv $r1               ; set return value
cfsi i96                      ; free 96 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i15                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i63                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function reentrancy_guard_33
cfei i528                     ; allocate 528 bytes for locals and 0 slots for call arguments
move $r0 $$reta               ; save return address
move $r1 $fp                  ; return value from ASM block with return register fp
movi $r2 i32                  ; get data length for memory copy
mcp  $$locbase $r1 $r2        ; copy memory
addi $r1 $$locbase i400       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $$locbase $r2        ; copy memory
addi $r2 $$locbase i224       ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i2053              ; [call]: call from_115
move $r1 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i32        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
addi $r1 $$locbase i496       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r2 $r3              ; copy memory
move $r5 $fp                  ; return value from ASM block with return register fp
move $r1 $zero                ; return value from ASM block with return register zero
eq   $r1 $r5 $r1
eq   $r1 $r1 $zero
jnzf $r1 $zero i1
jmpf $zero i6
move $$arg0 $r5               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i223               ; [call]: call get_previous_frame_pointer_47
move $r5 $$retv               ; [call]: copy the return value
move $r1 $zero                ; return value from ASM block with return register zero
eq   $r1 $r5 $r1
eq   $r1 $r1 $zero
move $r2 $zero                ; move parameter from branch to block argument
jnzf $r1 $zero i1
jmpf $zero i43
addi $r1 $$locbase i64        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r5 $r2              ; copy memory
addi $r2 $$locbase i432       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
addi $r1 $$locbase i256       ; get offset to local
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i2015              ; [call]: call from_115
move $r1 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i96        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
addi $r1 $$locbase i464       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r2 $r3              ; copy memory
addi $r1 $$locbase i496       ; get offset to local
addi $r3 $$locbase i336       ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $r2 $r4              ; copy memory
addi $r2 $$locbase i368       ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r4              ; copy memory
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i194               ; [call]: call eq_50
move $r1 $$retv               ; [call]: copy the return value
move $r2 $one                 ; move parameter from branch to block argument
jnzf $r1 $zero i7
move $$arg0 $r5               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i175               ; [call]: call get_previous_frame_pointer_47
move $r5 $$retv               ; [call]: copy the return value
jmpb $zero i47
eq   $r1 $r2 $zero
eq   $r1 $r1 $zero
jnzf $r1 $zero i2
move $$retv $zero             ; set return value
jmpf $zero i54
addi $r0 $$locbase i184       ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i102               ; [call]: call new_39
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
eq   $r3 $zero $zero
jnzf $r3 $zero i2
load $r0 data_22              ; load constant from data section
rvrt $r0
addi $r3 $$locbase i288       ; get offset to local
sw   $$locbase $r1 i36        ; store word
sw   $$locbase $r2 i37        ; store word
sw   $$locbase $r0 i38        ; store word
addi $r0 $$locbase i160       ; get offset to local
move $$arg0 $zero             ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i33                ; [call]: call abi_encode_38
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
addi $r3 $$locbase i312       ; get offset to local
sw   $$locbase $r1 i39        ; store word
sw   $$locbase $r2 i40        ; store word
sw   $$locbase $r0 i41        ; store word
addi $r0 $$locbase i208       ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i94                ; [call]: call as_raw_slice_40
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i128       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i144       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
load $r0 data_23              ; load constant from data section
lw   $r1 $$locbase i18        ; load slice pointer for logging data
lw   $r2 $$locbase i19        ; load slice size for logging data
logd $zero $r0 $r1 $r2        ; log slice
load $r0 data_24              ; load constant from data section
rvrt $r0
cfsi i528                     ; free 528 bytes for locals and 0 slots for extra call arguments
move $$reta $r0               ; restore return address
poph i524288                  ; restore registers 40..64
popl i63                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i255                     ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function abi_encode_38
cfei i144                     ; allocate 144 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (buffer)
move $r2 $$arg2               ; save argument 2 (__ret_value)
move $r3 $$reta               ; save return address
addi $r4 $$locbase i120       ; get offset to local
movi $r5 i24                  ; get data length for memory copy
mcp  $r4 $r1 $r5              ; copy memory
movi $r1 i24                  ; get data length for memory copy
mcp  $$locbase $r4 $r1        ; copy memory
addi $r1 $$locbase i48        ; get offset to local
movi $r4 i24                  ; get data length for memory copy
mcp  $r1 $$locbase $r4        ; copy memory
lw   $r7 $$locbase i6         ; load word
lw   $r6 $$locbase i7         ; load word
lw   $r1 $$locbase i8         ; load word
movi $r4 i8                   ; initialize constant into register
add  $r4 $r1 $r4
gt   $r5 $r4 $r6
jnzf $r5 $zero i1
jmpf $zero i5
movi $r5 i2                   ; initialize constant into register
mul  $r6 $r6 $r5
aloc $r6
mcp  $hp $r7 $r1
move $r7 $hp                  ; return value from ASM block with return register hp
add  $r1 $r7 $r1
sw   $r1 $r0 i0               ; store word
addi $r0 $$locbase i72        ; get offset to local
sw   $$locbase $r7 i9         ; store word
sw   $$locbase $r6 i10        ; store word
sw   $$locbase $r4 i11        ; store word
addi $r1 $$locbase i24        ; get offset to local
movi $r4 i24                  ; get data length for memory copy
mcp  $r1 $r0 $r4              ; copy memory
addi $r0 $$locbase i96        ; get offset to local
movi $r4 i24                  ; get data length for memory copy
mcp  $r0 $r1 $r4              ; copy memory
movi $r1 i24                  ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
move $$retv $r2               ; set return value
cfsi i144                     ; free 144 bytes for locals and 0 slots for extra call arguments
move $$reta $r3               ; restore return address
poph i524288                  ; restore registers 40..64
popl i255                     ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i15                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function new_39
cfei i72                      ; allocate 72 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (__ret_value)
move $r1 $$reta               ; save return address
movi $r2 i1024                ; initialize constant into register
aloc $r2
move $r2 $hp                  ; return value from ASM block with return register hp
addi $r3 $$locbase i24        ; get offset to local
sw   $$locbase $r2 i3         ; store word
movi $r2 i1024                ; initialize constant into register
sw   $$locbase $r2 i4         ; store word
sw   $$locbase $zero i5       ; store word
movi $r2 i24                  ; get data length for memory copy
mcp  $$locbase $r3 $r2        ; copy memory
addi $r2 $$locbase i48        ; get offset to local
movi $r3 i24                  ; get data length for memory copy
mcp  $r2 $$locbase $r3        ; copy memory
movi $r3 i24                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
move $$retv $r0               ; set return value
cfsi i72                      ; free 72 bytes for locals and 0 slots for extra call arguments
move $$reta $r1               ; restore return address
poph i524288                  ; restore registers 40..64
popl i15                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i63                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function as_raw_slice_40
cfei i104                     ; allocate 104 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
addi $r3 $$locbase i80        ; get offset to local
movi $r4 i24                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
movi $r0 i24                  ; get data length for memory copy
mcp  $$locbase $r3 $r0        ; copy memory
addi $r0 $$locbase i40        ; get offset to local
movi $r3 i24                  ; get data length for memory copy
mcp  $r0 $$locbase $r3        ; copy memory
lw   $r3 $$locbase i5         ; load word
addi $r0 $r0 i16              ; get offset to aggregate element
addi $r4 $$locbase i64        ; get offset to local
sw   $$locbase $r3 i8         ; store word
addi $r3 $r4 i8               ; get offset to aggregate element
movi $r5 i8                   ; get data length for memory copy
mcp  $r3 $r0 $r5              ; copy memory
addi $r0 $$locbase i24        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r0 $r4 $r3              ; copy memory
movi $r3 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
move $$retv $r1               ; set return value
cfsi i104                     ; free 104 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i63                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i3                       ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function get_previous_frame_pointer_47
cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (frame_pointer)
move $r1 $$reta               ; save return address
lw   $r0 $r0 i14              ; lw res ptr i0
move $$retv $r0               ; set return value
cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments
move $$reta $r1               ; restore return address
poph i524288                  ; restore registers 40..64
popl i3                       ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i15                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function eq_50
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
pshl i63                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function try_read_52
cfei i920                     ; allocate 920 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r5 $$arg1               ; save argument 1 (__ret_value)
move $r4 $$reta               ; save return address
addi $r1 $$locbase i640       ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r2 $$locbase i504       ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i2192              ; [call]: call slot_128
move $r1 $$retv               ; [call]: copy the return value
movi $r2 i32                  ; get data length for memory copy
mcp  $$locbase $r1 $r2        ; copy memory
addi $r1 $$locbase i568       ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
move $$arg0 $r1               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i176               ; [call]: call offset_67
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i536       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $$locbase $r2        ; copy memory
addi $r2 $$locbase i456       ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i50                ; [call]: call slot_calculator_54
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i32        ; get offset to local
movi $r2 i48                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i840       ; get offset to local
movi $r2 i48                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r0 $$locbase i888       ; get offset to local
addi $r1 $$locbase i32        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
lw   $r0 $$locbase i8         ; load word
lw   $r1 $$locbase i9         ; load word
movi $r2 i32                  ; initialize constant into register
mul  $r2 $r0 $r2
movi $r3 i8                   ; initialize constant into register
mul  $r2 $r3 $r2
aloc $r2                      ; aloc size
move $r2 $hp                  ; move ptr hp
addi $r3 $$locbase i888       ; get offset to local
srwq $r2 $r0 $r3 $r0          ; read sequence of storage slots
jnzf $r0 $zero i6
addi $r0 $$locbase i328       ; get offset to local
sw   $$locbase $zero i41      ; store word
addi $r2 $$locbase i712       ; get offset to local
movi $r1 i128                 ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
jmpf $zero i14
addi $r0 $$locbase i200       ; get offset to local
sw   $$locbase $one i25       ; store word
movi $r3 i8                   ; initialize constant into register
mul  $r1 $r3 $r1
add  $r1 $r2 $r1
addi $r2 $$locbase i80        ; get offset to local
movi $r3 i120                 ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
addi $r1 $r0 i8               ; get offset to aggregate element
movi $r3 i120                 ; get data length for memory copy
mcp  $r1 $r2 $r3              ; copy memory
addi $r2 $$locbase i712       ; get offset to local
movi $r1 i128                 ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
movi $r0 i128                 ; get data length for memory copy
mcp  $r5 $r2 $r0              ; copy memory
move $$retv $r5               ; set return value
cfsi i920                     ; free 920 bytes for locals and 0 slots for extra call arguments
move $$reta $r4               ; restore return address
poph i524288                  ; restore registers 40..64
popl i63                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i255                     ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function slot_calculator_54
cfei i496                     ; allocate 496 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (slot)
move $r1 $$arg1               ; save argument 1 (offset)
move $r6 $$arg2               ; save argument 2 (__ret_value)
move $r5 $$reta               ; save return address
movi $r2 i8                   ; initialize constant into register
mul  $r2 $r1 $r2
movi $r3 i120                 ; initialize constant into register
add  $r2 $r2 $r3
movi $r3 i31                  ; initialize constant into register
add  $r2 $r2 $r3
movi $r3 i5                   ; initialize constant into register
srl  $r2 $r2 $r3
movi $r3 i4                   ; initialize constant into register
mod  $r7 $r1 $r3
movi $r1 i8                   ; initialize constant into register
mul  $r1 $r7 $r1
movi $r3 i120                 ; initialize constant into register
add  $r1 $r1 $r3
movi $r3 i31                  ; initialize constant into register
add  $r1 $r1 $r3
movi $r3 i5                   ; initialize constant into register
srl  $r1 $r1 $r3
addi $r3 $$locbase i176       ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
movi $r0 i32                  ; get data length for memory copy
mcp  $$locbase $r3 $r0        ; copy memory
addi $r0 $$locbase i464       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $$locbase $r3        ; copy memory
addi $r0 $$locbase i240       ; get offset to local
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i51                ; [call]: call as_u256_62
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i32        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
addi $r0 $$locbase i272       ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i40                ; [call]: call as_u256_62
move $r0 $$retv               ; [call]: copy the return value
addi $r3 $$locbase i64        ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
addi $r0 $$locbase i304       ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r0 $r2 $r4              ; copy memory
addi $r2 $$locbase i432       ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r2 $r3 $r4              ; copy memory
addi $r3 $$locbase i368       ; get offset to local
wqop $r3 $r0 $r2 i33
addi $r0 $$locbase i336       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $$locbase $r2        ; copy memory
addi $r2 $$locbase i368       ; get offset to local
addi $r3 $$locbase i400       ; get offset to local
wqop $r3 $r0 $r2 i32
addi $r0 $$locbase i464       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r3 $r2              ; copy memory
addi $r0 $$locbase i208       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r3 $r2              ; copy memory
addi $r2 $$locbase i96        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
addi $r0 $$locbase i128       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
sw   $$locbase $r1 i20        ; store word
sw   $$locbase $r7 i21        ; store word
movi $r1 i48                  ; get data length for memory copy
mcp  $r6 $r0 $r1              ; copy memory
move $$retv $r6               ; set return value
cfsi i496                     ; free 496 bytes for locals and 0 slots for extra call arguments
move $$reta $r5               ; restore return address
poph i524288                  ; restore registers 40..64
popl i255                     ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i15                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function as_u256_62
cfei i64                      ; allocate 64 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
sw   $$locbase $zero i4       ; store word
sw   $$locbase $zero i5       ; store word
sw   $$locbase $zero i6       ; store word
sw   $$locbase $r0 i7         ; store word
addi $r0 $$locbase i32        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $$locbase $r0 $r3        ; copy memory
movi $r0 i32                  ; get data length for memory copy
mcp  $r1 $$locbase $r0        ; copy memory
move $$retv $r1               ; set return value
cfsi i64                      ; free 64 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i15                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i3                       ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function offset_67
cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$reta               ; save return address
lw   $r0 $r0 i4               ; load word
move $$retv $r0               ; set return value
cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments
move $$reta $r1               ; restore return address
poph i524288                  ; restore registers 40..64
popl i3                       ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i63                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function sha256_69
cfei i200                     ; allocate 200 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (s)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
addi $r3 $$locbase i32        ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i39                ; [call]: call new_70
move $r3 $$retv               ; [call]: copy the return value
lw   $r4 $r3 i0               ; load word
lw   $r5 $r3 i1               ; load word
lw   $r3 $r3 i2               ; load word
sw   $$locbase $r4 i22        ; store word
sw   $$locbase $r5 i23        ; store word
sw   $$locbase $r3 i24        ; store word
addi $r3 $$locbase i176       ; get offset to local
addi $r4 $$locbase i88        ; get offset to local
movi $r5 i64                  ; get data length for memory copy
mcp  $r4 $r0 $r5              ; copy memory
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i38                ; [call]: call hash_74
addi $r0 $$locbase i176       ; get offset to local
addi $r3 $$locbase i152       ; get offset to local
movi $r4 i24                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
addi $r0 $$locbase i56        ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i399               ; [call]: call sha256_93
move $r0 $$retv               ; [call]: copy the return value
movi $r3 i32                  ; get data length for memory copy
mcp  $$locbase $r0 $r3        ; copy memory
movi $r0 i32                  ; get data length for memory copy
mcp  $r1 $$locbase $r0        ; copy memory
move $$retv $r1               ; set return value
cfsi i200                     ; free 200 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i63                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i7                       ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function new_70
cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (__ret_value)
move $r1 $$reta               ; save return address
move $r2 $zero                ; copy ASM block argument's constant initial value to register
aloc $r2                      ; aloc size
move $r2 $hp                  ; return value from ASM block with return register hp
sw   $r0 $r2 i0               ; store word
sw   $r0 $zero i1             ; store word
sw   $r0 $zero i2             ; store word
move $$retv $r0               ; set return value
cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments
move $$reta $r1               ; restore return address
poph i524288                  ; restore registers 40..64
popl i7                       ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i31                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function hash_74
cfei i64                      ; allocate 64 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (state)
move $r2 $$reta               ; save return address
movi $r3 i32                  ; get data length for memory copy
mcp  $$locbase $r0 $r3        ; copy memory
move $$arg0 $$locbase         ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i16                ; [call]: call hash_75
addi $r0 $r0 i32              ; get offset to aggregate element
addi $r3 $$locbase i32        ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i6                 ; [call]: call hash_75
move $$retv $zero             ; set return value
cfsi i64                      ; free 64 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i31                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i127                     ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function hash_75
cfei i128                     ; allocate 128 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (state)
move $r2 $$reta               ; save return address
movi $r3 i32                  ; initialize constant into register
aloc $r3                      ; aloc size
move $r3 $hp                  ; return value from ASM block with return register hp
addi $r4 $$locbase i16        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r0 $r5              ; copy memory
lw   $r0 $r4 i0               ; load word
lw   $r5 $r4 i1               ; load word
lw   $r6 $r4 i2               ; load word
lw   $r4 $r4 i3               ; load word
sw   $r3 $r0 i0               ; sw ptr val_1 i0
sw   $r3 $r5 i1               ; sw ptr val_2 i1
sw   $r3 $r6 i2               ; sw ptr val_3 i2
sw   $r3 $r4 i3               ; sw ptr val_4 i3
addi $r0 $$locbase i48        ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
movi $r3 i32                  ; initialize constant into register
move $$arg1 $r3               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i168               ; [call]: call from_parts_81
move $r0 $$retv               ; [call]: copy the return value
movi $r3 i16                  ; get data length for memory copy
mcp  $$locbase $r0 $r3        ; copy memory
addi $r0 $$locbase i112       ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r0 $$locbase $r3        ; copy memory
addi $r3 $$locbase i64        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i261               ; [call]: call from_92
move $r0 $$retv               ; [call]: copy the return value
lw   $r3 $r0 i0               ; load word
lw   $r4 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
addi $r5 $$locbase i88        ; get offset to local
sw   $$locbase $r3 i11        ; store word
sw   $$locbase $r4 i12        ; store word
sw   $$locbase $r0 i13        ; store word
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r5               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i6                 ; [call]: call write_76
move $$retv $zero             ; set return value
cfsi i128                     ; free 128 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i127                     ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i2047                    ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function write_76
cfei i192                     ; allocate 192 bytes for locals and 0 slots for call arguments
move $r8 $$arg0               ; save argument 0 (self)
move $r6 $$arg1               ; save argument 1 (bytes)
move $r5 $$reta               ; save return address
addi $r0 $$locbase i48        ; get offset to local
movi $r1 i24                  ; get data length for memory copy
mcp  $r0 $r6 $r1              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i109               ; [call]: call len_78
move $r7 $$retv               ; [call]: copy the return value
eq   $r0 $r7 $zero
jnzf $r0 $zero i100
addi $r9 $r8 i16              ; get offset to aggregate element
lw   $r0 $r8 i2               ; load word
eq   $r0 $r0 $zero
jnzf $r0 $zero i94
lw   $r0 $r9 i0               ; load word
add  $r10 $r0 $r7
lw   $r0 $r9 i0               ; load word
addi $r1 $$locbase i144       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r8 $r2              ; copy memory
move $$arg0 $r1               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i8114              ; [call]: call capacity_326
move $r1 $$retv               ; [call]: copy the return value
lt   $r1 $r1 $r10
jnzf $r1 $zero i1
jmpf $zero i57
addi $r1 $$locbase i72        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r8 $r2              ; copy memory
move $$arg0 $r1               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i111               ; [call]: call ptr_86
move $r1 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i160       ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r2 $r8 $r3              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i8093              ; [call]: call capacity_326
move $r2 $$retv               ; [call]: copy the return value
gt   $r3 $r10 $r2
move $r4 $r1                  ; move parameter from branch to block argument
jnzf $r3 $zero i1
jmpf $zero i6
aloc $r10                     ; aloc size
move $r4 $hp                  ; return value from ASM block with return register hp
gt   $r3 $r2 $zero
jnzf $r3 $zero i1
jmpf $zero i1
mcp  $r4 $r1 $r2              ; mcp dst src len
addi $r1 $$locbase i16        ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r10              ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i62                ; [call]: call from_parts_81
move $r1 $$retv               ; [call]: copy the return value
movi $r2 i16                  ; get data length for memory copy
mcp  $$locbase $r1 $r2        ; copy memory
addi $r1 $$locbase i176       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $$locbase $r2        ; copy memory
addi $r1 $$locbase i104       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $$locbase $r2        ; copy memory
addi $r2 $$locbase i32        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i78                ; [call]: call from_87
move $r1 $$retv               ; [call]: copy the return value
lw   $r2 $r1 i0               ; load word
lw   $r1 $r1 i1               ; load word
sw   $r8 $r2 i0               ; store word
sw   $r8 $r1 i1               ; store word
addi $r1 $$locbase i88        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r8 $r2              ; copy memory
move $$arg0 $r1               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i54                ; [call]: call ptr_86
move $r1 $$retv               ; [call]: copy the return value
add  $r0 $r1 $r0              ; add new ptr offset
addi $r1 $$locbase i120       ; get offset to local
movi $r2 i24                  ; get data length for memory copy
mcp  $r1 $r6 $r2              ; copy memory
move $$arg0 $r1               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i109               ; [call]: call ptr_91
move $r1 $$retv               ; [call]: copy the return value
mcp  $r0 $r1 $r7              ; mcp dst src len
sw   $r9 $r10 i0              ; store word
jmpf $zero i2
movi $r0 i24                  ; get data length for memory copy
mcp  $r8 $r6 $r0              ; copy memory
move $$retv $zero             ; set return value
cfsi i192                     ; free 192 bytes for locals and 0 slots for extra call arguments
move $$reta $r5               ; restore return address
poph i524288                  ; restore registers 40..64
popl i2047                    ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i3                       ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function len_78
cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$reta               ; save return address
lw   $r0 $r0 i2               ; load word
move $$retv $r0               ; set return value
cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments
move $$reta $r1               ; restore return address
poph i524288                  ; restore registers 40..64
popl i3                       ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i31                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function from_parts_81
cfei i32                      ; allocate 32 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (ptr)
move $r1 $$arg1               ; save argument 1 (count)
move $r2 $$arg2               ; save argument 2 (__ret_value)
move $r3 $$reta               ; save return address
addi $r4 $$locbase i16        ; get offset to local
sw   $$locbase $r0 i2         ; store word
sw   $$locbase $r1 i3         ; store word
movi $r0 i16                  ; get data length for memory copy
mcp  $$locbase $r4 $r0        ; copy memory
movi $r0 i16                  ; get data length for memory copy
mcp  $r2 $$locbase $r0        ; copy memory
move $$retv $r2               ; set return value
cfsi i32                      ; free 32 bytes for locals and 0 slots for extra call arguments
move $$reta $r3               ; restore return address
poph i524288                  ; restore registers 40..64
popl i31                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i3                       ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function ptr_86
cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$reta               ; save return address
lw   $r0 $r0 i0               ; load word
move $$retv $r0               ; set return value
cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments
move $$reta $r1               ; restore return address
poph i524288                  ; restore registers 40..64
popl i3                       ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i63                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function from_87
cfei i32                      ; allocate 32 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (slice)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
addi $r3 $$locbase i16        ; get offset to local
movi $r4 i16                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
move $$arg0 $r3               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i23                ; [call]: call number_of_bytes_88
move $r3 $$retv               ; [call]: copy the return value
aloc $r3                      ; aloc size
move $r4 $hp                  ; return value from ASM block with return register hp
gt   $r5 $r3 $zero
jnzf $r5 $zero i1
jmpf $zero i9
movi $r5 i16                  ; get data length for memory copy
mcp  $$locbase $r0 $r5        ; copy memory
move $$arg0 $$locbase         ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i997               ; [call]: call ptr_23
move $r0 $$retv               ; [call]: copy the return value
mcp  $r4 $r0 $r3              ; mcp dst src len
sw   $r1 $r4 i0               ; store word
sw   $r1 $r3 i1               ; store word
move $$retv $r1               ; set return value
cfsi i32                      ; free 32 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i63                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i7                       ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function number_of_bytes_88
cfei i16                      ; allocate 16 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$reta               ; save return address
movi $r2 i16                  ; get data length for memory copy
mcp  $$locbase $r0 $r2        ; copy memory
move $r0 $$locbase            ; copy ASM block argument's constant initial value to register
lw   $r0 $r0 i1               ; load word
move $$retv $r0               ; set return value
cfsi i16                      ; free 16 bytes for locals and 0 slots for extra call arguments
move $$reta $r1               ; restore return address
poph i524288                  ; restore registers 40..64
popl i7                       ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i7                       ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function ptr_91
cfei i16                      ; allocate 16 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$reta               ; save return address
movi $r2 i16                  ; get data length for memory copy
mcp  $$locbase $r0 $r2        ; copy memory
move $$arg0 $$locbase         ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i76                ; [call]: call ptr_86
move $r0 $$retv               ; [call]: copy the return value
move $$retv $r0               ; set return value
cfsi i16                      ; free 16 bytes for locals and 0 slots for extra call arguments
move $$reta $r1               ; restore return address
poph i524288                  ; restore registers 40..64
popl i7                       ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i127                     ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function from_92
cfei i48                      ; allocate 48 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (slice)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
addi $r3 $$locbase i16        ; get offset to local
movi $r4 i16                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $$locbase         ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i88                ; [call]: call from_87
move $r3 $$retv               ; [call]: copy the return value
lw   $r4 $r3 i0               ; load word
lw   $r3 $r3 i1               ; load word
addi $r5 $$locbase i32        ; get offset to local
movi $r6 i16                  ; get data length for memory copy
mcp  $r5 $r0 $r6              ; copy memory
move $$arg0 $r5               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i61                ; [call]: call number_of_bytes_88
move $r0 $$retv               ; [call]: copy the return value
sw   $r1 $r4 i0               ; store word
sw   $r1 $r3 i1               ; store word
sw   $r1 $r0 i2               ; store word
move $$retv $r1               ; set return value
cfsi i48                      ; free 48 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i127                     ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i127                     ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function sha256_93
cfei i112                     ; allocate 112 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
load $r3 data_11              ; get local constant
addi $r4 $$locbase i80        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r3 $r5              ; copy memory
addi $r3 $$locbase i80        ; get offset to local
addi $r4 $$locbase i56        ; get offset to local
movi $r5 i24                  ; get data length for memory copy
mcp  $r4 $r0 $r5              ; copy memory
move $$arg0 $r4               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i76                ; [call]: call ptr_91
move $r4 $$retv               ; [call]: copy the return value
addi $r5 $$locbase i32        ; get offset to local
movi $r6 i24                  ; get data length for memory copy
mcp  $r5 $r0 $r6              ; copy memory
move $$arg0 $r5               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i182               ; [call]: call len_78
move $r0 $$retv               ; [call]: copy the return value
s256 $r3 $r4 $r0              ; s256 hash ptr bytes
movi $r0 i32                  ; get data length for memory copy
mcp  $$locbase $r3 $r0        ; copy memory
movi $r0 i32                  ; get data length for memory copy
mcp  $r1 $$locbase $r0        ; copy memory
move $$retv $r1               ; set return value
cfsi i112                     ; free 112 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i127                     ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i16777215                ; save registers 16..40
pshh i532479                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function require_97
cfei i840                     ; allocate 768 bytes for locals and 0 slots for call arguments and 72 bytes for spills
move $r0 $$arg0               ; save argument 0 (condition)
move $r1 $$arg1               ; save argument 1 (value)
sw   $$locbase $r1 i103       ; [spill/refill]: spill
move $r1 $$reta               ; save return address
eq   $r0 $r0 $zero
jnzf $r0 $zero i2
move $$retv $zero             ; set return value
jmpf $zero i422
addi $r0 $$locbase i176       ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i803               ; [call]: call new_39
move $r0 $$retv               ; [call]: copy the return value
sw   $$locbase $r0 i104       ; [spill/refill]: spill
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r0 $r0 i0               ; load word
sw   $$locbase $r0 i96        ; [spill/refill]: spill
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r0 $r0 i1               ; load word
sw   $$locbase $r0 i101       ; [spill/refill]: spill
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r0 $r0 i2               ; load word
sw   $$locbase $r0 i99        ; [spill/refill]: spill
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r0 $r0 i0               ; load word
sw   $$locbase $r0 i97        ; [spill/refill]: spill
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r0 $r0 i1               ; load word
sw   $$locbase $r0 i102       ; [spill/refill]: spill
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r0 $r0 i2               ; load word
sw   $$locbase $r0 i100       ; [spill/refill]: spill
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r0 $r0 i0               ; load word
sw   $$locbase $r0 i98        ; [spill/refill]: spill
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r34 $r0 i1              ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r33 $r0 i2              ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r35 $r0 i0              ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r32 $r0 i1              ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r31 $r0 i2              ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r30 $r0 i0              ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r29 $r0 i1              ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r28 $r0 i2              ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r27 $r0 i0              ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r26 $r0 i1              ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r25 $r0 i2              ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r24 $r0 i0              ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r23 $r0 i1              ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r22 $r0 i2              ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r21 $r0 i0              ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r20 $r0 i1              ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r19 $r0 i2              ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r18 $r0 i0              ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r17 $r0 i1              ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r16 $r0 i2              ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r15 $r0 i0              ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r14 $r0 i1              ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r13 $r0 i2              ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r12 $r0 i0              ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r11 $r0 i1              ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r10 $r0 i2              ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r9 $r0 i0               ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r8 $r0 i1               ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r7 $r0 i2               ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r6 $r0 i0               ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r5 $r0 i1               ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r4 $r0 i2               ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r3 $r0 i0               ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r2 $r0 i1               ; load word
lw   $r0 $$locbase i104       ; [spill/refill]: refill from spill
lw   $r36 $r0 i2              ; load word
lw   $r1 $$locbase i103       ; [spill/refill]: refill from spill
lw   $r1 $r1 i0               ; load word
eq   $r0 $r1 $zero
jnzf $r0 $zero i280
eq   $r0 $r1 $one
jnzf $r0 $zero i261
movi $r0 i2                   ; initialize constant into register
eq   $r0 $r1 $r0
jnzf $r0 $zero i240
movi $r0 i3                   ; initialize constant into register
eq   $r0 $r1 $r0
jnzf $r0 $zero i219
movi $r0 i4                   ; initialize constant into register
eq   $r0 $r1 $r0
jnzf $r0 $zero i198
movi $r0 i5                   ; initialize constant into register
eq   $r0 $r1 $r0
jnzf $r0 $zero i177
movi $r0 i6                   ; initialize constant into register
eq   $r0 $r1 $r0
jnzf $r0 $zero i156
movi $r0 i7                   ; initialize constant into register
eq   $r0 $r1 $r0
jnzf $r0 $zero i135
movi $r0 i8                   ; initialize constant into register
eq   $r0 $r1 $r0
jnzf $r0 $zero i114
movi $r0 i9                   ; initialize constant into register
eq   $r0 $r1 $r0
jnzf $r0 $zero i93
movi $r0 i10                  ; initialize constant into register
eq   $r0 $r1 $r0
jnzf $r0 $zero i72
movi $r0 i11                  ; initialize constant into register
eq   $r0 $r1 $r0
jnzf $r0 $zero i50
movi $r0 i12                  ; initialize constant into register
eq   $r0 $r1 $r0
jnzf $r0 $zero i26
movi $r0 i13                  ; initialize constant into register
eq   $r0 $r1 $r0
jnzf $r0 $zero i2
load $r0 data_22              ; load constant from data section
rvrt $r0
addi $r1 $$locbase i528       ; get offset to local
lw   $r0 $$locbase i96        ; [spill/refill]: refill from spill
sw   $$locbase $r0 i66        ; store word
lw   $r0 $$locbase i101       ; [spill/refill]: refill from spill
sw   $$locbase $r0 i67        ; store word
lw   $r0 $$locbase i99        ; [spill/refill]: refill from spill
sw   $$locbase $r0 i68        ; store word
addi $r0 $$locbase i152       ; get offset to local
movi $r2 i13                  ; initialize constant into register
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1005              ; [call]: call abi_encode_38
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
jmpf $zero i20
addi $r1 $$locbase i504       ; get offset to local
lw   $r0 $$locbase i97        ; [spill/refill]: refill from spill
sw   $$locbase $r0 i63        ; store word
lw   $r0 $$locbase i102       ; [spill/refill]: refill from spill
sw   $$locbase $r0 i64        ; store word
lw   $r0 $$locbase i100       ; [spill/refill]: refill from spill
sw   $$locbase $r0 i65        ; store word
addi $r0 $$locbase i128       ; get offset to local
movi $r2 i12                  ; initialize constant into register
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1026              ; [call]: call abi_encode_38
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
jmpf $zero i18
addi $r1 $$locbase i480       ; get offset to local
lw   $r0 $$locbase i98        ; [spill/refill]: refill from spill
sw   $$locbase $r0 i60        ; store word
sw   $$locbase $r34 i61       ; store word
sw   $$locbase $r33 i62       ; store word
addi $r0 $$locbase i104       ; get offset to local
movi $r2 i11                  ; initialize constant into register
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1045              ; [call]: call abi_encode_38
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
jmpf $zero i17
addi $r0 $$locbase i744       ; get offset to local
sw   $$locbase $r35 i93       ; store word
sw   $$locbase $r32 i94       ; store word
sw   $$locbase $r31 i95       ; store word
addi $r1 $$locbase i384       ; get offset to local
movi $r2 i10                  ; initialize constant into register
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1063              ; [call]: call abi_encode_38
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
jmpf $zero i17
addi $r0 $$locbase i720       ; get offset to local
sw   $$locbase $r30 i90       ; store word
sw   $$locbase $r29 i91       ; store word
sw   $$locbase $r28 i92       ; store word
addi $r1 $$locbase i360       ; get offset to local
movi $r2 i9                   ; initialize constant into register
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1081              ; [call]: call abi_encode_38
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
jmpf $zero i17
addi $r0 $$locbase i696       ; get offset to local
sw   $$locbase $r27 i87       ; store word
sw   $$locbase $r26 i88       ; store word
sw   $$locbase $r25 i89       ; store word
addi $r1 $$locbase i336       ; get offset to local
movi $r2 i8                   ; initialize constant into register
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1099              ; [call]: call abi_encode_38
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
jmpf $zero i17
addi $r0 $$locbase i672       ; get offset to local
sw   $$locbase $r24 i84       ; store word
sw   $$locbase $r23 i85       ; store word
sw   $$locbase $r22 i86       ; store word
addi $r1 $$locbase i312       ; get offset to local
movi $r2 i7                   ; initialize constant into register
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1117              ; [call]: call abi_encode_38
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
jmpf $zero i17
addi $r0 $$locbase i648       ; get offset to local
sw   $$locbase $r21 i81       ; store word
sw   $$locbase $r20 i82       ; store word
sw   $$locbase $r19 i83       ; store word
addi $r1 $$locbase i288       ; get offset to local
movi $r2 i6                   ; initialize constant into register
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1135              ; [call]: call abi_encode_38
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
jmpf $zero i17
addi $r0 $$locbase i624       ; get offset to local
sw   $$locbase $r18 i78       ; store word
sw   $$locbase $r17 i79       ; store word
sw   $$locbase $r16 i80       ; store word
addi $r1 $$locbase i264       ; get offset to local
movi $r2 i5                   ; initialize constant into register
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1153              ; [call]: call abi_encode_38
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
jmpf $zero i17
addi $r0 $$locbase i600       ; get offset to local
sw   $$locbase $r15 i75       ; store word
sw   $$locbase $r14 i76       ; store word
sw   $$locbase $r13 i77       ; store word
addi $r1 $$locbase i240       ; get offset to local
movi $r2 i4                   ; initialize constant into register
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1171              ; [call]: call abi_encode_38
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
jmpf $zero i17
addi $r0 $$locbase i576       ; get offset to local
sw   $$locbase $r12 i72       ; store word
sw   $$locbase $r11 i73       ; store word
sw   $$locbase $r10 i74       ; store word
addi $r1 $$locbase i216       ; get offset to local
movi $r2 i3                   ; initialize constant into register
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1189              ; [call]: call abi_encode_38
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
jmpf $zero i17
addi $r0 $$locbase i456       ; get offset to local
sw   $$locbase $r9 i57        ; store word
sw   $$locbase $r8 i58        ; store word
sw   $$locbase $r7 i59        ; store word
addi $r1 $$locbase i80        ; get offset to local
movi $r2 i2                   ; initialize constant into register
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1207              ; [call]: call abi_encode_38
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
jmpf $zero i16
addi $r0 $$locbase i432       ; get offset to local
sw   $$locbase $r6 i54        ; store word
sw   $$locbase $r5 i55        ; store word
sw   $$locbase $r4 i56        ; store word
addi $r1 $$locbase i56        ; get offset to local
move $$arg0 $one              ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1224              ; [call]: call abi_encode_38
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
jmpf $zero i16
addi $r0 $$locbase i408       ; get offset to local
sw   $$locbase $r3 i51        ; store word
sw   $$locbase $r2 i52        ; store word
sw   $$locbase $r36 i53       ; store word
addi $r1 $$locbase i32        ; get offset to local
move $$arg0 $zero             ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1241              ; [call]: call abi_encode_38
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
addi $r3 $$locbase i552       ; get offset to local
sw   $$locbase $r1 i69        ; store word
sw   $$locbase $r2 i70        ; store word
sw   $$locbase $r0 i71        ; store word
addi $r0 $$locbase i200       ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1180              ; [call]: call as_raw_slice_40
move $r0 $$retv               ; [call]: copy the return value
movi $r1 i16                  ; get data length for memory copy
mcp  $$locbase $r0 $r1        ; copy memory
addi $r0 $$locbase i16        ; get offset to local
movi $r1 i16                  ; get data length for memory copy
mcp  $r0 $$locbase $r1        ; copy memory
load $r0 data_25              ; load constant from data section
lw   $r1 $$locbase i2         ; load slice pointer for logging data
lw   $r2 $$locbase i3         ; load slice size for logging data
logd $zero $r0 $r1 $r2        ; log slice
load $r0 data_24              ; load constant from data section
rvrt $r0
cfsi i840                     ; free 768 bytes for locals and 0 slots for extra call arguments and 72 bytes for spills
move $$reta $r1               ; restore return address
poph i532479                  ; restore registers 40..64
popl i16777215                ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i7                       ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function is_some_101
cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$reta               ; save return address
lw   $r0 $r0 i0               ; load word
eq   $r0 $r0 $one
move $r2 $one                 ; move parameter from branch to block argument
jnzf $r0 $zero i1
move $r2 $zero                ; move parameter from branch to block argument
move $$retv $r2               ; set return value
cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments
move $$reta $r1               ; restore return address
poph i524288                  ; restore registers 40..64
popl i7                       ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i15                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function unwrap_102
cfei i128                     ; allocate 128 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
movi $r3 i128                 ; get data length for memory copy
mcp  $$locbase $r0 $r3        ; copy memory
lw   $r0 $r0 i0               ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i1
rvrt $zero
addi $r0 $$locbase i8         ; get offset to aggregate element
movi $r3 i120                 ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
move $$retv $r1               ; set return value
cfsi i128                     ; free 128 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i15                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i31                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function msg_sender_address_103
cfei i296                     ; allocate 296 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (__ret_value)
move $r1 $$reta               ; save return address
addi $r2 $$locbase i168       ; get offset to local
move $$arg0 $r2               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i59                ; [call]: call msg_sender_105
move $r2 $$retv               ; [call]: copy the return value
movi $r3 i48                  ; get data length for memory copy
mcp  $$locbase $r2 $r3        ; copy memory
addi $r2 $$locbase i216       ; get offset to local
movi $r3 i48                  ; get data length for memory copy
mcp  $r2 $$locbase $r3        ; copy memory
addi $r3 $$locbase i128       ; get offset to local
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i24                ; [call]: call unwrap_104
move $r2 $$retv               ; [call]: copy the return value
addi $r3 $$locbase i48        ; get offset to local
movi $r4 i40                  ; get data length for memory copy
mcp  $r3 $r2 $r4              ; copy memory
addi $r2 $$locbase i88        ; get offset to local
movi $r4 i40                  ; get data length for memory copy
mcp  $r2 $r3 $r4              ; copy memory
lw   $r2 $$locbase i6         ; load word
eq   $r2 $r2 $zero
jnzf $r2 $zero i1
rvrt $zero
addi $r2 $$locbase i88        ; get offset to local
addi $r2 $r2 i8               ; get offset to aggregate element
addi $r3 $$locbase i264       ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $r2 $r4              ; copy memory
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
move $$retv $r0               ; set return value
cfsi i296                     ; free 296 bytes for locals and 0 slots for extra call arguments
move $$reta $r1               ; restore return address
poph i524288                  ; restore registers 40..64
popl i31                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i15                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function unwrap_104
cfei i48                      ; allocate 48 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
movi $r3 i48                  ; get data length for memory copy
mcp  $$locbase $r0 $r3        ; copy memory
lw   $r0 $r0 i0               ; load word
eq   $r0 $r0 $zero
jnzf $r0 $zero i1
rvrt $zero
addi $r0 $$locbase i8         ; get offset to aggregate element
movi $r3 i40                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
move $$retv $r1               ; set return value
cfsi i48                      ; free 48 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i15                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i255                     ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function msg_sender_105
cfei i1872                    ; allocate 1872 bytes for locals and 0 slots for call arguments
move $r6 $$arg0               ; save argument 0 (__ret_value)
move $r5 $$reta               ; save return address
gm   $r0 i1                   ; gm r1 i1
jnzf $r0 $zero i32
addi $r0 $$locbase i616       ; get offset to local
sw   $$locbase $zero i77      ; store word
addi $r1 $$locbase i704       ; get offset to local
sw   $$locbase $one i88       ; store word
gm   $r2 i2                   ; gm r1 i2
addi $r3 $$locbase i176       ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $r2 $r4              ; copy memory
addi $r2 $$locbase i1304      ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r2 $r3 $r4              ; copy memory
addi $r3 $$locbase i1080      ; get offset to local
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i512               ; [call]: call from_115
move $r2 $$retv               ; [call]: copy the return value
addi $r3 $$locbase i208       ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $r2 $r4              ; copy memory
addi $r2 $r1 i8               ; get offset to aggregate element
movi $r4 i32                  ; get data length for memory copy
mcp  $r2 $r3 $r4              ; copy memory
addi $r2 $r0 i8               ; get offset to aggregate element
movi $r3 i40                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
addi $r3 $$locbase i1664      ; get offset to local
movi $r1 i48                  ; get data length for memory copy
mcp  $r3 $r0 $r1              ; copy memory
jmpf $zero i317
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i330               ; [call]: call input_count_109
move $r3 $$retv               ; [call]: copy the return value
addi $r0 $$locbase i288       ; get offset to local
sw   $$locbase $zero i36      ; store word
addi $r1 $$locbase i1744      ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
move $r4 $zero                ; move parameter from branch to block argument
lt   $r0 $r4 $r3
jnzf $r0 $zero i36
addi $r0 $$locbase i1744      ; get offset to local
addi $r1 $$locbase i912       ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
lw   $r0 $$locbase i218       ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i12
lw   $r0 $$locbase i114       ; load word
eq   $r0 $r0 $zero
jnzf $r0 $zero i2
load $r0 data_22              ; load constant from data section
rvrt $r0
addi $r0 $$locbase i744       ; get offset to local
sw   $$locbase $one i93       ; store word
sw   $$locbase $one i97       ; store word
addi $r2 $$locbase i1536      ; get offset to local
movi $r1 i40                  ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
jmpf $zero i13
addi $r0 $$locbase i912       ; get offset to local
addi $r0 $r0 i8               ; get offset to aggregate element
addi $r1 $$locbase i1712      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r1 $$locbase i664       ; get offset to local
sw   $$locbase $zero i83      ; store word
addi $r2 $r1 i8               ; get offset to aggregate element
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
addi $r2 $$locbase i1536      ; get offset to local
movi $r0 i40                  ; get data length for memory copy
mcp  $r2 $r1 $r0              ; copy memory
addi $r1 $$locbase i1576      ; get offset to local
movi $r0 i40                  ; get data length for memory copy
mcp  $r1 $r2 $r0              ; copy memory
jmpf $zero i225
addi $r0 $$locbase i968       ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i354               ; [call]: call input_type_112
move $r0 $$retv               ; [call]: copy the return value
movi $r1 i16                  ; get data length for memory copy
mcp  $$locbase $r0 $r1        ; copy memory
addi $r0 $$locbase i1856      ; get offset to local
movi $r1 i16                  ; get data length for memory copy
mcp  $r0 $$locbase $r1        ; copy memory
addi $r0 $$locbase i840       ; get offset to local
movi $r1 i16                  ; get data length for memory copy
mcp  $r0 $$locbase $r1        ; copy memory
lw   $r0 $$locbase i0         ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i1
jmpf $zero i2
lw   $r0 $$locbase i106       ; load word
eq   $r0 $r0 $zero
jnzf $r0 $zero i10
lw   $r0 $$locbase i105       ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i1
jmpf $zero i3
lw   $r0 $$locbase i106       ; load word
movi $r1 i2                   ; initialize constant into register
eq   $r0 $r0 $r1
jnzf $r0 $zero i2
add  $r4 $r4 $one
jmpb $zero i69
addi $r0 $$locbase i1856      ; get offset to local
addi $r1 $$locbase i856       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
lw   $r0 $$locbase i232       ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i1
jmpf $zero i2
lw   $r0 $$locbase i108       ; load word
eq   $r0 $r0 $zero
jnzf $r0 $zero i65
lw   $r0 $$locbase i107       ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i1
jmpf $zero i3
lw   $r0 $$locbase i108       ; load word
movi $r1 i2                   ; initialize constant into register
eq   $r0 $r0 $r1
jnzf $r0 $zero i2
add  $r4 $r4 $one
jmpb $zero i90
addi $r0 $$locbase i1000      ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i300               ; [call]: call input_type_112
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i64        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i824       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
lw   $r0 $$locbase i8         ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i1
jmpf $zero i3
lw   $r0 $$locbase i104       ; load word
movi $r1 i2                   ; initialize constant into register
eq   $r0 $r0 $r1
jnzf $r0 $zero i6
addi $r0 $$locbase i536       ; get offset to local
sw   $$locbase $zero i67      ; store word
addi $r2 $$locbase i1456      ; get offset to local
movi $r1 i40                  ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
jmpf $zero i23
addi $r0 $$locbase i368       ; get offset to local
sw   $$locbase $one i46       ; store word
gtf  $r1 $r4 i577             ; get transaction field
addi $r2 $$locbase i1272      ; get offset to local
movi $r7 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r7              ; copy memory
addi $r1 $$locbase i1048      ; get offset to local
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i354               ; [call]: call from_115
move $r1 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i80        ; get offset to local
movi $r7 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r7              ; copy memory
addi $r1 $r0 i8               ; get offset to aggregate element
movi $r7 i32                  ; get data length for memory copy
mcp  $r1 $r2 $r7              ; copy memory
addi $r2 $$locbase i1456      ; get offset to local
movi $r1 i40                  ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
addi $r1 $$locbase i1496      ; get offset to local
movi $r0 i40                  ; get data length for memory copy
mcp  $r1 $r2 $r0              ; copy memory
jmpf $zero i53
addi $r0 $$locbase i984       ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i245               ; [call]: call input_type_112
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i16        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i952       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
lw   $r0 $$locbase i2         ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i1
jmpf $zero i2
lw   $r0 $$locbase i120       ; load word
eq   $r0 $r0 $zero
jnzf $r0 $zero i6
addi $r0 $$locbase i496       ; get offset to local
sw   $$locbase $zero i62      ; store word
addi $r2 $$locbase i1416      ; get offset to local
movi $r1 i40                  ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
jmpf $zero i23
addi $r0 $$locbase i328       ; get offset to local
sw   $$locbase $one i41       ; store word
gtf  $r1 $r4 i515             ; get transaction field
addi $r2 $$locbase i1240      ; get offset to local
movi $r7 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r7              ; copy memory
addi $r1 $$locbase i1016      ; get offset to local
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i300               ; [call]: call from_115
move $r1 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i32        ; get offset to local
movi $r7 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r7              ; copy memory
addi $r1 $r0 i8               ; get offset to aggregate element
movi $r7 i32                  ; get data length for memory copy
mcp  $r1 $r2 $r7              ; copy memory
addi $r2 $$locbase i1416      ; get offset to local
movi $r1 i40                  ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
addi $r1 $$locbase i1496      ; get offset to local
movi $r0 i40                  ; get data length for memory copy
mcp  $r1 $r2 $r0              ; copy memory
addi $r0 $$locbase i1816      ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r0 $$locbase i1744      ; get offset to local
addi $r1 $$locbase i872       ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
lw   $r0 $$locbase i218       ; load word
eq   $r0 $r0 $one
move $r1 $zero                ; move parameter from branch to block argument
jnzf $r0 $zero i1
move $r1 $one                 ; move parameter from branch to block argument
jnzf $r1 $zero i99
addi $r0 $$locbase i1816      ; get offset to local
addi $r1 $$locbase i1336      ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i1112      ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i280               ; [call]: call unwrap_119
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i112       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i1744      ; get offset to local
addi $r2 $$locbase i1376      ; get offset to local
movi $r7 i40                  ; get data length for memory copy
mcp  $r2 $r0 $r7              ; copy memory
addi $r0 $$locbase i1144      ; get offset to local
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i265               ; [call]: call unwrap_119
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i144       ; get offset to local
movi $r7 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r7              ; copy memory
addi $r0 $$locbase i1176      ; get offset to local
movi $r7 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r7              ; copy memory
addi $r1 $$locbase i1208      ; get offset to local
movi $r7 i32                  ; get data length for memory copy
mcp  $r1 $r2 $r7              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1567              ; [call]: call eq_50
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i53
addi $r0 $$locbase i456       ; get offset to local
sw   $$locbase $one i57       ; store word
sw   $$locbase $zero i61      ; store word
addi $r1 $$locbase i1576      ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i784       ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
lw   $r0 $$locbase i197       ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i24
lw   $r0 $$locbase i98        ; load word
eq   $r0 $r0 $zero
jnzf $r0 $zero i2
load $r0 data_22              ; load constant from data section
rvrt $r0
addi $r0 $$locbase i784       ; get offset to local
addi $r0 $r0 i8               ; get offset to aggregate element
addi $r1 $$locbase i1784      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r1 $$locbase i408       ; get offset to local
sw   $$locbase $zero i51      ; store word
addi $r2 $$locbase i576       ; get offset to local
sw   $$locbase $zero i72      ; store word
addi $r3 $r2 i8               ; get offset to aggregate element
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
addi $r0 $r1 i8               ; get offset to aggregate element
movi $r3 i40                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
addi $r2 $$locbase i1616      ; get offset to local
movi $r0 i48                  ; get data length for memory copy
mcp  $r2 $r1 $r0              ; copy memory
jmpf $zero i10
addi $r0 $$locbase i784       ; get offset to local
addi $r0 $r0 i32              ; get offset to aggregate element
addi $r1 $$locbase i240       ; get offset to local
sw   $$locbase $one i30       ; store word
addi $r2 $r1 i40              ; get offset to aggregate element
movi $r3 i8                   ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
addi $r2 $$locbase i1616      ; get offset to local
movi $r0 i48                  ; get data length for memory copy
mcp  $r2 $r1 $r0              ; copy memory
addi $r3 $$locbase i1664      ; get offset to local
movi $r0 i48                  ; get data length for memory copy
mcp  $r3 $r2 $r0              ; copy memory
movi $r0 i48                  ; get data length for memory copy
mcp  $r6 $r3 $r0              ; copy memory
move $$retv $r6               ; set return value
jmpf $zero i8
add  $r4 $r4 $one
jmpb $zero i310
addi $r0 $$locbase i1816      ; get offset to local
addi $r1 $$locbase i1744      ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
add  $r4 $r4 $one
jmpb $zero i316
cfsi i1872                    ; free 1872 bytes for locals and 0 slots for extra call arguments
move $$reta $r5               ; restore return address
poph i524288                  ; restore registers 40..64
popl i255                     ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i7                       ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function input_count_109
cfei i8                       ; allocate 8 bytes for locals and 0 slots for call arguments
move $r0 $$reta               ; save return address
move $$arg0 $$locbase         ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i31                ; [call]: call tx_type_110
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
move $$locbase $sp            ; save locals base register for function tx_type_110
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
pshl i31                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function input_type_112
cfei i128                     ; allocate 128 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (index)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i85                ; [call]: call input_count_109
move $r3 $$retv               ; [call]: copy the return value
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i56                ; [call]: call ge_113
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
move $$locbase $sp            ; save locals base register for function ge_113
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
pshl i15                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function from_115
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
move $$locbase $sp            ; save locals base register for function unwrap_119
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
pshl i127                     ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function cancel_order_internal_121
cfei i416                     ; allocate 416 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (order)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
addi $r3 $r0 i96              ; get offset to aggregate element
lw   $r4 $r0 i12              ; load word
eq   $r4 $r4 $zero
eq   $r4 $r4 $zero
addi $r5 $$locbase i96        ; get offset to local
movi $r6 i10                  ; initialize constant into register
sw   $$locbase $r6 i12        ; store word
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r5               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1142              ; [call]: call require_97
addi $r4 $$locbase i104       ; get offset to local
movi $r5 i120                 ; get data length for memory copy
mcp  $r4 $r0 $r5              ; copy memory
addi $r5 $$locbase i40        ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r5               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i41                ; [call]: call order_return_asset_amount_122
move $r4 $$retv               ; [call]: copy the return value
movi $r5 i40                  ; get data length for memory copy
mcp  $$locbase $r4 $r5        ; copy memory
addi $r4 $$locbase i376       ; get offset to local
movi $r5 i40                  ; get data length for memory copy
mcp  $r4 $$locbase $r5        ; copy memory
addi $r4 $$locbase i360       ; get offset to local
movi $r5 i16                  ; get data length for memory copy
mcp  $r4 $r3 $r5              ; copy memory
addi $r3 $$locbase i80        ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i2485              ; [call]: call flip_170
move $r3 $$retv               ; [call]: copy the return value
lw   $r4 $r3 i0               ; load word
addi $r3 $r3 i8               ; get offset to aggregate element
lb   $r3 $r3 i0               ; load byte
addi $r5 $$locbase i224       ; get offset to local
movi $r6 i120                 ; get data length for memory copy
mcp  $r5 $r0 $r6              ; copy memory
addi $r0 $$locbase i344       ; get offset to local
sw   $$locbase $r4 i43        ; store word
addi $r4 $r0 i8               ; get offset to aggregate element
sb   $r4 $r3 i0               ; store byte
move $$arg0 $r5               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1097              ; [call]: call remove_update_order_internal_168
movi $r0 i40                  ; get data length for memory copy
mcp  $r1 $$locbase $r0        ; copy memory
move $$retv $r1               ; set return value
cfsi i416                     ; free 416 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i127                     ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i255                     ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function order_return_asset_amount_122
cfei i1016                    ; allocate 1016 bytes for locals and 0 slots for call arguments
move $r7 $$arg0               ; save argument 0 (order)
move $r6 $$arg1               ; save argument 1 (__ret_value)
move $r5 $$reta               ; save return address
addi $r4 $r7 i96              ; get offset to aggregate element
addi $r0 $r4 i8               ; get offset to aggregate element
lb   $r0 $r0 i0               ; load byte
jnzf $r0 $zero i107
load $r0 data_6               ; get local constant
load $r1 data_6               ; get local constant
addi $r2 $$locbase i304       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
sw   $$locbase $zero i42      ; store word
addi $r0 $r2 i40              ; get offset to aggregate element
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r3              ; copy memory
addi $r0 $r7 i64              ; get offset to aggregate element
addi $r1 $$locbase i832       ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r1 $r2 $r3              ; copy memory
addi $r2 $$locbase i904       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
addi $r0 $$locbase i536       ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i293               ; [call]: call get_130
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i72        ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r2 i72                  ; get data length for memory copy
mcp  $$locbase $r0 $r2        ; copy memory
addi $r0 $$locbase i760       ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r0 $$locbase $r2        ; copy memory
addi $r2 $$locbase i504       ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i264               ; [call]: call slot_128
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i144       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
addi $r0 $$locbase i608       ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r0 $r1 $r3              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1751              ; [call]: call offset_67
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i728       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r2 $r3              ; copy memory
addi $r2 $$locbase i456       ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i81                ; [call]: call read_125
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i176       ; get offset to local
movi $r2 i48                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i680       ; get offset to local
movi $r2 i48                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r1 $$locbase i416       ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i45                ; [call]: call unwrap_123
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i224       ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i976       ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r0 $ssp i8              ; get address of configurable QUOTE_TOKEN
lw   $r1 $r4 i0               ; load word
lw   $r2 $$locbase i32        ; load word
lw   $r3 $r7 i14              ; load word
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
move $$arg2 $r3               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i292               ; [call]: call base_size_to_quote_amount_136
move $r1 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i376       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
sw   $$locbase $r1 i51        ; store word
addi $r3 $$locbase i936       ; get offset to local
movi $r0 i40                  ; get data length for memory copy
mcp  $r3 $r2 $r0              ; copy memory
jmpf $zero i10
addi $r0 $r7 i64              ; get offset to aggregate element
addi $r1 $$locbase i264       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $r1 i32              ; get offset to aggregate element
movi $r2 i8                   ; get data length for memory copy
mcp  $r0 $r4 $r2              ; copy memory
addi $r3 $$locbase i936       ; get offset to local
movi $r0 i40                  ; get data length for memory copy
mcp  $r3 $r1 $r0              ; copy memory
movi $r0 i40                  ; get data length for memory copy
mcp  $r6 $r3 $r0              ; copy memory
move $$retv $r6               ; set return value
cfsi i1016                    ; free 1016 bytes for locals and 0 slots for extra call arguments
move $$reta $r5               ; restore return address
poph i524288                  ; restore registers 40..64
popl i255                     ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i15                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function unwrap_123
cfei i48                      ; allocate 48 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
movi $r3 i48                  ; get data length for memory copy
mcp  $$locbase $r0 $r3        ; copy memory
lw   $r0 $r0 i0               ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i1
rvrt $zero
addi $r0 $$locbase i8         ; get offset to aggregate element
movi $r3 i40                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
move $$retv $r1               ; set return value
cfsi i48                      ; free 48 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i15                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i63                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function read_125
cfei i392                     ; allocate 392 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (slot)
move $r1 $$arg1               ; save argument 1 (offset)
move $r2 $$arg2               ; save argument 2 (__ret_value)
move $r3 $$reta               ; save return address
addi $r4 $$locbase i232       ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r0 $r5              ; copy memory
addi $r0 $$locbase i184       ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i48                ; [call]: call slot_calculator_126
move $r0 $$retv               ; [call]: copy the return value
movi $r1 i48                  ; get data length for memory copy
mcp  $$locbase $r0 $r1        ; copy memory
addi $r0 $$locbase i312       ; get offset to local
movi $r1 i48                  ; get data length for memory copy
mcp  $r0 $$locbase $r1        ; copy memory
addi $r0 $$locbase i360       ; get offset to local
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $$locbase $r1        ; copy memory
lw   $r0 $$locbase i4         ; load word
lw   $r1 $$locbase i5         ; load word
movi $r4 i32                  ; initialize constant into register
mul  $r4 $r0 $r4
movi $r5 i8                   ; initialize constant into register
mul  $r4 $r5 $r4
aloc $r4                      ; aloc size
move $r4 $hp                  ; move ptr hp
addi $r5 $$locbase i360       ; get offset to local
srwq $r4 $r0 $r5 $r0          ; read sequence of storage slots
jnzf $r0 $zero i6
addi $r0 $$locbase i136       ; get offset to local
sw   $$locbase $zero i17      ; store word
addi $r4 $$locbase i264       ; get offset to local
movi $r1 i48                  ; get data length for memory copy
mcp  $r4 $r0 $r1              ; copy memory
jmpf $zero i14
addi $r0 $$locbase i88        ; get offset to local
sw   $$locbase $one i11       ; store word
movi $r5 i8                   ; initialize constant into register
mul  $r1 $r5 $r1
add  $r1 $r4 $r1
addi $r4 $$locbase i48        ; get offset to local
movi $r5 i40                  ; get data length for memory copy
mcp  $r4 $r1 $r5              ; copy memory
addi $r1 $r0 i8               ; get offset to aggregate element
movi $r5 i40                  ; get data length for memory copy
mcp  $r1 $r4 $r5              ; copy memory
addi $r4 $$locbase i264       ; get offset to local
movi $r1 i48                  ; get data length for memory copy
mcp  $r4 $r0 $r1              ; copy memory
movi $r0 i48                  ; get data length for memory copy
mcp  $r2 $r4 $r0              ; copy memory
move $$retv $r2               ; set return value
cfsi i392                     ; free 392 bytes for locals and 0 slots for extra call arguments
move $$reta $r3               ; restore return address
poph i524288                  ; restore registers 40..64
popl i63                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i255                     ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function slot_calculator_126
cfei i496                     ; allocate 496 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (slot)
move $r1 $$arg1               ; save argument 1 (offset)
move $r6 $$arg2               ; save argument 2 (__ret_value)
move $r5 $$reta               ; save return address
movi $r2 i8                   ; initialize constant into register
mul  $r2 $r1 $r2
movi $r3 i40                  ; initialize constant into register
add  $r2 $r2 $r3
movi $r3 i31                  ; initialize constant into register
add  $r2 $r2 $r3
movi $r3 i5                   ; initialize constant into register
srl  $r2 $r2 $r3
movi $r3 i4                   ; initialize constant into register
mod  $r7 $r1 $r3
movi $r1 i8                   ; initialize constant into register
mul  $r1 $r7 $r1
movi $r3 i40                  ; initialize constant into register
add  $r1 $r1 $r3
movi $r3 i31                  ; initialize constant into register
add  $r1 $r1 $r3
movi $r3 i5                   ; initialize constant into register
srl  $r1 $r1 $r3
addi $r3 $$locbase i176       ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
movi $r0 i32                  ; get data length for memory copy
mcp  $$locbase $r3 $r0        ; copy memory
addi $r0 $$locbase i464       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $$locbase $r3        ; copy memory
addi $r0 $$locbase i240       ; get offset to local
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1974              ; [call]: call as_u256_62
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i32        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
addi $r0 $$locbase i272       ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1985              ; [call]: call as_u256_62
move $r0 $$retv               ; [call]: copy the return value
addi $r3 $$locbase i64        ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
addi $r0 $$locbase i304       ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r0 $r2 $r4              ; copy memory
addi $r2 $$locbase i432       ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r2 $r3 $r4              ; copy memory
addi $r3 $$locbase i368       ; get offset to local
wqop $r3 $r0 $r2 i33
addi $r0 $$locbase i336       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $$locbase $r2        ; copy memory
addi $r2 $$locbase i368       ; get offset to local
addi $r3 $$locbase i400       ; get offset to local
wqop $r3 $r0 $r2 i32
addi $r0 $$locbase i464       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r3 $r2              ; copy memory
addi $r0 $$locbase i208       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r3 $r2              ; copy memory
addi $r2 $$locbase i96        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
addi $r0 $$locbase i128       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
sw   $$locbase $r1 i20        ; store word
sw   $$locbase $r7 i21        ; store word
movi $r1 i48                  ; get data length for memory copy
mcp  $r6 $r0 $r1              ; copy memory
move $$retv $r6               ; set return value
cfsi i496                     ; free 496 bytes for locals and 0 slots for extra call arguments
move $$reta $r5               ; restore return address
poph i524288                  ; restore registers 40..64
popl i255                     ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i15                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function slot_128
cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
move $$retv $r1               ; set return value
cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i15                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i63                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function get_130
cfei i568                     ; allocate 568 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (key)
move $r2 $$arg2               ; save argument 2 (__ret_value)
move $r3 $$reta               ; save return address
addi $r4 $$locbase i464       ; get offset to local
movi $r5 i72                  ; get data length for memory copy
mcp  $r4 $r0 $r5              ; copy memory
addi $r0 $$locbase i304       ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i4071              ; [call]: call field_id_251
move $r0 $$retv               ; [call]: copy the return value
movi $r4 i32                  ; get data length for memory copy
mcp  $$locbase $r0 $r4        ; copy memory
addi $r0 $$locbase i136       ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r4              ; copy memory
addi $r1 $r0 i32              ; get offset to aggregate element
movi $r4 i32                  ; get data length for memory copy
mcp  $r1 $$locbase $r4        ; copy memory
addi $r1 $$locbase i336       ; get offset to local
movi $r4 i64                  ; get data length for memory copy
mcp  $r1 $r0 $r4              ; copy memory
addi $r0 $$locbase i200       ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i2457              ; [call]: call sha256_186
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i32        ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r4              ; copy memory
addi $r0 $$locbase i536       ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r4              ; copy memory
addi $r0 $$locbase i400       ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r4              ; copy memory
addi $r4 $$locbase i432       ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r1 $r5              ; copy memory
addi $r1 $$locbase i232       ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $zero             ; [call]: pass argument 1
move $$arg2 $r4               ; [call]: pass argument 2
move $$arg3 $r1               ; [call]: pass argument 3
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i2539              ; [call]: call new_190
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i64        ; get offset to local
movi $r4 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r4              ; copy memory
movi $r0 i72                  ; get data length for memory copy
mcp  $r2 $r1 $r0              ; copy memory
move $$retv $r2               ; set return value
cfsi i568                     ; free 568 bytes for locals and 0 slots for extra call arguments
move $$reta $r3               ; restore return address
poph i524288                  ; restore registers 40..64
popl i63                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i63                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function base_size_to_quote_amount_136
cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (base_size)
move $r1 $$arg1               ; save argument 1 (base_decimals)
move $r2 $$arg2               ; save argument 2 (base_price)
move $r3 $$reta               ; save return address
lw   $r4 $ssp i0              ; load word
add  $r5 $r1 $r4
load $r1 data_3               ; load constant from data section
gt   $r1 $r5 $r1
jnzf $r1 $zero i1
jmpf $zero i7
move $r1 $flag                ; return value from ASM block with return register flag
movi $r4 i2                   ; initialize constant into register
and  $r1 $r1 $r4
eq   $r1 $r1 $zero
jnzf $r1 $zero i16
load $r1 data_26              ; load constant from data section
mod  $r5 $r5 $r1
lw   $r1 $ssp i5              ; load word
sub  $r1 $r5 $r1
movi $r4 i10                  ; initialize constant into register
exp  $r1 $r4 $r1              ; exp r3 r1 r2
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i8                 ; [call]: call mul_div_137
move $r0 $$retv               ; [call]: copy the return value
move $$retv $r0               ; set return value
jmpf $zero i1
rvrt $zero
cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments
move $$reta $r3               ; restore return address
poph i524288                  ; restore registers 40..64
popl i63                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i127                     ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function mul_div_137
cfei i256                     ; allocate 256 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (mul_to)
move $r2 $$arg2               ; save argument 2 (div_to)
move $r6 $$reta               ; save return address
sw   $$locbase $zero i2       ; store word
sw   $$locbase $r0 i3         ; store word
addi $r0 $$locbase i16        ; get offset to local
addi $r3 $$locbase i80        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i151               ; [call]: call from_145
move $r0 $$retv               ; [call]: copy the return value
lw   $r3 $r0 i0               ; load word
lw   $r0 $r0 i1               ; load word
sw   $$locbase $zero i4       ; store word
sw   $$locbase $r1 i5         ; store word
addi $r1 $$locbase i32        ; get offset to local
addi $r4 $$locbase i96        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i138               ; [call]: call from_145
move $r1 $$retv               ; [call]: copy the return value
lw   $r4 $r1 i0               ; load word
lw   $r1 $r1 i1               ; load word
addi $r5 $$locbase i160       ; get offset to local
sw   $$locbase $r3 i20        ; store word
sw   $$locbase $r0 i21        ; store word
addi $r0 $$locbase i176       ; get offset to local
sw   $$locbase $r4 i22        ; store word
sw   $$locbase $r1 i23        ; store word
addi $r1 $$locbase i64        ; get offset to local
move $$arg0 $r5               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i61                ; [call]: call multiply_138
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r0 $r0 i1               ; load word
sw   $$locbase $r1 i30        ; store word
sw   $$locbase $r0 i31        ; store word
sw   $$locbase $zero i6       ; store word
sw   $$locbase $r2 i7         ; store word
addi $r0 $$locbase i48        ; get offset to local
addi $r1 $$locbase i112       ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i106               ; [call]: call from_145
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r0 $r0 i1               ; load word
addi $r2 $$locbase i240       ; get offset to local
addi $r3 $$locbase i192       ; get offset to local
sw   $$locbase $r1 i24        ; store word
sw   $$locbase $r0 i25        ; store word
addi $r0 $$locbase i128       ; get offset to local
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i106               ; [call]: call divide_146
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r0 $r0 i1               ; load word
sw   $$locbase $r1 i28        ; store word
sw   $$locbase $r0 i29        ; store word
addi $r0 $$locbase i224       ; get offset to local
addi $r1 $$locbase i144       ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i525               ; [call]: call as_u64_162
move $r0 $$retv               ; [call]: copy the return value
movi $r1 i16                  ; get data length for memory copy
mcp  $$locbase $r0 $r1        ; copy memory
addi $r0 $$locbase i208       ; get offset to local
movi $r1 i16                  ; get data length for memory copy
mcp  $r0 $$locbase $r1        ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i495               ; [call]: call unwrap_161
move $r0 $$retv               ; [call]: copy the return value
move $$retv $r0               ; set return value
cfsi i256                     ; free 256 bytes for locals and 0 slots for extra call arguments
move $$reta $r6               ; restore return address
poph i524288                  ; restore registers 40..64
popl i127                     ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i1023                    ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function multiply_138
cfei i16                      ; allocate 16 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (other)
move $r2 $$arg2               ; save argument 2 (__ret_value)
move $r3 $$reta               ; save return address
lw   $r4 $r0 i0               ; load word
eq   $r4 $r4 $zero
jnzf $r4 $zero i2
lw   $r4 $r1 i0               ; load word
eq   $r4 $r4 $zero
eq   $r4 $r4 $zero
jnzf $r4 $zero i38
addi $r4 $r0 i8               ; get offset to aggregate element
lw   $r5 $r0 i1               ; load word
addi $r6 $r1 i8               ; get offset to aggregate element
lw   $r7 $r1 i1               ; load word
move $r8 $flag                ; return value from ASM block with return register flag
movi $r9 i2                   ; initialize constant into register
or   $r9 $r8 $r9
flag $r9                      ; flag flag_val
sw   $$locbase $zero i0       ; store word
sw   $$locbase $zero i1       ; store word
move $r9 $$locbase            ; copy ASM block argument's constant initial value to register
mul  $r5 $r5 $r7              ; mul product left right
move $r7 $of                  ; move overflow of
sw   $r9 $r7 i0               ; sw result_ptr overflow i0
sw   $r9 $r5 i1               ; sw result_ptr product i1
flag $r8                      ; flag new_flags
lw   $r8 $$locbase i0         ; load word
lw   $r5 $$locbase i1         ; load word
lw   $r7 $r0 i0               ; load word
eq   $r7 $r7 $zero
jnzf $r7 $zero i9
lw   $r1 $r1 i0               ; load word
eq   $r1 $r1 $zero
jnzf $r1 $zero i1
jmpf $zero i9
lw   $r0 $r0 i0               ; load word
lw   $r1 $r6 i0               ; load word
mul  $r0 $r0 $r1
add  $r8 $r8 $r0
jmpf $zero i4
lw   $r0 $r4 i0               ; load word
lw   $r1 $r1 i0               ; load word
mul  $r0 $r0 $r1
add  $r8 $r8 $r0
sw   $r2 $r8 i0               ; store word
sw   $r2 $r5 i1               ; store word
move $$retv $r2               ; set return value
jmpf $zero i2
load $r0 data_27              ; load constant from data section
rvrt $r0
cfsi i16                      ; free 16 bytes for locals and 0 slots for extra call arguments
move $$reta $r3               ; restore return address
poph i524288                  ; restore registers 40..64
popl i1023                    ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i15                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function from_145
cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (components)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
lw   $r3 $r0 i0               ; load word
lw   $r0 $r0 i1               ; load word
sw   $r1 $r3 i0               ; store word
sw   $r1 $r0 i1               ; store word
move $$retv $r1               ; set return value
cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i15                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i4095                    ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function divide_146
cfei i352                     ; allocate 352 bytes for locals and 0 slots for call arguments
move $r7 $$arg0               ; save argument 0 (self)
move $r6 $$arg1               ; save argument 1 (divisor)
move $r5 $$arg2               ; save argument 2 (__ret_value)
move $r4 $$reta               ; save return address
addi $r0 $$locbase i144       ; get offset to local
sw   $$locbase $zero i18      ; store word
sw   $$locbase $zero i19      ; store word
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $$locbase         ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i30                ; [call]: call from_145
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r0 $r0 i1               ; load word
addi $r2 $$locbase i224       ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r2 $r6 $r3              ; copy memory
addi $r3 $$locbase i240       ; get offset to local
sw   $$locbase $r1 i30        ; store word
sw   $$locbase $r0 i31        ; store word
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i238               ; [call]: call eq_148
move $r0 $$retv               ; [call]: copy the return value
eq   $r0 $r0 $zero
eq   $r0 $r0 $zero
jnzf $r0 $zero i227
lw   $r0 $r7 i0               ; load word
eq   $r0 $r0 $zero
jnzf $r0 $zero i1
jmpf $zero i2
lw   $r0 $r6 i0               ; load word
eq   $r0 $r0 $zero
jnzf $r0 $zero i200
addi $r0 $$locbase i64        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i240               ; [call]: call new_150
move $r0 $$retv               ; [call]: copy the return value
lw   $r8 $r0 i0               ; load word
lw   $r9 $r0 i1               ; load word
addi $r0 $$locbase i80        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i231               ; [call]: call new_150
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r0 $r0 i1               ; load word
sw   $$locbase $r1 i42        ; store word
sw   $$locbase $r0 i43        ; store word
movi $r10 i127                ; initialize constant into register
addi $r0 $$locbase i288       ; get offset to local
sw   $$locbase $r8 i36        ; store word
sw   $$locbase $r9 i37        ; store word
addi $r1 $$locbase i112       ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $one              ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i226               ; [call]: call lsh_152
move $r0 $$retv               ; [call]: copy the return value
lw   $r8 $r0 i0               ; load word
lw   $r9 $r0 i1               ; load word
addi $r0 $$locbase i336       ; get offset to local
addi $r1 $$locbase i304       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i128       ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $one              ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i211               ; [call]: call lsh_152
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r0 $r0 i1               ; load word
sw   $$locbase $r1 i42        ; store word
sw   $$locbase $r0 i43        ; store word
lw   $r0 $$locbase i43        ; load word
move $$arg0 $r10              ; [call]: pass argument 0
movi $r1 i128                 ; initialize constant into register
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i849               ; [call]: call ge_113
move $r1 $$retv               ; [call]: copy the return value
jnzf $r1 $zero i48
move $$arg0 $r10              ; [call]: pass argument 0
movi $r1 i64                  ; initialize constant into register
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i858               ; [call]: call ge_113
move $r1 $$retv               ; [call]: copy the return value
jnzf $r1 $zero i22
lw   $r1 $r7 i0               ; load word
movi $r2 i64                  ; initialize constant into register
sub  $r2 $r2 $r10
sll  $r1 $r1 $r2
lw   $r2 $r7 i0               ; load word
srl  $r2 $r2 $r10
lw   $r3 $r7 i1               ; load word
srl  $r3 $r3 $r10
add  $r1 $r3 $r1
addi $r3 $$locbase i208       ; get offset to local
sw   $$locbase $r2 i26        ; store word
sw   $$locbase $r1 i27        ; store word
addi $r1 $$locbase i48        ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i146               ; [call]: call from_145
move $r1 $$retv               ; [call]: copy the return value
lw   $r1 $r1 i1               ; load word
jmpf $zero i25
lw   $r1 $r7 i0               ; load word
movi $r2 i64                  ; initialize constant into register
sub  $r2 $r10 $r2
srl  $r1 $r1 $r2
addi $r2 $$locbase i176       ; get offset to local
sw   $$locbase $zero i22      ; store word
sw   $$locbase $r1 i23        ; store word
addi $r1 $$locbase i32        ; get offset to local
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i163               ; [call]: call from_145
move $r1 $$retv               ; [call]: copy the return value
lw   $r1 $r1 i1               ; load word
jmpf $zero i8
addi $r1 $$locbase i96        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i130               ; [call]: call new_150
move $r1 $$retv               ; [call]: copy the return value
lw   $r1 $r1 i1               ; load word
and  $r1 $r1 $one
or   $r0 $r0 $r1
sw   $$locbase $r0 i43        ; store word
addi $r0 $$locbase i336       ; get offset to local
lw   $r1 $$locbase i42        ; load word
lw   $r2 $r6 i0               ; load word
gt   $r1 $r1 $r2
jnzf $r1 $zero i8
lw   $r1 $r0 i0               ; load word
lw   $r2 $r6 i0               ; load word
eq   $r1 $r1 $r2
jnzf $r1 $zero i1
jmpf $zero i3
lw   $r1 $r0 i1               ; load word
lw   $r2 $r6 i1               ; load word
gt   $r1 $r1 $r2
jnzf $r1 $zero i13
addi $r1 $$locbase i256       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i272       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r6 $r2              ; copy memory
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i80                ; [call]: call eq_148
move $r1 $$retv               ; [call]: copy the return value
jnzf $r1 $zero i1
jmpf $zero i40
addi $r0 $$locbase i336       ; get offset to local
addi $r1 $$locbase i320       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r2 $$locbase i192       ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r2 $r6 $r3              ; copy memory
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i184               ; [call]: call lt_159
move $r1 $$retv               ; [call]: copy the return value
eq   $r1 $r1 $zero
eq   $r1 $r1 $zero
jnzf $r1 $zero i31
lw   $r1 $r0 i0               ; load word
lw   $r2 $r6 i0               ; load word
sub  $r11 $r1 $r2
addi $r1 $r0 i8               ; get offset to aggregate element
lw   $r0 $r0 i1               ; load word
addi $r2 $r6 i8               ; get offset to aggregate element
lw   $r3 $r6 i1               ; load word
lt   $r0 $r0 $r3
jnzf $r0 $zero i4
lw   $r0 $r1 i0               ; load word
lw   $r1 $r2 i0               ; load word
sub  $r0 $r0 $r1
jmpf $zero i7
lw   $r0 $r2 i0               ; load word
lw   $r1 $r1 i0               ; load word
sub  $r0 $r0 $r1
sub  $r0 $r0 $one
load $r1 data_28              ; load constant from data section
sub  $r0 $r1 $r0
sub  $r11 $r11 $one
sw   $$locbase $r11 i42       ; store word
sw   $$locbase $r0 i43        ; store word
or   $r9 $r9 $one
eq   $r0 $r10 $zero
jnzf $r0 $zero i2
sub  $r10 $r10 $one
jmpb $zero i171
sw   $r5 $r8 i0               ; store word
sw   $r5 $r9 i1               ; store word
move $$retv $r5               ; set return value
jmpf $zero i24
load $r0 data_27              ; load constant from data section
rvrt $r0
lw   $r0 $r7 i1               ; load word
lw   $r1 $r6 i1               ; load word
div  $r0 $r0 $r1
addi $r1 $$locbase i160       ; get offset to local
sw   $$locbase $zero i20      ; store word
sw   $$locbase $r0 i21        ; store word
addi $r0 $$locbase i16        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i269               ; [call]: call from_145
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r0 $r0 i1               ; load word
sw   $r5 $r1 i0               ; store word
sw   $r5 $r0 i1               ; store word
move $$retv $r5               ; set return value
jmpf $zero i2
load $r0 data_27              ; load constant from data section
rvrt $r0
cfsi i352                     ; free 352 bytes for locals and 0 slots for extra call arguments
move $$reta $r4               ; restore return address
poph i524288                  ; restore registers 40..64
popl i4095                    ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i31                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function eq_148
cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (other)
move $r2 $$reta               ; save return address
lw   $r3 $r0 i1               ; load word
lw   $r4 $r1 i1               ; load word
eq   $r3 $r3 $r4
jnzf $r3 $zero i1
jmpf $zero i3
lw   $r0 $r0 i0               ; load word
lw   $r1 $r1 i0               ; load word
eq   $r3 $r0 $r1
move $$retv $r3               ; set return value
cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i31                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i3                       ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function new_150
cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (__ret_value)
move $r1 $$reta               ; save return address
sw   $r0 $zero i0             ; store word
sw   $r0 $zero i1             ; store word
move $$retv $r0               ; set return value
cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments
move $$reta $r1               ; restore return address
poph i524288                  ; restore registers 40..64
popl i3                       ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i63                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function lsh_152
cfei i80                      ; allocate 80 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (rhs)
move $r2 $$arg2               ; save argument 2 (__ret_value)
move $r3 $$reta               ; save return address
move $$arg0 $r1               ; [call]: pass argument 0
movi $r4 i128                 ; initialize constant into register
move $$arg1 $r4               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1062              ; [call]: call ge_113
move $r4 $$retv               ; [call]: copy the return value
jnzf $r4 $zero i55
move $$arg0 $r1               ; [call]: pass argument 0
movi $r4 i64                  ; initialize constant into register
move $$arg1 $r4               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1071              ; [call]: call ge_113
move $r4 $$retv               ; [call]: copy the return value
jnzf $r4 $zero i26
lw   $r4 $r0 i1               ; load word
movi $r5 i64                  ; initialize constant into register
sub  $r5 $r5 $r1
srl  $r4 $r4 $r5
lw   $r5 $r0 i0               ; load word
sll  $r5 $r5 $r1
add  $r4 $r5 $r4
lw   $r0 $r0 i1               ; load word
sll  $r0 $r0 $r1
addi $r1 $$locbase i64        ; get offset to local
sw   $$locbase $r4 i8         ; store word
sw   $$locbase $r0 i9         ; store word
addi $r0 $$locbase i16        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i359               ; [call]: call from_145
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r0 $r0 i1               ; load word
sw   $r2 $r1 i0               ; store word
sw   $r2 $r0 i1               ; store word
move $$retv $r2               ; set return value
jmpf $zero i32
lw   $r0 $r0 i1               ; load word
movi $r4 i64                  ; initialize constant into register
sub  $r1 $r1 $r4
sll  $r0 $r0 $r1
addi $r1 $$locbase i48        ; get offset to local
sw   $$locbase $r0 i6         ; store word
sw   $$locbase $zero i7       ; store word
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $$locbase         ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i379               ; [call]: call from_145
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r0 $r0 i1               ; load word
sw   $r2 $r1 i0               ; store word
sw   $r2 $r0 i1               ; store word
move $$retv $r2               ; set return value
jmpf $zero i12
addi $r0 $$locbase i32        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i88                ; [call]: call new_150
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r0 $r0 i1               ; load word
sw   $r2 $r1 i0               ; store word
sw   $r2 $r0 i1               ; store word
move $$retv $r2               ; set return value
cfsi i80                      ; free 80 bytes for locals and 0 slots for extra call arguments
move $$reta $r3               ; restore return address
poph i524288                  ; restore registers 40..64
popl i63                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i31                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function lt_159
cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (other)
move $r2 $$reta               ; save return address
lw   $r3 $r0 i0               ; load word
lw   $r4 $r1 i0               ; load word
lt   $r3 $r3 $r4
jnzf $r3 $zero i8
lw   $r3 $r0 i0               ; load word
lw   $r4 $r1 i0               ; load word
eq   $r3 $r3 $r4
jnzf $r3 $zero i1
jmpf $zero i3
lw   $r0 $r0 i1               ; load word
lw   $r1 $r1 i1               ; load word
lt   $r3 $r0 $r1
move $$retv $r3               ; set return value
cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i31                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i7                       ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function unwrap_161
cfei i16                      ; allocate 16 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$reta               ; save return address
movi $r2 i16                  ; get data length for memory copy
mcp  $$locbase $r0 $r2        ; copy memory
lw   $r0 $r0 i0               ; load word
eq   $r0 $r0 $zero
jnzf $r0 $zero i1
rvrt $zero
lw   $r0 $$locbase i1         ; load word
move $$retv $r0               ; set return value
cfsi i16                      ; free 16 bytes for locals and 0 slots for extra call arguments
move $$reta $r1               ; restore return address
poph i524288                  ; restore registers 40..64
popl i7                       ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i31                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function as_u64_162
cfei i48                      ; allocate 48 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
lw   $r3 $r0 i0               ; load word
eq   $r3 $r3 $zero
jnzf $r3 $zero i7
addi $r0 $$locbase i16        ; get offset to local
sw   $$locbase $one i2        ; store word
sw   $$locbase $zero i3       ; store word
addi $r4 $$locbase i32        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r4 $r0 $r3              ; copy memory
jmpf $zero i8
sw   $$locbase $zero i0       ; store word
addi $r0 $r0 i8               ; get offset to aggregate element
addi $r3 $$locbase i8         ; get offset to aggregate element
movi $r4 i8                   ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
addi $r4 $$locbase i32        ; get offset to local
movi $r0 i16                  ; get data length for memory copy
mcp  $r4 $$locbase $r0        ; copy memory
movi $r0 i16                  ; get data length for memory copy
mcp  $r1 $r4 $r0              ; copy memory
move $$retv $r1               ; set return value
cfsi i48                      ; free 48 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i31                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i8191                    ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function remove_update_order_internal_168
cfei i9224                    ; allocate 9224 bytes for locals and 0 slots for call arguments
move $r7 $$arg0               ; save argument 0 (order)
move $r6 $$arg1               ; save argument 1 (base_size)
move $r5 $$reta               ; save return address
addi $r0 $r7 i96              ; get offset to aggregate element
movi $r1 i6032                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r6 $r2              ; copy memory
addi $r2 $$locbase i3432      ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1352              ; [call]: call flip_170
move $r1 $$retv               ; [call]: copy the return value
lw   $r2 $r1 i0               ; load word
addi $r1 $r1 i8               ; get offset to aggregate element
lb   $r1 $r1 i0               ; load byte
movi $r3 i6000                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
movi $r4 i16                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
movi $r0 i6016                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
sw   $$locbase $r2 i752       ; store word
addi $r2 $r0 i8               ; get offset to aggregate element
sb   $r2 $r1 i0               ; store byte
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1312              ; [call]: call eq_169
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i127
movi $r0 i9104                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i120                 ; get data length for memory copy
mcp  $r0 $r7 $r1              ; copy memory
movi $r0 i9104                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
addi $r0 $r0 i96              ; get offset to aggregate element
addi $r1 $r0 i8               ; get offset to aggregate element
lb   $r2 $r1 i0               ; load byte
eq   $r2 $r2 $zero
jnzf $r2 $zero i1
jmpf $zero i3
addi $r2 $r6 i8               ; get offset to aggregate element
lb   $r2 $r2 i0               ; load byte
eq   $r2 $r2 $zero
jnzf $r2 $zero i56
lb   $r2 $r1 i0               ; load byte
jnzf $r2 $zero i1
jmpf $zero i2
addi $r2 $r6 i8               ; get offset to aggregate element
lb   $r2 $r2 i0               ; load byte
jnzf $r2 $zero i35
lw   $r2 $r0 i0               ; load word
lw   $r3 $r6 i0               ; load word
gt   $r2 $r2 $r3
jnzf $r2 $zero i26
lw   $r1 $r0 i0               ; load word
lw   $r2 $r6 i0               ; load word
lt   $r1 $r1 $r2
jnzf $r1 $zero i16
lw   $r0 $r0 i0               ; load word
lw   $r1 $r6 i0               ; load word
eq   $r0 $r0 $r1
jnzf $r0 $zero i1
rvrt $zero
addi $r0 $$locbase i3448      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1386              ; [call]: call new_172
move $r0 $$retv               ; [call]: copy the return value
lw   $r2 $r0 i0               ; load word
addi $r0 $r0 i8               ; get offset to aggregate element
lb   $r0 $r0 i0               ; load byte
jmpf $zero i5
lw   $r1 $r6 i0               ; load word
lw   $r0 $r0 i0               ; load word
sub  $r2 $r1 $r0
addi $r0 $r6 i8               ; get offset to aggregate element
lb   $r0 $r0 i0               ; load byte
jmpf $zero i4
lw   $r0 $r0 i0               ; load word
lw   $r2 $r6 i0               ; load word
sub  $r2 $r0 $r2
lb   $r0 $r1 i0               ; load byte
jmpf $zero i14
lw   $r0 $r0 i0               ; load word
lw   $r1 $r6 i0               ; load word
add  $r0 $r0 $r1
addi $r1 $$locbase i3480      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1387              ; [call]: call neg_from_175
move $r0 $$retv               ; [call]: copy the return value
lw   $r2 $r0 i0               ; load word
addi $r0 $r0 i8               ; get offset to aggregate element
lb   $r0 $r0 i0               ; load byte
jmpf $zero i14
lw   $r0 $r0 i0               ; load word
lw   $r1 $r6 i0               ; load word
add  $r0 $r0 $r1
addi $r1 $$locbase i3464      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1358              ; [call]: call from_173
move $r0 $$retv               ; [call]: copy the return value
lw   $r2 $r0 i0               ; load word
addi $r0 $r0 i8               ; get offset to aggregate element
lb   $r0 $r0 i0               ; load byte
load $r1 data_10              ; get local constant
load $r3 data_10              ; get local constant
movi $r4 i9104                ; get offset to local
add  $r4 $$locbase $r4        ; get offset to local
addi $r4 $r4 i96              ; get offset to aggregate element
sw   $$locbase $r2 i1150      ; store word
addi $r2 $r4 i8               ; get offset to aggregate element
sb   $r2 $r0 i0               ; store byte
addi $r0 $$locbase i2616      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
sw   $$locbase $zero i331     ; store word
addi $r1 $r0 i40              ; get offset to aggregate element
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r3 $r2              ; copy memory
movi $r1 i9104                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i9104                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i7208                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
movi $r4 i72                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
movi $r0 i7288                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r4              ; copy memory
movi $r1 i7320                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r4 i120                 ; get data length for memory copy
mcp  $r1 $r2 $r4              ; copy memory
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i2329              ; [call]: call insert_225
jmpf $zero i1174
load $r0 data_13              ; get local constant
load $r1 data_13              ; get local constant
load $r9 data_13              ; get local constant
load $r8 data_13              ; get local constant
load $r6 data_12              ; get local constant
load $r4 data_12              ; get local constant
addi $r2 $$locbase i2152      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
sw   $$locbase $zero i273     ; store word
addi $r0 $r2 i40              ; get offset to aggregate element
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r3              ; copy memory
addi $r10 $r7 i32             ; get offset to aggregate element
movi $r0 i5208                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i72                  ; get data length for memory copy
mcp  $r0 $r2 $r1              ; copy memory
movi $r1 i5280                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r10 $r2             ; copy memory
movi $r2 i4408                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i961               ; [call]: call get_130
move $r0 $$retv               ; [call]: copy the return value
movi $r1 i72                  ; get data length for memory copy
mcp  $$locbase $r0 $r1        ; copy memory
movi $r0 i6304                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i72                  ; get data length for memory copy
mcp  $r0 $$locbase $r1        ; copy memory
movi $r1 i6376                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r7 $r2              ; copy memory
addi $r2 $$locbase i3656      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1441              ; [call]: call get_182
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i552       ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r2 $$locbase i72        ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i8256                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
addi $r2 $$locbase i3576      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1011              ; [call]: call slot_128
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i1024      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i5064                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r0 $r1 $r3              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i3029              ; [call]: call offset_67
move $r0 $$retv               ; [call]: copy the return value
movi $r1 i6048                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r2 $r3              ; copy memory
addi $r2 $$locbase i3496      ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1245              ; [call]: call read_178
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i1528      ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i7440                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i2801              ; [call]: call unwrap_233
move $r0 $$retv               ; [call]: copy the return value
sub  $r11 $r0 $one
addi $r0 $$locbase i2472      ; get offset to local
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $r9 $r1              ; copy memory
sw   $$locbase $zero i313     ; store word
addi $r1 $r0 i40              ; get offset to aggregate element
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r8 $r2              ; copy memory
movi $r1 i5312                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i5384                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r10 $r2             ; copy memory
movi $r2 i4672                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1063              ; [call]: call get_130
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i1896      ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i7456                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r1 i4248                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i3008              ; [call]: call field_id_251
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i1968      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i2224      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r7 $r2              ; copy memory
addi $r2 $r0 i32              ; get offset to aggregate element
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i5728                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i64                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i3296      ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i3107              ; [call]: call sha256_69
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i2000      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i8912                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r0 i6272                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r1 $$locbase i3608      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $zero             ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1217              ; [call]: call slot_calculator_179
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i2032      ; get offset to local
movi $r2 i48                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i8520                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i48                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r0 i9040                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
addi $r1 $$locbase i2032      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
lw   $r0 $$locbase i258       ; load word
movi $r1 i9040                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
scwq $r1 $r0 $r0              ; clear sequence of storage slots
movi $r1 i6520                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i11                  ; initialize constant into register
sw   $$locbase $r2 i815       ; store word
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i2672              ; [call]: call require_97
addi $r0 $$locbase i2808      ; get offset to local
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $r6 $r1              ; copy memory
sw   $$locbase $zero i355     ; store word
addi $r1 $r0 i40              ; get offset to aggregate element
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r4 $r2              ; copy memory
movi $r1 i5416                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i5488                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r10 $r2             ; copy memory
movi $r2 i4744                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1171              ; [call]: call get_130
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i2080      ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i7528                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r1 i4280                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i2900              ; [call]: call field_id_251
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i144       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i6080                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r1 $$locbase i3512      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $zero             ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1066              ; [call]: call read_178
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i176       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i6472                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $zero             ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1402              ; [call]: call unwrap_or_194
move $r0 $$retv               ; [call]: copy the return value
sub  $r4 $r0 $one
eq   $r0 $r4 $r11
eq   $r0 $r0 $zero
jnzf $r0 $zero i214
load $r0 data_12              ; get local constant
load $r1 data_12              ; get local constant
addi $r2 $$locbase i3096      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
sw   $$locbase $zero i391     ; store word
addi $r0 $r2 i40              ; get offset to aggregate element
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r3              ; copy memory
movi $r0 i5896                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i72                  ; get data length for memory copy
mcp  $r0 $r2 $r1              ; copy memory
movi $r1 i5968                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r10 $r2             ; copy memory
addi $r2 $$locbase i3360      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1249              ; [call]: call get_130
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i1576      ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r2 $$locbase i1456      ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
addi $r3 $$locbase i1336      ; get offset to local
movi $r4 i72                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
movi $r0 i7968                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r4 i72                  ; get data length for memory copy
mcp  $r0 $r3 $r4              ; copy memory
movi $r3 i4544                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i2816              ; [call]: call field_id_251
move $r0 $$retv               ; [call]: copy the return value
addi $r3 $$locbase i1408      ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
movi $r0 i6240                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r0 $r3 $r4              ; copy memory
addi $r3 $$locbase i3560      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $zero             ; [call]: pass argument 1
move $$arg2 $r3               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i982               ; [call]: call read_178
move $r0 $$retv               ; [call]: copy the return value
addi $r3 $$locbase i1440      ; get offset to local
movi $r4 i16                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
movi $r0 i6528                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r4 i16                  ; get data length for memory copy
mcp  $r0 $r3 $r4              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $zero             ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1318              ; [call]: call unwrap_or_194
move $r0 $$retv               ; [call]: copy the return value
eq   $r3 $r0 $zero
jnzf $r3 $zero i91
movi $r3 i8040                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
movi $r4 i72                  ; get data length for memory copy
mcp  $r3 $r2 $r4              ; copy memory
movi $r2 i4576                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i2771              ; [call]: call field_id_251
move $r2 $$retv               ; [call]: copy the return value
addi $r3 $$locbase i1544      ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $r2 $r4              ; copy memory
sub  $r0 $r0 $one
movi $r2 i7072                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r2 $r3 $r4              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $zero             ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1810              ; [call]: call write_218
movi $r2 i8112                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i4608                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i2743              ; [call]: call field_id_251
move $r1 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i1648      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i6904                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r2 $r3              ; copy memory
movi $r2 i4184                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1503              ; [call]: call sha256_209
move $r1 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i1680      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i8880                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r2 $r3              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1542              ; [call]: call offset_calculator_210
move $r0 $$retv               ; [call]: copy the return value
movi $r1 i6800                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r2 $r3              ; copy memory
addi $r2 $$locbase i4080      ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1279              ; [call]: call read_201
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i1712      ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r2 i8480                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r0 i40                  ; get data length for memory copy
mcp  $r2 $r1 $r0              ; copy memory
jmpf $zero i6
addi $r0 $$locbase i2368      ; get offset to local
sw   $$locbase $zero i296     ; store word
movi $r2 i8480                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r1 i40                  ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
movi $r0 i6664                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i40                  ; get data length for memory copy
mcp  $r0 $r2 $r1              ; copy memory
addi $r1 $$locbase i3896      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1231              ; [call]: call unwrap_200
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i1752      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i8616                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r1 i8680                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r7 $r2              ; copy memory
wqcm $r0 $r0 $r1 i32
movi $r1 i7280                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i12                  ; initialize constant into register
sw   $$locbase $r2 i910       ; store word
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i2960              ; [call]: call require_97
jmpf $zero i571
load $r0 data_12              ; get local constant
load $r1 data_12              ; get local constant
addi $r2 $$locbase i2880      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
sw   $$locbase $zero i364     ; store word
addi $r0 $r2 i40              ; get offset to aggregate element
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r3              ; copy memory
movi $r0 i5520                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i72                  ; get data length for memory copy
mcp  $r0 $r2 $r1              ; copy memory
movi $r1 i5592                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r10 $r2             ; copy memory
movi $r2 i4816                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1464              ; [call]: call get_130
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i312       ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r2 $$locbase i192       ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i7600                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
movi $r2 i4312                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i2604              ; [call]: call field_id_251
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i264       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i6112                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
addi $r2 $$locbase i3528      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $zero             ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i770               ; [call]: call read_178
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i296       ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i6488                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $zero             ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1106              ; [call]: call unwrap_or_194
move $r0 $$retv               ; [call]: copy the return value
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1329              ; [call]: call le_208
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i94
movi $r0 i7672                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r1 i4344                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i2553              ; [call]: call field_id_251
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i384       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i6832                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r1 i4120                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1313              ; [call]: call sha256_209
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i416       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i8816                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
move $$arg0 $r4               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1352              ; [call]: call offset_calculator_210
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i2688      ; get offset to local
sw   $$locbase $one i336      ; store word
addi $r3 $$locbase i2768      ; get offset to local
sw   $$locbase $r4 i346       ; store word
addi $r4 $r3 i8               ; get offset to aggregate element
movi $r6 i32                  ; get data length for memory copy
mcp  $r4 $r1 $r6              ; copy memory
movi $r4 i6936                ; get offset to local
add  $r4 $$locbase $r4        ; get offset to local
movi $r6 i40                  ; get data length for memory copy
mcp  $r4 $r3 $r6              ; copy memory
movi $r3 i4216                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1346              ; [call]: call sha256_212
move $r3 $$retv               ; [call]: copy the return value
addi $r4 $$locbase i448       ; get offset to local
movi $r6 i32                  ; get data length for memory copy
mcp  $r4 $r3 $r6              ; copy memory
movi $r3 i6408                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
movi $r6 i32                  ; get data length for memory copy
mcp  $r3 $r1 $r6              ; copy memory
movi $r1 i6440                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r6 i32                  ; get data length for memory copy
mcp  $r1 $r4 $r6              ; copy memory
addi $r4 $$locbase i3728      ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
move $$arg3 $r4               ; [call]: pass argument 3
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i992               ; [call]: call new_190
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i480       ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
addi $r0 $r2 i8               ; get offset to aggregate element
movi $r3 i72                  ; get data length for memory copy
mcp  $r0 $r1 $r3              ; copy memory
movi $r1 i8400                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r0 i80                  ; get data length for memory copy
mcp  $r1 $r2 $r0              ; copy memory
jmpf $zero i6
addi $r0 $$locbase i2288      ; get offset to local
sw   $$locbase $zero i286     ; store word
movi $r1 i8400                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i80                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i3168      ; get offset to local
movi $r2 i80                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
lw   $r0 $$locbase i1050      ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i1
rvrt $zero
load $r0 data_12              ; get local constant
load $r1 data_12              ; get local constant
addi $r2 $$locbase i3168      ; get offset to local
addi $r2 $r2 i8               ; get offset to aggregate element
movi $r3 i8744                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
movi $r4 i72                  ; get data length for memory copy
mcp  $r3 $r2 $r4              ; copy memory
movi $r3 i8328                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
movi $r4 i72                  ; get data length for memory copy
mcp  $r3 $r2 $r4              ; copy memory
addi $r4 $$locbase i4048      ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1663              ; [call]: call slot_128
move $r3 $$retv               ; [call]: copy the return value
addi $r4 $$locbase i624       ; get offset to local
movi $r6 i32                  ; get data length for memory copy
mcp  $r4 $r3 $r6              ; copy memory
movi $r3 i5136                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
movi $r6 i72                  ; get data length for memory copy
mcp  $r3 $r2 $r6              ; copy memory
move $$arg0 $r3               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i3681              ; [call]: call offset_67
move $r2 $$retv               ; [call]: copy the return value
movi $r3 i6704                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
movi $r6 i32                  ; get data length for memory copy
mcp  $r3 $r4 $r6              ; copy memory
addi $r4 $$locbase i3928      ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
move $$arg2 $r4               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i989               ; [call]: call read_201
move $r2 $$retv               ; [call]: copy the return value
addi $r3 $$locbase i656       ; get offset to local
movi $r4 i40                  ; get data length for memory copy
mcp  $r3 $r2 $r4              ; copy memory
movi $r2 i6544                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r4 i40                  ; get data length for memory copy
mcp  $r2 $r3 $r4              ; copy memory
addi $r3 $$locbase i3800      ; get offset to local
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i952               ; [call]: call unwrap_200
move $r2 $$retv               ; [call]: copy the return value
addi $r3 $$locbase i696       ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $r2 $r4              ; copy memory
movi $r2 i9008                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r2 $r3 $r4              ; copy memory
addi $r2 $$locbase i2952      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
sw   $$locbase $zero i373     ; store word
addi $r0 $r2 i40              ; get offset to aggregate element
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r3              ; copy memory
movi $r0 i5624                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i72                  ; get data length for memory copy
mcp  $r0 $r2 $r1              ; copy memory
movi $r1 i5696                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r10 $r2             ; copy memory
movi $r2 i4888                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1723              ; [call]: call get_130
move $r0 $$retv               ; [call]: copy the return value
addi $r4 $$locbase i1160      ; get offset to local
movi $r1 i72                  ; get data length for memory copy
mcp  $r4 $r0 $r1              ; copy memory
addi $r1 $$locbase i848       ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r2 $$locbase i728       ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i7744                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
movi $r2 i4376                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i2342              ; [call]: call field_id_251
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i800       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i6208                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
addi $r2 $$locbase i3544      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $zero             ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i508               ; [call]: call read_178
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i832       ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i6504                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $zero             ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i844               ; [call]: call unwrap_or_194
move $r6 $$retv               ; [call]: copy the return value
lt   $r0 $r11 $r6
eq   $r0 $r0 $zero
jnzf $r0 $zero i321
load $r8 data_13              ; get local constant
load $r3 data_13              ; get local constant
movi $r0 i7816                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r1 i4480                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i2292              ; [call]: call field_id_251
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i920       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i6872                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r1 i4152                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1052              ; [call]: call sha256_209
move $r0 $$retv               ; [call]: copy the return value
addi $r9 $$locbase i952       ; get offset to local
movi $r1 i32                  ; get data length for memory copy
mcp  $r9 $r0 $r1              ; copy memory
movi $r0 i8848                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $r9 $r1              ; copy memory
move $$arg0 $r11              ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1091              ; [call]: call offset_calculator_210
move $r12 $$retv              ; [call]: copy the return value
movi $r0 i6736                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $r9 $r1              ; copy memory
addi $r1 $$locbase i3968      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r12              ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i828               ; [call]: call read_201
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i984       ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i6584                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r1 $$locbase i3832      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i791               ; [call]: call unwrap_200
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i1056      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i8712                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
sub  $r0 $r6 $one
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1049              ; [call]: call offset_calculator_210
move $r1 $$retv               ; [call]: copy the return value
movi $r2 i6768                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r6 i32                  ; get data length for memory copy
mcp  $r2 $r9 $r6              ; copy memory
addi $r6 $$locbase i4008      ; get offset to local
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $r6               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i786               ; [call]: call read_201
move $r1 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i1088      ; get offset to local
movi $r6 i40                  ; get data length for memory copy
mcp  $r2 $r1 $r6              ; copy memory
movi $r1 i6624                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r6 i40                  ; get data length for memory copy
mcp  $r1 $r2 $r6              ; copy memory
addi $r2 $$locbase i3864      ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i749               ; [call]: call unwrap_200
move $r1 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i1128      ; get offset to local
movi $r6 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r6              ; copy memory
movi $r1 i8976                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r6 i32                  ; get data length for memory copy
mcp  $r1 $r2 $r6              ; copy memory
movi $r1 i6976                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r6 i32                  ; get data length for memory copy
mcp  $r1 $r9 $r6              ; copy memory
movi $r6 i7008                ; get offset to local
add  $r6 $$locbase $r6        ; get offset to local
movi $r9 i32                  ; get data length for memory copy
mcp  $r6 $r2 $r9              ; copy memory
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r12              ; [call]: pass argument 1
move $$arg2 $r6               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1146              ; [call]: call write_216
movi $r1 i7888                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r4 $r2              ; copy memory
movi $r2 i4512                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i2158              ; [call]: call field_id_251
move $r1 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i1232      ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r4              ; copy memory
movi $r1 i7040                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r1 $r2 $r4              ; copy memory
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $zero             ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1198              ; [call]: call write_218
movi $r0 i8712                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i8648                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r7 $r2              ; copy memory
wqcm $r0 $r0 $r1 i32
movi $r1 i6864                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i12                  ; initialize constant into register
sw   $$locbase $r2 i858       ; store word
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i3486              ; [call]: call require_97
addi $r0 $$locbase i3024      ; get offset to local
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $r8 $r1              ; copy memory
sw   $$locbase $zero i382     ; store word
addi $r1 $r0 i40              ; get offset to aggregate element
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r3 $r2              ; copy memory
movi $r1 i5792                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i5864                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r10 $r2             ; copy memory
movi $r2 i4960                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1985              ; [call]: call get_130
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i1264      ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i9008                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
add  $r2 $r11 $one
movi $r3 i7104                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
movi $r4 i72                  ; get data length for memory copy
mcp  $r3 $r1 $r4              ; copy memory
movi $r1 i7176                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r4              ; copy memory
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1185              ; [call]: call insert_220
load $r0 data_10              ; get local constant
load $r1 data_10              ; get local constant
addi $r2 $$locbase i2544      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
sw   $$locbase $zero i322     ; store word
addi $r0 $r2 i40              ; get offset to aggregate element
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r3              ; copy memory
movi $r0 i8184                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i72                  ; get data length for memory copy
mcp  $r0 $r2 $r1              ; copy memory
movi $r1 i4640                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i2057              ; [call]: call field_id_251
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i1784      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i2408      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r7 $r2              ; copy memory
addi $r2 $r0 i32              ; get offset to aggregate element
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i6144                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i64                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i3328      ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4058              ; [call]: call sha256_69
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i1816      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i8944                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r0 i5032                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r1 $$locbase i3248      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $zero             ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4203              ; [call]: call slot_calculator_54
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i1848      ; get offset to local
movi $r2 i48                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i8568                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i48                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r0 i9072                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
addi $r1 $$locbase i1848      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
lw   $r0 $$locbase i235       ; load word
movi $r1 i9072                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
scwq $r1 $r0 $r0              ; clear sequence of storage slots
movi $r1 i7960                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i13                  ; initialize constant into register
sw   $$locbase $r2 i995       ; store word
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i3623              ; [call]: call require_97
move $$retv $zero             ; set return value
jmpf $zero i2
load $r0 data_27              ; load constant from data section
rvrt $r0
cfsi i9224                    ; free 9224 bytes for locals and 0 slots for extra call arguments
move $$reta $r5               ; restore return address
poph i524288                  ; restore registers 40..64
popl i8191                    ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i31                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function eq_169
cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (other)
move $r2 $$reta               ; save return address
lw   $r3 $r0 i0               ; load word
lw   $r4 $r1 i0               ; load word
eq   $r3 $r3 $r4
jnzf $r3 $zero i1
jmpf $zero i5
addi $r0 $r0 i8               ; get offset to aggregate element
lb   $r0 $r0 i0               ; load byte
addi $r1 $r1 i8               ; get offset to aggregate element
lb   $r1 $r1 i0               ; load byte
eq   $r3 $r0 $r1
move $$retv $r3               ; set return value
cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i31                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i255                     ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function flip_170
cfei i144                     ; allocate 144 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r7 $$arg1               ; save argument 1 (__ret_value)
move $r6 $$reta               ; save return address
addi $r1 $$locbase i80        ; get offset to local
move $$arg0 $one              ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i109               ; [call]: call neg_from_175
move $r1 $$retv               ; [call]: copy the return value
lw   $r2 $r0 i0               ; load word
eq   $r2 $r2 $zero
jnzf $r2 $zero i2
lw   $r2 $r1 i0               ; load word
eq   $r2 $r2 $zero
jnzf $r2 $zero i55
addi $r2 $r0 i8               ; get offset to aggregate element
lb   $r3 $r2 i0               ; load byte
eq   $r3 $r3 $zero
addi $r4 $r1 i8               ; get offset to aggregate element
lb   $r5 $r4 i0               ; load byte
eq   $r5 $r5 $zero
eq   $r3 $r3 $r5
jnzf $r3 $zero i26
lb   $r2 $r2 i0               ; load byte
eq   $r2 $r2 $zero
lb   $r3 $r4 i0               ; load byte
eq   $r3 $r3 $zero
eq   $r2 $r2 $r3
eq   $r2 $r2 $zero
jnzf $r2 $zero i1
rvrt $zero
lw   $r0 $r0 i0               ; load word
lw   $r1 $r1 i0               ; load word
mul  $r0 $r0 $r1
addi $r1 $$locbase i96        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i76                ; [call]: call neg_from_175
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i32        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r2 $$locbase i112       ; get offset to local
movi $r0 i16                  ; get data length for memory copy
mcp  $r2 $r1 $r0              ; copy memory
jmpf $zero i17
lw   $r0 $r0 i0               ; load word
lw   $r1 $r1 i0               ; load word
mul  $r0 $r0 $r1
addi $r1 $$locbase i64        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i44                ; [call]: call from_173
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i16        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r2 $$locbase i112       ; get offset to local
movi $r0 i16                  ; get data length for memory copy
mcp  $r2 $r1 $r0              ; copy memory
addi $r1 $$locbase i128       ; get offset to local
movi $r0 i16                  ; get data length for memory copy
mcp  $r1 $r2 $r0              ; copy memory
jmpf $zero i12
addi $r0 $$locbase i48        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i14                ; [call]: call new_172
move $r0 $$retv               ; [call]: copy the return value
movi $r1 i16                  ; get data length for memory copy
mcp  $$locbase $r0 $r1        ; copy memory
addi $r1 $$locbase i128       ; get offset to local
movi $r0 i16                  ; get data length for memory copy
mcp  $r1 $$locbase $r0        ; copy memory
movi $r0 i16                  ; get data length for memory copy
mcp  $r7 $r1 $r0              ; copy memory
move $$retv $r7               ; set return value
cfsi i144                     ; free 144 bytes for locals and 0 slots for extra call arguments
move $$reta $r6               ; restore return address
poph i524288                  ; restore registers 40..64
popl i255                     ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i7                       ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function new_172
cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (__ret_value)
move $r1 $$reta               ; save return address
sw   $r0 $zero i0             ; store word
addi $r2 $r0 i8               ; get offset to aggregate element
sb   $r2 $zero i0             ; store byte
move $$retv $r0               ; set return value
cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments
move $$reta $r1               ; restore return address
poph i524288                  ; restore registers 40..64
popl i7                       ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i7                       ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function from_173
cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (b)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
sw   $r1 $r0 i0               ; store word
addi $r0 $r1 i8               ; get offset to aggregate element
sb   $r0 $zero i0             ; store byte
move $$retv $r1               ; set return value
cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i7                       ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i31                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function neg_from_175
cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (value)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
eq   $r3 $r0 $zero
move $r4 $zero                ; move parameter from branch to block argument
jnzf $r3 $zero i1
move $r4 $one                 ; move parameter from branch to block argument
sw   $r1 $r0 i0               ; store word
addi $r0 $r1 i8               ; get offset to aggregate element
sb   $r0 $r4 i0               ; store byte
move $$retv $r1               ; set return value
cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i31                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i63                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function read_178
cfei i256                     ; allocate 256 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (slot)
move $r1 $$arg1               ; save argument 1 (offset)
move $r2 $$arg2               ; save argument 2 (__ret_value)
move $r3 $$reta               ; save return address
addi $r4 $$locbase i128       ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r0 $r5              ; copy memory
addi $r0 $$locbase i80        ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i49                ; [call]: call slot_calculator_179
move $r0 $$retv               ; [call]: copy the return value
movi $r1 i48                  ; get data length for memory copy
mcp  $$locbase $r0 $r1        ; copy memory
addi $r0 $$locbase i176       ; get offset to local
movi $r1 i48                  ; get data length for memory copy
mcp  $r0 $$locbase $r1        ; copy memory
addi $r0 $$locbase i224       ; get offset to local
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $$locbase $r1        ; copy memory
lw   $r0 $$locbase i4         ; load word
lw   $r1 $$locbase i5         ; load word
movi $r4 i32                  ; initialize constant into register
mul  $r4 $r0 $r4
movi $r5 i8                   ; initialize constant into register
mul  $r4 $r5 $r4
aloc $r4                      ; aloc size
move $r4 $hp                  ; move ptr hp
addi $r5 $$locbase i224       ; get offset to local
srwq $r4 $r0 $r5 $r0          ; read sequence of storage slots
jnzf $r0 $zero i6
addi $r0 $$locbase i64        ; get offset to local
sw   $$locbase $zero i8       ; store word
addi $r4 $$locbase i160       ; get offset to local
movi $r1 i16                  ; get data length for memory copy
mcp  $r4 $r0 $r1              ; copy memory
jmpf $zero i15
addi $r0 $$locbase i48        ; get offset to local
sw   $$locbase $one i6        ; store word
movi $r5 i8                   ; initialize constant into register
mul  $r1 $r5 $r1
add  $r1 $r4 $r1
move $$arg0 $r1               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i5000              ; [call]: call read_17
move $r1 $$retv               ; [call]: copy the return value
sw   $r0 $r1 i1               ; store word
addi $r4 $$locbase i160       ; get offset to local
movi $r1 i16                  ; get data length for memory copy
mcp  $r4 $r0 $r1              ; copy memory
movi $r0 i16                  ; get data length for memory copy
mcp  $r2 $r4 $r0              ; copy memory
move $$retv $r2               ; set return value
cfsi i256                     ; free 256 bytes for locals and 0 slots for extra call arguments
move $$reta $r3               ; restore return address
poph i524288                  ; restore registers 40..64
popl i63                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i127                     ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function slot_calculator_179
cfei i496                     ; allocate 496 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (slot)
move $r1 $$arg1               ; save argument 1 (offset)
move $r6 $$arg2               ; save argument 2 (__ret_value)
move $r5 $$reta               ; save return address
movi $r2 i8                   ; initialize constant into register
mul  $r2 $r1 $r2
movi $r3 i8                   ; initialize constant into register
add  $r2 $r2 $r3
movi $r3 i31                  ; initialize constant into register
add  $r2 $r2 $r3
movi $r3 i5                   ; initialize constant into register
srl  $r2 $r2 $r3
movi $r3 i4                   ; initialize constant into register
mod  $r1 $r1 $r3
addi $r3 $$locbase i176       ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
movi $r0 i32                  ; get data length for memory copy
mcp  $$locbase $r3 $r0        ; copy memory
addi $r0 $$locbase i464       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $$locbase $r3        ; copy memory
addi $r0 $$locbase i240       ; get offset to local
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4410              ; [call]: call as_u256_62
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i32        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
addi $r0 $$locbase i272       ; get offset to local
move $$arg0 $one              ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4421              ; [call]: call as_u256_62
move $r0 $$retv               ; [call]: copy the return value
addi $r3 $$locbase i64        ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
addi $r0 $$locbase i304       ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r0 $r2 $r4              ; copy memory
addi $r2 $$locbase i432       ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r2 $r3 $r4              ; copy memory
addi $r3 $$locbase i368       ; get offset to local
wqop $r3 $r0 $r2 i33
addi $r0 $$locbase i336       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $$locbase $r2        ; copy memory
addi $r2 $$locbase i368       ; get offset to local
addi $r3 $$locbase i400       ; get offset to local
wqop $r3 $r0 $r2 i32
addi $r0 $$locbase i464       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r3 $r2              ; copy memory
addi $r0 $$locbase i208       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r3 $r2              ; copy memory
addi $r2 $$locbase i96        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
addi $r0 $$locbase i128       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
sw   $$locbase $one i20       ; store word
sw   $$locbase $r1 i21        ; store word
movi $r1 i48                  ; get data length for memory copy
mcp  $r6 $r0 $r1              ; copy memory
move $$retv $r6               ; set return value
cfsi i496                     ; free 496 bytes for locals and 0 slots for extra call arguments
move $$reta $r5               ; restore return address
poph i524288                  ; restore registers 40..64
popl i127                     ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i63                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function get_182
cfei i568                     ; allocate 568 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (key)
move $r2 $$arg2               ; save argument 2 (__ret_value)
move $r3 $$reta               ; save return address
addi $r4 $$locbase i464       ; get offset to local
movi $r5 i72                  ; get data length for memory copy
mcp  $r4 $r0 $r5              ; copy memory
addi $r0 $$locbase i304       ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i1648              ; [call]: call field_id_251
move $r0 $$retv               ; [call]: copy the return value
movi $r4 i32                  ; get data length for memory copy
mcp  $$locbase $r0 $r4        ; copy memory
addi $r0 $$locbase i136       ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r4              ; copy memory
addi $r1 $r0 i32              ; get offset to aggregate element
movi $r4 i32                  ; get data length for memory copy
mcp  $r1 $$locbase $r4        ; copy memory
addi $r1 $$locbase i336       ; get offset to local
movi $r4 i64                  ; get data length for memory copy
mcp  $r1 $r0 $r4              ; copy memory
addi $r0 $$locbase i200       ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4465              ; [call]: call sha256_69
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i32        ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r4              ; copy memory
addi $r0 $$locbase i536       ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r4              ; copy memory
addi $r0 $$locbase i400       ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r4              ; copy memory
addi $r4 $$locbase i432       ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r1 $r5              ; copy memory
addi $r1 $$locbase i232       ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $zero             ; [call]: pass argument 1
move $$arg2 $r4               ; [call]: pass argument 2
move $$arg3 $r1               ; [call]: pass argument 3
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i116               ; [call]: call new_190
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i64        ; get offset to local
movi $r4 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r4              ; copy memory
movi $r0 i72                  ; get data length for memory copy
mcp  $r2 $r1 $r0              ; copy memory
move $$retv $r2               ; set return value
cfsi i568                     ; free 568 bytes for locals and 0 slots for extra call arguments
move $$reta $r3               ; restore return address
poph i524288                  ; restore registers 40..64
popl i63                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i63                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function sha256_186
cfei i200                     ; allocate 200 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (s)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
addi $r3 $$locbase i32        ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4460              ; [call]: call new_70
move $r3 $$retv               ; [call]: copy the return value
lw   $r4 $r3 i0               ; load word
lw   $r5 $r3 i1               ; load word
lw   $r3 $r3 i2               ; load word
sw   $$locbase $r4 i22        ; store word
sw   $$locbase $r5 i23        ; store word
sw   $$locbase $r3 i24        ; store word
addi $r3 $$locbase i176       ; get offset to local
addi $r4 $$locbase i112       ; get offset to local
movi $r5 i64                  ; get data length for memory copy
mcp  $r4 $r0 $r5              ; copy memory
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i22                ; [call]: call hash_187
addi $r0 $$locbase i176       ; get offset to local
addi $r3 $$locbase i88        ; get offset to local
movi $r4 i24                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
addi $r0 $$locbase i56        ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4100              ; [call]: call sha256_93
move $r0 $$retv               ; [call]: copy the return value
movi $r3 i32                  ; get data length for memory copy
mcp  $$locbase $r0 $r3        ; copy memory
movi $r0 i32                  ; get data length for memory copy
mcp  $r1 $$locbase $r0        ; copy memory
move $$retv $r1               ; set return value
cfsi i200                     ; free 200 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i63                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i31                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function hash_187
cfei i64                      ; allocate 64 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (state)
move $r2 $$reta               ; save return address
addi $r3 $$locbase i32        ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i15                ; [call]: call hash_188
addi $r0 $r0 i32              ; get offset to aggregate element
movi $r3 i32                  ; get data length for memory copy
mcp  $$locbase $r0 $r3        ; copy memory
move $$arg0 $$locbase         ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4477              ; [call]: call hash_75
move $$retv $zero             ; set return value
cfsi i64                      ; free 64 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i31                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i15                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function hash_188
cfei i32                      ; allocate 32 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (state)
move $r2 $$reta               ; save return address
movi $r3 i32                  ; get data length for memory copy
mcp  $$locbase $r0 $r3        ; copy memory
move $$arg0 $$locbase         ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4498              ; [call]: call hash_75
move $$retv $zero             ; set return value
cfsi i32                      ; free 32 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i15                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i63                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function new_190
cfei i72                      ; allocate 72 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (slot)
move $r1 $$arg1               ; save argument 1 (offset)
move $r2 $$arg2               ; save argument 2 (field_id)
move $r3 $$arg3               ; save argument 3 (__ret_value)
move $r4 $$reta               ; save return address
movi $r5 i32                  ; get data length for memory copy
mcp  $$locbase $r0 $r5        ; copy memory
sw   $$locbase $r1 i4         ; store word
addi $r0 $$locbase i40        ; get offset to aggregate element
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $r2 $r1              ; copy memory
movi $r0 i72                  ; get data length for memory copy
mcp  $r3 $$locbase $r0        ; copy memory
move $$retv $r3               ; set return value
cfsi i72                      ; free 72 bytes for locals and 0 slots for extra call arguments
move $$reta $r4               ; restore return address
poph i524288                  ; restore registers 40..64
popl i63                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i15                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function unwrap_or_194
cfei i16                      ; allocate 16 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r3 $$arg1               ; save argument 1 (default)
move $r1 $$reta               ; save return address
movi $r2 i16                  ; get data length for memory copy
mcp  $$locbase $r0 $r2        ; copy memory
lw   $r0 $r0 i0               ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i5
lw   $r0 $$locbase i0         ; load word
eq   $r0 $r0 $zero
jnzf $r0 $zero i3
load $r0 data_22              ; load constant from data section
rvrt $r0
lw   $r3 $$locbase i1         ; load word
move $$retv $r3               ; set return value
cfsi i16                      ; free 16 bytes for locals and 0 slots for extra call arguments
move $$reta $r1               ; restore return address
poph i524288                  ; restore registers 40..64
popl i15                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i15                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function unwrap_200
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
pshl i63                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function read_201
cfei i392                     ; allocate 392 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (slot)
move $r1 $$arg1               ; save argument 1 (offset)
move $r2 $$arg2               ; save argument 2 (__ret_value)
move $r3 $$reta               ; save return address
addi $r4 $$locbase i240       ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r0 $r5              ; copy memory
addi $r0 $$locbase i160       ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i56                ; [call]: call slot_calculator_202
move $r0 $$retv               ; [call]: copy the return value
movi $r1 i48                  ; get data length for memory copy
mcp  $$locbase $r0 $r1        ; copy memory
addi $r0 $$locbase i312       ; get offset to local
movi $r1 i48                  ; get data length for memory copy
mcp  $r0 $$locbase $r1        ; copy memory
addi $r0 $$locbase i360       ; get offset to local
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $$locbase $r1        ; copy memory
lw   $r0 $$locbase i4         ; load word
lw   $r1 $$locbase i5         ; load word
movi $r4 i32                  ; initialize constant into register
mul  $r4 $r0 $r4
movi $r5 i8                   ; initialize constant into register
mul  $r4 $r5 $r4
aloc $r4                      ; aloc size
move $r4 $hp                  ; move ptr hp
addi $r5 $$locbase i360       ; get offset to local
srwq $r4 $r0 $r5 $r0          ; read sequence of storage slots
jnzf $r0 $zero i6
addi $r0 $$locbase i120       ; get offset to local
sw   $$locbase $zero i15      ; store word
addi $r4 $$locbase i272       ; get offset to local
movi $r1 i40                  ; get data length for memory copy
mcp  $r4 $r0 $r1              ; copy memory
jmpf $zero i22
addi $r0 $$locbase i80        ; get offset to local
sw   $$locbase $one i10       ; store word
movi $r5 i8                   ; initialize constant into register
mul  $r1 $r5 $r1
add  $r1 $r4 $r1
addi $r4 $$locbase i208       ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i110               ; [call]: call read_203
move $r1 $$retv               ; [call]: copy the return value
addi $r4 $$locbase i48        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r1 $r5              ; copy memory
addi $r1 $r0 i8               ; get offset to aggregate element
movi $r5 i32                  ; get data length for memory copy
mcp  $r1 $r4 $r5              ; copy memory
addi $r4 $$locbase i272       ; get offset to local
movi $r1 i40                  ; get data length for memory copy
mcp  $r4 $r0 $r1              ; copy memory
movi $r0 i40                  ; get data length for memory copy
mcp  $r2 $r4 $r0              ; copy memory
move $$retv $r2               ; set return value
cfsi i392                     ; free 392 bytes for locals and 0 slots for extra call arguments
move $$reta $r3               ; restore return address
poph i524288                  ; restore registers 40..64
popl i63                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i255                     ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function slot_calculator_202
cfei i496                     ; allocate 496 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (slot)
move $r1 $$arg1               ; save argument 1 (offset)
move $r6 $$arg2               ; save argument 2 (__ret_value)
move $r5 $$reta               ; save return address
movi $r2 i8                   ; initialize constant into register
mul  $r2 $r1 $r2
movi $r3 i32                  ; initialize constant into register
add  $r2 $r2 $r3
movi $r3 i31                  ; initialize constant into register
add  $r2 $r2 $r3
movi $r3 i5                   ; initialize constant into register
srl  $r2 $r2 $r3
movi $r3 i4                   ; initialize constant into register
mod  $r7 $r1 $r3
movi $r1 i8                   ; initialize constant into register
mul  $r1 $r7 $r1
movi $r3 i32                  ; initialize constant into register
add  $r1 $r1 $r3
movi $r3 i31                  ; initialize constant into register
add  $r1 $r1 $r3
movi $r3 i5                   ; initialize constant into register
srl  $r1 $r1 $r3
addi $r3 $$locbase i176       ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
movi $r0 i32                  ; get data length for memory copy
mcp  $$locbase $r3 $r0        ; copy memory
addi $r0 $$locbase i464       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $$locbase $r3        ; copy memory
addi $r0 $$locbase i240       ; get offset to local
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4821              ; [call]: call as_u256_62
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i32        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
addi $r0 $$locbase i272       ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4832              ; [call]: call as_u256_62
move $r0 $$retv               ; [call]: copy the return value
addi $r3 $$locbase i64        ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
addi $r0 $$locbase i304       ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r0 $r2 $r4              ; copy memory
addi $r2 $$locbase i432       ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r2 $r3 $r4              ; copy memory
addi $r3 $$locbase i368       ; get offset to local
wqop $r3 $r0 $r2 i33
addi $r0 $$locbase i336       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $$locbase $r2        ; copy memory
addi $r2 $$locbase i368       ; get offset to local
addi $r3 $$locbase i400       ; get offset to local
wqop $r3 $r0 $r2 i32
addi $r0 $$locbase i464       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r3 $r2              ; copy memory
addi $r0 $$locbase i208       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r3 $r2              ; copy memory
addi $r2 $$locbase i96        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
addi $r0 $$locbase i128       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
sw   $$locbase $r1 i20        ; store word
sw   $$locbase $r7 i21        ; store word
movi $r1 i48                  ; get data length for memory copy
mcp  $r6 $r0 $r1              ; copy memory
move $$retv $r6               ; set return value
cfsi i496                     ; free 496 bytes for locals and 0 slots for extra call arguments
move $$reta $r5               ; restore return address
poph i524288                  ; restore registers 40..64
popl i255                     ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i15                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function read_203
cfei i32                      ; allocate 32 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
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
move $$locbase $sp            ; save locals base register for function le_208
cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (other)
move $r2 $$reta               ; save return address
lt   $r3 $r0 $r1
jnzf $r3 $zero i1
eq   $r3 $r0 $r1
move $$retv $r3               ; set return value
cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i15                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i63                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function sha256_209
cfei i168                     ; allocate 168 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (s)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
addi $r3 $$locbase i32        ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4831              ; [call]: call new_70
move $r3 $$retv               ; [call]: copy the return value
lw   $r4 $r3 i0               ; load word
lw   $r5 $r3 i1               ; load word
lw   $r3 $r3 i2               ; load word
sw   $$locbase $r4 i18        ; store word
sw   $$locbase $r5 i19        ; store word
sw   $$locbase $r3 i20        ; store word
addi $r3 $$locbase i144       ; get offset to local
addi $r4 $$locbase i88        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r0 $r5              ; copy memory
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4801              ; [call]: call hash_75
addi $r0 $$locbase i144       ; get offset to local
addi $r3 $$locbase i120       ; get offset to local
movi $r4 i24                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
addi $r0 $$locbase i56        ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4471              ; [call]: call sha256_93
move $r0 $$retv               ; [call]: copy the return value
movi $r3 i32                  ; get data length for memory copy
mcp  $$locbase $r0 $r3        ; copy memory
movi $r0 i32                  ; get data length for memory copy
mcp  $r1 $$locbase $r0        ; copy memory
move $$retv $r1               ; set return value
cfsi i168                     ; free 168 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i63                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i7                       ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function offset_calculator_210
cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (offset)
move $r1 $$reta               ; save return address
movi $r2 i32                  ; initialize constant into register
mul  $r0 $r0 $r2
movi $r2 i8                   ; initialize constant into register
div  $r0 $r0 $r2
move $$retv $r0               ; set return value
cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments
move $$reta $r1               ; restore return address
poph i524288                  ; restore registers 40..64
popl i7                       ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i63                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function sha256_212
cfei i176                     ; allocate 176 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (s)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
addi $r3 $$locbase i32        ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4897              ; [call]: call new_70
move $r3 $$retv               ; [call]: copy the return value
lw   $r4 $r3 i0               ; load word
lw   $r5 $r3 i1               ; load word
lw   $r3 $r3 i2               ; load word
sw   $$locbase $r4 i19        ; store word
sw   $$locbase $r5 i20        ; store word
sw   $$locbase $r3 i21        ; store word
addi $r3 $$locbase i152       ; get offset to local
addi $r4 $$locbase i112       ; get offset to local
movi $r5 i40                  ; get data length for memory copy
mcp  $r4 $r0 $r5              ; copy memory
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i22                ; [call]: call hash_213
addi $r0 $$locbase i152       ; get offset to local
addi $r3 $$locbase i88        ; get offset to local
movi $r4 i24                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
addi $r0 $$locbase i56        ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4537              ; [call]: call sha256_93
move $r0 $$retv               ; [call]: copy the return value
movi $r3 i32                  ; get data length for memory copy
mcp  $$locbase $r0 $r3        ; copy memory
movi $r0 i32                  ; get data length for memory copy
mcp  $r1 $$locbase $r0        ; copy memory
move $$retv $r1               ; set return value
cfsi i176                     ; free 176 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i63                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i15                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function hash_213
cfei i32                      ; allocate 32 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (state)
move $r2 $$reta               ; save return address
lw   $r3 $r0 i0               ; load word
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i15                ; [call]: call hash_214
addi $r0 $r0 i8               ; get offset to aggregate element
movi $r3 i32                  ; get data length for memory copy
mcp  $$locbase $r0 $r3        ; copy memory
move $$arg0 $$locbase         ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4912              ; [call]: call hash_75
move $$retv $zero             ; set return value
cfsi i32                      ; free 32 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i15                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i63                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function hash_214
cfei i96                      ; allocate 96 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (state)
move $r2 $$reta               ; save return address
movi $r3 i8                   ; initialize constant into register
aloc $r3                      ; aloc size
move $r3 $hp                  ; return value from ASM block with return register hp
sw   $r3 $r0 i0               ; sw ptr val i0
addi $r0 $$locbase i16        ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
movi $r3 i8                   ; initialize constant into register
move $$arg1 $r3               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4740              ; [call]: call from_parts_81
move $r0 $$retv               ; [call]: copy the return value
movi $r3 i16                  ; get data length for memory copy
mcp  $$locbase $r0 $r3        ; copy memory
addi $r0 $$locbase i80        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r0 $$locbase $r3        ; copy memory
addi $r3 $$locbase i32        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4647              ; [call]: call from_92
move $r0 $$retv               ; [call]: copy the return value
lw   $r3 $r0 i0               ; load word
lw   $r4 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
addi $r5 $$locbase i56        ; get offset to local
sw   $$locbase $r3 i7         ; store word
sw   $$locbase $r4 i8         ; store word
sw   $$locbase $r0 i9         ; store word
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r5               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4902              ; [call]: call write_76
move $$retv $zero             ; set return value
cfsi i96                      ; free 96 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i63                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i127                     ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function write_216
cfei i272                     ; allocate 272 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (slot)
move $r1 $$arg1               ; save argument 1 (offset)
move $r2 $$arg2               ; save argument 2 (value)
move $r3 $$reta               ; save return address
addi $r4 $$locbase i48        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r2 $r5              ; copy memory
addi $r2 $$locbase i128       ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r5              ; copy memory
addi $r0 $$locbase i80        ; get offset to local
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i343               ; [call]: call slot_calculator_202
move $r0 $$retv               ; [call]: copy the return value
movi $r1 i48                  ; get data length for memory copy
mcp  $$locbase $r0 $r1        ; copy memory
addi $r0 $$locbase i192       ; get offset to local
movi $r1 i48                  ; get data length for memory copy
mcp  $r0 $$locbase $r1        ; copy memory
addi $r0 $$locbase i240       ; get offset to local
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $$locbase $r1        ; copy memory
lw   $r0 $$locbase i4         ; load word
lw   $r1 $$locbase i5         ; load word
movi $r2 i32                  ; initialize constant into register
mul  $r2 $r0 $r2
movi $r5 i8                   ; initialize constant into register
mul  $r2 $r5 $r2
aloc $r2                      ; aloc size
move $r2 $hp                  ; move ptr hp
addi $r5 $$locbase i240       ; get offset to local
srwq $r2 $r5 $r5 $r0          ; read sequence of storage slots
movi $r5 i8                   ; initialize constant into register
mul  $r1 $r5 $r1
add  $r1 $r2 $r1
addi $r5 $$locbase i160       ; get offset to local
movi $r6 i32                  ; get data length for memory copy
mcp  $r5 $r4 $r6              ; copy memory
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r5               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i8                 ; [call]: call write_217
addi $r1 $$locbase i240       ; get offset to local
swwq $r1 $r0 $r2 $r0          ; write sequence of storage slots
move $$retv $zero             ; set return value
cfsi i272                     ; free 272 bytes for locals and 0 slots for extra call arguments
move $$reta $r3               ; restore return address
poph i524288                  ; restore registers 40..64
popl i127                     ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i15                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function write_217
cfei i32                      ; allocate 32 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (val)
move $r2 $$reta               ; save return address
movi $r3 i32                  ; get data length for memory copy
mcp  $$locbase $r1 $r3        ; copy memory
movi $r3 i32                  ; initialize constant into register
move $r1 $$locbase            ; copy ASM block argument's constant initial value to register
mcp  $r0 $r1 $r3              ; mcp dst src count
move $$retv $zero             ; set return value
cfsi i32                      ; free 32 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i15                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i63                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function write_218
cfei i208                     ; allocate 208 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (slot)
move $r1 $$arg1               ; save argument 1 (offset)
move $r2 $$arg2               ; save argument 2 (value)
move $r3 $$reta               ; save return address
addi $r4 $$locbase i96        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r0 $r5              ; copy memory
addi $r0 $$locbase i48        ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i822               ; [call]: call slot_calculator_179
move $r0 $$retv               ; [call]: copy the return value
movi $r1 i48                  ; get data length for memory copy
mcp  $$locbase $r0 $r1        ; copy memory
addi $r0 $$locbase i128       ; get offset to local
movi $r1 i48                  ; get data length for memory copy
mcp  $r0 $$locbase $r1        ; copy memory
addi $r0 $$locbase i176       ; get offset to local
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $$locbase $r1        ; copy memory
lw   $r0 $$locbase i4         ; load word
lw   $r1 $$locbase i5         ; load word
movi $r4 i32                  ; initialize constant into register
mul  $r4 $r0 $r4
movi $r5 i8                   ; initialize constant into register
mul  $r4 $r5 $r4
aloc $r4                      ; aloc size
move $r4 $hp                  ; move ptr hp
addi $r5 $$locbase i176       ; get offset to local
srwq $r4 $r5 $r5 $r0          ; read sequence of storage slots
movi $r5 i8                   ; initialize constant into register
mul  $r1 $r5 $r1
add  $r1 $r4 $r1
sw   $r1 $r2 i0               ; sw ptr val i0
addi $r1 $$locbase i176       ; get offset to local
swwq $r1 $r0 $r4 $r0          ; write sequence of storage slots
move $$retv $zero             ; set return value
cfsi i208                     ; free 208 bytes for locals and 0 slots for extra call arguments
move $$reta $r3               ; restore return address
poph i524288                  ; restore registers 40..64
popl i63                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i63                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function insert_220
cfei i392                     ; allocate 392 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (key)
move $r2 $$arg2               ; save argument 2 (value)
move $r3 $$reta               ; save return address
addi $r4 $$locbase i288       ; get offset to local
movi $r5 i72                  ; get data length for memory copy
mcp  $r4 $r0 $r5              ; copy memory
addi $r0 $$locbase i160       ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i877               ; [call]: call field_id_251
move $r0 $$retv               ; [call]: copy the return value
movi $r4 i32                  ; get data length for memory copy
mcp  $$locbase $r0 $r4        ; copy memory
addi $r0 $$locbase i64        ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r4              ; copy memory
addi $r1 $r0 i32              ; get offset to aggregate element
movi $r4 i32                  ; get data length for memory copy
mcp  $r1 $$locbase $r4        ; copy memory
addi $r1 $$locbase i192       ; get offset to local
movi $r4 i64                  ; get data length for memory copy
mcp  $r1 $r0 $r4              ; copy memory
addi $r0 $$locbase i128       ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i5236              ; [call]: call sha256_69
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i32        ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r4              ; copy memory
addi $r0 $$locbase i360       ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r4              ; copy memory
addi $r0 $$locbase i256       ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r4              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $zero             ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i102               ; [call]: call write_218
move $$retv $zero             ; set return value
cfsi i392                     ; free 392 bytes for locals and 0 slots for extra call arguments
move $$reta $r3               ; restore return address
poph i524288                  ; restore registers 40..64
popl i63                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i127                     ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function insert_225
cfei i808                     ; allocate 808 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (key)
move $r2 $$arg2               ; save argument 2 (value)
move $r5 $$reta               ; save return address
addi $r4 $$locbase i112       ; get offset to local
movi $r3 i120                 ; get data length for memory copy
mcp  $r4 $r2 $r3              ; copy memory
addi $r2 $$locbase i624       ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
addi $r0 $$locbase i496       ; get offset to local
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i814               ; [call]: call field_id_251
move $r0 $$retv               ; [call]: copy the return value
movi $r2 i32                  ; get data length for memory copy
mcp  $$locbase $r0 $r2        ; copy memory
addi $r0 $$locbase i232       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r1 $r0 i32              ; get offset to aggregate element
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $$locbase $r2        ; copy memory
addi $r1 $$locbase i560       ; get offset to local
movi $r2 i64                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i464       ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i5299              ; [call]: call sha256_69
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i32        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i744       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r0 $$locbase i528       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r1 $$locbase i416       ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $zero             ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i5442              ; [call]: call slot_calculator_54
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i64        ; get offset to local
movi $r2 i48                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i696       ; get offset to local
movi $r2 i48                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r0 $$locbase i776       ; get offset to local
addi $r1 $$locbase i64        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
lw   $r0 $$locbase i12        ; load word
lw   $r1 $$locbase i13        ; load word
movi $r2 i32                  ; initialize constant into register
mul  $r2 $r0 $r2
movi $r3 i8                   ; initialize constant into register
mul  $r2 $r3 $r2
aloc $r2                      ; aloc size
move $r2 $hp                  ; move ptr hp
addi $r3 $$locbase i776       ; get offset to local
srwq $r2 $r3 $r3 $r0          ; read sequence of storage slots
movi $r3 i8                   ; initialize constant into register
mul  $r1 $r3 $r1
add  $r1 $r2 $r1
addi $r3 $$locbase i296       ; get offset to local
movi $r6 i120                 ; get data length for memory copy
mcp  $r3 $r4 $r6              ; copy memory
movi $r4 i120                 ; initialize constant into register
mcp  $r1 $r3 $r4              ; mcp dst src count
addi $r1 $$locbase i776       ; get offset to local
swwq $r1 $r0 $r2 $r0          ; write sequence of storage slots
move $$retv $zero             ; set return value
cfsi i808                     ; free 808 bytes for locals and 0 slots for extra call arguments
move $$reta $r5               ; restore return address
poph i524288                  ; restore registers 40..64
popl i127                     ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i1023                    ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function transfer_228
cfei i992                     ; allocate 992 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (to)
move $r3 $$arg1               ; save argument 1 (asset_id)
move $r5 $$arg2               ; save argument 2 (amount)
move $r4 $$reta               ; save return address
addi $r1 $$locbase i448       ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
lw   $r0 $r0 i0               ; load word
eq   $r0 $r0 $zero
jnzf $r0 $zero i32
lw   $r0 $$locbase i56        ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i2
load $r0 data_22              ; load constant from data section
rvrt $r0
addi $r0 $$locbase i448       ; get offset to local
addi $r0 $r0 i8               ; get offset to aggregate element
addi $r1 $$locbase i960       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r1 $$locbase i720       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i640       ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i476               ; [call]: call bits_238
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i80        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i384       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r3 $r2              ; copy memory
addi $r2 $$locbase i416       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
tr   $r2 $r5 $r0              ; tr r3 r1 r2
jmpf $zero i296
addi $r0 $$locbase i448       ; get offset to local
addi $r0 $r0 i8               ; get offset to aggregate element
addi $r1 $$locbase i928       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r8 $$locbase i928       ; get offset to local
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i292               ; [call]: call output_count_230
move $r7 $$retv               ; [call]: copy the return value
move $r6 $zero                ; move parameter from branch to block argument
lt   $r0 $r6 $r7
jnzf $r0 $zero i2
load $r0 data_29              ; load constant from data section
rvrt $r0
addi $r0 $$locbase i560       ; get offset to local
move $$arg0 $r6               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i320               ; [call]: call output_type_231
move $r0 $$retv               ; [call]: copy the return value
movi $r1 i16                  ; get data length for memory copy
mcp  $$locbase $r0 $r1        ; copy memory
addi $r0 $$locbase i504       ; get offset to local
movi $r1 i16                  ; get data length for memory copy
mcp  $r0 $$locbase $r1        ; copy memory
lw   $r0 $$locbase i0         ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i1
jmpf $zero i3
lw   $r0 $$locbase i64        ; load word
movi $r1 i3                   ; initialize constant into register
eq   $r0 $r0 $r1
jnzf $r0 $zero i1
jmpf $zero i235
addi $r0 $$locbase i576       ; get offset to local
move $$arg0 $r6               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i298               ; [call]: call output_type_231
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i16        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i536       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
lw   $r0 $$locbase i2         ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i1
jmpf $zero i2
lw   $r0 $$locbase i68        ; load word
eq   $r0 $r0 $zero
jnzf $r0 $zero i197
lw   $r0 $$locbase i67        ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i1
jmpf $zero i2
lw   $r0 $$locbase i68        ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i181
lw   $r0 $$locbase i67        ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i1
jmpf $zero i3
lw   $r0 $$locbase i68        ; load word
movi $r1 i2                   ; initialize constant into register
eq   $r0 $r0 $r1
jnzf $r0 $zero i163
lw   $r0 $$locbase i67        ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i1
jmpf $zero i3
lw   $r0 $$locbase i68        ; load word
movi $r1 i3                   ; initialize constant into register
eq   $r0 $r0 $r1
jnzf $r0 $zero i28
lw   $r0 $$locbase i67        ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i1
jmpf $zero i3
lw   $r0 $$locbase i68        ; load word
movi $r1 i4                   ; initialize constant into register
eq   $r0 $r0 $r1
jnzf $r0 $zero i11
lw   $r0 $$locbase i67        ; load word
eq   $r0 $r0 $zero
jnzf $r0 $zero i2
load $r0 data_22              ; load constant from data section
rvrt $r0
addi $r0 $$locbase i272       ; get offset to local
sw   $$locbase $zero i34      ; store word
addi $r2 $$locbase i848       ; get offset to local
movi $r1 i16                  ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
jmpf $zero i5
addi $r0 $$locbase i240       ; get offset to local
sw   $$locbase $zero i30      ; store word
addi $r2 $$locbase i848       ; get offset to local
movi $r1 i16                  ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
addi $r9 $$locbase i864       ; get offset to local
movi $r0 i16                  ; get data length for memory copy
mcp  $r9 $r2 $r0              ; copy memory
jmpf $zero i123
addi $r0 $$locbase i592       ; get offset to local
move $$arg0 $r6               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i226               ; [call]: call output_type_231
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i32        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i520       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
lw   $r0 $$locbase i4         ; load word
eq   $r0 $r0 $one
move $r1 $zero                ; move parameter from branch to block argument
jnzf $r0 $zero i1
move $r1 $one                 ; move parameter from branch to block argument
jnzf $r1 $zero i82
addi $r0 $$locbase i552       ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4092              ; [call]: call tx_type_110
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
addi $r0 $$locbase i304       ; get offset to local
sw   $$locbase $zero i38      ; store word
addi $r2 $$locbase i752       ; get offset to local
movi $r1 i16                  ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
jmpf $zero i7
addi $r0 $$locbase i288       ; get offset to local
sw   $$locbase $one i36       ; store word
gtf  $r1 $r6 i12              ; get transaction field
sw   $$locbase $r1 i37        ; store word
addi $r2 $$locbase i752       ; get offset to local
movi $r1 i16                  ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
addi $r1 $$locbase i768       ; get offset to local
movi $r0 i16                  ; get data length for memory copy
mcp  $r1 $r2 $r0              ; copy memory
jmpf $zero i7
addi $r0 $$locbase i256       ; get offset to local
sw   $$locbase $one i32       ; store word
gtf  $r1 $r6 i12              ; get transaction field
sw   $$locbase $r1 i33        ; store word
addi $r1 $$locbase i768       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r2 $$locbase i784       ; get offset to local
movi $r0 i16                  ; get data length for memory copy
mcp  $r2 $r1 $r0              ; copy memory
jmpf $zero i7
addi $r0 $$locbase i224       ; get offset to local
sw   $$locbase $one i28       ; store word
gtf  $r1 $r6 i12              ; get transaction field
sw   $$locbase $r1 i29        ; store word
addi $r2 $$locbase i784       ; get offset to local
movi $r1 i16                  ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
addi $r1 $$locbase i800       ; get offset to local
movi $r0 i16                  ; get data length for memory copy
mcp  $r1 $r2 $r0              ; copy memory
jmpf $zero i7
addi $r0 $$locbase i192       ; get offset to local
sw   $$locbase $one i24       ; store word
gtf  $r1 $r6 i265             ; get transaction field
sw   $$locbase $r1 i25        ; store word
addi $r1 $$locbase i800       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r2 $$locbase i816       ; get offset to local
movi $r0 i16                  ; get data length for memory copy
mcp  $r2 $r1 $r0              ; copy memory
jmpf $zero i7
addi $r0 $$locbase i160       ; get offset to local
sw   $$locbase $one i20       ; store word
gtf  $r1 $r6 i12              ; get transaction field
sw   $$locbase $r1 i21        ; store word
addi $r2 $$locbase i816       ; get offset to local
movi $r1 i16                  ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
addi $r1 $$locbase i832       ; get offset to local
movi $r0 i16                  ; get data length for memory copy
mcp  $r1 $r2 $r0              ; copy memory
jmpf $zero i5
addi $r0 $$locbase i128       ; get offset to local
sw   $$locbase $zero i16      ; store word
addi $r1 $$locbase i832       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i672       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i220               ; [call]: call unwrap_233
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i208       ; get offset to local
sw   $$locbase $one i26       ; store word
lw   $r0 $r0 i5               ; lw r1 r2 i0
sw   $$locbase $r0 i27        ; store word
addi $r9 $$locbase i864       ; get offset to local
movi $r0 i16                  ; get data length for memory copy
mcp  $r9 $r1 $r0              ; copy memory
addi $r1 $$locbase i880       ; get offset to local
movi $r0 i16                  ; get data length for memory copy
mcp  $r1 $r9 $r0              ; copy memory
jmpf $zero i6
addi $r0 $$locbase i176       ; get offset to local
sw   $$locbase $one i22       ; store word
sw   $$locbase $zero i23      ; store word
addi $r1 $$locbase i880       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r2 $$locbase i896       ; get offset to local
movi $r0 i16                  ; get data length for memory copy
mcp  $r2 $r1 $r0              ; copy memory
jmpf $zero i5
addi $r0 $$locbase i144       ; get offset to local
sw   $$locbase $zero i18      ; store word
addi $r2 $$locbase i896       ; get offset to local
movi $r1 i16                  ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
addi $r1 $$locbase i912       ; get offset to local
movi $r0 i16                  ; get data length for memory copy
mcp  $r1 $r2 $r0              ; copy memory
jmpf $zero i7
addi $r0 $$locbase i112       ; get offset to local
sw   $$locbase $one i14       ; store word
gtf  $r1 $r6 i770             ; get transaction field
sw   $$locbase $r1 i15        ; store word
addi $r1 $$locbase i912       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i488       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
lw   $r0 $$locbase i114       ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i1
jmpf $zero i2
lw   $r0 $$locbase i62        ; load word
eq   $r0 $r0 $zero
jnzf $r0 $zero i2
add  $r6 $r6 $one
jmpb $zero i261
addi $r0 $$locbase i688       ; get offset to local
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $r8 $r1              ; copy memory
addi $r1 $$locbase i608       ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i179               ; [call]: call bits_238
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i48        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i320       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r1 $$locbase i352       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r3 $r2              ; copy memory
tro  $r0 $r6 $r5 $r1          ; tro r1 r2 r3 r4
move $$retv $zero             ; set return value
cfsi i992                     ; free 992 bytes for locals and 0 slots for extra call arguments
move $$reta $r4               ; restore return address
poph i524288                  ; restore registers 40..64
popl i1023                    ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i7                       ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function output_count_230
cfei i8                       ; allocate 8 bytes for locals and 0 slots for call arguments
move $r0 $$reta               ; save return address
move $$arg0 $$locbase         ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4268              ; [call]: call tx_type_110
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
pshl i31                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function output_type_231
cfei i192                     ; allocate 192 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (index)
move $r4 $$arg1               ; save argument 1 (__ret_value)
move $r3 $$reta               ; save return address
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i50                ; [call]: call output_count_230
move $r1 $$retv               ; [call]: copy the return value
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4208              ; [call]: call ge_113
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
pshl i7                       ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function unwrap_233
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
pshl i15                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function bits_238
cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
move $$retv $r1               ; set return value
cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i15                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i2047                    ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function push_244
cfei i1744                    ; allocate 1744 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (value)
move $r5 $$reta               ; save return address
addi $r4 $$locbase i488       ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r4 $r0 $r2              ; copy memory
addi $r6 $$locbase i240       ; get offset to local
movi $r2 i248                 ; get data length for memory copy
mcp  $r6 $r1 $r2              ; copy memory
addi $r1 $$locbase i1272      ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r2 $$locbase i1064      ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i194               ; [call]: call field_id_251
move $r1 $$retv               ; [call]: copy the return value
movi $r2 i32                  ; get data length for memory copy
mcp  $$locbase $r1 $r2        ; copy memory
addi $r1 $$locbase i1160      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $$locbase $r2        ; copy memory
addi $r2 $$locbase i1016      ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $zero             ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1636              ; [call]: call read_178
move $r1 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i32        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
addi $r1 $$locbase i1192      ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r1 $r2 $r3              ; copy memory
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $zero             ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1299              ; [call]: call unwrap_or_194
move $r7 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i1344      ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i1096      ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i156               ; [call]: call field_id_251
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i48        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i1208      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r1 $$locbase i1032      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1080              ; [call]: call sha256_209
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i80        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i1648      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r0 i248                 ; initialize constant into register
mul  $r0 $r7 $r0
movi $r2 i8                   ; initialize constant into register
div  $r0 $r0 $r2
movi $r2 i8                   ; initialize constant into register
mul  $r2 $r0 $r2
movi $r3 i248                 ; initialize constant into register
add  $r2 $r2 $r3
movi $r3 i31                  ; initialize constant into register
add  $r2 $r2 $r3
movi $r3 i5                   ; initialize constant into register
srl  $r2 $r2 $r3
movi $r3 i4                   ; initialize constant into register
mod  $r9 $r0 $r3
movi $r0 i8                   ; initialize constant into register
mul  $r0 $r9 $r0
movi $r3 i248                 ; initialize constant into register
add  $r0 $r0 $r3
movi $r3 i31                  ; initialize constant into register
add  $r0 $r0 $r3
movi $r3 i5                   ; initialize constant into register
srl  $r10 $r0 $r3
addi $r0 $$locbase i640       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r3              ; copy memory
addi $r1 $$locbase i112       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
addi $r0 $$locbase i1712      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r3              ; copy memory
addi $r0 $$locbase i952       ; get offset to local
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i6030              ; [call]: call as_u256_62
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i144       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
addi $r0 $$locbase i984       ; get offset to local
move $$arg0 $r10              ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i6041              ; [call]: call as_u256_62
move $r0 $$retv               ; [call]: copy the return value
addi $r3 $$locbase i176       ; get offset to local
movi $r8 i32                  ; get data length for memory copy
mcp  $r3 $r0 $r8              ; copy memory
addi $r0 $$locbase i1488      ; get offset to local
movi $r8 i32                  ; get data length for memory copy
mcp  $r0 $r2 $r8              ; copy memory
addi $r2 $$locbase i1616      ; get offset to local
movi $r8 i32                  ; get data length for memory copy
mcp  $r2 $r3 $r8              ; copy memory
addi $r3 $$locbase i1552      ; get offset to local
wqop $r3 $r0 $r2 i33
addi $r0 $$locbase i1520      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r1 $$locbase i1552      ; get offset to local
addi $r2 $$locbase i1584      ; get offset to local
wqop $r2 $r0 $r1 i32
addi $r0 $$locbase i1712      ; get offset to local
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $r2 $r1              ; copy memory
addi $r0 $$locbase i672       ; get offset to local
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $r2 $r1              ; copy memory
addi $r1 $$locbase i208       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i592       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
sw   $$locbase $r10 i78       ; store word
sw   $$locbase $r9 i79        ; store word
addi $r0 $$locbase i1680      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
lw   $r0 $$locbase i78        ; load word
lw   $r1 $$locbase i79        ; load word
movi $r2 i32                  ; initialize constant into register
mul  $r2 $r0 $r2
movi $r3 i8                   ; initialize constant into register
mul  $r2 $r3 $r2
aloc $r2                      ; aloc size
move $r2 $hp                  ; move ptr hp
addi $r3 $$locbase i1680      ; get offset to local
srwq $r2 $r3 $r3 $r0          ; read sequence of storage slots
movi $r3 i8                   ; initialize constant into register
mul  $r1 $r3 $r1
add  $r1 $r2 $r1
addi $r3 $$locbase i704       ; get offset to local
movi $r8 i248                 ; get data length for memory copy
mcp  $r3 $r6 $r8              ; copy memory
movi $r6 i248                 ; initialize constant into register
mcp  $r1 $r3 $r6              ; mcp dst src count
addi $r1 $$locbase i1680      ; get offset to local
swwq $r1 $r0 $r2 $r0          ; write sequence of storage slots
addi $r0 $$locbase i1416      ; get offset to local
movi $r1 i72                  ; get data length for memory copy
mcp  $r0 $r4 $r1              ; copy memory
addi $r1 $$locbase i1128      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i21                ; [call]: call field_id_251
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i560       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
add  $r0 $r7 $one
addi $r2 $$locbase i1240      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $zero             ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i937               ; [call]: call write_218
move $$retv $zero             ; set return value
cfsi i1744                    ; free 1744 bytes for locals and 0 slots for extra call arguments
move $$reta $r5               ; restore return address
poph i524288                  ; restore registers 40..64
popl i2047                    ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i15                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function field_id_251
cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
addi $r0 $r0 i40              ; get offset to aggregate element
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
move $$retv $r1               ; set return value
cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i15                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i127                     ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function log_253
cfei i392                     ; allocate 392 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (value)
move $r1 $$reta               ; save return address
addi $r2 $$locbase i32        ; get offset to local
move $$arg0 $r2               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i6425              ; [call]: call new_39
move $r2 $$retv               ; [call]: copy the return value
lw   $r3 $r2 i0               ; load word
lw   $r4 $r2 i1               ; load word
lw   $r2 $r2 i2               ; load word
addi $r5 $$locbase i120       ; get offset to local
movi $r6 i248                 ; get data length for memory copy
mcp  $r5 $r0 $r6              ; copy memory
addi $r0 $$locbase i368       ; get offset to local
sw   $$locbase $r3 i46        ; store word
sw   $$locbase $r4 i47        ; store word
sw   $$locbase $r2 i48        ; store word
addi $r2 $$locbase i72        ; get offset to local
move $$arg0 $r5               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i31                ; [call]: call abi_encode_255
move $r0 $$retv               ; [call]: copy the return value
lw   $r2 $r0 i0               ; load word
lw   $r3 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
addi $r4 $$locbase i96        ; get offset to local
sw   $$locbase $r2 i12        ; store word
sw   $$locbase $r3 i13        ; store word
sw   $$locbase $r0 i14        ; store word
addi $r0 $$locbase i56        ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i6432              ; [call]: call as_raw_slice_40
move $r0 $$retv               ; [call]: copy the return value
movi $r2 i16                  ; get data length for memory copy
mcp  $$locbase $r0 $r2        ; copy memory
addi $r0 $$locbase i16        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $$locbase $r2        ; copy memory
load $r0 data_30              ; load constant from data section
lw   $r2 $$locbase i2         ; load slice pointer for logging data
lw   $r3 $$locbase i3         ; load slice size for logging data
logd $zero $r0 $r2 $r3        ; log slice
move $$retv $zero             ; set return value
cfsi i392                     ; free 392 bytes for locals and 0 slots for extra call arguments
move $$reta $r1               ; restore return address
poph i524288                  ; restore registers 40..64
popl i127                     ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i511                     ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function abi_encode_255
cfei i888                     ; allocate 888 bytes for locals and 0 slots for call arguments
move $r8 $$arg0               ; save argument 0 (self)
move $r0 $$arg1               ; save argument 1 (buffer)
move $r7 $$arg2               ; save argument 2 (__ret_value)
move $r6 $$reta               ; save return address
addi $r1 $$locbase i680       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r8 $r2              ; copy memory
addi $r2 $$locbase i712       ; get offset to local
movi $r3 i24                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
addi $r0 $$locbase i184       ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i221               ; [call]: call abi_encode_256
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
addi $r3 $r8 i32              ; get offset to aggregate element
movi $r4 i40                  ; get data length for memory copy
mcp  $$locbase $r3 $r4        ; copy memory
lw   $r3 $$locbase i0         ; load word
eq   $r3 $r3 $zero
jnzf $r3 $zero i45
lw   $r3 $$locbase i0         ; load word
eq   $r3 $r3 $one
jnzf $r3 $zero i2
load $r0 data_22              ; load constant from data section
rvrt $r0
addi $r3 $$locbase i8         ; get offset to aggregate element
addi $r4 $$locbase i856       ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r3 $r5              ; copy memory
addi $r4 $$locbase i328       ; get offset to local
sw   $$locbase $r1 i41        ; store word
sw   $$locbase $r2 i42        ; store word
sw   $$locbase $r0 i43        ; store word
addi $r0 $$locbase i64        ; get offset to local
move $$arg0 $one              ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i6577              ; [call]: call abi_encode_38
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
addi $r4 $$locbase i400       ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r3 $r5              ; copy memory
addi $r3 $$locbase i432       ; get offset to local
sw   $$locbase $r1 i54        ; store word
sw   $$locbase $r2 i55        ; store word
sw   $$locbase $r0 i56        ; store word
addi $r0 $$locbase i256       ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i227               ; [call]: call abi_encode_258
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
jmpf $zero i39
addi $r3 $$locbase i8         ; get offset to aggregate element
addi $r4 $$locbase i824       ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r3 $r5              ; copy memory
addi $r4 $$locbase i304       ; get offset to local
sw   $$locbase $r1 i38        ; store word
sw   $$locbase $r2 i39        ; store word
sw   $$locbase $r0 i40        ; store word
addi $r0 $$locbase i40        ; get offset to local
move $$arg0 $zero             ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i6617              ; [call]: call abi_encode_38
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
addi $r4 $$locbase i792       ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r3 $r5              ; copy memory
addi $r3 $$locbase i376       ; get offset to local
sw   $$locbase $r1 i47        ; store word
sw   $$locbase $r2 i48        ; store word
sw   $$locbase $r0 i49        ; store word
addi $r0 $$locbase i232       ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i187               ; [call]: call abi_encode_258
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
lw   $r3 $r8 i9               ; load word
addi $r4 $$locbase i352       ; get offset to local
sw   $$locbase $r1 i44        ; store word
sw   $$locbase $r2 i45        ; store word
sw   $$locbase $r0 i46        ; store word
addi $r0 $$locbase i88        ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i6653              ; [call]: call abi_encode_38
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
lw   $r3 $r8 i10              ; load word
eq   $r4 $r3 $zero
jnzf $r4 $zero i42
eq   $r4 $r3 $one
jnzf $r4 $zero i23
movi $r4 i2                   ; initialize constant into register
eq   $r3 $r3 $r4
jnzf $r3 $zero i2
load $r0 data_22              ; load constant from data section
rvrt $r0
addi $r3 $$locbase i656       ; get offset to local
sw   $$locbase $r1 i82        ; store word
sw   $$locbase $r2 i83        ; store word
sw   $$locbase $r0 i84        ; store word
addi $r0 $$locbase i160       ; get offset to local
movi $r1 i2                   ; initialize constant into register
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i6680              ; [call]: call abi_encode_38
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
jmpf $zero i16
addi $r3 $$locbase i632       ; get offset to local
sw   $$locbase $r1 i79        ; store word
sw   $$locbase $r2 i80        ; store word
sw   $$locbase $r0 i81        ; store word
addi $r0 $$locbase i136       ; get offset to local
move $$arg0 $one              ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i6697              ; [call]: call abi_encode_38
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
jmpf $zero i16
addi $r3 $$locbase i608       ; get offset to local
sw   $$locbase $r1 i76        ; store word
sw   $$locbase $r2 i77        ; store word
sw   $$locbase $r0 i78        ; store word
addi $r0 $$locbase i112       ; get offset to local
move $$arg0 $zero             ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i6714              ; [call]: call abi_encode_38
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
addi $r3 $r8 i88              ; get offset to aggregate element
addi $r4 $$locbase i736       ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r3 $r5              ; copy memory
addi $r3 $$locbase i768       ; get offset to local
sw   $$locbase $r1 i96        ; store word
sw   $$locbase $r2 i97        ; store word
sw   $$locbase $r0 i98        ; store word
addi $r0 $$locbase i208       ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i33                ; [call]: call abi_encode_256
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
addi $r3 $r8 i120             ; get offset to aggregate element
addi $r4 $$locbase i456       ; get offset to local
movi $r5 i128                 ; get data length for memory copy
mcp  $r4 $r3 $r5              ; copy memory
addi $r3 $$locbase i584       ; get offset to local
sw   $$locbase $r1 i73        ; store word
sw   $$locbase $r2 i74        ; store word
sw   $$locbase $r0 i75        ; store word
addi $r0 $$locbase i280       ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i103               ; [call]: call abi_encode_261
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
sw   $r7 $r1 i0               ; store word
sw   $r7 $r2 i1               ; store word
sw   $r7 $r0 i2               ; store word
move $$retv $r7               ; set return value
cfsi i888                     ; free 888 bytes for locals and 0 slots for extra call arguments
move $$reta $r6               ; restore return address
poph i524288                  ; restore registers 40..64
popl i511                     ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i511                     ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function abi_encode_256
cfei i208                     ; allocate 208 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (buffer)
move $r2 $$arg2               ; save argument 2 (__ret_value)
move $r3 $$reta               ; save return address
addi $r4 $$locbase i24        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r0 $r5              ; copy memory
addi $r0 $$locbase i184       ; get offset to local
movi $r5 i24                  ; get data length for memory copy
mcp  $r0 $r1 $r5              ; copy memory
movi $r1 i24                  ; get data length for memory copy
mcp  $$locbase $r0 $r1        ; copy memory
addi $r0 $$locbase i80        ; get offset to local
movi $r1 i24                  ; get data length for memory copy
mcp  $r0 $$locbase $r1        ; copy memory
lw   $r7 $$locbase i10        ; load word
lw   $r6 $$locbase i11        ; load word
lw   $r0 $$locbase i12        ; load word
movi $r1 i32                  ; initialize constant into register
add  $r1 $r0 $r1
gt   $r5 $r1 $r6
jnzf $r5 $zero i1
jmpf $zero i5
movi $r5 i2                   ; initialize constant into register
mul  $r6 $r6 $r5
aloc $r6
mcp  $hp $r7 $r0
move $r7 $hp                  ; return value from ASM block with return register hp
addi $r5 $$locbase i104       ; get offset to local
movi $r8 i32                  ; get data length for memory copy
mcp  $r5 $r4 $r8              ; copy memory
add  $r0 $r7 $r0
movi $r4 i32                  ; get data length for memory copy
mcp  $r0 $r5 $r4              ; copy memory
addi $r0 $$locbase i136       ; get offset to local
sw   $$locbase $r7 i17        ; store word
sw   $$locbase $r6 i18        ; store word
sw   $$locbase $r1 i19        ; store word
addi $r1 $$locbase i56        ; get offset to local
movi $r4 i24                  ; get data length for memory copy
mcp  $r1 $r0 $r4              ; copy memory
addi $r0 $$locbase i160       ; get offset to local
movi $r4 i24                  ; get data length for memory copy
mcp  $r0 $r1 $r4              ; copy memory
movi $r1 i24                  ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
move $$retv $r2               ; set return value
cfsi i208                     ; free 208 bytes for locals and 0 slots for extra call arguments
move $$reta $r3               ; restore return address
poph i524288                  ; restore registers 40..64
popl i511                     ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i63                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function abi_encode_258
cfei i80                      ; allocate 80 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (buffer)
move $r2 $$arg2               ; save argument 2 (__ret_value)
move $r3 $$reta               ; save return address
addi $r4 $$locbase i24        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r0 $r5              ; copy memory
addi $r0 $$locbase i56        ; get offset to local
movi $r5 i24                  ; get data length for memory copy
mcp  $r0 $r1 $r5              ; copy memory
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $$locbase         ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i75                ; [call]: call abi_encode_256
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r4 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
sw   $r2 $r1 i0               ; store word
sw   $r2 $r4 i1               ; store word
sw   $r2 $r0 i2               ; store word
move $$retv $r2               ; set return value
cfsi i80                      ; free 80 bytes for locals and 0 slots for extra call arguments
move $$reta $r3               ; restore return address
poph i524288                  ; restore registers 40..64
popl i63                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i511                     ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function abi_encode_261
cfei i728                     ; allocate 728 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (buffer)
move $r7 $$arg2               ; save argument 2 (__ret_value)
move $r6 $$reta               ; save return address
movi $r2 i128                 ; get data length for memory copy
mcp  $$locbase $r0 $r2        ; copy memory
lw   $r0 $r0 i0               ; load word
eq   $r0 $r0 $zero
jnzf $r0 $zero i138
lw   $r0 $$locbase i0         ; load word
eq   $r0 $r0 $one
jnzf $r0 $zero i2
load $r0 data_22              ; load constant from data section
rvrt $r0
addi $r0 $$locbase i8         ; get offset to aggregate element
addi $r2 $$locbase i608       ; get offset to local
movi $r3 i120                 ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
addi $r0 $$locbase i344       ; get offset to local
movi $r2 i24                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r1 $$locbase i152       ; get offset to local
move $$arg0 $one              ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i6890              ; [call]: call abi_encode_38
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
addi $r8 $$locbase i608       ; get offset to local
addi $r3 $$locbase i416       ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $r8 $r4              ; copy memory
addi $r4 $$locbase i448       ; get offset to local
sw   $$locbase $r1 i56        ; store word
sw   $$locbase $r2 i57        ; store word
sw   $$locbase $r0 i58        ; store word
addi $r0 $$locbase i224       ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i141               ; [call]: call abi_encode_256
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
addi $r3 $r8 i32              ; get offset to aggregate element
addi $r4 $$locbase i472       ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r3 $r5              ; copy memory
addi $r3 $$locbase i504       ; get offset to local
sw   $$locbase $r1 i63        ; store word
sw   $$locbase $r2 i64        ; store word
sw   $$locbase $r0 i65        ; store word
addi $r0 $$locbase i248       ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i105               ; [call]: call abi_encode_258
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
addi $r3 $r8 i64              ; get offset to aggregate element
addi $r4 $$locbase i528       ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r3 $r5              ; copy memory
addi $r3 $$locbase i560       ; get offset to local
sw   $$locbase $r1 i70        ; store word
sw   $$locbase $r2 i71        ; store word
sw   $$locbase $r0 i72        ; store word
addi $r0 $$locbase i272       ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i125               ; [call]: call abi_encode_258
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
addi $r3 $r8 i96              ; get offset to aggregate element
lw   $r4 $r8 i12              ; load word
addi $r5 $$locbase i368       ; get offset to local
sw   $$locbase $r1 i46        ; store word
sw   $$locbase $r2 i47        ; store word
sw   $$locbase $r0 i48        ; store word
addi $r0 $$locbase i176       ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r5               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i6968              ; [call]: call abi_encode_38
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
addi $r3 $r3 i8               ; get offset to aggregate element
lb   $r3 $r3 i0               ; load byte
addi $r4 $$locbase i584       ; get offset to local
sw   $$locbase $r1 i73        ; store word
sw   $$locbase $r2 i74        ; store word
sw   $$locbase $r0 i75        ; store word
addi $r0 $$locbase i296       ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i46                ; [call]: call abi_encode_265
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
lw   $r3 $r8 i14              ; load word
addi $r4 $$locbase i392       ; get offset to local
sw   $$locbase $r1 i49        ; store word
sw   $$locbase $r2 i50        ; store word
sw   $$locbase $r0 i51        ; store word
addi $r0 $$locbase i200       ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i7003              ; [call]: call abi_encode_38
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
jmpf $zero i15
addi $r0 $$locbase i320       ; get offset to local
movi $r2 i24                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r1 $$locbase i128       ; get offset to local
move $$arg0 $zero             ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i7019              ; [call]: call abi_encode_38
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
sw   $r7 $r1 i0               ; store word
sw   $r7 $r2 i1               ; store word
sw   $r7 $r0 i2               ; store word
move $$retv $r7               ; set return value
cfsi i728                     ; free 728 bytes for locals and 0 slots for extra call arguments
move $$reta $r6               ; restore return address
poph i524288                  ; restore registers 40..64
popl i511                     ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i255                     ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function abi_encode_265
cfei i144                     ; allocate 144 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (buffer)
move $r2 $$arg2               ; save argument 2 (__ret_value)
move $r3 $$reta               ; save return address
addi $r4 $$locbase i120       ; get offset to local
movi $r5 i24                  ; get data length for memory copy
mcp  $r4 $r1 $r5              ; copy memory
movi $r1 i24                  ; get data length for memory copy
mcp  $$locbase $r4 $r1        ; copy memory
addi $r1 $$locbase i48        ; get offset to local
movi $r4 i24                  ; get data length for memory copy
mcp  $r1 $$locbase $r4        ; copy memory
lw   $r7 $$locbase i6         ; load word
lw   $r6 $$locbase i7         ; load word
lw   $r1 $$locbase i8         ; load word
add  $r4 $r1 $one
gt   $r5 $r4 $r6
jnzf $r5 $zero i1
jmpf $zero i5
movi $r5 i2                   ; initialize constant into register
mul  $r6 $r6 $r5
aloc $r6
mcp  $hp $r7 $r1
move $r7 $hp                  ; return value from ASM block with return register hp
add  $r1 $r7 $r1
sb   $r1 $r0 i0               ; store byte
addi $r0 $$locbase i72        ; get offset to local
sw   $$locbase $r7 i9         ; store word
sw   $$locbase $r6 i10        ; store word
sw   $$locbase $r4 i11        ; store word
addi $r1 $$locbase i24        ; get offset to local
movi $r4 i24                  ; get data length for memory copy
mcp  $r1 $r0 $r4              ; copy memory
addi $r0 $$locbase i96        ; get offset to local
movi $r4 i24                  ; get data length for memory copy
mcp  $r0 $r1 $r4              ; copy memory
movi $r1 i24                  ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
move $$retv $r2               ; set return value
cfsi i144                     ; free 144 bytes for locals and 0 slots for extra call arguments
move $$reta $r3               ; restore return address
poph i524288                  ; restore registers 40..64
popl i255                     ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i7                       ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function is_none_271
cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$reta               ; save return address
lw   $r0 $r0 i0               ; load word
eq   $r0 $r0 $one
move $r2 $zero                ; move parameter from branch to block argument
jnzf $r0 $zero i1
move $r2 $one                 ; move parameter from branch to block argument
move $$retv $r2               ; set return value
cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments
move $$reta $r1               ; restore return address
poph i524288                  ; restore registers 40..64
popl i7                       ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i255                     ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function abi_encode_278
cfei i152                     ; allocate 152 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (buffer)
move $r2 $$arg2               ; save argument 2 (__ret_value)
move $r3 $$reta               ; save return address
addi $r4 $$locbase i128       ; get offset to local
movi $r5 i24                  ; get data length for memory copy
mcp  $r4 $r1 $r5              ; copy memory
movi $r1 i24                  ; get data length for memory copy
mcp  $$locbase $r4 $r1        ; copy memory
addi $r1 $$locbase i48        ; get offset to local
movi $r4 i24                  ; get data length for memory copy
mcp  $r1 $$locbase $r4        ; copy memory
lw   $r7 $$locbase i6         ; load word
lw   $r6 $$locbase i7         ; load word
lw   $r1 $$locbase i8         ; load word
movi $r4 i4                   ; initialize constant into register
add  $r4 $r1 $r4
gt   $r5 $r4 $r6
jnzf $r5 $zero i1
jmpf $zero i5
movi $r5 i2                   ; initialize constant into register
mul  $r6 $r6 $r5
aloc $r6
mcp  $hp $r7 $r1
move $r7 $hp                  ; return value from ASM block with return register hp
addi $r5 $$locbase i72        ; get offset to local
sw   $$locbase $r0 i9         ; store word
movi $r0 i4                   ; initialize constant into register
add  $r0 $r5 $r0
add  $r1 $r7 $r1
movi $r5 i4                   ; get data length for memory copy
mcp  $r1 $r0 $r5              ; copy memory
addi $r0 $$locbase i80        ; get offset to local
sw   $$locbase $r7 i10        ; store word
sw   $$locbase $r6 i11        ; store word
sw   $$locbase $r4 i12        ; store word
addi $r1 $$locbase i24        ; get offset to local
movi $r4 i24                  ; get data length for memory copy
mcp  $r1 $r0 $r4              ; copy memory
addi $r0 $$locbase i104       ; get offset to local
movi $r4 i24                  ; get data length for memory copy
mcp  $r0 $r1 $r4              ; copy memory
movi $r1 i24                  ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
move $$retv $r2               ; set return value
cfsi i152                     ; free 152 bytes for locals and 0 slots for extra call arguments
move $$reta $r3               ; restore return address
poph i524288                  ; restore registers 40..64
popl i255                     ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i7                       ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function len_282
cfei i16                      ; allocate 16 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$reta               ; save return address
movi $r2 i16                  ; get data length for memory copy
mcp  $$locbase $r0 $r2        ; copy memory
move $r0 $$locbase            ; copy ASM block argument's constant initial value to register
lw   $r0 $r0 i1               ; load word
move $$retv $r0               ; set return value
cfsi i16                      ; free 16 bytes for locals and 0 slots for extra call arguments
move $$reta $r1               ; restore return address
poph i524288                  ; restore registers 40..64
popl i7                       ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i15                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function abi_decode_284
cfei i96                      ; allocate 96 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (buffer)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
addi $r3 $$locbase i64        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i7547              ; [call]: call abi_decode_11
move $r0 $$retv               ; [call]: copy the return value
movi $r3 i32                  ; get data length for memory copy
mcp  $$locbase $r0 $r3        ; copy memory
addi $r0 $$locbase i32        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $$locbase $r3        ; copy memory
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
move $$retv $r1               ; set return value
cfsi i96                      ; free 96 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i15                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i127                     ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function from_295
cfei i48                      ; allocate 48 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (slice)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
addi $r3 $$locbase i16        ; get offset to local
movi $r4 i16                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
move $$arg0 $r3               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i37                ; [call]: call len_297
move $r3 $$retv               ; [call]: copy the return value
movi $r4 i248                 ; initialize constant into register
mul  $r4 $r4 $r3
aloc $r4                      ; aloc size
move $r4 $hp                  ; move ptr hp
gt   $r5 $r3 $zero
jnzf $r5 $zero i1
jmpf $zero i11
movi $r5 i16                  ; get data length for memory copy
mcp  $$locbase $r0 $r5        ; copy memory
move $$arg0 $$locbase         ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i7511              ; [call]: call ptr_23
move $r5 $$retv               ; [call]: copy the return value
movi $r6 i248                 ; initialize constant into register
mul  $r6 $r3 $r6
mcp  $r4 $r5 $r6              ; mcp dst src len
addi $r5 $$locbase i32        ; get offset to local
movi $r6 i16                  ; get data length for memory copy
mcp  $r5 $r0 $r6              ; copy memory
move $$arg0 $r5               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i10                ; [call]: call len_297
move $r0 $$retv               ; [call]: copy the return value
sw   $r1 $r4 i0               ; store word
sw   $r1 $r3 i1               ; store word
sw   $r1 $r0 i2               ; store word
move $$retv $r1               ; set return value
cfsi i48                      ; free 48 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i127                     ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i7                       ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function len_297
cfei i16                      ; allocate 16 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$reta               ; save return address
movi $r2 i16                  ; get data length for memory copy
mcp  $$locbase $r0 $r2        ; copy memory
move $r0 $$locbase            ; copy ASM block argument's constant initial value to register
lw   $r0 $r0 i1               ; load word
movi $r2 i248                 ; initialize constant into register
div  $r0 $r0 $r2
move $$retv $r0               ; set return value
cfsi i16                      ; free 16 bytes for locals and 0 slots for extra call arguments
move $$reta $r1               ; restore return address
poph i524288                  ; restore registers 40..64
popl i7                       ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i65535                   ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function match_orders_311
cfei i10592                   ; allocate 10592 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (order_sell_id)
move $r1 $$arg1               ; save argument 1 (order_buy_id)
move $r8 $$reta               ; save return address
load $r2 data_10              ; get local constant
load $r3 data_10              ; get local constant
load $r4 data_10              ; get local constant
load $r5 data_10              ; get local constant
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i7432              ; [call]: call reentrancy_guard_33
addi $r6 $$locbase i1856      ; get offset to local
movi $r7 i32                  ; get data length for memory copy
mcp  $r6 $r2 $r7              ; copy memory
sw   $$locbase $zero i236     ; store word
addi $r2 $r6 i40              ; get offset to aggregate element
movi $r7 i32                  ; get data length for memory copy
mcp  $r2 $r3 $r7              ; copy memory
movi $r2 i6296                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r2 $r6 $r3              ; copy memory
movi $r3 i6368                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
movi $r6 i32                  ; get data length for memory copy
mcp  $r3 $r0 $r6              ; copy memory
addi $r0 $$locbase i2984      ; get offset to local
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i2521              ; [call]: call get_182
move $r0 $$retv               ; [call]: copy the return value
movi $r2 i72                  ; get data length for memory copy
mcp  $$locbase $r0 $r2        ; copy memory
movi $r0 i6952                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r0 $$locbase $r2        ; copy memory
movi $r2 i4128                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i7181              ; [call]: call try_read_52
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i72        ; get offset to local
movi $r3 i128                 ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i10160               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i128                 ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
addi $r0 $$locbase i1928      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r4 $r3              ; copy memory
sw   $$locbase $zero i245     ; store word
addi $r3 $r0 i40              ; get offset to aggregate element
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $r5 $r4              ; copy memory
movi $r3 i6432                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
movi $r4 i72                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
movi $r0 i6504                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r4              ; copy memory
addi $r1 $$locbase i3056      ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i2567              ; [call]: call get_182
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i200       ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
movi $r0 i8304                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r0 $r1 $r3              ; copy memory
movi $r1 i4256                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i7228              ; [call]: call try_read_52
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i768       ; get offset to local
movi $r3 i128                 ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
movi $r0 i9912                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i128                 ; get data length for memory copy
mcp  $r0 $r1 $r3              ; copy memory
movi $r0 i4976                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i128                 ; get data length for memory copy
mcp  $r0 $r2 $r1              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i6109              ; [call]: call is_some_101
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i12
movi $r0 i9912                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i5104                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i128                 ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
move $$arg0 $r1               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i6123              ; [call]: call is_some_101
move $r0 $$retv               ; [call]: copy the return value
movi $r1 i9232                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
sw   $$locbase $one i1154     ; store word
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i6572              ; [call]: call require_97
movi $r0 i10160               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i5232                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i128                 ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i4640                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i6132              ; [call]: call unwrap_102
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i1520      ; get offset to local
movi $r2 i120                 ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i10288               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i120                 ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r0 i9912                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i5360                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i128                 ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i4760                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i6154              ; [call]: call unwrap_102
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i1656      ; get offset to local
movi $r2 i120                 ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i10040               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i120                 ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r0 $$locbase i1520      ; get offset to local
addi $r0 $r0 i104             ; get offset to aggregate element
lb   $r0 $r0 i0               ; load byte
jnzf $r0 $zero i1
jmpf $zero i6
movi $r0 i10040               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
addi $r0 $r0 i96              ; get offset to aggregate element
addi $r0 $r0 i8               ; get offset to aggregate element
lb   $r0 $r0 i0               ; load byte
eq   $r0 $r0 $zero
movi $r1 i4952                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i4                   ; initialize constant into register
sw   $$locbase $r2 i619       ; store word
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i6637              ; [call]: call require_97
movi $r0 i10288               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
addi $r0 $r0 i64              ; get offset to aggregate element
movi $r1 i10040               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
addi $r1 $r1 i64              ; get offset to aggregate element
movi $r2 i5928                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i6400                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r3              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i7373              ; [call]: call eq_50
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i9
lw   $r0 $$locbase i1300      ; load word
lw   $r1 $$locbase i1269      ; load word
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i2292              ; [call]: call le_208
move $r0 $$retv               ; [call]: copy the return value
movi $r1 i4960                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i3                   ; initialize constant into register
sw   $$locbase $r2 i620       ; store word
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i6679              ; [call]: call require_97
movi $r0 i10288               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i10472               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i120                 ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i6264                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i10288               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
addi $r1 $r1 i96              ; get offset to aggregate element
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r1 $$locbase i2952      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i3044              ; [call]: call flip_170
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
addi $r0 $r0 i8               ; get offset to aggregate element
lb   $r0 $r0 i0               ; load byte
movi $r2 i10472               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
addi $r2 $r2 i96              ; get offset to aggregate element
sw   $$locbase $r1 i1321      ; store word
addi $r1 $r2 i8               ; get offset to aggregate element
sb   $r1 $r0 i0               ; store byte
lw   $r4 $$locbase i1298      ; load word
lw   $r0 $$locbase i1267      ; load word
lw   $r1 $$locbase i1269      ; load word
lw   $r2 $$locbase i1300      ; load word
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i5085              ; [call]: call mul_div_137
move $r0 $$retv               ; [call]: copy the return value
lt   $r1 $r4 $r0
jnzf $r1 $zero i1
move $r4 $r0                  ; move parameter from branch to block argument
sw   $$locbase $r4 i1321      ; store word
movi $r0 i10288               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
addi $r0 $r0 i32              ; get offset to aggregate element
movi $r1 i10408               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i10472               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i5488                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i120                 ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i2736      ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i5550              ; [call]: call order_return_asset_amount_122
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i1776      ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i9240                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r0 i10440               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
addi $r1 $$locbase i1776      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
lw   $r5 $$locbase i226       ; load word
movi $r0 i10288               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i10472               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
addi $r1 $r1 i96              ; get offset to aggregate element
movi $r2 i5992                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i120                 ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i6112                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r3              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4494              ; [call]: call remove_update_order_internal_168
movi $r0 i10472               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
addi $r0 $r0 i96              ; get offset to aggregate element
movi $r1 i6280                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i2968      ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i3137              ; [call]: call flip_170
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
addi $r0 $r0 i8               ; get offset to aggregate element
lb   $r0 $r0 i0               ; load byte
movi $r2 i10472               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
addi $r2 $r2 i96              ; get offset to aggregate element
sw   $$locbase $r1 i1321      ; store word
addi $r1 $r2 i8               ; get offset to aggregate element
sb   $r1 $r0 i0               ; store byte
movi $r0 i10040               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
addi $r0 $r0 i32              ; get offset to aggregate element
movi $r1 i9320                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i10472               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i5608                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i120                 ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i2776      ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i5627              ; [call]: call order_return_asset_amount_122
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i1816      ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i9280                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
movi $r0 i9352                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
addi $r1 $$locbase i1816      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
lw   $r10 $$locbase i231      ; load word
movi $r0 i10288               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
addi $r0 $r0 i112             ; get offset to aggregate element
movi $r1 i10040               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
addi $r1 $r1 i112             ; get offset to aggregate element
lw   $r2 $$locbase i1321      ; load word
movi $r3 i5816                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
sw   $$locbase $zero i727     ; store word
sw   $$locbase $r2 i728       ; store word
addi $r2 $$locbase i2848      ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i5050              ; [call]: call from_145
move $r2 $$retv               ; [call]: copy the return value
lw   $r3 $r2 i0               ; load word
lw   $r2 $r2 i1               ; load word
lw   $r0 $r0 i0               ; load word
movi $r6 i5832                ; get offset to local
add  $r6 $$locbase $r6        ; get offset to local
sw   $$locbase $zero i729     ; store word
sw   $$locbase $r0 i730       ; store word
addi $r0 $$locbase i2864      ; get offset to local
move $$arg0 $r6               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i5065              ; [call]: call from_145
move $r0 $$retv               ; [call]: copy the return value
lw   $r6 $r0 i0               ; load word
lw   $r0 $r0 i1               ; load word
movi $r7 i5728                ; get offset to local
add  $r7 $$locbase $r7        ; get offset to local
sw   $$locbase $r3 i716       ; store word
sw   $$locbase $r2 i717       ; store word
movi $r2 i5768                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
sw   $$locbase $r6 i721       ; store word
sw   $$locbase $r0 i722       ; store word
addi $r0 $$locbase i2816      ; get offset to local
move $$arg0 $r7               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i5144              ; [call]: call multiply_138
move $r0 $$retv               ; [call]: copy the return value
lw   $r2 $r0 i0               ; load word
lw   $r0 $r0 i1               ; load word
lw   $r1 $r1 i0               ; load word
movi $r3 i5848                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
sw   $$locbase $zero i731     ; store word
sw   $$locbase $r1 i732       ; store word
addi $r1 $$locbase i2880      ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i5099              ; [call]: call from_145
move $r1 $$retv               ; [call]: copy the return value
lw   $r3 $r1 i0               ; load word
lw   $r1 $r1 i1               ; load word
movi $r6 i5864                ; get offset to local
add  $r6 $$locbase $r6        ; get offset to local
sw   $$locbase $r2 i733       ; store word
sw   $$locbase $r0 i734       ; store word
movi $r7 i5880                ; get offset to local
add  $r7 $$locbase $r7        ; get offset to local
sw   $$locbase $r3 i735       ; store word
sw   $$locbase $r1 i736       ; store word
addi $r9 $$locbase i2896      ; get offset to local
move $$arg0 $r6               ; [call]: pass argument 0
move $$arg1 $r7               ; [call]: pass argument 1
move $$arg2 $r9               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i5103              ; [call]: call divide_146
move $r6 $$retv               ; [call]: copy the return value
lw   $r7 $r6 i0               ; load word
lw   $r6 $r6 i1               ; load word
movi $r9 i5784                ; get offset to local
add  $r9 $$locbase $r9        ; get offset to local
sw   $$locbase $r7 i723       ; store word
sw   $$locbase $r6 i724       ; store word
movi $r11 i5800               ; get offset to local
add  $r11 $$locbase $r11      ; get offset to local
sw   $$locbase $r3 i725       ; store word
sw   $$locbase $r1 i726       ; store word
addi $r1 $$locbase i2832      ; get offset to local
move $$arg0 $r9               ; [call]: pass argument 0
move $$arg1 $r11              ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i5197              ; [call]: call multiply_138
move $r1 $$retv               ; [call]: copy the return value
lw   $r3 $r1 i0               ; load word
lw   $r1 $r1 i1               ; load word
movi $r9 i5896                ; get offset to local
add  $r9 $$locbase $r9        ; get offset to local
sw   $$locbase $r3 i737       ; store word
sw   $$locbase $r1 i738       ; store word
movi $r1 i5912                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
sw   $$locbase $r2 i739       ; store word
sw   $$locbase $r0 i740       ; store word
move $$arg0 $r9               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4749              ; [call]: call lt_159
move $r0 $$retv               ; [call]: copy the return value
move $r1 $one                 ; move parameter from branch to block argument
jnzf $r0 $zero i1
move $r1 $zero                ; move parameter from branch to block argument
movi $r0 i5976                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
sw   $$locbase $r7 i747       ; store word
sw   $$locbase $r6 i748       ; store word
addi $r2 $$locbase i2912      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4722              ; [call]: call as_u64_162
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i272       ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i5960                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4754              ; [call]: call unwrap_161
move $r0 $$retv               ; [call]: copy the return value
add  $r0 $r0 $r1
sw   $$locbase $r0 i1321      ; store word
movi $r0 i10040               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i10472               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
addi $r1 $r1 i96              ; get offset to aggregate element
movi $r2 i6128                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i120                 ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i6248                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r3              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4724              ; [call]: call remove_update_order_internal_168
eq   $r0 $r5 $zero
eq   $r0 $r0 $zero
jnzf $r0 $zero i1
jmpf $zero i2
eq   $r0 $r10 $zero
eq   $r0 $r0 $zero
load $r15 data_10             ; get local constant
load $r14 data_10             ; get local constant
load $r13 data_14             ; get local constant
load $r12 data_14             ; get local constant
load $r11 data_10             ; get local constant
load $r9 data_10              ; get local constant
load $r7 data_14              ; get local constant
load $r6 data_14              ; get local constant
movi $r1 i4968                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i5                   ; initialize constant into register
sw   $$locbase $r2 i621       ; store word
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i7040              ; [call]: call require_97
addi $r0 $$locbase i2392      ; get offset to local
sw   $$locbase $zero i299     ; store word
movi $r1 i10408               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
addi $r2 $r0 i8               ; get offset to aggregate element
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i10440               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i7024                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i40                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i7064                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r3              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r5               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i2190              ; [call]: call transfer_228
addi $r0 $$locbase i2432      ; get offset to local
sw   $$locbase $zero i304     ; store word
movi $r1 i9320                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
addi $r2 $r0 i8               ; get offset to aggregate element
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i9352                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r2 i7096                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i40                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i7136                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r3              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r10              ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i2214              ; [call]: call transfer_228
addi $r0 $$locbase i2704      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i6618              ; [call]: call msg_sender_address_103
move $r0 $$retv               ; [call]: copy the return value
addi $r10 $$locbase i288      ; get offset to local
movi $r1 i32                  ; get data length for memory copy
mcp  $r10 $r0 $r1             ; copy memory
movi $r0 i9880                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $r10 $r1             ; copy memory
movi $r0 i10288               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
addi $r1 $$locbase i2472      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r15 $r2             ; copy memory
sw   $$locbase $zero i313     ; store word
addi $r2 $r1 i40              ; get offset to aggregate element
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r14 $r3             ; copy memory
movi $r2 i10288               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i6536                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
movi $r5 i72                  ; get data length for memory copy
mcp  $r3 $r1 $r5              ; copy memory
movi $r1 i6608                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r1 $r2 $r5              ; copy memory
addi $r2 $$locbase i3128      ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i3181              ; [call]: call get_182
move $r1 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i320       ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i8656                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r1 $r2 $r3              ; copy memory
movi $r2 i4384                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i7842              ; [call]: call try_read_52
move $r1 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i392       ; get offset to local
movi $r3 i128                 ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i8840                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
movi $r0 i8872                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i128                 ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
addi $r2 $$locbase i3632      ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i485               ; [call]: call match_orders_314
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i520       ; get offset to local
movi $r2 i248                 ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i9384                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i248                 ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r0 $$locbase i2544      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r13 $r2             ; copy memory
sw   $$locbase $zero i322     ; store word
addi $r2 $r0 i40              ; get offset to aggregate element
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r12 $r3             ; copy memory
movi $r2 i10288               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i6640                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
movi $r5 i72                  ; get data length for memory copy
mcp  $r3 $r0 $r5              ; copy memory
movi $r0 i6712                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r0 $r2 $r5              ; copy memory
addi $r2 $$locbase i3200      ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i3250              ; [call]: call get_182
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i896       ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i7168                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
movi $r2 i7240                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i248                 ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1819              ; [call]: call push_244
movi $r0 i7808                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i248                 ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1597              ; [call]: call log_253
movi $r0 i10040               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
addi $r1 $$locbase i2000      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r11 $r2             ; copy memory
sw   $$locbase $zero i254     ; store word
addi $r2 $r1 i40              ; get offset to aggregate element
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r9 $r3              ; copy memory
movi $r2 i10040               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i6744                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
movi $r5 i72                  ; get data length for memory copy
mcp  $r3 $r1 $r5              ; copy memory
movi $r1 i6816                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r1 $r2 $r5              ; copy memory
addi $r2 $$locbase i3272      ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i3304              ; [call]: call get_182
move $r1 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i968       ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i9160                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r1 $r2 $r3              ; copy memory
movi $r2 i4512                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i7965              ; [call]: call try_read_52
move $r1 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i1040      ; get offset to local
movi $r3 i128                 ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
movi $r1 i9000                ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
movi $r0 i9032                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i128                 ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
addi $r2 $$locbase i3880      ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i362               ; [call]: call match_orders_314
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i1168      ; get offset to local
movi $r2 i248                 ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i9632                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i248                 ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r0 $$locbase i2072      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r7 $r2              ; copy memory
sw   $$locbase $zero i263     ; store word
addi $r2 $r0 i40              ; get offset to aggregate element
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r6 $r3              ; copy memory
movi $r2 i10040               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i6848                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
movi $r5 i72                  ; get data length for memory copy
mcp  $r3 $r0 $r5              ; copy memory
movi $r0 i6920                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r0 $r2 $r5              ; copy memory
addi $r2 $$locbase i3344      ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i3373              ; [call]: call get_182
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i1416      ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
movi $r0 i7488                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
movi $r2 i7560                ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
movi $r3 i248                 ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1942              ; [call]: call push_244
movi $r0 i8056                ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
movi $r2 i248                 ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1720              ; [call]: call log_253
movi $r0 i10288               ; get offset to local
add  $r0 $$locbase $r0        ; get offset to local
addi $r0 $r0 i64              ; get offset to aggregate element
movi $r1 i10288               ; get offset to local
add  $r1 $$locbase $r1        ; get offset to local
addi $r1 $r1 i32              ; get offset to aggregate element
movi $r2 i10040               ; get offset to local
add  $r2 $$locbase $r2        ; get offset to local
addi $r2 $r2 i32              ; get offset to aggregate element
movi $r3 i10288               ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
addi $r3 $r3 i112             ; get offset to aggregate element
movi $r5 i10288               ; get offset to local
add  $r5 $$locbase $r5        ; get offset to local
movi $r6 i10040               ; get offset to local
add  $r6 $$locbase $r6        ; get offset to local
bhei $r7                      ; bhei height
time $r7 $r7                  ; time timestamp height
move $r9 $zero                ; copy ASM block argument's constant initial value to register
addi $r11 $$locbase i3416     ; get offset to local
move $$arg0 $r9               ; [call]: pass argument 0
move $$arg1 $r11              ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i3015              ; [call]: call read_203
move $r9 $$retv               ; [call]: copy the return value
addi $r11 $$locbase i1488     ; get offset to local
movi $r12 i32                 ; get data length for memory copy
mcp  $r11 $r9 $r12            ; copy memory
addi $r12 $$locbase i2144     ; get offset to local
movi $r9 i32                  ; get data length for memory copy
mcp  $r12 $r0 $r9             ; copy memory
addi $r0 $r12 i32             ; get offset to aggregate element
movi $r9 i32                  ; get data length for memory copy
mcp  $r0 $r10 $r9             ; copy memory
addi $r0 $r12 i64             ; get offset to aggregate element
movi $r9 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r9              ; copy memory
addi $r0 $r12 i96             ; get offset to aggregate element
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $r2 $r1              ; copy memory
sw   $$locbase $r4 i284       ; store word
addi $r0 $r12 i136            ; get offset to aggregate element
movi $r1 i8                   ; get data length for memory copy
mcp  $r0 $r3 $r1              ; copy memory
addi $r0 $r12 i144            ; get offset to aggregate element
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $r5 $r1              ; copy memory
addi $r0 $r12 i176            ; get offset to aggregate element
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $r6 $r1              ; copy memory
sw   $$locbase $r7 i294       ; store word
addi $r0 $r12 i216            ; get offset to aggregate element
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $r11 $r1             ; copy memory
addi $r0 $$locbase i2928      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i8197              ; [call]: call new_39
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
movi $r3 i8544                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $r12 $r4             ; copy memory
movi $r4 i8576                ; get offset to local
add  $r4 $$locbase $r4        ; get offset to local
sw   $$locbase $r1 i1072      ; store word
sw   $$locbase $r2 i1073      ; store word
sw   $$locbase $r0 i1074      ; store word
addi $r0 $$locbase i3536      ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1442              ; [call]: call abi_encode_258
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
addi $r3 $r12 i32             ; get offset to aggregate element
movi $r4 i8600                ; get offset to local
add  $r4 $$locbase $r4        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r3 $r5              ; copy memory
movi $r3 i8632                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
sw   $$locbase $r1 i1079      ; store word
sw   $$locbase $r2 i1080      ; store word
sw   $$locbase $r0 i1081      ; store word
addi $r0 $$locbase i3560      ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1464              ; [call]: call abi_encode_258
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
addi $r3 $r12 i64             ; get offset to aggregate element
movi $r4 i8728                ; get offset to local
add  $r4 $$locbase $r4        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r3 $r5              ; copy memory
movi $r3 i8760                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
sw   $$locbase $r1 i1095      ; store word
sw   $$locbase $r2 i1096      ; store word
sw   $$locbase $r0 i1097      ; store word
addi $r0 $$locbase i3584      ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1486              ; [call]: call abi_encode_258
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
addi $r3 $r12 i96             ; get offset to aggregate element
movi $r4 i8784                ; get offset to local
add  $r4 $$locbase $r4        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r3 $r5              ; copy memory
movi $r3 i8816                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
sw   $$locbase $r1 i1102      ; store word
sw   $$locbase $r2 i1103      ; store word
sw   $$locbase $r0 i1104      ; store word
addi $r0 $$locbase i3608      ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1508              ; [call]: call abi_encode_258
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
lw   $r3 $r12 i16             ; load word
movi $r4 i4880                ; get offset to local
add  $r4 $$locbase $r4        ; get offset to local
sw   $$locbase $r1 i610       ; store word
sw   $$locbase $r2 i611       ; store word
sw   $$locbase $r0 i612       ; store word
addi $r0 $$locbase i2632      ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i8351              ; [call]: call abi_encode_38
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
lw   $r3 $r12 i17             ; load word
movi $r4 i4904                ; get offset to local
add  $r4 $$locbase $r4        ; get offset to local
sw   $$locbase $r1 i613       ; store word
sw   $$locbase $r2 i614       ; store word
sw   $$locbase $r0 i615       ; store word
addi $r0 $$locbase i2656      ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i8369              ; [call]: call abi_encode_38
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
addi $r3 $r12 i144            ; get offset to aggregate element
movi $r4 i8376                ; get offset to local
add  $r4 $$locbase $r4        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r3 $r5              ; copy memory
movi $r3 i8408                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
sw   $$locbase $r1 i1051      ; store word
sw   $$locbase $r2 i1052      ; store word
sw   $$locbase $r0 i1053      ; store word
addi $r0 $$locbase i3448      ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1622              ; [call]: call abi_encode_256
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
addi $r3 $r12 i176            ; get offset to aggregate element
movi $r4 i8432                ; get offset to local
add  $r4 $$locbase $r4        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r3 $r5              ; copy memory
movi $r3 i8464                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
sw   $$locbase $r1 i1058      ; store word
sw   $$locbase $r2 i1059      ; store word
sw   $$locbase $r0 i1060      ; store word
addi $r0 $$locbase i3488      ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1644              ; [call]: call abi_encode_256
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
lw   $r3 $r12 i26             ; load word
movi $r4 i4928                ; get offset to local
add  $r4 $$locbase $r4        ; get offset to local
sw   $$locbase $r1 i616       ; store word
sw   $$locbase $r2 i617       ; store word
sw   $$locbase $r0 i618       ; store word
addi $r0 $$locbase i2680      ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i8431              ; [call]: call abi_encode_38
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
addi $r3 $r12 i216            ; get offset to aggregate element
movi $r4 i8488                ; get offset to local
add  $r4 $$locbase $r4        ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r3 $r5              ; copy memory
movi $r3 i8520                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
sw   $$locbase $r1 i1065      ; store word
sw   $$locbase $r2 i1066      ; store word
sw   $$locbase $r0 i1067      ; store word
addi $r0 $$locbase i3512      ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i1684              ; [call]: call abi_encode_256
move $r0 $$retv               ; [call]: copy the return value
lw   $r1 $r0 i0               ; load word
lw   $r2 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
movi $r3 i5744                ; get offset to local
add  $r3 $$locbase $r3        ; get offset to local
sw   $$locbase $r1 i718       ; store word
sw   $$locbase $r2 i719       ; store word
sw   $$locbase $r0 i720       ; store word
addi $r0 $$locbase i3472      ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i8393              ; [call]: call as_raw_slice_40
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i1640      ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i2616      ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
load $r0 data_31              ; load constant from data section
lw   $r1 $$locbase i327       ; load slice pointer for logging data
lw   $r2 $$locbase i328       ; load slice size for logging data
logd $zero $r0 $r1 $r2        ; log slice
move $$retv $zero             ; set return value
cfsi i10592                   ; free 10592 bytes for locals and 0 slots for extra call arguments
move $$reta $r8               ; restore return address
poph i524288                  ; restore registers 40..64
popl i65535                   ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i511                     ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function match_orders_314
cfei i536                     ; allocate 536 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (id)
move $r1 $$arg1               ; save argument 1 (order)
move $r2 $$arg2               ; save argument 2 (__ret_value)
move $r3 $$reta               ; save return address
addi $r4 $$locbase i408       ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i7117              ; [call]: call msg_sender_105
move $r4 $$retv               ; [call]: copy the return value
movi $r5 i48                  ; get data length for memory copy
mcp  $$locbase $r4 $r5        ; copy memory
addi $r4 $$locbase i488       ; get offset to local
movi $r5 i48                  ; get data length for memory copy
mcp  $r4 $$locbase $r5        ; copy memory
addi $r5 $$locbase i368       ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r5               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i7152              ; [call]: call unwrap_104
move $r4 $$retv               ; [call]: copy the return value
addi $r5 $$locbase i48        ; get offset to local
movi $r6 i40                  ; get data length for memory copy
mcp  $r5 $r4 $r6              ; copy memory
bhei $r4                      ; bhei height
time $r4 $r4                  ; time timestamp height
move $r6 $zero                ; copy ASM block argument's constant initial value to register
addi $r7 $$locbase i456       ; get offset to local
move $$arg0 $r6               ; [call]: pass argument 0
move $$arg1 $r7               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i3332              ; [call]: call read_203
move $r6 $$retv               ; [call]: copy the return value
addi $r7 $$locbase i88        ; get offset to local
movi $r8 i32                  ; get data length for memory copy
mcp  $r7 $r6 $r8              ; copy memory
addi $r6 $$locbase i120       ; get offset to local
movi $r8 i32                  ; get data length for memory copy
mcp  $r6 $r0 $r8              ; copy memory
addi $r0 $r6 i32              ; get offset to aggregate element
movi $r8 i40                  ; get data length for memory copy
mcp  $r0 $r5 $r8              ; copy memory
sw   $$locbase $r4 i24        ; store word
movi $r0 i2                   ; initialize constant into register
sw   $$locbase $r0 i25        ; store word
addi $r0 $r6 i88              ; get offset to aggregate element
movi $r4 i32                  ; get data length for memory copy
mcp  $r0 $r7 $r4              ; copy memory
addi $r0 $r6 i120             ; get offset to aggregate element
movi $r4 i128                 ; get data length for memory copy
mcp  $r0 $r1 $r4              ; copy memory
movi $r0 i248                 ; get data length for memory copy
mcp  $r2 $r6 $r0              ; copy memory
move $$retv $r2               ; set return value
cfsi i536                     ; free 536 bytes for locals and 0 slots for extra call arguments
move $$reta $r3               ; restore return address
poph i524288                  ; restore registers 40..64
popl i511                     ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i4095                    ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function abi_decode_320
cfei i160                     ; allocate 160 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (buffer)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i8870              ; [call]: call read_8_bytes_21
move $r3 $$retv               ; [call]: copy the return value
movi $r4 i32                  ; initialize constant into register
mul  $r4 $r4 $r3
aloc $r4                      ; aloc size
move $r4 $hp                  ; move ptr hp
move $r11 $zero               ; move parameter from branch to block argument
move $r10 $zero               ; move parameter from branch to block argument
move $r5 $r3                  ; move parameter from branch to block argument
lt   $r6 $r11 $r3
jnzf $r6 $zero i5
sw   $r1 $r4 i0               ; store word
sw   $r1 $r5 i1               ; store word
sw   $r1 $r10 i2              ; store word
move $$retv $r1               ; set return value
jmpf $zero i75
addi $r6 $$locbase i32        ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r6               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i8928              ; [call]: call abi_decode_13
move $r6 $$retv               ; [call]: copy the return value
movi $r7 i32                  ; get data length for memory copy
mcp  $$locbase $r6 $r7        ; copy memory
addi $r6 $$locbase i128       ; get offset to local
movi $r7 i32                  ; get data length for memory copy
mcp  $r6 $$locbase $r7        ; copy memory
addi $r6 $$locbase i128       ; get offset to local
addi $r7 $$locbase i112       ; get offset to local
sw   $$locbase $r4 i14        ; store word
sw   $$locbase $r5 i15        ; store word
move $$arg0 $r7               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i58                ; [call]: call capacity_326
move $r7 $$retv               ; [call]: copy the return value
eq   $r7 $r10 $r7
jnzf $r7 $zero i1
jmpf $zero i25
eq   $r7 $r5 $zero
move $r8 $one                 ; move parameter from branch to block argument
jnzf $r7 $zero i2
movi $r7 i2                   ; initialize constant into register
mul  $r8 $r7 $r5
gt   $r7 $r8 $r5
move $r9 $r4                  ; move parameter from branch to block argument
jnzf $r7 $zero i1
jmpf $zero i14
movi $r7 i32                  ; initialize constant into register
mul  $r7 $r7 $r8
aloc $r7                      ; aloc size
move $r9 $hp                  ; move ptr hp
gt   $r7 $r5 $zero
jnzf $r7 $zero i1
jmpf $zero i7
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r9               ; [call]: pass argument 1
move $$arg2 $r5               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i42                ; [call]: call copy_to_329
move $r5 $r8                  ; move parameter from branch to block argument
move $r4 $r9                  ; move parameter from branch to block argument
addi $r7 $$locbase i64        ; get offset to local
sw   $$locbase $r4 i8         ; store word
sw   $$locbase $r5 i9         ; store word
move $$arg0 $r7               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i7968              ; [call]: call ptr_86
move $r7 $$retv               ; [call]: copy the return value
movi $r8 i32                  ; initialize constant into register
mul  $r8 $r8 $r10
add  $r7 $r7 $r8
addi $r8 $$locbase i80        ; get offset to local
movi $r9 i32                  ; get data length for memory copy
mcp  $r8 $r6 $r9              ; copy memory
move $$arg0 $r7               ; [call]: pass argument 0
move $$arg1 $r8               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i3166              ; [call]: call write_217
add  $r10 $r10 $one
add  $r11 $r11 $one
jmpb $zero i80
cfsi i160                     ; free 160 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i4095                    ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i3                       ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function capacity_326
cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$reta               ; save return address
lw   $r0 $r0 i1               ; load word
move $$retv $r0               ; set return value
cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments
move $$reta $r1               ; restore return address
poph i524288                  ; restore registers 40..64
popl i3                       ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i31                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function copy_to_329
cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (dst)
move $r2 $$arg2               ; save argument 2 (count)
move $r3 $$reta               ; save return address
movi $r4 i32                  ; initialize constant into register
mul  $r2 $r2 $r4
mcp  $r1 $r0 $r2              ; mcp dst src len
move $$retv $zero             ; set return value
cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments
move $$reta $r3               ; restore return address
poph i524288                  ; restore registers 40..64
popl i31                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i63                      ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function get_334
cfei i160                     ; allocate 160 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$arg1               ; save argument 1 (index)
move $r2 $$arg2               ; save argument 2 (__ret_value)
move $r3 $$reta               ; save return address
lw   $r4 $r0 i2               ; load word
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i3490              ; [call]: call le_208
move $r4 $$retv               ; [call]: copy the return value
jnzf $r4 $zero i31
addi $r4 $$locbase i144       ; get offset to local
movi $r5 i16                  ; get data length for memory copy
mcp  $r4 $r0 $r5              ; copy memory
move $$arg0 $r4               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i8040              ; [call]: call ptr_86
move $r0 $$retv               ; [call]: copy the return value
movi $r4 i32                  ; initialize constant into register
mul  $r1 $r4 $r1
add  $r0 $r0 $r1
addi $r1 $$locbase i72        ; get offset to local
sw   $$locbase $one i9        ; store word
addi $r4 $$locbase i112       ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i3530              ; [call]: call read_203
move $r0 $$retv               ; [call]: copy the return value
movi $r4 i32                  ; get data length for memory copy
mcp  $$locbase $r0 $r4        ; copy memory
addi $r0 $r1 i8               ; get offset to aggregate element
movi $r4 i32                  ; get data length for memory copy
mcp  $r0 $$locbase $r4        ; copy memory
movi $r0 i40                  ; get data length for memory copy
mcp  $r2 $r1 $r0              ; copy memory
move $$retv $r2               ; set return value
jmpf $zero i5
addi $r0 $$locbase i32        ; get offset to local
sw   $$locbase $zero i4       ; store word
movi $r1 i40                  ; get data length for memory copy
mcp  $r2 $r0 $r1              ; copy memory
move $$retv $r2               ; set return value
cfsi i160                     ; free 160 bytes for locals and 0 slots for extra call arguments
move $$reta $r3               ; restore return address
poph i524288                  ; restore registers 40..64
popl i63                      ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i7                       ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function is_none_335
cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$reta               ; save return address
lw   $r0 $r0 i0               ; load word
eq   $r0 $r0 $one
move $r2 $zero                ; move parameter from branch to block argument
jnzf $r0 $zero i1
move $r2 $one                 ; move parameter from branch to block argument
move $$retv $r2               ; set return value
cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments
move $$reta $r1               ; restore return address
poph i524288                  ; restore registers 40..64
popl i7                       ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i127                     ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function sha256_349
cfei i200                     ; allocate 200 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (s)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
addi $r3 $$locbase i32        ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i8367              ; [call]: call new_70
move $r3 $$retv               ; [call]: copy the return value
lw   $r4 $r3 i0               ; load word
lw   $r5 $r3 i1               ; load word
lw   $r3 $r3 i2               ; load word
sw   $$locbase $r4 i22        ; store word
sw   $$locbase $r5 i23        ; store word
sw   $$locbase $r3 i24        ; store word
addi $r3 $$locbase i176       ; get offset to local
addi $r4 $$locbase i112       ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r0 $r5              ; copy memory
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i3852              ; [call]: call hash_188
addi $r4 $r0 i32              ; get offset to aggregate element
addi $r5 $$locbase i144       ; get offset to local
movi $r6 i32                  ; get data length for memory copy
mcp  $r5 $r4 $r6              ; copy memory
move $$arg0 $r5               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i3862              ; [call]: call hash_188
lw   $r0 $r0 i8               ; load word
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i3434              ; [call]: call hash_214
addi $r0 $$locbase i176       ; get offset to local
addi $r3 $$locbase i88        ; get offset to local
movi $r4 i24                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
addi $r0 $$locbase i56        ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i8024              ; [call]: call sha256_93
move $r0 $$retv               ; [call]: copy the return value
movi $r3 i32                  ; get data length for memory copy
mcp  $$locbase $r0 $r3        ; copy memory
movi $r0 i32                  ; get data length for memory copy
mcp  $r1 $$locbase $r0        ; copy memory
move $$retv $r1               ; set return value
cfsi i200                     ; free 200 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i127                     ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i127                     ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function from_366
cfei i48                      ; allocate 48 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (slice)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
addi $r3 $$locbase i16        ; get offset to local
movi $r4 i16                  ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
move $$arg0 $r3               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i41                ; [call]: call len_368
move $r3 $$retv               ; [call]: copy the return value
movi $r4 i32                  ; initialize constant into register
mul  $r4 $r4 $r3
aloc $r4                      ; aloc size
move $r4 $hp                  ; move ptr hp
gt   $r5 $r3 $zero
jnzf $r5 $zero i1
jmpf $zero i15
movi $r5 i16                  ; get data length for memory copy
mcp  $$locbase $r0 $r5        ; copy memory
move $$arg0 $$locbase         ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i9147              ; [call]: call ptr_23
move $r5 $$retv               ; [call]: copy the return value
move $$arg0 $r5               ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
move $$arg2 $r3               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i193               ; [call]: call copy_to_329
addi $r5 $$locbase i32        ; get offset to local
movi $r6 i16                  ; get data length for memory copy
mcp  $r5 $r0 $r6              ; copy memory
move $$arg0 $r5               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpf $zero i10                ; [call]: call len_368
move $r0 $$retv               ; [call]: copy the return value
sw   $r1 $r4 i0               ; store word
sw   $r1 $r3 i1               ; store word
sw   $r1 $r0 i2               ; store word
move $$retv $r1               ; set return value
cfsi i48                      ; free 48 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i127                     ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i7                       ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function len_368
cfei i16                      ; allocate 16 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (self)
move $r1 $$reta               ; save return address
movi $r2 i16                  ; get data length for memory copy
mcp  $$locbase $r0 $r2        ; copy memory
move $r0 $$locbase            ; copy ASM block argument's constant initial value to register
lw   $r0 $r0 i1               ; load word
movi $r2 i32                  ; initialize constant into register
div  $r0 $r0 $r2
move $$retv $r0               ; set return value
cfsi i16                      ; free 16 bytes for locals and 0 slots for extra call arguments
move $$reta $r1               ; restore return address
poph i524288                  ; restore registers 40..64
popl i7                       ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i4095                    ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function cancel_order
cfei i4024                    ; allocate 4024 bytes for locals and 0 slots for call arguments
move $r9 $$arg0               ; save argument 0 (order_id)
move $r8 $$reta               ; save return address
load $r0 data_10              ; get local constant
load $r1 data_10              ; get local constant
load $r7 data_10              ; get local constant
load $r6 data_10              ; get local constant
load $r5 data_14              ; get local constant
load $r4 data_14              ; get local constant
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i9075              ; [call]: call reentrancy_guard_33
addi $r2 $$locbase i784       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
sw   $$locbase $zero i102     ; store word
addi $r0 $r2 i40              ; get offset to aggregate element
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r3              ; copy memory
addi $r0 $$locbase i3600      ; get offset to local
movi $r1 i72                  ; get data length for memory copy
mcp  $r0 $r2 $r1              ; copy memory
addi $r1 $$locbase i2208      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r9 $r2              ; copy memory
addi $r2 $$locbase i1824      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4162              ; [call]: call get_182
move $r0 $$retv               ; [call]: copy the return value
movi $r1 i72                  ; get data length for memory copy
mcp  $$locbase $r0 $r1        ; copy memory
addi $r0 $$locbase i2136      ; get offset to local
movi $r1 i72                  ; get data length for memory copy
mcp  $r0 $$locbase $r1        ; copy memory
addi $r1 $$locbase i1288      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i8820              ; [call]: call try_read_52
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i72        ; get offset to local
movi $r2 i128                 ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i3776      ; get offset to local
movi $r2 i128                 ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r0 $$locbase i3176      ; get offset to local
movi $r2 i128                 ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i7699              ; [call]: call is_some_101
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i3160      ; get offset to local
sw   $$locbase $one i395      ; store word
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i8147              ; [call]: call require_97
addi $r0 $$locbase i3304      ; get offset to local
movi $r2 i128                 ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r1 $$locbase i1544      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i7703              ; [call]: call unwrap_102
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i200       ; get offset to local
movi $r2 i120                 ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i3904      ; get offset to local
movi $r2 i120                 ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r0 $$locbase i1664      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i7694              ; [call]: call msg_sender_address_103
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i320       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
addi $r0 $$locbase i3744      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
addi $r0 $$locbase i2072      ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
addi $r3 $$locbase i2104      ; get offset to local
addi $r10 $$locbase i200      ; get offset to local
addi $r10 $r10 i32            ; get offset to aggregate element
movi $r11 i32                 ; get data length for memory copy
mcp  $r3 $r10 $r11            ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i8907              ; [call]: call eq_50
move $r0 $$retv               ; [call]: copy the return value
addi $r3 $$locbase i3168      ; get offset to local
sw   $$locbase $zero i396     ; store word
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i8200              ; [call]: call require_97
addi $r0 $$locbase i3480      ; get offset to local
movi $r3 i120                 ; get data length for memory copy
mcp  $r0 $r1 $r3              ; copy memory
addi $r1 $$locbase i1784      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i7086              ; [call]: call cancel_order_internal_121
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i352       ; get offset to local
movi $r3 i40                  ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
addi $r0 $$locbase i3672      ; get offset to local
movi $r3 i40                  ; get data length for memory copy
mcp  $r0 $r1 $r3              ; copy memory
addi $r0 $$locbase i3712      ; get offset to local
addi $r1 $$locbase i352       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r3              ; copy memory
lw   $r0 $$locbase i48        ; load word
addi $r3 $$locbase i1104      ; get offset to local
sw   $$locbase $zero i138     ; store word
addi $r10 $r3 i8              ; get offset to aggregate element
movi $r11 i32                 ; get data length for memory copy
mcp  $r10 $r2 $r11            ; copy memory
addi $r2 $$locbase i2448      ; get offset to local
movi $r10 i40                 ; get data length for memory copy
mcp  $r2 $r3 $r10             ; copy memory
addi $r3 $$locbase i2488      ; get offset to local
movi $r10 i32                 ; get data length for memory copy
mcp  $r3 $r1 $r10             ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i3366              ; [call]: call transfer_228
addi $r0 $$locbase i1144      ; get offset to local
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $r7 $r1              ; copy memory
sw   $$locbase $zero i147     ; store word
addi $r1 $r0 i40              ; get offset to aggregate element
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r6 $r2              ; copy memory
addi $r1 $$locbase i2240      ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i2312      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r9 $r2              ; copy memory
addi $r2 $$locbase i1896      ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4313              ; [call]: call get_182
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i392       ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i3088      ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r1 $$locbase i1416      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i8972              ; [call]: call try_read_52
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i584       ; get offset to local
movi $r2 i128                 ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i1736      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i7738              ; [call]: call msg_sender_105
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i464       ; get offset to local
movi $r3 i48                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
addi $r0 $$locbase i3432      ; get offset to local
movi $r3 i48                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
addi $r2 $$locbase i1696      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i7774              ; [call]: call unwrap_104
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i512       ; get offset to local
movi $r3 i40                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
bhei $r0                      ; bhei height
time $r0 $r0                  ; time timestamp height
move $r3 $zero                ; copy ASM block argument's constant initial value to register
addi $r6 $$locbase i2040      ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r6               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i3954              ; [call]: call read_203
move $r3 $$retv               ; [call]: copy the return value
addi $r6 $$locbase i552       ; get offset to local
movi $r7 i32                  ; get data length for memory copy
mcp  $r6 $r3 $r7              ; copy memory
addi $r3 $$locbase i856       ; get offset to local
movi $r7 i32                  ; get data length for memory copy
mcp  $r3 $r9 $r7              ; copy memory
addi $r7 $r3 i32              ; get offset to aggregate element
movi $r10 i40                 ; get data length for memory copy
mcp  $r7 $r2 $r10             ; copy memory
sw   $$locbase $r0 i116       ; store word
sw   $$locbase $one i117      ; store word
addi $r0 $r3 i88              ; get offset to aggregate element
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r6 $r2              ; copy memory
addi $r0 $r3 i120             ; get offset to aggregate element
movi $r2 i128                 ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r0 $$locbase i1216      ; get offset to local
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $r5 $r1              ; copy memory
sw   $$locbase $zero i156     ; store word
addi $r1 $r0 i40              ; get offset to aggregate element
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r4 $r2              ; copy memory
addi $r1 $$locbase i2344      ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i2416      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r9 $r2              ; copy memory
addi $r2 $$locbase i1968      ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4404              ; [call]: call get_182
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i712       ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i856       ; get offset to local
addi $r2 $$locbase i2520      ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r2 $r1 $r3              ; copy memory
addi $r1 $$locbase i2592      ; get offset to local
movi $r3 i248                 ; get data length for memory copy
mcp  $r1 $r0 $r3              ; copy memory
move $$arg0 $r2               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i2972              ; [call]: call push_244
addi $r0 $$locbase i856       ; get offset to local
addi $r1 $$locbase i2840      ; get offset to local
movi $r2 i248                 ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
move $$arg0 $r1               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i2750              ; [call]: call log_253
move $$retv $zero             ; set return value
cfsi i4024                    ; free 4024 bytes for locals and 0 slots for extra call arguments
move $$reta $r8               ; restore return address
poph i524288                  ; restore registers 40..64
popl i4095                    ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i127                     ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function get_market_by_id
cfei i856                     ; allocate 856 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (asset_id)
move $r6 $$arg1               ; save argument 1 (__ret_value)
move $r5 $$reta               ; save return address
load $r1 data_6               ; get local constant
load $r2 data_6               ; get local constant
addi $r3 $$locbase i264       ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $r1 $r4              ; copy memory
sw   $$locbase $zero i37      ; store word
addi $r1 $r3 i40              ; get offset to aggregate element
movi $r4 i32                  ; get data length for memory copy
mcp  $r1 $r2 $r4              ; copy memory
addi $r1 $$locbase i752       ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r3 $r2              ; copy memory
addi $r2 $$locbase i824       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
addi $r0 $$locbase i456       ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i6891              ; [call]: call get_130
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i72        ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r2 i72                  ; get data length for memory copy
mcp  $$locbase $r0 $r2        ; copy memory
addi $r0 $$locbase i680       ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r0 $$locbase $r2        ; copy memory
addi $r2 $$locbase i424       ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i6920              ; [call]: call slot_128
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i144       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
addi $r0 $$locbase i528       ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r0 $r1 $r3              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i8937              ; [call]: call offset_67
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i648       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r1 $r2 $r3              ; copy memory
addi $r2 $$locbase i376       ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i7103              ; [call]: call read_125
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i176       ; get offset to local
movi $r2 i48                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i600       ; get offset to local
movi $r2 i48                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r1 $$locbase i336       ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i7139              ; [call]: call unwrap_123
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i224       ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r0 i40                  ; get data length for memory copy
mcp  $r6 $r1 $r0              ; copy memory
move $$retv $r6               ; set return value
cfsi i856                     ; free 856 bytes for locals and 0 slots for extra call arguments
move $$reta $r5               ; restore return address
poph i524288                  ; restore registers 40..64
popl i127                     ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i255                     ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function get_order_change_events_by_order
cfei i944                     ; allocate 944 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (order)
move $r6 $$arg1               ; save argument 1 (__ret_value)
move $r5 $$reta               ; save return address
load $r1 data_14              ; get local constant
load $r2 data_14              ; get local constant
addi $r3 $$locbase i272       ; get offset to local
movi $r4 i32                  ; get data length for memory copy
mcp  $r3 $r1 $r4              ; copy memory
sw   $$locbase $zero i38      ; store word
addi $r1 $r3 i40              ; get offset to aggregate element
movi $r4 i32                  ; get data length for memory copy
mcp  $r1 $r2 $r4              ; copy memory
addi $r1 $$locbase i600       ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r3 $r2              ; copy memory
addi $r2 $$locbase i672       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
addi $r0 $$locbase i376       ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4566              ; [call]: call get_182
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i120       ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
movi $r2 i72                  ; get data length for memory copy
mcp  $$locbase $r0 $r2        ; copy memory
addi $r0 $$locbase i752       ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r0 $$locbase $r2        ; copy memory
addi $r2 $$locbase i480       ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i2916              ; [call]: call field_id_251
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i72        ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
addi $r0 $$locbase i568       ; get offset to local
movi $r3 i32                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
addi $r2 $$locbase i360       ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $zero             ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4749              ; [call]: call read_178
move $r0 $$retv               ; [call]: copy the return value
addi $r2 $$locbase i104       ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r2 $r0 $r3              ; copy memory
addi $r0 $$locbase i704       ; get offset to local
movi $r3 i16                  ; get data length for memory copy
mcp  $r0 $r2 $r3              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $zero             ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4412              ; [call]: call unwrap_or_194
move $r0 $$retv               ; [call]: copy the return value
eq   $r2 $r0 $zero
jnzf $r2 $zero i63
movi $r2 i248                 ; initialize constant into register
mul  $r0 $r0 $r2
movi $r2 i31                  ; initialize constant into register
add  $r2 $r0 $r2
movi $r3 i5                   ; initialize constant into register
srl  $r2 $r2 $r3
movi $r3 i32                  ; initialize constant into register
mul  $r3 $r2 $r3
aloc $r3                      ; aloc size
move $r3 $hp                  ; return value from ASM block with return register hp
addi $r4 $$locbase i824       ; get offset to local
movi $r7 i72                  ; get data length for memory copy
mcp  $r4 $r1 $r7              ; copy memory
addi $r1 $$locbase i512       ; get offset to local
move $$arg0 $r4               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i2967              ; [call]: call field_id_251
move $r1 $$retv               ; [call]: copy the return value
addi $r4 $$locbase i192       ; get offset to local
movi $r7 i32                  ; get data length for memory copy
mcp  $r4 $r1 $r7              ; copy memory
addi $r1 $$locbase i720       ; get offset to local
movi $r7 i32                  ; get data length for memory copy
mcp  $r1 $r4 $r7              ; copy memory
addi $r4 $$locbase i448       ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4205              ; [call]: call sha256_209
move $r1 $$retv               ; [call]: copy the return value
addi $r4 $$locbase i224       ; get offset to local
movi $r7 i32                  ; get data length for memory copy
mcp  $r4 $r1 $r7              ; copy memory
addi $r1 $$locbase i912       ; get offset to local
movi $r7 i32                  ; get data length for memory copy
mcp  $r1 $r4 $r7              ; copy memory
srwq $r3 $r1 $r1 $r2          ; read sequence of storage slots
addi $r1 $$locbase i344       ; get offset to local
sw   $$locbase $r3 i43        ; store word
sw   $$locbase $r0 i44        ; store word
addi $r0 $$locbase i256       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r1 $$locbase i896       ; get offset to local
movi $r2 i16                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i544       ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i2260              ; [call]: call from_295
move $r0 $$retv               ; [call]: copy the return value
lw   $r2 $r0 i0               ; load word
lw   $r1 $r0 i1               ; load word
lw   $r0 $r0 i2               ; load word
jmpf $zero i5
move $r0 $zero                ; copy ASM block argument's constant initial value to register
aloc $r0                      ; aloc size
move $r2 $hp                  ; move ptr hp
move $r0 $zero                ; move parameter from branch to block argument
move $r1 $zero                ; move parameter from branch to block argument
sw   $r6 $r2 i0               ; store word
sw   $r6 $r1 i1               ; store word
sw   $r6 $r0 i2               ; store word
move $$retv $r6               ; set return value
cfsi i944                     ; free 944 bytes for locals and 0 slots for extra call arguments
move $$reta $r5               ; restore return address
poph i524288                  ; restore registers 40..64
popl i255                     ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i16383                   ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function match_orders_many
cfei i2152                    ; allocate 2152 bytes for locals and 0 slots for call arguments
move $r5 $$arg0               ; save argument 0 (order_sell_ids)
move $r4 $$arg1               ; save argument 1 (order_buy_ids)
move $r3 $$reta               ; save return address
addi $r0 $$locbase i1376      ; get offset to local
movi $r1 i24                  ; get data length for memory copy
mcp  $r0 $r5 $r1              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i8849              ; [call]: call len_78
move $r6 $$retv               ; [call]: copy the return value
addi $r0 $$locbase i1768      ; get offset to local
movi $r1 i24                  ; get data length for memory copy
mcp  $r0 $r4 $r1              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i8858              ; [call]: call len_78
move $r8 $$retv               ; [call]: copy the return value
gt   $r0 $r6 $zero
jnzf $r0 $zero i1
jmpf $zero i1
gt   $r0 $r8 $zero
addi $r1 $$locbase i1792      ; get offset to local
movi $r2 i3                   ; initialize constant into register
sw   $$locbase $r2 i224       ; store word
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i8676              ; [call]: call require_97
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i9666              ; [call]: call reentrancy_guard_33
move $r7 $zero                ; move parameter from branch to block argument
move $r9 $zero                ; move parameter from branch to block argument
load $r11 data_10             ; get local constant
load $r10 data_10             ; get local constant
addi $r0 $$locbase i1464      ; get offset to local
movi $r1 i24                  ; get data length for memory copy
mcp  $r0 $r5 $r1              ; copy memory
addi $r1 $$locbase i1152      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r9               ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i844               ; [call]: call get_334
move $r0 $$retv               ; [call]: copy the return value
movi $r1 i40                  ; get data length for memory copy
mcp  $$locbase $r0 $r1        ; copy memory
addi $r0 $$locbase i2008      ; get offset to local
movi $r1 i40                  ; get data length for memory copy
mcp  $r0 $$locbase $r1        ; copy memory
addi $r1 $$locbase i1088      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4540              ; [call]: call unwrap_200
move $r0 $$retv               ; [call]: copy the return value
addi $r13 $$locbase i40       ; get offset to local
movi $r1 i32                  ; get data length for memory copy
mcp  $r13 $r0 $r1             ; copy memory
addi $r0 $$locbase i2120      ; get offset to local
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $r13 $r1             ; copy memory
addi $r0 $$locbase i1488      ; get offset to local
movi $r1 i24                  ; get data length for memory copy
mcp  $r0 $r4 $r1              ; copy memory
addi $r1 $$locbase i1192      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r7               ; [call]: pass argument 1
move $$arg2 $r1               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i875               ; [call]: call get_334
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i72        ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i2048      ; get offset to local
movi $r2 i40                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r1 $$locbase i1120      ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4572              ; [call]: call unwrap_200
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i112       ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i2088      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r0 $$locbase i1400      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r13 $r2             ; copy memory
addi $r2 $$locbase i1432      ; get offset to local
movi $r12 i32                 ; get data length for memory copy
mcp  $r2 $r1 $r12             ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i2332              ; [call]: call match_orders_311
addi $r0 $$locbase i544       ; get offset to local
movi $r1 i32                  ; get data length for memory copy
mcp  $r0 $r11 $r1             ; copy memory
sw   $$locbase $zero i72      ; store word
addi $r1 $r0 i40              ; get offset to aggregate element
movi $r2 i32                  ; get data length for memory copy
mcp  $r1 $r10 $r2             ; copy memory
addi $r1 $$locbase i1800      ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i1872      ; get offset to local
movi $r2 i32                  ; get data length for memory copy
mcp  $r0 $r13 $r2             ; copy memory
addi $r2 $$locbase i944       ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r0               ; [call]: pass argument 1
move $$arg2 $r2               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4834              ; [call]: call get_182
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i144       ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i1232      ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r1 $$locbase i688       ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i9493              ; [call]: call try_read_52
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i216       ; get offset to local
movi $r2 i128                 ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i1512      ; get offset to local
movi $r2 i128                 ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i897               ; [call]: call is_none_335
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i3
add  $r9 $r9 $one
eq   $r0 $r9 $r6
jnzf $r0 $zero i59
load $r0 data_10              ; get local constant
load $r1 data_10              ; get local constant
addi $r2 $$locbase i616       ; get offset to local
movi $r10 i32                 ; get data length for memory copy
mcp  $r2 $r0 $r10             ; copy memory
sw   $$locbase $zero i81      ; store word
addi $r0 $r2 i40              ; get offset to aggregate element
movi $r10 i32                 ; get data length for memory copy
mcp  $r0 $r1 $r10             ; copy memory
addi $r0 $$locbase i2088      ; get offset to local
addi $r1 $$locbase i1904      ; get offset to local
movi $r10 i72                 ; get data length for memory copy
mcp  $r1 $r2 $r10             ; copy memory
addi $r2 $$locbase i1976      ; get offset to local
movi $r10 i32                 ; get data length for memory copy
mcp  $r2 $r0 $r10             ; copy memory
addi $r0 $$locbase i1016      ; get offset to local
move $$arg0 $r1               ; [call]: pass argument 0
move $$arg1 $r2               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4892              ; [call]: call get_182
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i344       ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i1304      ; get offset to local
movi $r2 i72                  ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
addi $r1 $$locbase i816       ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r1               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i9551              ; [call]: call try_read_52
move $r0 $$retv               ; [call]: copy the return value
addi $r1 $$locbase i416       ; get offset to local
movi $r2 i128                 ; get data length for memory copy
mcp  $r1 $r0 $r2              ; copy memory
addi $r0 $$locbase i1640      ; get offset to local
movi $r2 i128                 ; get data length for memory copy
mcp  $r0 $r1 $r2              ; copy memory
move $$arg0 $r0               ; [call]: pass argument 0
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i955               ; [call]: call is_none_335
move $r0 $$retv               ; [call]: copy the return value
jnzf $r0 $zero i1
jmpf $zero i3
add  $r7 $r7 $one
eq   $r0 $r7 $r8
jnzf $r0 $zero i1
jmpb $zero i189
move $$retv $zero             ; set return value
cfsi i2152                    ; free 2152 bytes for locals and 0 slots for extra call arguments
move $$reta $r3               ; restore return address
poph i524288                  ; restore registers 40..64
popl i16383                   ; restore registers 16..40
jmp $$reta                    ; return from call
pshl i127                     ; save registers 16..40
pshh i524288                  ; save registers 40..64
move $$locbase $sp            ; save locals base register for function order_by_id
cfei i648                     ; allocate 648 bytes for locals and 0 slots for call arguments
move $r0 $$arg0               ; save argument 0 (order)
move $r1 $$arg1               ; save argument 1 (__ret_value)
move $r2 $$reta               ; save return address
load $r3 data_10              ; get local constant
load $r4 data_10              ; get local constant
addi $r5 $$locbase i200       ; get offset to local
movi $r6 i32                  ; get data length for memory copy
mcp  $r5 $r3 $r6              ; copy memory
sw   $$locbase $zero i29      ; store word
addi $r3 $r5 i40              ; get offset to aggregate element
movi $r6 i32                  ; get data length for memory copy
mcp  $r3 $r4 $r6              ; copy memory
addi $r3 $$locbase i544       ; get offset to local
movi $r4 i72                  ; get data length for memory copy
mcp  $r3 $r5 $r4              ; copy memory
addi $r4 $$locbase i616       ; get offset to local
movi $r5 i32                  ; get data length for memory copy
mcp  $r4 $r0 $r5              ; copy memory
addi $r0 $$locbase i400       ; get offset to local
move $$arg0 $r3               ; [call]: pass argument 0
move $$arg1 $r4               ; [call]: pass argument 1
move $$arg2 $r0               ; [call]: pass argument 2
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i4963              ; [call]: call get_182
move $r0 $$retv               ; [call]: copy the return value
movi $r3 i72                  ; get data length for memory copy
mcp  $$locbase $r0 $r3        ; copy memory
addi $r0 $$locbase i472       ; get offset to local
movi $r3 i72                  ; get data length for memory copy
mcp  $r0 $$locbase $r3        ; copy memory
addi $r3 $$locbase i272       ; get offset to local
move $$arg0 $r0               ; [call]: pass argument 0
move $$arg1 $r3               ; [call]: pass argument 1
sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
addi $$reta $$reta i4         ; [call]: set new return address
jmpb $zero i9621              ; [call]: call try_read_52
move $r0 $$retv               ; [call]: copy the return value
addi $r3 $$locbase i72        ; get offset to local
movi $r4 i128                 ; get data length for memory copy
mcp  $r3 $r0 $r4              ; copy memory
movi $r0 i128                 ; get data length for memory copy
mcp  $r1 $r3 $r0              ; copy memory
move $$retv $r1               ; set return value
cfsi i648                     ; free 648 bytes for locals and 0 slots for extra call arguments
move $$reta $r2               ; restore return address
poph i524288                  ; restore registers 40..64
popl i127                     ; restore registers 16..40
jmp $$reta                    ; return from call
.data:
data_0 .bytes[4] 00 00 00 09  ....
data_1 .bytes[32] 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................
data_2 .bytes[4] 00 00 00 09  ....
data_3 .word 4294967295
data_4 .bytes[12] 63 61 6e 63 65 6c 5f 6f 72 64 65 72  cancel_order
data_5 .bytes[13] 63 72 65 61 74 65 5f 6d 61 72 6b 65 74  create_market
data_6 .bytes[32] ad 2f 32 0b 9f 3c f0 bd de 58 c7 df 14 45 72 88 06 ab 77 6c e0 ed 77 53 50 99 99 ea 5c 45 a7 4f  ./2..<...X...Er...wl..wSP...\E.O
data_7 .bytes[12] 6d 61 74 63 68 5f 6f 72 64 65 72 73  match_orders
data_8 .bytes[17] 6d 61 74 63 68 5f 6f 72 64 65 72 73 5f 6d 61 6e 79  match_orders_many
data_9 .bytes[10] 6f 70 65 6e 5f 6f 72 64 65 72  open_order
data_10 .bytes[32] a2 4f a5 aa e3 19 77 e9 7e 8b d7 99 a1 a2 8e c9 7f 5f b7 d3 55 48 19 56 82 d9 5c 7c b1 14 8f c5  .O....w.~........_..UH.V..\|....
data_11 .bytes[32] 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................
data_12 .bytes[32] fc 86 33 bb c7 b1 8e 1e f6 8b a2 bb 06 78 35 9f f3 61 43 34 32 07 06 e4 46 7b 15 2d 3e b5 19 cd  ..3..........x5..aC42...F{.->...
data_13 .bytes[32] 38 ee 99 4e c1 5c 41 2a 03 6e b0 0d f5 3c 08 55 7d 54 78 f6 d9 ec 85 9e d2 19 d3 3e 26 e5 61 fe  8..N.\A*.n...<.U}Tx........>&.a.
data_14 .bytes[32] 4e 71 90 40 5f 6e ba 12 64 be 8e f1 c2 76 84 6b cd 18 57 89 28 76 43 8e 04 3f 83 53 23 ce 47 4c  Nq.@_n..d....v.k..W.(vC..?.S#.GL
data_15 .bytes[11] 6f 72 64 65 72 5f 62 79 5f 69 64  order_by_id
data_16 .bytes[16] 6f 72 64 65 72 73 5f 62 79 5f 74 72 61 64 65 72  orders_by_trader
data_17 .bytes[17] 67 65 74 5f 63 6f 6e 66 69 67 75 72 61 62 6c 65 73  get_configurables
data_18 .bytes[16] 67 65 74 5f 6d 61 72 6b 65 74 5f 62 79 5f 69 64  get_market_by_id
data_19 .bytes[32] 67 65 74 5f 6f 72 64 65 72 5f 63 68 61 6e 67 65 5f 65 76 65 6e 74 73 5f 62 79 5f 6f 72 64 65 72  get_order_change_events_by_order
data_20 .bytes[13] 6d 61 72 6b 65 74 5f 65 78 69 73 74 73  market_exists
data_21 .word 4834916382903929744
data_22 .word 14757395258967588866
data_23 .word 5557842539076482339
data_24 .word 18446744073709486080
data_25 .word 5432468599230875534
data_26 .word 4294967296
data_27 .word 18446744073709486084
data_28 .word 18446744073709551615
data_29 .word 18446744073709486081
data_30 .word 6411998037120698508
data_31 .word 8794783797310168923
