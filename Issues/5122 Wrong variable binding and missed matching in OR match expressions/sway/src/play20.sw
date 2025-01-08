library;

enum Enum {
    A: (),
    B: (),
}

pub fn play() -> () {
    let e = Enum::A;

    let _x = match e {
        Enum::A => 111,
        Enum::B => 222,
    };

    let _x = match e {
        Enum::A => 111,
        Enum::B => 222,
    };

    // As expected, two __match_return_var_names get generated: _1 and _2.

    poke(Enum::B);
}

fn poke<T>(_x: T) { }
