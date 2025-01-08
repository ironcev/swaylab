library;

struct S {
    x: (u8, u8),
}

pub fn play() {
    let s = S { x: (0, 0) };
    let array = [s, s];

    array[0].x.1 = if s.x.0 > 101 {
        11
    } else {
        12
    };

    array[0]
        .x
        .1 = if s.x.0 > 101 {
        11
    } else {
        12
    };

    array = [s, s];
}
