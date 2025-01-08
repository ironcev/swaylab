library;

struct S {
    x: u8,
}

pub fn play() {
    let x = 0;
    x = 1;

    let s = S { x: 0 };
    s = S { x: 1 };
//  ^^^^^^^^^^^^^^ Assignment to immutable variable. Variable s is not declared as mutable.
    s.x = 1;
}
