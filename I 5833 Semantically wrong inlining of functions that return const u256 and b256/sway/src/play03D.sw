library;

struct S {
    x: u64,
    y: u64,
}

const CONST_0: S = S { x: 0, y: 0, };
const CONST_1: S = S { x: 1, y: 1, };

#[inline(never)]
pub fn play() {
    let x = get_const_1();
    let y = get_const_2();

    poke(x, y);
}

#[inline(always)]
fn get_const_1() -> S {
    CONST_0
}

#[inline(always)]
fn get_const_2() -> S {
    CONST_1
}

#[inline(never)]
fn poke<T>(_x: T, _y: T) {}
