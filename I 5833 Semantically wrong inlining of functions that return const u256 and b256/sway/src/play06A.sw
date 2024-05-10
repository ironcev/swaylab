library;

struct S {
    x: u64,
    y: u64,
}

const CONST_1: S = S { x: 11, y: 11 };
const CONST_2: S = S { x: 22, y: 22 };

#[inline(never)]
pub fn play() {
    let x = a();
    let y = b();

    poke(x, y);
}

#[inline(never)]
fn a() -> S {
    CONST_1
}

#[inline(never)]
fn b() -> S {
    CONST_2
}

#[inline(never)]
fn poke<T>(_x: T, _y: T) {}

// fn a_2(__ret_value: ptr { u64, u64 }) -> ptr { u64, u64 }, !36 {
//     entry(__ret_value: ptr { u64, u64 }):
//     v0 = const u64 0
//     v1 = get_elem_ptr __ret_value, ptr u64, v0
//     v2 = const u64 11
//     store v2 to v1
//     v3 = const u64 1
//     v4 = get_elem_ptr __ret_value, ptr u64, v3
//     v5 = const u64 11
//     store v5 to v4
//     ret ptr { u64, u64 } __ret_value
// }

// fn b_3(__ret_value: ptr { u64, u64 }) -> ptr { u64, u64 }, !38 {
//     entry(__ret_value: ptr { u64, u64 }):
//     v0 = const u64 0
//     v1 = get_elem_ptr __ret_value, ptr u64, v0
//     v2 = const u64 22
//     store v2 to v1
//     v3 = const u64 1
//     v4 = get_elem_ptr __ret_value, ptr u64, v3
//     v5 = const u64 22
//     store v5 to v4
//     ret ptr { u64, u64 } __ret_value
// }