library;

#[inline(never)]
pub fn play(ref mut x: u64) -> u64 {
    let y = x + x;
    poke(y);
    x
}

#[inline(never)]
fn poke<T>(_x: T) { }