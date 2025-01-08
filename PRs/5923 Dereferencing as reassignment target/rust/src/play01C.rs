pub fn play() {
    let mut x = 0u8;

    let r_x_1 = &mut &x;

    **r_x_1 = 1;
}

// error[E0594]: cannot assign to `**r_x_1`, which is behind a `&` reference
//  --> src/play03.rs:6:5
//   |
// 6 |     **r_x_1 = 1;
//   |     ^^^^^^^^^^^ cannot assign