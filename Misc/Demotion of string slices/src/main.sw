script;

fn main() {
    let _ = return_array();
    let _ = return_str();
}

#[inline(never)]
fn return_array() -> [u8; 5] {
    [42; 5]
}

#[inline(never)]
fn return_str() -> str {
    "aaaaa"
}

// entry_orig fn main_0() -> (), !48 {
//     local [u8; 5] __ret_val
//     local slice __ret_val0

//     entry():
//     v0 = get_local __ptr [u8; 5], __ret_val
//     v1 = const u64 0
//     v2 = call return_array_1(v1, v0)
//     v3 = get_local __ptr slice, __ret_val0
//     v4 = const u64 0
//     v5 = call return_str_2(v4, v3)
//     v6 = const unit ()
//     ret () v6
// }

// fn return_array_1(__backtrace: u64, __ret_value: __ptr [u8; 5]) -> __ptr [u8; 5], !52 {
//     entry(__backtrace: u64, __ret_value: __ptr [u8; 5]):
//     v0 = const u64 0
//     v1 = get_elem_ptr __ret_value, __ptr u8, v0
//     v2 = const u8 42, !53
//     store v2 to v1
//     v3 = const u64 1
//     v4 = get_elem_ptr __ret_value, __ptr u8, v3
//     store v2 to v4
//     v5 = const u64 2
//     v6 = get_elem_ptr __ret_value, __ptr u8, v5
//     store v2 to v6
//     v7 = const u64 3
//     v8 = get_elem_ptr __ret_value, __ptr u8, v7
//     store v2 to v8
//     v9 = const u64 4
//     v10 = get_elem_ptr __ret_value, __ptr u8, v9
//     store v2 to v10
//     ret __ptr [u8; 5] __ret_value
// }

// fn return_str_2(__backtrace: u64, __ret_value: __ptr slice) -> __ptr slice, !56 {
//     local string<5> __anon_0
//     local { ptr, u64 } __anon_1
//     local slice __anon_2
//     local string<5> __const = const string<5> "aaaaa"

//     entry(__backtrace: u64, __ret_value: __ptr slice):
//     v0 = get_local __ptr string<5>, __const
//     v1 = get_local __ptr string<5>, __anon_0
//     mem_copy_val v1, v0
//     v2 = cast_ptr v1 to ptr, !57
//     v3 = get_local __ptr { ptr, u64 }, __anon_1, !57
//     v4 = const u64 0
//     v5 = get_elem_ptr v3, __ptr ptr, v4
//     store v2 to v5, !57
//     v6 = const u64 1
//     v7 = get_elem_ptr v3, __ptr u64, v6
//     v8 = const u64 5
//     store v8 to v7, !57
//     v9 = get_local __ptr slice, __anon_2, !57
//     mem_copy_bytes v9, v3, 16
//     mem_copy_val __ret_value, v9
//     ret __ptr slice __ret_value
// }
