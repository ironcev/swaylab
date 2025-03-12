library;

use core::ops::*;

struct S {}

impl core::ops::Add for S {
    fn add(self, other: Self) -> Self {
        Self {}
    }
}

fn core() {}

fn main() {
    use core::ops::*;
    let _ = 0;

    core();
}
