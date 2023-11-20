script;

mod my_trait;
mod lib;

use ::lib::S;
use ::my_trait::MyTrait;
use ::my_trait::MyTrait as MyTraitAlias;
// use std::hash::Hash as MyTraitAlias;

fn main() -> u64 {
    ::lib::func(S {})
}

// Either this:
// error
//   --> /home/igor/p/swaylab/I 5129 Provide temporary fix for the Cannot find trait Hash in this scope issue/sway/play06/src/main.sw:10:7
//    |
//  8 | 
//  9 | fn main() -> u64 {
// 10 |     ::lib::func(S {})
//    |       ^^^^^^^^^ Trait "MyTraitAlias" is not implemented for type "S".
// 11 | }
//    |
//
// or this:

// error
//   --> /home/igor/p/swaylab/I 5129 Provide temporary fix for the Cannot find trait Hash in this scope issue/sway/play06/src/lib.sw:16:14
//    |
// 14 | 
// 15 | pub fn func<T>(t: T) -> u64
// 16 |     where T: MyTraitAlias
//    |              ^^^^^^^^^^^^ Could not find symbol "MyTraitAlias" in this scope.
// 17 | {
// 18 |     t.my_fun()
//    |
// ____

// error
//   --> /home/igor/p/swaylab/I 5129 Provide temporary fix for the Cannot find trait Hash in this scope issue/sway/play06/src/lib.sw:16:14
//    |
// 14 | 
// 15 | pub fn func<T>(t: T) -> u64
// 16 |     where T: MyTraitAlias
//    |              ^^^^^^^^^^^^ Cannot find trait "MyTraitAlias" in this scope.
// 17 | {
// 18 |     t.my_fun()
//    |
//
// or as expected this:
// error
//  --> /home/igor/p/swaylab/I 5129 Provide temporary fix for the Cannot find trait Hash in this scope issue/sway/play06/src/my_trait.sw:4:8
//   |
// 2 | 
// 3 | pub trait MyTrait {
// 4 |     fn my_fun(self) -> u64;
//   |        ^^^^^^ Internal compiler error: Method my_fun_1 is a trait method dummy and was not properly replaced.
// Please file an issue on the repository and include the code that triggered this error.
// 5 | }
//   |
