library;

#[inline(never)]
pub fn play() {
    let mut s = get_constant();
    let mut r_s = &mut s;
    let mut r_r_s = &mut r_s;

    *r_s = get_constant();

    poke(s);
}

fn get_constant() -> u256 {
    0x0111111111111111111111111111111111111111111111111111111111111111u256
}

#[inline(never)]
fn poke<T>(_x: T) {}
