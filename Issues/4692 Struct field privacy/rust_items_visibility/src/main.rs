mod top;
mod some_lib;
mod rand;

use ::rand::*;
use rand::*;

use ::std::assert;

pub fn main() {
    top::middle::use_private_middle_struct();
    top::middle::bottom::use_private_bottom_struct();
    top::use_items_from_middle();

    rand::rand_fn();

    rand_fn();

    thread_rng();

    assert!(true);

    some_lib::lib_fn(); // As expected, stack overflow.
}

pub fn fn_in_main() {}
