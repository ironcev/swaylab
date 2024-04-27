library;

struct S {
    x: u64,
    y: u64,
}

#[inline(never)]
pub fn play() {
    let a = S { x: 0, y: 0};
    let r_a = &a;

    let b = *r_a;
    let r_b = &b;

    let c = *r_b;
    let r_c = &c;

    let d = *r_c;

    poke(d);
}

#[inline(never)]
fn poke<T>(_x: T) {}
