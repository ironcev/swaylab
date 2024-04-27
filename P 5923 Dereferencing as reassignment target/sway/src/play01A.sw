library;

struct S {
    x: u8,
}

const CONST_S = S { x: 0 };
// ^^^^^^^^^^^^^^^^^^^^^^^^^^ This is a constant, not a variable.

pub fn play() {
    // CONST_S = S { x: 0 };
    CONST_S.x = 1;

    const CONST = 0;
    CONST = 1;
}
