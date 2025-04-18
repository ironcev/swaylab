library;

pub fn play() {
    let ct = 42u64;
    let x = asm(reg_agg: (1, 2), reg_ct: ct) { reg_agg: u64 };
    poke(x);
    some_fn((1, 2), 42);
}

#[inline(never)]
fn some_fn(tuple: (u64, u64), x: u64) {
    let x = asm(reg_agg: tuple, reg_ct: x) { reg_agg: u64 };
    poke(x);
}

#[inline(never)]
fn poke<T>(_t: T) { }