library;

#[inline(never)]
pub fn play() -> u256 {
    let x = 0x1111111111111111111111111111111111111111111111111111111111111111u256 + 0x2222222222222222222222222222222222222222222222222222222222222222u256;
    x
}

// pub fn play_0(__ret_value: ptr u256) -> ptr u256, !6 {
//     local u256 __const = const u256 0x1111111111111111111111111111111111111111111111111111111111111111
//     local u256 __const0 = const u256 0x2222222222222222222222222222222222222222222222222222222222222222
//     local u256 __tmp_block_arg
//     local mut u256 __wide_result

//     entry(__ret_value: ptr u256):
//     v0 = get_local ptr u256, __const, !7
//     v1 = get_local ptr u256, __const0, !7
//     v2 = get_local ptr u256, __wide_result, !7
//     wide add v0, v1 to v2, !7
//     v3 = get_local ptr u256, __tmp_block_arg
//     mem_copy_val v3, v2
//     mem_copy_val __ret_value, v3
//     ret ptr u256 __ret_value
// }

// ;; ASM: Final program
// ;; Program kind: Script
// .program:
// move $$tmp $pc
// jmpf $zero i2
// DATA_SECTION_OFFSET[0..32]
// DATA_SECTION_OFFSET[32..64]
// lw   $$ds $$tmp i1
// add  $$ds $$ds $$tmp
// cfei i0                       ; allocate stack space for globals
// move $$locbase $sp            ; save locals base register for function main
// cfei i32                      ; allocate 32 bytes for locals and 0 slots for call arguments
// move $$arg0 $$locbase         ; [call]: pass argument 0
// sub  $$reta $pc $is           ; get current instruction offset from instructions start ($is)
// srli $$reta $$reta i2         ; get current instruction offset in 32-bit words
// addi $$reta $$reta i4         ; [call]: set new return address
// jmpf $zero i1                 ; [call]: call play_0
// ret  $zero                    ; return unit as zero
// pshl i31                      ; save registers 16..40
// pshh i524288                  ; save registers 40..64
// move $$locbase $sp            ; save locals base register for function play_0
// cfei i64                      ; allocate 64 bytes for locals and 0 slots for call arguments
// move $r0 $$arg0               ; save argument 0 (__ret_value)
// move $r1 $$reta               ; save return address
// load $r2 data_0               ; get local constant
// load $r3 data_1               ; get local constant
// addi $r4 $$locbase i32        ; get offset to local
// wqop $r4 $r2 $r3 i32          ; add two 256-bit integers
// movi $r2 i32                  ; get data length for memory copy
// mcp  $$locbase $r4 $r2        ; copy memory
// movi $r2 i32                  ; get data length for memory copy
// mcp  $r0 $$locbase $r2        ; copy memory
// move $$retv $r0               ; set return value
// cfsi i64                      ; free 64 bytes for locals and 0 slots for extra call arguments
// move $$reta $r1               ; restore return address
// poph i524288                  ; restore registers 40..64
// popl i31                      ; restore registers 16..40
// jmp $$reta                    ; return from call
// .data:
// data_0 .bytes[32] 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11  ................................
// data_1 .bytes[32] 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22  """"""""""""""""""""""""""""""""
