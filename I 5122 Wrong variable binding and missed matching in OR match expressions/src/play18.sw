library;

use ::lib::LIB_X;

const MOD_X = 1;

pub fn play() -> () {
    const FUNC_X = 2;

    let e = 1;

    let _x = match e {
        MOD_X => {
            e
        },
        FUNC_X => {
            e + e
        },
        LIB_X => {
            e - e
        },
        _ => 9999,
    };

// if core::ops::eq(__match_return_var_name_1, MOD_X) {
//     e
// }
// else if core::ops::eq(__match_return_var_name_1, FUNC_X) {
//     core::ops::add(e, e)
// }
// else if core::ops::eq(__match_return_var_name_1, LIB_X) {
//     core::ops::subtract(e, e)
// }
// else {
//     9999
// }
}
