library;

pub fn play() -> () {
    let x: u32 = 2;
    poke(x);

    {
        let x: u32 = 3;
        poke(x);
    }
}

fn poke<T>(x: T) -> () { let _ = x; () }
