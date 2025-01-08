script;

#[inline(never)]
fn main() {
    play_u256();
    play_u64();
}

#[inline(never)]
fn play_u256() {
    let x = get_u256() + get_u256();
    poke(x);
}

#[inline(never)]
fn play_u64() {
    let x = get_u64() + get_u64();
    poke(x);
}

#[inline(never)]
fn get_u256() -> u256 {
    0x0000000000000000000000000000000000000000000000000000000000000000u256
}

#[inline(never)]
fn get_u64() -> u64 {
    0
}

#[inline(never)]
fn poke<T>(_x: T) { }