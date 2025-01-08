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
fn test_address_equality() {
    assert(__addr_of(CONST_1) == __addr_of(CONST_2));
}

#[inline(never)]
fn a() -> u256 {
    let ptr = __addr_of(CONST_1);
    ptr.read::<u256>()
}

#[inline(never)]
fn b() -> u256 {
    let ptr = __addr_of(CONST_2);
    ptr.read::<u256>()
}

#[inline(never)]
fn poke<T>(_x: T, _y: T) {}

// fn a_6(__ret_value: ptr u256) -> ptr u256, !47 {
//     local u256 __const = const u256 0x0111111111111111111111111111111111111111111111111111111111111111

//     entry(__ret_value: ptr u256):
//     v0 = get_local ptr u256, __const
//     v1 = ptr_to_int v0 to u64, !48
//     v2 = asm(ptr: v1) -> ptr u256 ptr {
//     }
//     mem_copy_val __ret_value, v2
//     ret ptr u256 __ret_value
// }

// entry fn test_address_equality() -> (), !53 {
//     local u256 __const = const u256 0x0111111111111111111111111111111111111111111111111111111111111111
//     local u256 __const0 = const u256 0x0111111111111111111111111111111111111111111111111111111111111111

//     entry():
//     v0 = get_local ptr u256, __const
//     v1 = get_local ptr u256, __const0
//     v2 = ptr_to_int v0 to u64, !54
//     v3 = ptr_to_int v1 to u64, !55
//     v4 = cmp eq v2 v3, !56
//     v5 = const bool false, !58
//     v6 = cmp eq v4 v5, !62
//     cbr v6, assert_11_block0(), assert_11_block1(), !63

//     assert_11_block0():
//     v7 = const u64 18446744073709486084, !65
//     revert v7, !69

//     assert_11_block1():
//     v8 = const unit ()
//     ret () v8
// }