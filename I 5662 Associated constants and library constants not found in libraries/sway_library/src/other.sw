library;

struct S {}

impl S {
    const CONST_IN_S = 123;
}

pub fn function() {
    let _ = S::CONST_IN_S;
    let _ = ::lib::LIB_X;
}
