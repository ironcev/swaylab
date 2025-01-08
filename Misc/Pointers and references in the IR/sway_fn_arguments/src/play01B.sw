library;

#[inline(never)]
pub fn play(ref mut x: u8) -> u8 {
    let y = x + x;
    poke(y);
    x
}

#[inline(never)]
fn poke<T>(_x: T) { }