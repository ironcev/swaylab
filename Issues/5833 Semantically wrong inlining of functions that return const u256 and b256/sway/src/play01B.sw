library;

pub fn play() {
    let x = get_const();
    let y = get_const();

    poke(x, y);
}

fn get_const() -> u64 {
    12345
}

#[inline(never)]
fn poke<T>(_x: T, _y: T) {}
