library;

struct S { }

pub fn play() {
    let x = get_const();
    let y = get_const();
    
    poke(x);
    poke(y);
}

fn get_const() -> S {
    S { }
}

#[inline(never)]
fn poke<T>(_x: T) {}