script;

use test_lib::*;

fn main() {
    play();
}

#[inline(never)]
fn play() {
    let addresses = get_test_lib_const_addresses();
    poke(addresses);
}

fn poke<T>(_x: T) {}