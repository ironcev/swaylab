mod lib;

use lib::*;

trait Trait {}

impl<T> Trait for Option<T> {}

fn main() {
    println!("Hello, traits!");
}
