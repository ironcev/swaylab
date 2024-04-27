library;

pub fn play() {
    let x = get_const();
    let y = get_const();
    
    poke(x);
    poke(y);
}

fn get_const() -> u64 {
    123
}

#[inline(never)]
fn poke<T>(_x: T) {}