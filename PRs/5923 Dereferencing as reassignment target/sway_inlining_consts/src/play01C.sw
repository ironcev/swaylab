library;

pub fn play() {
    let x = get_const();
    let y = get_const();
    
    poke(x);
    poke(y);
}

fn get_const() -> u256 {
    0x0111111111111111111111111111111111111111111111111111111111111111u256
}

#[inline(never)]
fn poke<T>(_x: T) {}