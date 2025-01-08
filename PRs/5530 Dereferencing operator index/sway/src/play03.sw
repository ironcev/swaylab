library;

struct S {
    x: u8,
    u8_field: u8,
}

pub fn play() {
    let mut not_array = 0;

    not_array[0] = 1;

    let mut s = S { x: 0, u8_field: 0 };

    s.x[0] = 1;

    let mut array = [s, s];

    array[0].x[0] = 1;

    array[0].u8_field[0] = 1;

    array[0][0] = 1;

    let _ = return[0];

    let mut tuple = (1, 2);

    tuple[0] = 1;

    tuple.1[0] = 1;
}
