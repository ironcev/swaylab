library;

pub fn play() -> () {
    poke(X); // ERR: Variable "X" does not exist in this scope.

    const X: u32 = 2;
}

fn poke<T>(x: T) -> () { let _ = x; () }
