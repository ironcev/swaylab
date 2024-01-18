mod lib;

use lib::LibStruct;

struct MainStruct {
    pub x_1: u64,
    pub x_2: u64,
    y_1: u64,
    y_2: u64,
}

impl MainStruct {
    pub fn new() -> Self {
        Self { x_1: 0, x_2: 0, y_1: 0, y_2: 0 }
    }
}

fn main() {
    let ls = LibStruct::new();

    // let _ = match ls {
    //     LibStruct { x_1: 0, x_2: 0 } => 1,
    //     LibStruct { x_1: 0, y_1: 0 } => 1,
    //     LibStruct { y_1: 0, y_2: 0 } => 1,
    //     LibStruct { y_1: 0, y_2: 0, .. } => 1,
    //     LibStruct { x_1: 0, y_2: 0, .. } => 1,
    //     _ => 0
    // };

    // let LibStruct { x_1, x_2 } = ls;
    // let LibStruct { x_1, y_1 } = ls;
    let LibStruct { x_1, x_2, y_1, y_2 } = ls;

    let ms = MainStruct::new();

    // let _ = match ms {
    //     MainStruct { x_1: 0, x_2: 0 } => 1,
    //     MainStruct { x_1: 0, y_1: 0 } => 1,
    //     MainStruct { y_1: 0, y_2: 0 } => 1,
    //     MainStruct { y_1: 0, y_2: 0, .. } => 1,
    //     MainStruct { x_1: 0, y_2: 0, .. } => 1,
    //     _ => 0
    // };

    //  MainStruct { x_1, x_2 } = ms;
     MainStruct { x_1, x_2, .. } = ms;
    // MainStruct { x_1, y_1 } = ms;
    // MainStruct { x_1: 0, x_2, y_1, y_2 } = ms;
}

// LibStruct { x_1: 0, x_2: 0 } => 1,
// error: pattern requires `..` due to inaccessible fields
//  --> src/main.rs:9:9
//   |
// 9 |         LibStruct { x_1: 0, x_2: 0 } => 1,
//   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//   |
// help: ignore the inaccessible and unused fields
//   |
// 9 |         LibStruct { x_1: 0, x_2: 0, .. } => 1,
//   |                                   ++++


// LibStruct { x_1: 0, y_1: 0 } => 1,
// error[E0027]: pattern does not mention field `x_2` and inaccessible fields
//   --> src/main.rs:10:9
//    |
// 10 |         LibStruct { x_1: 0, y_1: 0 } => 1,
//    |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing field `x_2` and inaccessible fields
//    |
// help: include the missing field in the pattern and ignore the inaccessible fields
//    |
// 10 |         LibStruct { x_1: 0, y_1: 0, x_2, .. } => 1,
//    |                                   ~~~~~~~~~~~
// help: if you don't care about this missing field, you can explicitly ignore it
//    |
// 10 |         LibStruct { x_1: 0, y_1: 0, .. } => 1,
//    |                                   ~~~~~~


// LibStruct { y_1: 0, y_2: 0 } => 1,
// error[E0027]: pattern does not mention fields `x_1`, `x_2`
//   --> src/main.rs:11:9
//    |
// 11 |         LibStruct { y_1: 0, y_2: 0 } => 1,
//    |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing fields `x_1`, `x_2`
//    |
// help: include the missing fields in the pattern
//    |
// 11 |         LibStruct { y_1: 0, y_2: 0, x_1, x_2 } => 1,
//    |                                   ~~~~~~~~~~~~
// help: if you don't care about these missing fields, you can explicitly ignore them
//    |
// 11 |         LibStruct { y_1: 0, y_2: 0, .. } => 1,
//    | 


// LibStruct { y_1: 0, y_2: 0, .. } => 1,
// error[E0451]: field `y_1` of struct `LibStruct` is private
//   --> src/main.rs:12:21
//    |
// 12 |         LibStruct { y_1: 0, y_2: 0, .. } => 1,
//    |                     ^^^^^^ private field

// error[E0451]: field `y_2` of struct `LibStruct` is private
//   --> src/main.rs:12:29
//    |
// 12 |         LibStruct { y_1: 0, y_2: 0, .. } => 1,
//    |                             ^^^^^^ private field


// let LibStruct { x_1, x_2} = ls;
// error: pattern requires `..` due to inaccessible fields
//   --> src/main.rs:17:9
//    |
// 17 |     let LibStruct { x_1, x_2} = ls;
//    |         ^^^^^^^^^^^^^^^^^^^^^
//    |
// help: ignore the inaccessible and unused fields
//    |
// 17 |     let LibStruct { x_1, x_2, ..} = ls;
//    |                             ++++


// let LibStruct { x_1, y_1} = ls;
// error[E0027]: pattern does not mention field `x_2` and inaccessible fields
//   --> src/main.rs:18:9
//    |
// 18 |     let LibStruct { x_1, y_1} = ls;
//    |         ^^^^^^^^^^^^^^^^^^^^^ missing field `x_2` and inaccessible fields
//    |
// help: include the missing field in the pattern and ignore the inaccessible fields
//    |
// 18 |     let LibStruct { x_1, y_1, x_2, .. } = ls;
//    |                             ~~~~~~~~~~~
// help: if you don't care about this missing field, you can explicitly ignore it
//    |
// 18 |     let LibStruct { x_1, y_1, .. } = ls;
//    |                             ~~~~~~


// MainStruct { x_1: 0, x_2: 0 } => 1,
// error[E0027]: pattern does not mention fields `y_1`, `y_2`
//   --> src/main.rs:36:9
//    |
// 36 |         MainStruct { x_1: 0, x_2: 0 } => 1,
//    |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing fields `y_1`, `y_2`
//    |
// help: include the missing fields in the pattern
//    |
// 36 |         MainStruct { x_1: 0, x_2: 0, y_1, y_2 } => 1,
//    |                                    ~~~~~~~~~~~~
// help: if you don't care about these missing fields, you can explicitly ignore them
//    |
// 36 |         MainStruct { x_1: 0, x_2: 0, .. } => 1,
//    |                                    ~~~~~~


// MainStruct { x_1, x_2 } = ms;
// error[E0027]: pattern does not mention fields `y_1`, `y_2`
//   --> src/main.rs:45:6
//    |
// 45 |      MainStruct { x_1, x_2 } = ms;
//    |      ^^^^^^^^^^^^^^^^^^^^^^^ missing fields `y_1`, `y_2`
//    |
// help: include the missing fields in the pattern
//    |
// 45 |      MainStruct { x_1, x_2, y_1, y_2 } = ms;
//    |                           ~~~~~~~~~~~~
// help: if you don't care about these missing fields, you can explicitly ignore them
//    |
// 45 |      MainStruct { x_1, x_2, .. } = ms;
//    |                           ~~~~~~


// MainStruct { x_1: 0, x_2, y_1, y_2 } = ms;
// error[E0070]: invalid left-hand side of assignment
//   --> src/main.rs:46:42
//    |
// 46 |     MainStruct { x_1: 0, x_2, y_1, y_2 } = ms;
//    |                       -                  ^
//    |                       |
//    |                       cannot assign to this expression
