library;

#[inline(never)]
pub fn play() {
    let mut ref_u = &0u64;
    ref_u = &1u64;
    poke(ref_u);
}

#[inline(never)]
fn poke<T>(_x: T) { }