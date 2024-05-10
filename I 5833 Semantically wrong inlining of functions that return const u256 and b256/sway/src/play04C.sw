library;

struct S {
    x: u64,
    y: u64,
}

#[inline(never)]
pub fn play() {
    let p_s_1 = __addr_of(S { x: 0, y: 0, });
    let p_s_2 = __addr_of(S { x: 0, y: 0, });

    poke(p_s_1, p_s_2);
}

#[inline(never)]
fn poke<T>(_x: T, _y: T) {}
