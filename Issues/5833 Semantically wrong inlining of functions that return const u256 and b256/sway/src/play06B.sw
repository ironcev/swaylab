library;

const CONST_1: u256 = 0x0111111111111111111111111111111111111111111111111111111111111111u256;
const CONST_2: u256 = 0x0111111111111111111111111111111111111111111111111111111111111111u256;

#[inline(never)]
pub fn play() {
    let x = a();
    let y = b();

    poke(x, y);
}

#[test]
fn test() {
    play();
}

#[inline(never)]
fn a() -> u256 {
    CONST_1
}

#[inline(never)]
fn b() -> u256 {
    CONST_2
}

#[inline(never)]
fn poke<T>(_x: T, _y: T) {}
