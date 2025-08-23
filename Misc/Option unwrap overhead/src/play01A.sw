library;

use std::address::Address;

#[inline(always)]
pub fn play() {
    let _ = wrapper();
}

#[inline(never)]
fn wrapper() -> Address {
    return_option().unwrap()
}

#[inline(never)]
fn return_option() -> Option<Address> {
    None
}

// IR: Final
// script {
//     entry fn main() -> (), !3 {
//         local { b256 } __ret_val

//         entry():
//         v0 = get_local ptr { b256 }, __ret_val
//         v1 = call wrapper_1(v0)
//         v2 = const unit ()
//         ret () v2
//     }

//     fn wrapper_1(__ret_value: ptr { b256 }) -> ptr { b256 }, !8 {
//         local mut { u64, ( () | { b256 } ) } __aggr_memcpy_0
//         local { u64, ( () | { b256 } ) } __matched_value_4
//         local { u64, ( () | { b256 } ) } __ret_val
//         local { b256 } inner_value

//         entry(__ret_value: ptr { b256 }):
//         v0 = get_local ptr { u64, ( () | { b256 } ) }, __ret_val
//         v1 = call return_option_5(v0)
//         v2 = get_local ptr { u64, ( () | { b256 } ) }, __aggr_memcpy_0
//         mem_copy_val v2, v1
//         v3 = get_local ptr { u64, ( () | { b256 } ) }, __matched_value_4, !13
//         mem_copy_val v3, v2
//         v4 = get_local ptr { u64, ( () | { b256 } ) }, __aggr_memcpy_0
//         v5 = const u64 0
//         v6 = get_elem_ptr v4, ptr u64, v5
//         v7 = load v6, !14
//         v8 = const u64 1, !15
//         v9 = cmp eq v7 v8, !18
//         cbr v9, unwrap_2_block0(), unwrap_2_block1(), !19

//         unwrap_2_block0():
//         v10 = get_local ptr { u64, ( () | { b256 } ) }, __matched_value_4, !20
//         v11 = const u64 1
//         v12 = const u64 1
//         v13 = get_elem_ptr v10, ptr { b256 }, v11, v12, !14
//         v14 = get_local ptr { b256 }, inner_value, !22
//         mem_copy_val v14, v13
//         mem_copy_val __ret_value, v13
//         ret ptr { b256 } __ret_value

//         unwrap_2_block1():
//         v15 = const u64 0, !23
//         revert v15, !28
//     }

//     fn return_option_5(__ret_value: ptr { u64, ( () | { b256 } ) }) -> ptr { u64, ( () | { b256 } ) }, !31 {
//         local { u64, ( () | { b256 } ) } __anon_0

//         entry(__ret_value: ptr { u64, ( () | { b256 } ) }):
//         v0 = get_local ptr { u64, ( () | { b256 } ) }, __anon_0, !32
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, ptr u64, v1, !32
//         v3 = const u64 0, !32
//         store v3 to v2, !32
//         mem_copy_val __ret_value, v0
//         ret ptr { u64, ( () | { b256 } ) } __ret_value
//     }
// }
