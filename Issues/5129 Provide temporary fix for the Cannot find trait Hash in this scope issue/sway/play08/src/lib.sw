library;

use std::hash::Hash;

pub trait FirstTrait {}

pub trait SecondTrait<T> {
    fn trait_method(self, t: T) where T: FirstTrait;
    fn trait_associated_function(t: T) where T: FirstTrait;
}

pub trait GenericTrait<T> {}

pub trait DuplicatedTrait {}

pub struct FirstStruct<T> where T: FirstTrait {}

pub struct A {}

impl<T> FirstStruct<T> where T: FirstTrait {
    pub fn method(self, t: T) { }
}

pub struct SecondStruct<T> where T: Hash {}

impl<T> SecondStruct<T> where T: Hash {
    pub fn method(self, t: T) { }
}

pub struct ThirdStruct {}

impl ThirdStruct {
    pub fn method_01<T>(self, t: T) where T: Hash { }
    pub fn method_02<T>(self, t: T) where T: FirstTrait { }

    pub fn associated_function<T>(t: T) where T: FirstTrait { }
}

pub fn function<T>(t: T) where T: FirstTrait + GenericTrait<u8> { }