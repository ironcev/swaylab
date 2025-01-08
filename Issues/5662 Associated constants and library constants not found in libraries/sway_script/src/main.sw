script;

mod lib;

struct S {}

impl S {
    const CONST_IN_S = 123;
}

fn main() {
    let _ = S::CONST_IN_S;
    let _ = ::lib::LIB_X;
}
