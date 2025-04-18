library;

pub fn play() {
    let x = asm(reg: (1, 2)) { reg: u64 };
    poke(x);
    some_fn((1, 2));
}

#[inline(never)]
fn some_fn(tuple: (u64, u64)) {
    let x = asm(reg: tuple) { reg: u64 };
    poke(x);
}

#[inline(never)]
fn poke<T>(_t: T) { }