library;

pub fn play() {
    let x = get_const();
    let y = get_const();
    
    poke(x);
    poke(y);
}

fn get_const() -> b256 {
    0x0111111111111111111111111111111111111111111111111111111111111111
}

#[inline(never)]
fn poke<T>(_x: T) {}