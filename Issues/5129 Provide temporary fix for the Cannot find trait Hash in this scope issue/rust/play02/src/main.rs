mod lib_traits;
mod lib_types;
mod lib_types_impls;
mod lib_funcs;

use lib_types::MyStruct;
// use lib_types_impls::*;
use lib_funcs::{my_func_01, my_func_02};

// use lib_traits::*;

fn main() {
    let _x = my_func_01(MyStruct {});
    let _x = my_func_02(MyStruct {}, MyStruct {});

    print!("Hello Traits!");
}


impl MyTrait for u32 {
    
}

// error[E0405]: cannot find trait `MyTrait` in this scope
//   --> src\main.rs:20:6
//    |
// 20 | impl MyTrait for u32 {
//    |      ^^^^^^^ not found in this scope
//    |
// help: consider importing this trait
//    |
// 6  + use crate::lib_traits::MyTrait;