library;

struct S {
    x: u64,
    y: u64,
}


#[inline(never)]
pub fn play() {
    let x = get_const();
    let y = get_const();

    poke(x, y);
}

#[inline(always)] // No inlining :-(
fn get_const() -> S {
    const CONST: S = S { x: 0, y: 0, };
    CONST
}

#[inline(never)]
fn poke<T>(_x: T, _y: T) {}
