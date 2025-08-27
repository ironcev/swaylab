script;

// const HELLO: str = "Hello, world!";
//              ^^^ `str` or a type containing `str` on `const` is not allowed.

const A: b256 = 0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef;
const B: b256 = 0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef;

fn main() {
    // poke(HELLO);
    poke("Hello, world!");
    poke("Hello, world!");
    poke(A);
    poke(B);
}

#[inline(never)]
fn poke<T>(_t: T) { }

// IR: Final
// script {
//     global __const_global : string<13> = const string<13> "Hello, world!"
//     global __const_global0 : string<13> = const string<13> "Hello, world!"
//     global string_constants::A : b256 = const b256 0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef
//     global string_constants::B : b256 = const b256 0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef

//     entry fn main() -> (), !3 {
//         local { ptr, u64 } __anon_0
//         local slice __anon_1
//         local { ptr, u64 } __anon_2
//         local slice __anon_3
//         local slice __tmp_arg
//         local slice __tmp_arg0
//         local b256 __tmp_arg1
//         local b256 __tmp_arg2

//         entry():
//         v0 = get_global __ptr string<13>, __const_global
//         v1 = cast_ptr v0 to ptr, !4
//         v2 = get_local __ptr { ptr, u64 }, __anon_0, !4
//         v3 = const u64 0
//         v4 = get_elem_ptr v2, __ptr ptr, v3
//         store v1 to v4, !4
//         v5 = const u64 1
//         v6 = get_elem_ptr v2, __ptr u64, v5
//         v7 = const u64 13
//         store v7 to v6, !4
//         v8 = get_local __ptr slice, __anon_1, !4
//         mem_copy_bytes v8, v2, 16
//         v9 = get_local __ptr slice, __tmp_arg
//         mem_copy_val v9, v8
//         v10 = call poke_0(v9)
//         v11 = get_global __ptr string<13>, __const_global0
//         v12 = cast_ptr v11 to ptr, !5
//         v13 = get_local __ptr { ptr, u64 }, __anon_2, !5
//         v14 = const u64 0
//         v15 = get_elem_ptr v13, __ptr ptr, v14
//         store v12 to v15, !5
//         v16 = const u64 1
//         v17 = get_elem_ptr v13, __ptr u64, v16
//         v18 = const u64 13
//         store v18 to v17, !5
//         v19 = get_local __ptr slice, __anon_3, !5
//         mem_copy_bytes v19, v13, 16
//         v20 = get_local __ptr slice, __tmp_arg0
//         mem_copy_val v20, v19
//         v21 = call poke_0(v20)
//         v22 = get_global __ptr b256, string_constants::A, !6
//         v23 = get_local __ptr b256, __tmp_arg1
//         mem_copy_val v23, v22
//         v24 = call poke_1(v23)
//         v25 = get_global __ptr b256, string_constants::B, !7
//         v26 = get_local __ptr b256, __tmp_arg2
//         mem_copy_val v26, v25
//         v27 = call poke_1(v26)
//         v28 = const unit ()
//         ret () v28
//     }

//     fn poke_0(_t: __ptr slice) -> (), !11 {
//         entry(_t: __ptr slice):
//         v0 = const unit ()
//         ret () v0
//     }

//     fn poke_1(_t: __ptr b256) -> (), !12 {
//         entry(_t: __ptr b256):
//         v0 = const unit ()
//         ret () v0
//     }
// }

// ;; ASM: Final program
// ;; Program kind: Script
// .program:
// move $$tmp $pc
// jmpf $zero i4
// DATA_SECTION_OFFSET[0..32]
// DATA_SECTION_OFFSET[32..64]
// CONFIGURABLES_OFFSET[0..32]
// CONFIGURABLES_OFFSET[32..64]
// lw   $$ds $$tmp i1
// add  $$ds $$ds $$tmp
// cfei i0                       ; allocate stack space for globals
// move $$locbase $sp            ; save locals base register for function main
// cfei i160                     ; allocate 160 bytes for locals and 0 slots for call arguments
// addr $r0 data_NonConfigurable_0; get constant's address in data section
// sw   $$locbase $r0 i0         ; store word
// movi $r0 i13                  ; initialize constant into register
// sw   $$locbase $r0 i1         ; store word
// addi $r0 $$locbase i16        ; get offset to local
// mcpi $r0 $$locbase i16        ; copy memory
// addi $r1 $$locbase i64        ; get offset to local
// mcpi $r1 $r0 i16              ; copy memory
// move $$arg0 $r1               ; [call]: pass argument 0
// jal  $$reta $pc i26           ; [call]: call poke_0
// addr $r0 data_NonConfigurable_0; get constant's address in data section
// addi $r1 $$locbase i32        ; get offset to local
// sw   $$locbase $r0 i4         ; store word
// movi $r0 i13                  ; initialize constant into register
// sw   $$locbase $r0 i5         ; store word
// addi $r0 $$locbase i48        ; get offset to local
// mcpi $r0 $r1 i16              ; copy memory
// addi $r1 $$locbase i80        ; get offset to local
// mcpi $r1 $r0 i16              ; copy memory
// move $$arg0 $r1               ; [call]: pass argument 0
// jal  $$reta $pc i14           ; [call]: call poke_0
// addr $r0 data_NonConfigurable_1; get constant's address in data section
// addi $r1 $$locbase i96        ; get offset to local
// mcpi $r1 $r0 i32              ; copy memory
// move $$arg0 $r1               ; [call]: pass argument 0
// jal  $$reta $pc i17           ; [call]: call poke_1
// addr $r0 data_NonConfigurable_1; get constant's address in data section
// addi $r1 $$locbase i128       ; get offset to local
// mcpi $r1 $r0 i32              ; copy memory
// move $$arg0 $r1               ; [call]: pass argument 0
// jal  $$reta $pc i11           ; [call]: call poke_1
// ret  $zero                    ; return unit as zero
// pshl i1                       ; save registers 16..40
// pshh i524288                  ; save registers 40..64
// move $$locbase $sp            ; save locals base register for function poke_0
// move $r0 $$reta               ; save return address
// move $$retv $zero             ; set return value
// move $$reta $r0               ; restore return address
// poph i524288                  ; restore registers 40..64
// popl i1                       ; restore registers 16..40
// jal  $zero $$reta i0          ; return from call
// pshl i1                       ; save registers 16..40
// pshh i524288                  ; save registers 40..64
// move $$locbase $sp            ; save locals base register for function poke_1
// move $r0 $$reta               ; save return address
// move $$retv $zero             ; set return value
// move $$reta $r0               ; restore return address
// poph i524288                  ; restore registers 40..64
// popl i1                       ; restore registers 16..40
// jal  $zero $$reta i0          ; return from call
// .data:
// data_NonConfigurable_0 .bytes[13] 48 65 6c 6c 6f 2c 20 77 6f 72 6c 64 21  Hello, world!
// data_NonConfigurable_1 .bytes[32] 12 34 56 78 90 ab cd ef 12 34 56 78 90 ab cd ef 12 34 56 78 90 ab cd ef 12 34 56 78 90 ab cd ef  .4Vx.....4Vx.....4Vx.....4Vx....
