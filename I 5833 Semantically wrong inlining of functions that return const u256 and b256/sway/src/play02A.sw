library;

const CONST = 0x0111111111111111111111111111111111111111111111111111111111111111u256;

pub fn play() {
    let x = get_const();
    let y = get_const();

    poke(x, y);
}

fn get_const() -> u256 {
   CONST 
}

#[inline(never)]
fn poke<T>(_x: T, _y: T) {}
