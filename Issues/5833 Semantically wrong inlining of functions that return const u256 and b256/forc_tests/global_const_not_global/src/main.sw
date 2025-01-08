script;

struct S {
    x: u64,
}

const CONST_S_1: S = S { x: 11 };
const CONST_S_2: S = S { x: 22 };

#[test]
fn test() {
    let ptr_to_const_1 = get_const_1_address();
    let s_1 = ptr_to_const_1.read::<S>();
    assert_eq(CONST_S_1.x, s_1.x);

    let ptr_to_const_2 = get_const_2_address();
    let s_2 = ptr_to_const_2.read::<S>();
    assert_eq(CONST_S_2.x, s_2.x);

    let s_1 = ptr_to_const_1.read::<S>();
    assert_eq(CONST_S_1.x, s_1.x);
}

#[inline(never)]
fn get_const_1_address() -> raw_ptr {
    __addr_of(CONST_S_1)
}

#[inline(never)]
fn get_const_2_address() -> raw_ptr {
    __addr_of(CONST_S_2)
}

fn main() {}

// fn get_const_1_address_5() -> u64, !69 {
//     local { u64 } __const = const { u64 } { u64 11 }

//     entry():
//     v0 = get_local ptr { u64 }, __const
//     v1 = ptr_to_int v0 to u64, !70
//     ret u64 v1
// }

// fn get_const_2_address_28() -> u64, !175 {
//     local { u64 } __const = const { u64 } { u64 22 }

//     entry():
//     v0 = get_local ptr { u64 }, __const
//     v1 = ptr_to_int v0 to u64, !176
//     ret u64 v1
// }

