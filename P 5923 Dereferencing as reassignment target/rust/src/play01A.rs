pub fn play() {
    let mut x = 0u8;

    let r_x: &u8 = &x;

    *r_x = 1;
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