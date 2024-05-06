library;

#[inline(never)]
pub fn play() {
    let mut s = 0x0111111111111111111111111111111111111111111111111111111111111111u256;
    let p_s = __addr_of(s);

    p_s.write(0x0111111111111111111111111111111111111111111111111111111111111111u256);

    poke(s);
}

#[inline(never)]
fn poke<T>(_x: T) {}
