library;

enum Enum {
    A: (u64),
    B: (u64),
}

pub fn play() -> () {
    let e = Enum::A(0);

    let _x = match e {
        Enum::A(x) => x,
        Enum::B(x) => x,
    };

// if core::ops::eq(EnumTag(__match_return_var_name_1), 0) {
//     let x = UnsafeDowncast(__match_return_var_name_1, A);
//     x
// }
// else if core::ops::eq(EnumTag(__match_return_var_name_1), 1) {
//     let x = UnsafeDowncast(__match_return_var_name_1, B);
//     x
// }
// else {
//     let x = UnsafeDowncast(__match_return_var_name_1, B);
//     x
// }

    poke(Enum::B(0));
}

fn poke<T>(_x: T) { }
