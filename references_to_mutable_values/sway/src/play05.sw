library;

use ::lib_a::LIB_X;
use ::lib_a::LIB_X as LIB_X_ALIAS;

const LOCAL_X = 123;

struct S {}

impl S {
    const CONST_IN_S = 123;
}

pub fn play() {
    let _ = &mut LIB_X;

    let _ = &mut LIB_X_ALIAS;

    let _ = &mut LOCAL_X;

    let _ = S::CONST_IN_S;
    let _ = &mut S::CONST_IN_S;

    let _ = &mut ::lib_a::LIB_X;

    // let _ = ::lib_a::S { x: 0 };
}
