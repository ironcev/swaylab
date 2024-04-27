library;

struct S {
    x: u64,
    y: u64,
}

#[inline(never)]
pub fn play() {
    let a = S { x: 0, y: 0};

    let b = a;
    let c = b;
    let d = c;

    poke(d);
}

#[inline(never)]
fn poke<T>(_x: T) {}
