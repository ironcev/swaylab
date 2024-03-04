script;

mod lib;

use lib::*;

trait Trait {}

impl Trait for u64 {}

fn main() -> u64 {
  100 << 2
}
