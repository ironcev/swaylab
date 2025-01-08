library;

pub fn play() {
    let mut x = get_const();
    let mut y = get_const();

    //ref_mut_poke(y);
    
    x = y;
    
    poke(x);
    poke(y);
}

fn get_const() -> u256 {
    0x0111111111111111111111111111111111111111111111111111111111111111u256
}

#[inline(never)]
fn poke<T>(_x: T) {}

#[inline(never)]
fn ref_mut_poke<T>(ref mut _x: T) { }