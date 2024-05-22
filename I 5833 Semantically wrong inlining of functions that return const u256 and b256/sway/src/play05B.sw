library;

use ::lib::CONST_LIB_S;

struct S {
    x: u64,
    y: u64,
}

const CONST_U64: u64 = 112233;
const CONST_S: S = S { x: 44, y: 55 };

#[inline(never)]
pub fn play() {
    a();
    b();
}

#[inline(never)]
fn a() {
    poke(CONST_U64, CONST_U64);
    poke(CONST_S, CONST_S);
    poke(CONST_LIB_S, CONST_LIB_S);
}

#[inline(never)]
fn b() {
    poke(CONST_S, CONST_S);
    poke(CONST_U64, CONST_U64);
    poke(CONST_LIB_S, CONST_LIB_S);
}

#[inline(never)]
fn poke<T>(_x: T, _y: T) {}
