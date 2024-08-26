library;

struct S {
    x: u64,
}

const C1 = S { x: 66 };

#[inline(never)]
pub fn play() -> S {
    const C2 = C1;
    C2
}