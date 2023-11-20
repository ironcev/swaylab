script;

mod lib;

use ::lib::S;
// use ::lib::MyTrait;

pub trait MyTrait {
    fn my_fun(self) -> u64;
}

impl MyTrait for S {
    fn my_fun(self) -> u64 {
        22
    }
}

fn main() -> u64 {
    ::lib::func(S {})
}

// warning
//   --> /home/igor/p/swaylab/I 5129 Provide temporary fix for the Cannot find trait Hash in this scope issue/sway/play05/src/main.sw:8:11
//    |
//  6 | 
//  7 | 
//  8 | pub trait MyTrait {
//    |           ------- This trait is never implemented.
//  9 |     fn my_fun(self) -> u64;
// 10 | }
//    |
// ____

// error
//   --> /home/igor/p/swaylab/I 5129 Provide temporary fix for the Cannot find trait Hash in this scope issue/sway/play05/src/main.sw:12:1
//    |
// 10 |   
// 11 |   
// 12 | / impl MyTrait for S {
// 13 | |     fn my_fun(self) -> u64 {
// 14 | |         22
// 15 | |     }
// 16 | | }
//    | |_^ Conflicting implementations of trait "MyTrait" for type "S".
// 17 |   
// 18 |   fn main() -> u64 {
//    |
// ____
