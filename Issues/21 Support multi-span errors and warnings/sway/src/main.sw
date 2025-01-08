script;

mod lib;

use lib::LIB_X;

fn main() {
    const LIB_X = 2;

    let x = 1;

    const x = 2;

    const y = 3;

    let y = 4;

    const X = 1;

    const X = 2;

    let LIB_Y = 5;

    let LIB_Y_ALIAS = 6;

    let LIB_Z_ALIAS = 7;

    // use lib::LIB_X as LIB_Y_ALIAS_2;

    const myConstant = 7;

    use lib::LIB_Y as myLibY;
}

use lib::LIB_Y;

use lib::LIB_Y as LIB_Y_ALIAS;

use lib::LIB_Z as LIB_Z_ALIAS;

// use lib::LIB_Y as LIB_Y_ALIAS_2;