library;

struct S {
    x: u64,
}

const C1 = S { x: 66 };

#[inline(never)]
pub fn play() -> u64 {
    C1.x
}