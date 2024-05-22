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
fn test_address_equality() {
    assert(__addr_of(CONST_1) == __addr_of(CONST_2));
}

#[inline(never)]
fn a() -> S {
    let ptr = __addr_of(CONST_1);
    ptr.read::<S>()
}

#[inline(never)]
fn b() -> S {
    let ptr = __addr_of(CONST_2);
    ptr.read::<S>()
}

#[inline(never)]
fn poke<T>(_x: T, _y: T) {}

// fn a_6(__ret_value: ptr { u64, bool }) -> ptr { u64, bool }, !43 {
//     local { u64, bool } __const = const { u64, bool } { u64 112233, bool true }

//     entry(__ret_value: ptr { u64, bool }):
//     v0 = get_local ptr { u64, bool }, __const
//     v1 = ptr_to_int v0 to u64, !44
//     v2 = asm(ptr: v1) -> ptr { u64, bool } ptr {
//     }
//     mem_copy_val __ret_value, v2
//     ret ptr { u64, bool } __ret_value
// }

// fn poke_10(_x: ptr { u64, bool }, _y: ptr { u64, bool }) -> (), !46 {
//     entry(_x: ptr { u64, bool }, _y: ptr { u64, bool }):
//     v0 = const unit ()
//     ret () v0
// }

// entry fn test_address_equality() -> (), !49 {
//     local { u64, bool } __const = const { u64, bool } { u64 112233, bool true }
//     local { u64, bool } __const0 = const { u64, bool } { u64 112233, bool true }

//     entry():
//     v0 = get_local ptr { u64, bool }, __const
//     v1 = get_local ptr { u64, bool }, __const0
//     v2 = ptr_to_int v0 to u64, !50
//     v3 = ptr_to_int v1 to u64, !51
//     v4 = cmp eq v2 v3, !52
//     v5 = const bool false, !54
//     v6 = cmp eq v4 v5, !58
//     cbr v6, assert_11_block0(), assert_11_block1(), !59

//     assert_11_block0():
//     v7 = const u64 18446744073709486084, !61
//     revert v7, !65

//     assert_11_block1():
//     v8 = const unit ()
//     ret () v8
// }
