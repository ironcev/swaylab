pub fn play() {
    let mut x = 0u8;

    let r_x_1: &u8 = &&x;

    *r_x_1 = 1;

    let r_x_2 = &mut &x;

    *r_x_2 = 1;
}

// error[E0594]: cannot assign to `*r_x`, which is behind a `&` reference
//  --> src/play01.rs:6:5
//   |
// 6 |     *r_x = 1;
//   |     ^^^^^^^^ `r_x` is a `&` reference, so the data it refers to cannot be written
//   |
// help: consider changing this to be a mutable reference
//   |
// 4 |     let r_x: &u8 = &mut x;
//   |                     +++


// error[E0308]: mismatched types
//   --> src/play02.rs:10:14
//    |
// 10 |     *r_x_2 = 1;
//    |     ------   ^ expected `&u8`, found integer
//    |     |
//    |     expected due to the type of this binding
//    |
// help: consider borrowing here
//    |
// 10 |     *r_x_2 = &1;
//    |              +