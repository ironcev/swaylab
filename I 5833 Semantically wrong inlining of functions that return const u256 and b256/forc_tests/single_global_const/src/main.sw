script;

struct S {
    x: u64,
}

const CONST_S: S = S { x: 11 };

#[test]
fn test() {
    let ptr_to_const_1 = get_const_address_1();
    let ptr_to_const_2 = get_const_address_2();
    assert(ptr_to_const_1 == ptr_to_const_2);
}

#[inline(never)]
fn get_const_address_1() -> raw_ptr {
    poke(505);
    __addr_of(CONST_S)
}

#[inline(never)]
fn get_const_address_2() -> raw_ptr {
    poke(606);
    __addr_of(CONST_S)
}

fn main() {}

#[inline(never)]
fn poke<T>(_x: T) {}

// fn get_const_address_1_5() -> u64, !49 {
//     local { u64 } __const = const { u64 } { u64 11 }

//     entry():
//     v0 = get_local ptr { u64 }, __const
//     v1 = const u64 505, !50
//     v2 = call poke_6(v1), !51
//     v3 = ptr_to_int v0 to u64, !52
//     ret u64 v3
// }

// fn get_const_address_2_7() -> u64, !57 {
//     local { u64 } __const = const { u64 } { u64 11 }

//     entry():
//     v0 = get_local ptr { u64 }, __const
//     v1 = const u64 606, !58
//     v2 = call poke_6(v1), !59
//     v3 = ptr_to_int v0 to u64, !60
//     ret u64 v3
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
// cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments.
// sub  $$reta $pc $is           ; Get current instruction offset from Instruction start
// srli $$reta $$reta i2         ; Current instruction offset in 32b words
// addi $$reta $$reta i4         ; set new return addr
// jmpf $zero i12                ; call get_const_address_1_5
// move $r0 $$retv               ; copy the return value
// sub  $$reta $pc $is           ; Get current instruction offset from Instruction start
// srli $$reta $$reta i2         ; Current instruction offset in 32b words
// addi $$reta $$reta i4         ; set new return addr
// jmpf $zero i33                ; call get_const_address_2_7
// move $r1 $$retv               ; copy the return value
// eq   $r0 $r0 $r1
// eq   $r0 $r0 $zero
// jnzf $r0 $zero i1
// ret  $zero                    ; returning unit as zero
// load $r0 data_1               ; literal instantiation
// rvrt $r0
// pshl i7                       ; Save registers 16..40
// pshh i524288                  ; Save registers 40..64
// move $$locbase $sp            ; save locals base register for get_const_address_1_5
// cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments.
// move $r0 $$reta               ; save reta
// load $r1 data_2               ; get local constant
// load $r2 data_3               ; literal instantiation
// move $$arg0 $r2               ; pass arg 0
// sub  $$reta $pc $is           ; Get current instruction offset from Instruction start
// srli $$reta $$reta i2         ; Current instruction offset in 32b words
// addi $$reta $$reta i4         ; set new return addr
// jmpf $zero i5                 ; call poke_6
// move $$retv $r1               ; set return value
// cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments.
// move $$reta $r0               ; restore reta
// poph i524288                  ; Restore registers 40..64
// popl i7                       ; Restore registers 16..40
// jmp $$reta                    ; return from call
// pshl i1                       ; Save registers 16..40
// pshh i524288                  ; Save registers 40..64
// move $$locbase $sp            ; save locals base register for poke_6
// cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments.
// move $r0 $$reta               ; save reta
// move $$retv $zero             ; set return value
// cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments.
// move $$reta $r0               ; restore reta
// poph i524288                  ; Restore registers 40..64
// popl i1                       ; Restore registers 16..40
// jmp $$reta                    ; return from call
// pshl i7                       ; Save registers 16..40
// pshh i524288                  ; Save registers 40..64
// move $$locbase $sp            ; save locals base register for get_const_address_2_7
// cfei i0                       ; allocate 0 bytes for locals and 0 slots for call arguments.
// move $r0 $$reta               ; save reta
// load $r1 data_2               ; get local constant
// load $r2 data_4               ; literal instantiation
// move $$arg0 $r2               ; pass arg 0
// sub  $$reta $pc $is           ; Get current instruction offset from Instruction start
// srli $$reta $$reta i2         ; Current instruction offset in 32b words
// addi $$reta $$reta i4         ; set new return addr
// jmpb $zero i19                ; call poke_6
// move $$retv $r1               ; set return value
// cfsi i0                       ; free 0 bytes for locals and 0 slots for extra call arguments.
// move $$reta $r0               ; restore reta
// poph i524288                  ; Restore registers 40..64
// popl i7                       ; Restore registers 16..40
// jmp $$reta                    ; return from call
// .data:
// data_0 .word 1024
// data_1 .word 18446744073709486084
// data_2 .collection { .word 11 }
// data_3 .word 505
// data_4 .word 606
