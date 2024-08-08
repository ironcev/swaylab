library;

struct S {
    t: (u64, u64, u64),
}

#[inline(never)]
pub fn play() {
    let s = S {
        t : (111, 222, 333),
    };
    poke(s);
}

#[inline(never)]
fn poke<T>(_x: T) { }