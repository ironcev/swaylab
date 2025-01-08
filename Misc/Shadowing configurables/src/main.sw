script;

mod lib;
mod other_lib;

const C: u8 = 0;

configurable {
    X: u8 = 0,
    Y: u8 = 0,
    Z: u8 = 0,
    A: u8 = 0,
    B: u8 = 0,
    C: u8 = 0,
    D: u8 = 0,
    SAME: u8 = 0,
    // SAME: u8 = 0,
    LIB_CONST_OTHER: u8 = 0,
}

const Z: u8 = 0;

const CONST: u8 = 0;
const CONST: u8 = 0;

use lib::LIB_CONST;
const LIB_CONST: u8 = 0;

use lib::LIB_CONST as LIB_CONST_ALIAS;
const LIB_CONST_ALIAS: u8 = 0;

use lib::LIB_CONST as D;
use lib::LIB_CONST_OTHER;

const LIB_CONST_THIRD: u8 = 0;
use lib::LIB_CONST_THIRD;

fn main() -> u8 {
    let X = 123u8;
    const Y: u8 = 0;

    {
        let A = 123u8;
        const B: u8 = 0;
    }

    X + Y + Z + A + B + C
}
