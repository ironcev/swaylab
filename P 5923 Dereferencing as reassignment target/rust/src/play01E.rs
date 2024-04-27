pub fn play() {
    let mut x = 0u8;

    let r_x_1 = &mut &mut x;

    **r_x_1 = 1;

    let r_x_2 = &&mut x;

    let r_x_2 = *r_x_2;
//     error[E0507]: cannot move out of `*r_x_2` which is behind a shared reference
//   --> src/play01E.rs:10:17
//    |
// 10 |     let r_x_2 = *r_x_2;
//    |                 ^^^^^^ move occurs because `*r_x_2` has type `&mut u8`, which does not implement the `Copy` trait

    *r_x_2 = 1;
}
