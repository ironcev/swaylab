struct S {
    x: (u8, u8),
}

pub fn play() {
    let array = [S { x: (0, 0) }];

    array[0].x.1 = if 200 > 101 {
        11
    } else {
        12
    };

    array[0]
        .x
        .1 = if 200 > 101 {
        11
    } else {
        12
    };
}
