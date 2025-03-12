script;

mod core_fn;

use core::ops::*;

struct S {}

impl core::ops::Add for S {
    fn add(self, other: Self) -> Self {
        Self {}
    }
}

fn main() {
    use core::ops::*;
    let _ = 0;

    let _ = core::codec::encode(0u64);
}
