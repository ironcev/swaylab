library;

enum Enum {
    A: (),
    B: (),
}

enum EmptyEnum { }

impl EmptyEnum {
    fn match_me(self) -> Self {
        let e = self;
        match e { }

        // // [Desugared match expression]
        // if true ()
        // else ()
    }
}

pub fn play() -> () {
    let e = Enum::A;

    let _x = match e {
        Enum::A => 111,
        Enum::B => 222,
    };

// Final:
// if core::ops::eq(EnumTag(__matched_value_2), 0) {
//     111
// }
// else if core::ops::eq(EnumTag(__matched_value_2), 1) {
//     222
// }
// else {
//     __revert(14757395258967588866)
// }

// Original:
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
