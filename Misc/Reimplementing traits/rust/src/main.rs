mod lib;
mod lib_b;

use lib::*;

// use std::ops::Not;

trait Trait {}

trait Not {
    fn my_not(&self) -> bool;
}

impl<T> Trait for Option<T> {}

impl<T> Not for Option<T> {
    fn my_not(&self) -> bool {
        self.is_none()
    }
}

fn main() {
    println!("Hello, traits!");
}
