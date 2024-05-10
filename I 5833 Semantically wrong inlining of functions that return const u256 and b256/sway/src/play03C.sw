library;

struct S {
    x: u64,
    y: u64,
}

const CONST: S = S { x: 0, y: 0, };

#[inline(never)]
pub fn play() {
    let x = get_const_1();
    let y = get_const_2();

    poke(x, y);
}

#[inline(always)]
fn get_const_1() -> S {
    CONST
}

#[inline(always)]
fn get_const_2() -> S {
    CONST
}

#[inline(never)]
fn poke<T>(_x: T, _y: T) {}
