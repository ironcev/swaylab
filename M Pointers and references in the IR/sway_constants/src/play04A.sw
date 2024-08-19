library;

struct S { }

impl S {
    const S_CONST: [u64;3] = [333333; 3];
}

#[inline(never)]
pub fn play() -> u64 {
    poke(S::S_CONST);
    poke(S::S_CONST);
    poke(S::S_CONST);

    0
}

#[inline(never)]
fn poke<T>(_x: T) {}
