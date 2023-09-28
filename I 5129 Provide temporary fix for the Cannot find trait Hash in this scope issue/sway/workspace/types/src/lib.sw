library;

use traits::MyTrait;
use std::hash::{Hash, Hasher};

pub struct MyType<T>
    where T: MyTrait
{
    t: T
}

pub fn my_function<T>(_t: T) -> u64
    where T: MyTrait
{
    0
}

impl<T> MyTrait for MyType<T>
    where T: MyTrait
{
    fn trait_func(self) -> u64 {
        11
    }
}

impl MyTrait for u32 {
    fn trait_func(self) -> u64 {
        self.as_u64().trait_func() // Importing MyTrait imports the impls.
    }
}

pub struct MyStruct { }

impl MyTrait for MyStruct {
    fn trait_func(self) -> u64 {
        111
    }
}

impl Hash for MyStruct {
    fn hash(self, ref mut state: Hasher) {
        state.write_str("");
    }
}

pub enum MyEnum {
    A: ()
}

impl Hash for MyEnum {
    fn hash(self, ref mut state: Hasher) {
        state.write_str("");
    }
}

impl MyTrait for MyEnum {
    fn trait_func(self) -> u64 {
        222
    }
}

// ERROR: Conflicting implementations of trait "Eq" for type "u32".
// impl Eq for u32 {
//     fn eq(self, other: Self) -> bool {
//         true
//     } 
// }

impl AsRawSlice for u32 { // Compiles fine. Orpahan rule not applicable.
    fn as_raw_slice(self) -> raw_slice {
        let vec = Vec::<u32>::new();

        vec.as_raw_slice()
    }
}