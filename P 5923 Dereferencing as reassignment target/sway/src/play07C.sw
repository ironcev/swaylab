library;

#[inline(never)]
pub fn play() {
    let mut s = 0x0111111111111111111111111111111111111111111111111111111111111111u256;
    let mut r_s = &mut s;
    let mut r_r_s = &mut r_s;

    *r_s = 0x0111111111111111111111111111111111111111111111111111111111111111u256;

    poke(s);
}

#[inline(never)]
fn poke<T>(_x: T) {}
