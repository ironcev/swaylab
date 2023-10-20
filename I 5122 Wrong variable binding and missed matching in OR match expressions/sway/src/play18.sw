library;

struct Struct {
    x: u64,
    y: u64,
    z: u64,
}

use ::lib::LIB_X;
use ::lib::LIB_Y as ALIAS_LIB_Y;

use common::common_consts::COMMON_CONST_X;
use common::common_consts::COMMON_CONST_Y as ALIAS_COMMON_CONST_Y;

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
        ALIAS_LIB_Y => {
            e * e
        },
        COMMON_CONST_X => {
            e / e
        },
        ALIAS_COMMON_CONST_Y => {
            e % e
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

    let s = Struct { x: 0, y: 0, z: 0 };

    let _x = match s {
        Struct { x: MOD_X, y: FUNC_X, z: LIB_X } => 1111,
        Struct { x: ALIAS_LIB_Y, .. } => 2222,
        _ => 9999,
    };

    let _dummy = match e {
        _ => {
            if e == MOD_X {
                e
            }
            else if e == FUNC_X {
                e + e
            }
            else if e == LIB_X {
                e - e
            }
            else if e == ALIAS_LIB_Y {
                e * e
            }
            else if e == COMMON_CONST_X {
                e / e
            }
            else if e == ALIAS_COMMON_CONST_Y {
                e % e
            }
            else {
                9999
            }
        }
    };

    poke(s.x);
    poke(s.y);
    poke(s.z);
}

fn poke<T>(_x: T) { }
