library;

#[inline(never)]
pub fn play() {
    let mut s = 0x0111111111111111111111111111111111111111111111111111111111111111u256;
    let r_s = &mut s;

    *r_s = 0x0222222222222222222222222222222222222222222222222222222222222222u256;

    poke(s);
}

#[inline(never)]
fn poke<T>(_x: T) {}