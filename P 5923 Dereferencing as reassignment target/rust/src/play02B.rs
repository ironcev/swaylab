struct S {
    x: u8,
}

pub fn play() {
    let mut x = S { x: 0u8 };

    let r_x_1 = &mut &mut x;

    **r_x_1 = S { x: 1u8 };
}
