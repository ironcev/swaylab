library;

const CONST_1: u256 = 0x0111111111111111111111111111111111111111111111111111111111111111u256;
const CONST_2: u256 = 0x0111111111111111111111111111111111111111111111111111111111111111u256;

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
fn a() -> u256 {
    let r = &CONST_1;
    *r
}

#[inline(never)]
fn b() -> u256 {
    let r = &CONST_2;
    *r
}

#[inline(never)]
fn poke<T>(_x: T, _y: T) {}

// fn a_6(__ret_value: ptr u256) -> ptr u256, !47 {
//     local u256 __anon_0
//     local u256 __const = const u256 0x0111111111111111111111111111111111111111111111111111111111111111

//     entry(__ret_value: ptr u256):
//     v0 = get_local ptr u256, __const
//     v1 = get_local ptr u256, __anon_0
//     mem_copy_val v1, v0
//     v2 = ptr_to_int v1 to u64, !48
//     v3 = int_to_ptr v2 to ptr u256, !49
//     mem_copy_val __ret_value, v3
//     ret ptr u256 __ret_value
// }

// entry fn test_ref_equality_different_const() -> (), !54 {
//     local u256 __anon_0
//     local u256 __anon_1
//     local u256 __const = const u256 0x0111111111111111111111111111111111111111111111111111111111111111
//     local u256 __const0 = const u256 0x0111111111111111111111111111111111111111111111111111111111111111

//     entry():
//     v0 = get_local ptr u256, __const
//     v1 = get_local ptr u256, __const0
//     v2 = get_local ptr u256, __anon_0
//     mem_copy_val v2, v0
//     v3 = ptr_to_int v2 to u64, !55
//     v4 = get_local ptr u256, __anon_1
//     mem_copy_val v4, v1
//     v5 = ptr_to_int v4 to u64, !56
//     v6 = asm(ptr: v3) -> u64 ptr, !57 {
//     }
//     v7 = asm(ptr: v5) -> u64 ptr, !58 {
//     }
//     v8 = cmp eq v6 v7, !59
//     v9 = const bool false, !61
//     v10 = cmp eq v8 v9, !65
//     cbr v10, assert_9_block0(), assert_9_block1(), !66

//     assert_9_block0():
//     v11 = const u64 18446744073709486084, !68
//     revert v11, !72

//     assert_9_block1():
//     v12 = const unit ()
//     ret () v12
// }

// entry fn test_ref_equality_same_const() -> (), !75 {
//     local u256 __anon_0
//     local u256 __anon_1
//     local u256 __const0 = const u256 0x0111111111111111111111111111111111111111111111111111111111111111

//     entry():
//     v0 = get_local ptr u256, __const0
//     v1 = get_local ptr u256, __anon_0
//     mem_copy_val v1, v0
//     v2 = ptr_to_int v1 to u64, !76
//     v3 = get_local ptr u256, __anon_1
//     mem_copy_val v3, v0
//     v4 = ptr_to_int v3 to u64, !77
//     v5 = asm(ptr: v2) -> u64 ptr, !78 {
//     }
//     v6 = asm(ptr: v4) -> u64 ptr, !79 {
//     }
//     v7 = cmp eq v5 v6, !80
//     v8 = const bool false, !61
//     v9 = cmp eq v7 v8, !82
//     cbr v9, assert_13_block0(), assert_13_block1(), !83

//     assert_13_block0():
//     v10 = const u64 18446744073709486084, !68
//     revert v10, !84

//     assert_13_block1():
//     v11 = const unit ()
//     ret () v11
// }
