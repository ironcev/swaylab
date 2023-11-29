library;

use std::hash::Hash;

pub trait EmptyTrait {}

pub trait Trait {
    fn method(self) -> u64;
}

pub struct S<H, E, T>
where H: Hash,
      E: EmptyTrait,
      T: Trait
{
    x: H,
    y: E,
    z: T,
}

pub struct A {}

impl EmptyTrait for A {}

impl Trait for A {
    fn method(self) -> u64 {
        0
    }
}