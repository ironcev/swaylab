library;

struct S {
    x: u64,
    y: u64,
}


#[inline(never)]
pub fn play() {
    let x = get_const_1();
    let y = get_const_2();

    poke(x, y);
}

#[inline(always)]
fn get_const_1() -> S {
    const CONST: S = S { x: 0, y: 0, };
    CONST
}

#[inline(always)]
fn get_const_2() -> S {
    const CONST: S = S { x: 0, y: 0, };
    CONST
}

#[inline(never)]
fn poke<T>(_x: T, _y: T) {}
