library;

struct S {
    x: u64,
    y: u64,
}

pub fn play() {
    let x = get_const();
    let y = get_const();

    poke(x, y);
}

#[inline(always)] // Does not get inlined.
fn get_const() -> S {
    S {
        x: 0,
        y: 0,
    }
}

#[inline(never)]
fn poke<T>(_x: T, _y: T) {}
