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

// if core::ops::eq(EnumTag(__match_return_var_name_1), 0) {
//     111
// }
// else if core::ops::eq(EnumTag(__match_return_var_name_1), 1) {
//     222
// }
// else {
//     222
// } 

    poke(Enum::B);
}

fn poke<T>(_x: T) { }
