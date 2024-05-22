library;

struct S {
    x: u64,
    y: bool,
}

const CONST_1: S = S { x: 112233, y: true };
const CONST_2: S = S { x: 112233, y: true };

#[inline(never)]
pub fn play() {
    let x = a();
    let y = b();

    poke(x, y);
}

#[test]
fn test() {
    play();
}

#[test]
fn test_ref_equality_different_const() {
    let r_1 = &CONST_1;
    let r_2 = &CONST_2;

    let p_1 = asm(ptr: r_1) { ptr: raw_ptr };
    let p_2 = asm(ptr: r_2) { ptr: raw_ptr };

    assert(p_1 == p_2); // <<-- FAILS.
}

#[test]
fn test_ref_equality_same_const() {
    let r_1 = &CONST_1;
    let r_2 = &CONST_1;

    let p_1 = asm(ptr: r_1) { ptr: raw_ptr };
    let p_2 = asm(ptr: r_2) { ptr: raw_ptr };

    assert(p_1 == p_2); // <<-- FAILS.
}

#[inline(never)]
fn a() -> S {
    let r = &CONST_1;
    *r
}

#[inline(never)]
fn b() -> S {
    let r = &CONST_2;
    *r
}

#[inline(never)]
fn poke<T>(_x: T, _y: T) {}

// fn a_6(__ret_value: ptr { u64, bool }) -> ptr { u64, bool }, !43 {
//     local { u64, bool } __anon_0

//     entry(__ret_value: ptr { u64, bool }):
//     v0 = get_local ptr { u64, bool }, __anon_0
//     v1 = const u64 0
//     v2 = get_elem_ptr v0, ptr u64, v1
//     v3 = const u64 112233
//     store v3 to v2
//     v4 = const u64 1
//     v5 = get_elem_ptr v0, ptr bool, v4
//     v6 = const bool true
//     store v6 to v5
//     v7 = ptr_to_int v0 to u64, !44
//     v8 = int_to_ptr v7 to ptr { u64, bool }, !45
//     mem_copy_val __ret_value, v8
//     ret ptr { u64, bool } __ret_value
// }

// entry fn test_ref_equality_different_const() -> (), !50 {
//     local { u64, bool } __anon_0
//     local { u64, bool } __anon_1

//     entry():
//     v0 = get_local ptr { u64, bool }, __anon_0
//     v1 = const u64 0
//     v2 = get_elem_ptr v0, ptr u64, v1
//     v3 = const u64 112233
//     store v3 to v2
//     v4 = const u64 1
//     v5 = get_elem_ptr v0, ptr bool, v4
//     v6 = const bool true
//     store v6 to v5
//     v7 = ptr_to_int v0 to u64, !51
//     v8 = get_local ptr { u64, bool }, __anon_1
//     v9 = const u64 0
//     v10 = get_elem_ptr v8, ptr u64, v9
//     v11 = const u64 112233
//     store v11 to v10
//     v12 = const u64 1
//     v13 = get_elem_ptr v8, ptr bool, v12
//     v14 = const bool true
//     store v14 to v13
//     v15 = ptr_to_int v8 to u64, !52
//     v16 = asm(ptr: v7) -> u64 ptr, !53 {
//     }
//     v17 = asm(ptr: v15) -> u64 ptr, !54 {
//     }
//     v18 = cmp eq v16 v17, !55
//     v19 = const bool false, !57
//     v20 = cmp eq v18 v19, !61
//     cbr v20, assert_9_block0(), assert_9_block1(), !62

//     assert_9_block0():
//     v21 = const u64 18446744073709486084, !64
//     revert v21, !68

//     assert_9_block1():
//     v22 = const unit ()
//     ret () v22
// }

// entry fn test_ref_equality_same_const() -> (), !71 {
//     local { u64, bool } __anon_0
//     local { u64, bool } __anon_1

//     entry():
//     v0 = get_local ptr { u64, bool }, __anon_0
//     v1 = const u64 0
//     v2 = get_elem_ptr v0, ptr u64, v1
//     v3 = const u64 112233
//     store v3 to v2
//     v4 = const u64 1
//     v5 = get_elem_ptr v0, ptr bool, v4
//     v6 = const bool true
//     store v6 to v5
//     v7 = ptr_to_int v0 to u64, !72
//     v8 = get_local ptr { u64, bool }, __anon_1
//     v9 = const u64 0
//     v10 = get_elem_ptr v8, ptr u64, v9
//     v11 = const u64 112233
//     store v11 to v10
//     v12 = const u64 1
//     v13 = get_elem_ptr v8, ptr bool, v12
//     v14 = const bool true
//     store v14 to v13
//     v15 = ptr_to_int v8 to u64, !73
//     v16 = asm(ptr: v7) -> u64 ptr, !74 {
//     }
//     v17 = asm(ptr: v15) -> u64 ptr, !75 {
//     }
//     v18 = cmp eq v16 v17, !76
//     v19 = const bool false, !57
//     v20 = cmp eq v18 v19, !78
//     cbr v20, assert_13_block0(), assert_13_block1(), !79

//     assert_13_block0():
//     v21 = const u64 18446744073709486084, !64
//     revert v21, !80

//     assert_13_block1():
//     v22 = const unit ()
//     ret () v22
// }
