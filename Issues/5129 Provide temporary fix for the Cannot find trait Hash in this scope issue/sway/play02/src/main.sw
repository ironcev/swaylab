script;

mod lib_traits;
mod lib_types;
mod lib_types_impls;
mod lib_funcs;

use lib_types::MyStruct;
//use lib_types_impls::*;
use lib_funcs::my_func;

use lib_traits::*;

fn main() {
    let _x = my_func(MyStruct {}, MyStruct {});
}
