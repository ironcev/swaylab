fn main() {
 let n = 1;
 
 let _x = match n {
     1 | 2 | _ => 0,
     3 => 1,
     4 => 2,
 };

 let _x = match n {
     _ => 0,
     3 => 1,
     4 => 2,
 };

 let b = true;
 
 let _x = match b {
     true | false => 0,
     true => 1,
 };
}


// warning: unreachable pattern
//  --> src/main.rs:6:6
//   |
// 6 |      3 => 1,
//   |      ^
//   |
//   = note: `#[warn(unreachable_patterns)]` on by default
// 
// warning: unreachable pattern
//  --> src/main.rs:7:6
//   |
// 7 |      4 => 2,
//   |      ^
// 
// warning: unreachable pattern
//   --> src/main.rs:12:6
//    |
// 11 |      _ => 0,
//    |      - matches any value
// 12 |      3 => 1,
//    |      ^ unreachable pattern
// 
// warning: unreachable pattern
//   --> src/main.rs:13:6
//    |
// 11 |      _ => 0,
//    |      - matches any value
// 12 |      3 => 1,
// 13 |      4 => 2,
//    |      ^ unreachable pattern
// 
// warning: unreachable pattern
//   --> src/main.rs:20:6
//    |
// 20 |      true => 1,
//    |      ^^^^
