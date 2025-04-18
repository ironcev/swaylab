library;

pub fn play() {
    let _ = asm(reg: (1, 2)) { reg: u64 };
    some_fn((1, 2));
}

#[inline(never)]
fn some_fn(tuple: (u64, u64)) {
    asm(reg: tuple) { reg: u64};
}