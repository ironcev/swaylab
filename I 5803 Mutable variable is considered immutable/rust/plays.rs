pub fn play() {
    let _ = std;
    let _ = std::ops;

    f(std);
    f(std::ops);

    std = 0;
    std::ops = 0;
}

fn f(_x: u8) { }


//    Compiling playground v0.0.1 (/playground)
// error[E0423]: expected value, found crate `std`
//  --> src/lib.rs:2:13
//   |
// 2 |     let _ = std;
//   |             ^^^ not a value
// 
// error[E0423]: expected value, found module `std::ops`
//  --> src/lib.rs:3:13
//   |
// 3 |     let _ = std::ops;
//   |             ^^^^^^^^ not a value
// 
// error[E0423]: expected value, found crate `std`
//  --> src/lib.rs:5:7
//   |
// 5 |     f(std);
//   |       ^^^ not a value
// 
// error[E0423]: expected value, found module `std::ops`
//  --> src/lib.rs:6:7
//   |
// 6 |     f(std::ops);
//   |       ^^^^^^^^ not a value
// 
// error[E0423]: expected value, found crate `std`
//  --> src/lib.rs:8:5
//   |
// 8 |     std = 0;
//   |     ^^^
//   |
// help: you might have meant to introduce a new binding
//   |
// 8 |     let std = 0;
//   |     +++
// 
// error[E0423]: expected value, found module `std::ops`
//  --> src/lib.rs:9:5
//   |
// 9 |     std::ops = 0;
//   |     ^^^^^^^^
//   |
// help: you might have meant to introduce a new binding
//   |
// 9 |     std::let ops = 0;
//   |          +++
// 
// For more information about this error, try `rustc --explain E0423`.
