library;

use std::bytes::Bytes;

pub trait MyTrait {
    fn trait_func(self) -> u64;
}

impl MyTrait for u64 { // u64 is in the prelude.
    fn trait_func(self) -> u64 {
        self
    }
}

impl MyTrait for Address { // Address is in the prelude.
    fn trait_func(self) -> u64 {
        10
    }
}

impl MyTrait for str[3] { // str is in the prelude.
    fn trait_func(self) -> u64 {
        10
    }
}

impl MyTrait for Bytes {
    fn trait_func(self) -> u64 {
        11
    }
}