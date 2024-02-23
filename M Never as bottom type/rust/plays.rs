#![feature(never_type)]

fn play01() -> u64 {
    let x: ! = {
        return 123
    };
}

fn play02() -> u64 {
    let x: ! = 123u8;
    
    0
}

fn play03() -> u64 {
    let x: ! = panic!();
    
    0
}

fn play04() -> u64 {
    let x: u8 = panic!();
    
    0
}

fn play05() -> u64 {
    let x: u8 = {
        return 123
    };
}


// error[E0308]: mismatched types
//   --> src/lib.rs:10:16
//    |
// 10 |     let x: ! = 123u8;
//    |            -   ^^^^^ expected `!`, found `u8`
//    |            |
//    |            expected due to this
//    |
//    = note: expected type `!`
//               found type `u8`
// 
// warning: unreachable expression
//   --> src/lib.rs:18:5
//    |
// 16 |     let x: ! = panic!();
//    |                -------- any code following this expression is unreachable
// 17 |     
// 18 |     0
//    |     ^ unreachable expression
//    |
//    = note: `#[warn(unreachable_code)]` on by default
// 
// warning: unreachable expression
//   --> src/lib.rs:24:5
//    |
// 22 |     let x: u8 = panic!();
//    |                 -------- any code following this expression is unreachable
// 23 |     
// 24 |     0
//    |     ^ unreachable expression
// 
// warning: unused variable: `x`
//  --> src/lib.rs:4:9
//   |
// 4 |     let x: ! = {
//   |         ^ help: if this is intentional, prefix it with an underscore: `_x`
//   |
//   = note: `#[warn(unused_variables)]` on by default
// 
// warning: unused variable: `x`
//   --> src/lib.rs:16:9
//    |
// 16 |     let x: ! = panic!();
//    |         ^ help: if this is intentional, prefix it with an underscore: `_x`
// 
// warning: unused variable: `x`
//   --> src/lib.rs:22:9
//    |
// 22 |     let x: u8 = panic!();
//    |         ^ help: if this is intentional, prefix it with an underscore: `_x`
// 
// warning: unused variable: `x`
//   --> src/lib.rs:28:9
//    |
// 28 |     let x: u8 = {
//    |         ^ help: if this is intentional, prefix it with an underscore: `_x`
// 
// For more information about this error, try `rustc --explain E0308`.
// warning: `playground` (lib) generated 6 warnings
// error: could not compile `playground` (lib) due to 1 previous error; 6 warnings emitted
