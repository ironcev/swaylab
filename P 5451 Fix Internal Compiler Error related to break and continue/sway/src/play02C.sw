library;

#[inline(never)]
pub fn play(b: bool) -> u64 {
    let x = if b {
        poke(b);
        1
    } else {
        2
    };

    x
}

#[inline(never)]
fn poke<T>(_x: T) { }
