fn play01() {
    let o: Option<u8> = Option::Some(123u64);
    match o {
        Some(x) => x == 123u8,
        _ => false,
    };
}


// error[E0308]: mismatched types
//    --> src/lib.rs:2:38
//     |
// 2   |     let o: Option<u8> = Option::Some(123u64);
//     |                         ------------ ^^^^^^ expected `u8`, found `u64`
//     |                         |
//     |                         arguments to this enum variant are incorrect
//     |
// help: the type constructed contains `u64` due to the type of the argument passed
//    --> src/lib.rs:2:25
//     |
// 2   |     let o: Option<u8> = Option::Some(123u64);
//     |                         ^^^^^^^^^^^^^------^
//     |                                      |
//     |                                      this argument influences the type of `Option`
// note: tuple variant defined here
//    --> /playground/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/option.rs:578:5
//     |
// 578 |     Some(#[stable(feature = "rust1", since = "1.0.0")] T),
//     |     ^^^^
// help: change the type of the numeric literal from `u64` to `u8`
//     |
// 2   |     let o: Option<u8> = Option::Some(123u8);
//     |                                         ~~
// 
// For more information about this error, try `rustc --explain E0308`.
