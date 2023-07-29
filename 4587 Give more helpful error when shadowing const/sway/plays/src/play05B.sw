library;

pub fn play() -> () {
    let X: u32 = 3;
    poke(X);

    const X: u32 = 1;
    poke(X);
}

fn poke<T>(x: T) -> () { let _ = x; () }