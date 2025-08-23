library;

use std::address::Address;

#[inline(always)]
pub fn play() {
    let _ = wrapper();
}

#[inline(never)]
fn wrapper() -> (Address, Address, Address) {
    (return_option().unwrap(), return_option().unwrap(), return_option().unwrap())
}

#[inline(never)]
fn return_option() -> Option<Address> {
    None
}

// IR: Final
// script {
//     entry fn main() -> (), !3 {
//         local { { b256 }, { b256 }, { b256 } } __ret_val

//         entry():
//         v0 = get_local ptr { { b256 }, { b256 }, { b256 } }, __ret_val
//         v1 = call wrapper_1(v0)
//         v2 = const unit ()
//         ret () v2
//     }

//     fn wrapper_1(__ret_value: ptr { { b256 }, { b256 }, { b256 } }) -> ptr { { b256 }, { b256 }, { b256 } }, !8 {
//         local mut { u64, ( () | { b256 } ) } __aggr_memcpy_0
//         local mut { u64, ( () | { b256 } ) } __aggr_memcpy_00
//         local mut { u64, ( () | { b256 } ) } __aggr_memcpy_01
//         local mut { b256 } __aggr_memcpy_02
//         local mut { b256 } __aggr_memcpy_03
//         local mut { b256 } __aggr_memcpy_04
//         local { { b256 }, { b256 }, { b256 } } __anon_0
//         local { b256 } __ret_val
//         local { b256 } __ret_val0
//         local { b256 } __ret_val1
//         local { u64, ( () | { b256 } ) } __ret_val2
//         local { u64, ( () | { b256 } ) } __ret_val3
//         local { u64, ( () | { b256 } ) } __ret_val4
//         local { u64, ( () | { b256 } ) } __tmp_arg
//         local { u64, ( () | { b256 } ) } __tmp_arg0
//         local { u64, ( () | { b256 } ) } __tmp_arg1

//         entry(__ret_value: ptr { { b256 }, { b256 }, { b256 } }):
//         v0 = get_local ptr { u64, ( () | { b256 } ) }, __ret_val2
//         v1 = call return_option_5(v0)
//         v2 = get_local ptr { u64, ( () | { b256 } ) }, __aggr_memcpy_0
//         mem_copy_val v2, v1
//         v3 = get_local ptr { u64, ( () | { b256 } ) }, __tmp_arg
//         mem_copy_val v3, v2
//         v4 = get_local ptr { b256 }, __ret_val
//         v5 = call unwrap_2(v3, v4)
//         v6 = get_local ptr { b256 }, __aggr_memcpy_02
//         mem_copy_val v6, v5
//         v7 = get_local ptr { u64, ( () | { b256 } ) }, __ret_val3
//         v8 = call return_option_5(v7)
//         v9 = get_local ptr { u64, ( () | { b256 } ) }, __aggr_memcpy_00
//         mem_copy_val v9, v8
//         v10 = get_local ptr { u64, ( () | { b256 } ) }, __tmp_arg0
//         mem_copy_val v10, v9
//         v11 = get_local ptr { b256 }, __ret_val0
//         v12 = call unwrap_2(v10, v11)
//         v13 = get_local ptr { b256 }, __aggr_memcpy_03
//         mem_copy_val v13, v12
//         v14 = get_local ptr { u64, ( () | { b256 } ) }, __ret_val4
//         v15 = call return_option_5(v14)
//         v16 = get_local ptr { u64, ( () | { b256 } ) }, __aggr_memcpy_01
//         mem_copy_val v16, v15
//         v17 = get_local ptr { u64, ( () | { b256 } ) }, __tmp_arg1
//         mem_copy_val v17, v16
//         v18 = get_local ptr { b256 }, __ret_val1
//         v19 = call unwrap_2(v17, v18)
//         v20 = get_local ptr { b256 }, __aggr_memcpy_04
//         mem_copy_val v20, v19
//         v21 = get_local ptr { { b256 }, { b256 }, { b256 } }, __anon_0, !9
//         v22 = const u64 0
//         v23 = get_elem_ptr v21, ptr { b256 }, v22, !9
//         mem_copy_val v23, v6
//         v24 = const u64 1
//         v25 = get_elem_ptr v21, ptr { b256 }, v24, !9
//         mem_copy_val v25, v13
//         v26 = const u64 2
//         v27 = get_elem_ptr v21, ptr { b256 }, v26, !9
//         mem_copy_val v27, v20
//         mem_copy_val __ret_value, v21
//         ret ptr { { b256 }, { b256 }, { b256 } } __ret_value
//     }

//     pub fn unwrap_2(self: ptr { u64, ( () | { b256 } ) }, __ret_value: ptr { b256 }) -> ptr { b256 }, !13 {
//         local { u64, ( () | { b256 } ) } __matched_value_4

//         entry(self: ptr { u64, ( () | { b256 } ) }, __ret_value: ptr { b256 }):
//         v0 = get_local ptr { u64, ( () | { b256 } ) }, __matched_value_4, !14
//         mem_copy_val v0, self
//         v1 = const u64 0
//         v2 = get_elem_ptr self, ptr u64, v1
//         v3 = load v2
//         v4 = const u64 1, !15
//         v5 = cmp eq v3 v4, !18
//         cbr v5, block0(), block1(), !16

//         block0():
//         v6 = get_local ptr { u64, ( () | { b256 } ) }, __matched_value_4, !15
//         v7 = const u64 1
//         v8 = const u64 1
//         v9 = get_elem_ptr v6, ptr { b256 }, v7, v8
//         mem_copy_val __ret_value, v9
//         ret ptr { b256 } __ret_value

//         block1():
//         v10 = const u64 0, !19
//         revert v10, !24
//     }

//     fn return_option_5(__ret_value: ptr { u64, ( () | { b256 } ) }) -> ptr { u64, ( () | { b256 } ) }, !27 {
//         local { u64, ( () | { b256 } ) } __anon_0

//         entry(__ret_value: ptr { u64, ( () | { b256 } ) }):
//         v0 = get_local ptr { u64, ( () | { b256 } ) }, __anon_0, !28
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, ptr u64, v1, !28
//         v3 = const u64 0, !28
//         store v3 to v2, !28
//         mem_copy_val __ret_value, v0
//         ret ptr { u64, ( () | { b256 } ) } __ret_value
//     }
// }
