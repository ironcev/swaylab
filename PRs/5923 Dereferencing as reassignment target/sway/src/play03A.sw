library;

struct S {
    x: (u8, u8),
}

pub fn play() {
    *return_ref(&mut 0) = 1;
//  ^^^^^^^^^^^^^^^^^^^ This expression cannot be assigned to.

    return_array()[0].x.1 = 222;

    let mut x = 0;
    let r_x = &mut x;

    *r_x = 1;
}

fn return_ref(r_x: &mut u8) -> &mut u8 {
    r_x
}

fn return_array() -> [S;2] {
    let s = S { x: (0, 0) };
    [s, s]
}