library;

struct S {
    x: (u8, u8),
}

#[inline(never)]
pub fn play() {
    S { x: 0 } = 0;
    S { x: 0 }.x = 0;

    return_array() = 1;
    return_array()[0].x.1 = 1;

    return = 2;
    
    break = 3;

    continue = 3;

    (2 + 2) = 4;
    (2 + 2).x = 4;

    2 + 2 = 4;
}

fn return_array() -> [S;2] {
    let s = S { x: (0, 0) };
    [s, s]
}