// .program:
// move $$tmp $pc
// jmpf $zero i2
// DATA_SECTION_OFFSET[0..32]
// DATA_SECTION_OFFSET[32..64]
// lw   $$ds $$tmp i1
// add  $$ds $$ds $$tmp
// move $$locbase $sp            ; save locals base register for __entry
// cfei i56                      ; allocate 56 bytes for locals and 0 slots for call arguments.
// addi $r0 $$locbase i16        ; get offset to local
// load $r1 data_0               ; literal instantiation
// aloc $r1                      ; asm block
// move $r1 $hp                  ; return value from inline asm
// sw   $$locbase $r1 i4         ; store value
// load $r1 data_0               ; literal instantiation
// sw   $$locbase $r1 i5         ; store value
// sw   $$locbase $zero i6       ; store value
// addi $r2 $$locbase i32        ; get offset to local
// addi $r3 $r2 i16              ; get offset to element
// movi $r1 i8                   ; get length for mcp
// mcp  $$locbase $r2 $r1        ; copy memory with mem_copy
// addi $r1 $$locbase i8         ; get offset to element
// movi $r2 i8                   ; get length for mcp
// mcp  $r1 $r3 $r2              ; copy memory with mem_copy
// move $r1 $$locbase            ; copy const asm init to GP reg
// movi $r2 i16                  ; get length for mcp
// mcp  $r0 $r1 $r2              ; copy memory with mem_copy
// lw   $r1 $$locbase i3         ; load size of returned slice
// lw   $r0 $$locbase i2         ; load ptr of returned slice
// retd  $r0 $r1
// move $$locbase $sp            ; save locals base register for test
// cfei i24                      ; allocate 24 bytes for locals and 0 slots for call arguments.
// sub  $$reta $pc $is           ; Get current instruction offset from Instruction start
// srli $$reta $$reta i2         ; Current instruction offset in 32b words
// addi $$reta $$reta i4         ; set new return addr
// jmpf $zero i84                ; call get_const_1_address_5
// move $r0 $$retv               ; copy the return value
// move $$arg0 $r0               ; pass arg 0
// move $$arg1 $$locbase         ; pass arg 1
// sub  $$reta $pc $is           ; Get current instruction offset from Instruction start
// srli $$reta $$reta i2         ; Current instruction offset in 32b words
// addi $$reta $$reta i4         ; set new return addr
// jmpf $zero i88                ; call read_6
// move $r1 $$retv               ; copy the return value
// lw   $r1 $r1 i0               ; load value
// load $r2 data_1               ; literal instantiation
// eq   $r2 $r2 $r1
// eq   $r2 $r2 $zero
// jnzf $r2 $zero i58
// sub  $$reta $pc $is           ; Get current instruction offset from Instruction start
// srli $$reta $$reta i2         ; Current instruction offset in 32b words
// addi $$reta $$reta i4         ; set new return addr
// jmpf $zero i182               ; call get_const_2_address_28
// move $r1 $$retv               ; copy the return value
// addi $r2 $$locbase i8         ; get offset to local
// move $$arg0 $r1               ; pass arg 0
// move $$arg1 $r2               ; pass arg 1
// sub  $$reta $pc $is           ; Get current instruction offset from Instruction start
// srli $$reta $$reta i2         ; Current instruction offset in 32b words
// addi $$reta $$reta i4         ; set new return addr
// jmpf $zero i70                ; call read_6
// move $r1 $$retv               ; copy the return value
// lw   $r1 $r1 i0               ; load value
// load $r2 data_2               ; literal instantiation
// eq   $r2 $r2 $r1
// eq   $r2 $r2 $zero
// jnzf $r2 $zero i27
// addi $r1 $$locbase i16        ; get offset to local
// move $$arg0 $r0               ; pass arg 0
// move $$arg1 $r1               ; pass arg 1
// sub  $$reta $pc $is           ; Get current instruction offset from Instruction start
// srli $$reta $$reta i2         ; Current instruction offset in 32b words
// addi $$reta $$reta i4         ; set new return addr
// jmpf $zero i57                ; call read_6
// move $r0 $$retv               ; copy the return value
// lw   $r0 $r0 i0               ; load value
// load $r1 data_1               ; literal instantiation
// eq   $r1 $r1 $r0
// eq   $r1 $r1 $zero
// jnzf $r1 $zero i1
// ret  $zero                    ; returning unit as zero
// load $r1 data_1               ; literal instantiation
// move $$arg0 $r1               ; pass arg 0
// sub  $$reta $pc $is           ; Get current instruction offset from Instruction start
// srli $$reta $$reta i2         ; Current instruction offset in 32b words
// addi $$reta $$reta i4         ; set new return addr
// jmpf $zero i251               ; call log_54
// move $$arg0 $r0               ; pass arg 0
// sub  $$reta $pc $is           ; Get current instruction offset from Instruction start
// srli $$reta $$reta i2         ; Current instruction offset in 32b words
// addi $$reta $$reta i4         ; set new return addr
// jmpf $zero i246               ; call log_54
// load $r0 data_3               ; literal instantiation
// rvrt $r0
// load $r0 data_2               ; literal instantiation
// move $$arg0 $r0               ; pass arg 0
// sub  $$reta $pc $is           ; Get current instruction offset from Instruction start
// srli $$reta $$reta i2         ; Current instruction offset in 32b words
// addi $$reta $$reta i4         ; set new return addr
// jmpf $zero i146               ; call log_33
// move $$arg0 $r1               ; pass arg 0
// sub  $$reta $pc $is           ; Get current instruction offset from Instruction start
// srli $$reta $$reta i2         ; Current instruction offset in 32b words
// addi $$reta $$reta i4         ; set new return addr
// jmpf $zero i141               ; call log_33
// load $r0 data_3               ; literal instantiation
// rvrt $r0
// load $r0 data_1               ; literal instantiation
// move $$arg0 $r0               ; pass arg 0
// sub  $$reta $pc $is           ; Get current instruction offset from Instruction start
// srli $$reta $$reta i2         ; Current instruction offset in 32b words
// addi $$reta $$reta i4         ; set new return addr
// jmpf $zero i31                ; call log_11
// move $$arg0 $r1               ; pass arg 0
// sub  $$reta $pc $is           ; Get current instruction offset from Instruction start
// srli $$reta $$reta i2         ; Current instruction offset in 32b words
// addi $$reta $$reta i4         ; set new return addr
// jmpf $zero i26                ; call log_11
// load $r0 data_3               ; literal instantiation
// rvrt $r0
// pshl i3                       ; Save registers 16..40
// pshh i524288                  ; Save registers 40..64
// move $$locbase $sp            ; save locals base register for get_const_1_address_5
// cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments.
// move $r0 $$reta               ; save reta
// load $r1 data_4               ; get local constant
// move $$retv $r1               ; set return value
// cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments.
// move $$reta $r0               ; restore reta
// poph i524288                  ; Restore registers 40..64
// popl i3                       ; Restore registers 16..40
// jmp $$reta                    ; return from call
// pshl i15                      ; Save registers 16..40
// pshh i524288                  ; Save registers 40..64
// move $$locbase $sp            ; save locals base register for read_6
// cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments.
// move $r0 $$arg0               ; save arg 0
// move $r1 $$arg1               ; save arg 1
// move $r2 $$reta               ; save reta
// movi $r3 i8                   ; get length for mcp
// mcp  $r1 $r0 $r3              ; copy memory with mem_copy
// move $$retv $r1               ; set return value
// cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments.
// move $$reta $r2               ; restore reta
// poph i524288                  ; Restore registers 40..64
// popl i15                      ; Restore registers 16..40
// jmp $$reta                    ; return from call
// pshl i127                     ; Save registers 16..40
// pshh i524288                  ; Save registers 40..64
// move $$locbase $sp            ; save locals base register for log_11
// cfei i152                     ; allocate 152 bytes for locals and 0 slots for call arguments.
// move $r6 $$arg0               ; save arg 0
// move $r4 $$reta               ; save reta
// load $r0 data_0               ; literal instantiation
// aloc $r0                      ; asm block
// move $r0 $hp                  ; return value from inline asm
// sw   $$locbase $r0 i16        ; store value
// load $r0 data_0               ; literal instantiation
// sw   $$locbase $r0 i17        ; store value
// sw   $$locbase $zero i18      ; store value
// addi $r5 $$locbase i128       ; get offset to local
// lw   $r0 $$locbase i16        ; load value
// lw   $r1 $$locbase i17        ; load value
// lw   $r2 $$locbase i18        ; load value
// load $r3 data_5               ; literal instantiation
// add  $r2 $r2 $r3
// lt   $r3 $r1 $r2
// jnzf $r3 $zero i1
// eq   $r3 $r1 $r2
// jnzf $r3 $zero i6
// addi $r0 $$locbase i40        ; get offset to local
// sw   $$locbase $zero i5       ; store value
// addi $r2 $$locbase i104       ; get offset to local
// movi $r1 i24                  ; get length for mcp
// mcp  $r2 $r0 $r1              ; copy memory with mem_copy
// jmpf $zero i12
// div  $r2 $r2 $r1
// add  $r2 $r2 $one
// mul  $r2 $r1 $r2
// aloc $r2                      ; asm block
// mcp  $hp $r0 $r1              ; asm block
// move $r0 $hp                  ; return value from inline asm
// sw   $$locbase $one i0        ; store value
// sw   $$locbase $r0 i1         ; store value
// sw   $$locbase $r2 i2         ; store value
// addi $r2 $$locbase i104       ; get offset to local
// movi $r0 i24                  ; get length for mcp
// mcp  $r2 $$locbase $r0        ; copy memory with mem_copy
// addi $r0 $$locbase i80        ; get offset to local
// movi $r1 i24                  ; get length for mcp
// mcp  $r0 $r2 $r1              ; copy memory with mem_copy
// lw   $r0 $$locbase i13        ; load value
// eq   $r0 $r0 $zero
// jnzf $r0 $zero i15
// lw   $r0 $$locbase i10        ; load value
// eq   $r0 $r0 $one
// jnzf $r0 $zero i2
// load $r0 data_6               ; literal instantiation
// rvrt $r0
// addi $r0 $$locbase i80        ; get offset to local
// addi $r0 $r0 i8               ; get offset to element
// addi $r1 $$locbase i80        ; get offset to local
// addi $r1 $r1 i8               ; get offset to element
// addi $r1 $r1 i8               ; get offset to element
// movi $r2 i8                   ; get length for mcp
// mcp  $r5 $r0 $r2              ; copy memory with mem_copy
// addi $r0 $r5 i8               ; get offset to element
// movi $r2 i8                   ; get length for mcp
// mcp  $r0 $r1 $r2              ; copy memory with mem_copy
// lw   $r0 $r5 i0               ; load value
// lw   $r1 $r5 i2               ; load value
// mul  $r1 $one $r1
// add  $r0 $r0 $r1
// sw   $r0 $r6 i0               ; asm block
// lw   $r0 $r5 i2               ; load value
// load $r1 data_5               ; literal instantiation
// add  $r0 $r0 $r1
// sw   $r5 $r0 i2               ; store value
// addi $r0 $$locbase i128       ; get offset to local
// addi $r1 $r0 i16              ; get offset to element
// addi $r2 $$locbase i24        ; get offset to local
// movi $r3 i8                   ; get length for mcp
// mcp  $r2 $r0 $r3              ; copy memory with mem_copy
// addi $r0 $r2 i8               ; get offset to element
// movi $r3 i8                   ; get length for mcp
// mcp  $r0 $r1 $r3              ; copy memory with mem_copy
// addi $r0 $$locbase i64        ; get offset to local
// movi $r1 i16                  ; get length for mcp
// mcp  $r0 $r2 $r1              ; copy memory with mem_copy
// lw   $r0 $$locbase i8         ; load slice ptr
// lw   $r1 $$locbase i9         ; load slice size
// logd $zero $one $r0 $r1       ; log slice
// move $$retv $zero             ; set return value
// cfsi i152                     ; free 152 bytes for locals and 0 slots for extra call arguments.
// move $$reta $r4               ; restore reta
// poph i524288                  ; Restore registers 40..64
// popl i127                     ; Restore registers 16..40
// jmp $$reta                    ; return from call
// pshl i3                       ; Save registers 16..40
// pshh i524288                  ; Save registers 40..64
// move $$locbase $sp            ; save locals base register for get_const_2_address_28
// cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments.
// move $r0 $$reta               ; save reta
// load $r1 data_7               ; get local constant
// move $$retv $r1               ; set return value
// cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments.
// move $$reta $r0               ; restore reta
// poph i524288                  ; Restore registers 40..64
// popl i3                       ; Restore registers 16..40
// jmp $$reta                    ; return from call
// pshl i127                     ; Save registers 16..40
// pshh i524288                  ; Save registers 40..64
// move $$locbase $sp            ; save locals base register for log_33
// cfei i152                     ; allocate 152 bytes for locals and 0 slots for call arguments.
// move $r5 $$arg0               ; save arg 0
// move $r4 $$reta               ; save reta
// load $r0 data_0               ; literal instantiation
// aloc $r0                      ; asm block
// move $r0 $hp                  ; return value from inline asm
// sw   $$locbase $r0 i16        ; store value
// load $r0 data_0               ; literal instantiation
// sw   $$locbase $r0 i17        ; store value
// sw   $$locbase $zero i18      ; store value
// addi $r6 $$locbase i128       ; get offset to local
// lw   $r0 $$locbase i16        ; load value
// lw   $r1 $$locbase i17        ; load value
// lw   $r2 $$locbase i18        ; load value
// load $r3 data_5               ; literal instantiation
// add  $r2 $r2 $r3
// lt   $r3 $r1 $r2
// jnzf $r3 $zero i1
// eq   $r3 $r1 $r2
// jnzf $r3 $zero i6
// addi $r0 $$locbase i40        ; get offset to local
// sw   $$locbase $zero i5       ; store value
// addi $r2 $$locbase i104       ; get offset to local
// movi $r1 i24                  ; get length for mcp
// mcp  $r2 $r0 $r1              ; copy memory with mem_copy
// jmpf $zero i12
// div  $r2 $r2 $r1
// add  $r2 $r2 $one
// mul  $r2 $r1 $r2
// aloc $r2                      ; asm block
// mcp  $hp $r0 $r1              ; asm block
// move $r0 $hp                  ; return value from inline asm
// sw   $$locbase $one i0        ; store value
// sw   $$locbase $r0 i1         ; store value
// sw   $$locbase $r2 i2         ; store value
// addi $r2 $$locbase i104       ; get offset to local
// movi $r0 i24                  ; get length for mcp
// mcp  $r2 $$locbase $r0        ; copy memory with mem_copy
// addi $r0 $$locbase i80        ; get offset to local
// movi $r1 i24                  ; get length for mcp
// mcp  $r0 $r2 $r1              ; copy memory with mem_copy
// lw   $r0 $$locbase i13        ; load value
// eq   $r0 $r0 $zero
// jnzf $r0 $zero i15
// lw   $r0 $$locbase i10        ; load value
// eq   $r0 $r0 $one
// jnzf $r0 $zero i2
// load $r0 data_6               ; literal instantiation
// rvrt $r0
// addi $r0 $$locbase i80        ; get offset to local
// addi $r0 $r0 i8               ; get offset to element
// addi $r1 $$locbase i80        ; get offset to local
// addi $r1 $r1 i8               ; get offset to element
// addi $r1 $r1 i8               ; get offset to element
// movi $r2 i8                   ; get length for mcp
// mcp  $r6 $r0 $r2              ; copy memory with mem_copy
// addi $r0 $r6 i8               ; get offset to element
// movi $r2 i8                   ; get length for mcp
// mcp  $r0 $r1 $r2              ; copy memory with mem_copy
// lw   $r0 $r6 i0               ; load value
// lw   $r1 $r6 i2               ; load value
// mul  $r1 $one $r1
// add  $r0 $r0 $r1
// sw   $r0 $r5 i0               ; asm block
// lw   $r0 $r6 i2               ; load value
// load $r1 data_5               ; literal instantiation
// add  $r0 $r0 $r1
// sw   $r6 $r0 i2               ; store value
// addi $r0 $$locbase i128       ; get offset to local
// addi $r1 $r0 i16              ; get offset to element
// addi $r2 $$locbase i24        ; get offset to local
// movi $r3 i8                   ; get length for mcp
// mcp  $r2 $r0 $r3              ; copy memory with mem_copy
// addi $r0 $r2 i8               ; get offset to element
// movi $r3 i8                   ; get length for mcp
// mcp  $r0 $r1 $r3              ; copy memory with mem_copy
// addi $r0 $$locbase i64        ; get offset to local
// movi $r1 i16                  ; get length for mcp
// mcp  $r0 $r2 $r1              ; copy memory with mem_copy
// load $r0 data_8               ; literal instantiation
// lw   $r1 $$locbase i8         ; load slice ptr
// lw   $r2 $$locbase i9         ; load slice size
// logd $zero $r0 $r1 $r2        ; log slice
// move $$retv $zero             ; set return value
// cfsi i152                     ; free 152 bytes for locals and 0 slots for extra call arguments.
// move $$reta $r4               ; restore reta
// poph i524288                  ; Restore registers 40..64
// popl i127                     ; Restore registers 16..40
// jmp $$reta                    ; return from call
// pshl i127                     ; Save registers 16..40
// pshh i524288                  ; Save registers 40..64
// move $$locbase $sp            ; save locals base register for log_54
// cfei i152                     ; allocate 152 bytes for locals and 0 slots for call arguments.
// move $r5 $$arg0               ; save arg 0
// move $r4 $$reta               ; save reta
// load $r0 data_0               ; literal instantiation
// aloc $r0                      ; asm block
// move $r0 $hp                  ; return value from inline asm
// sw   $$locbase $r0 i16        ; store value
// load $r0 data_0               ; literal instantiation
// sw   $$locbase $r0 i17        ; store value
// sw   $$locbase $zero i18      ; store value
// addi $r6 $$locbase i128       ; get offset to local
// lw   $r0 $$locbase i16        ; load value
// lw   $r1 $$locbase i17        ; load value
// lw   $r2 $$locbase i18        ; load value
// load $r3 data_5               ; literal instantiation
// add  $r2 $r2 $r3
// lt   $r3 $r1 $r2
// jnzf $r3 $zero i1
// eq   $r3 $r1 $r2
// jnzf $r3 $zero i6
// addi $r0 $$locbase i40        ; get offset to local
// sw   $$locbase $zero i5       ; store value
// addi $r2 $$locbase i104       ; get offset to local
// movi $r1 i24                  ; get length for mcp
// mcp  $r2 $r0 $r1              ; copy memory with mem_copy
// jmpf $zero i12
// div  $r2 $r2 $r1
// add  $r2 $r2 $one
// mul  $r2 $r1 $r2
// aloc $r2                      ; asm block
// mcp  $hp $r0 $r1              ; asm block
// move $r0 $hp                  ; return value from inline asm
// sw   $$locbase $one i0        ; store value
// sw   $$locbase $r0 i1         ; store value
// sw   $$locbase $r2 i2         ; store value
// addi $r2 $$locbase i104       ; get offset to local
// movi $r0 i24                  ; get length for mcp
// mcp  $r2 $$locbase $r0        ; copy memory with mem_copy
// addi $r0 $$locbase i80        ; get offset to local
// movi $r1 i24                  ; get length for mcp
// mcp  $r0 $r2 $r1              ; copy memory with mem_copy
// lw   $r0 $$locbase i13        ; load value
// eq   $r0 $r0 $zero
// jnzf $r0 $zero i15
// lw   $r0 $$locbase i10        ; load value
// eq   $r0 $r0 $one
// jnzf $r0 $zero i2
// load $r0 data_6               ; literal instantiation
// rvrt $r0
// addi $r0 $$locbase i80        ; get offset to local
// addi $r0 $r0 i8               ; get offset to element
// addi $r1 $$locbase i80        ; get offset to local
// addi $r1 $r1 i8               ; get offset to element
// addi $r1 $r1 i8               ; get offset to element
// movi $r2 i8                   ; get length for mcp
// mcp  $r6 $r0 $r2              ; copy memory with mem_copy
// addi $r0 $r6 i8               ; get offset to element
// movi $r2 i8                   ; get length for mcp
// mcp  $r0 $r1 $r2              ; copy memory with mem_copy
// lw   $r0 $r6 i0               ; load value
// lw   $r1 $r6 i2               ; load value
// mul  $r1 $one $r1
// add  $r0 $r0 $r1
// sw   $r0 $r5 i0               ; asm block
// lw   $r0 $r6 i2               ; load value
// load $r1 data_5               ; literal instantiation
// add  $r0 $r0 $r1
// sw   $r6 $r0 i2               ; store value
// addi $r0 $$locbase i128       ; get offset to local
// addi $r1 $r0 i16              ; get offset to element
// addi $r2 $$locbase i24        ; get offset to local
// movi $r3 i8                   ; get length for mcp
// mcp  $r2 $r0 $r3              ; copy memory with mem_copy
// addi $r0 $r2 i8               ; get offset to element
// movi $r3 i8                   ; get length for mcp
// mcp  $r0 $r1 $r3              ; copy memory with mem_copy
// addi $r0 $$locbase i64        ; get offset to local
// movi $r1 i16                  ; get length for mcp
// mcp  $r0 $r2 $r1              ; copy memory with mem_copy
// load $r0 data_9               ; literal instantiation
// lw   $r1 $$locbase i8         ; load slice ptr
// lw   $r2 $$locbase i9         ; load slice size
// logd $zero $r0 $r1 $r2        ; log slice
// move $$retv $zero             ; set return value
// cfsi i152                     ; free 152 bytes for locals and 0 slots for extra call arguments.
// move $$reta $r4               ; restore reta
// poph i524288                  ; Restore registers 40..64
// popl i127                     ; Restore registers 16..40
// jmp $$reta                    ; return from call
// .data:
// data_0 .word 1024
// data_1 .word 11
// data_2 .word 22
// data_3 .word 18446744073709486083
// data_4 .collection { .word 11 }
// data_5 .word 8
// data_6 .word 14757395258967588866
// data_7 .collection { .word 22 }
// data_8 .word 3
// data_9 .word 5
