contract;

struct S {
    a: b256,
    b: u64,
}

// Stored in the data section, as expected.
const CONST: b256 = 0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef;
const CONST_S: S = S {
    a: 0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef,
    b: 10,
};

impl Contract {
    fn use_consts() {
        poke(CONST);
        poke(CONST_S);
        poke(CONST_S.b);
    }
}

#[inline(never)]
fn poke<T>(_t: T) { }

// contract {
//     global global_constants_memory_layout::CONST : b256 = const b256 0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef
//     global global_constants_memory_layout::CONST_S : { b256, u64 } = const { b256, u64 } { b256 0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef, u64 10 }

//     pub entry fn use_consts<fb82eacb>() -> (), !3 {
//         local mut b256 __aggr_memcpy_0
//         local mut { b256, u64 } __aggr_memcpy_00
//         local b256 __tmp_arg
//         local { b256, u64 } __tmp_arg0

//         entry():
//         v0 = get_global ptr b256, global_constants_memory_layout::CONST, !4
//         v1 = get_local ptr b256, __aggr_memcpy_0
//         mem_copy_val v1, v0
//         v2 = get_local ptr b256, __tmp_arg
//         mem_copy_val v2, v1
//         v3 = call poke_0(v2)
//         v4 = get_global ptr { b256, u64 }, global_constants_memory_layout::CONST_S, !5
//         v5 = get_local ptr { b256, u64 }, __aggr_memcpy_00
//         mem_copy_val v5, v4
//         v6 = get_local ptr { b256, u64 }, __tmp_arg0
//         mem_copy_val v6, v5
//         v7 = call poke_1(v6)
//         v8 = get_global ptr { b256, u64 }, global_constants_memory_layout::CONST_S, !6
//         v9 = const u64 1
//         v10 = get_elem_ptr v8, ptr u64, v9, !7
//         v11 = load v10
//         v12 = call poke_2(v11), !10
//         v13 = const unit ()
//         ret () v13
//     }

//     fn poke_0(_t: ptr b256) -> (), !14 {
//         entry(_t: ptr b256):
//         v0 = const unit ()
//         ret () v0
//     }

//     fn poke_1(_t: ptr { b256, u64 }) -> (), !15 {
//         entry(_t: ptr { b256, u64 }):
//         v0 = const unit ()
//         ret () v0
//     }

//     fn poke_2(_t !16: u64) -> (), !17 {
//         entry(_t: u64):
//         v0 = const unit ()
//         ret () v0
//     }
// }

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
// lw   $r0 $fp i73              ; [function selection]: load input function selector
// load $r1 data_NonConfigurable_2; [function selection]: load function use_consts selector for comparison
// eq   $r2 $r0 $r1              ; [function selection]: compare function use_consts selector with input selector
// jnzf $r2 $zero i2             ; [function selection]: jump to selected contract function
// movi $$tmp i123               ; [function selection]: load revert code for mismatched function selector
// rvrt $$tmp                    ; [function selection]: revert if no selectors have matched
// move $$locbase $sp            ; save locals base register for function use_consts
// cfei i144                     ; allocate 144 bytes for locals and 0 slots for call arguments
// addr $r0 data_NonConfigurable_0; get constant's address in data section
// mcpi $$locbase $r0 i32        ; copy memory
// addi $r0 $$locbase i72        ; get offset to local
// mcpi $r0 $$locbase i32        ; copy memory
// move $$arg0 $r0               ; [call]: pass argument 0
// jal  $$reta $pc i15           ; [call]: call poke_0
// addr $r0 data_NonConfigurable_1; get constant's address in data section
// addi $r1 $$locbase i32        ; get offset to local
// mcpi $r1 $r0 i40              ; copy memory
// addi $r0 $$locbase i104       ; get offset to local
// mcpi $r0 $r1 i40              ; copy memory
// move $$arg0 $r0               ; [call]: pass argument 0
// jal  $$reta $pc i12           ; [call]: call poke_1
// addr $r0 data_NonConfigurable_1; get constant's address in data section
// lw   $r0 $r0 i4               ; load word
// move $$arg0 $r0               ; [call]: pass argument 0
// jal  $$reta $pc i12           ; [call]: call poke_2
// ret  $zero                    ; return unit as zero
// pshh i524288                  ; save registers 40..64
// move $$locbase $sp            ; save locals base register for function poke_0
// move $$retv $zero             ; set return value
// poph i524288                  ; restore registers 40..64
// jal  $zero $$reta i0          ; return from call
// pshh i524288                  ; save registers 40..64
// move $$locbase $sp            ; save locals base register for function poke_1
// move $$retv $zero             ; set return value
// poph i524288                  ; restore registers 40..64
// jal  $zero $$reta i0          ; return from call
// pshh i524288                  ; save registers 40..64
// move $$locbase $sp            ; save locals base register for function poke_2
// move $$retv $zero             ; set return value
// poph i524288                  ; restore registers 40..64
// jal  $zero $$reta i0          ; return from call
// .data:
// data_NonConfigurable_0 .bytes[32] 12 34 56 78 90 ab cd ef 12 34 56 78 90 ab cd ef 12 34 56 78 90 ab cd ef 12 34 56 78 90 ab cd ef  .4Vx.....4Vx.....4Vx.....4Vx....
// data_NonConfigurable_1 .collection { .bytes[32] 12 34 56 78 90 ab cd ef 12 34 56 78 90 ab cd ef 12 34 56 78 90 ab cd ef 12 34 56 78 90 ab cd ef  .4Vx.....4Vx.....4Vx.....4Vx...., .word 10 }
// data_NonConfigurable_2 .word 4219661003
