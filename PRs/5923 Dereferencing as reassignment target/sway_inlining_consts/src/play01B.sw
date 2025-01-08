library;

struct S {
    x: u64,
    y: u64,
}

pub fn play() {
    let x = get_const();
    let y = get_const();
    
    poke(x);
    poke(y);
}

fn get_const() -> S {
    S {
        x: 123,
        y: 321,
    }
}

#[inline(never)]
fn poke<T>(_x: T) {}