library;

use types::my_function;

// Without this we will get these two errors when calling `my_function<u64>()`:
//  Could not find symbol "MyTrait" in this scope.
//  Cannot find trait "MyTrait" in this scope.
use traits::MyTrait; // Imports all the impls.

use types::MyStruct; // Imports the impls as well.

use types::*; // To import AsRawSlice impl for u32.

pub fn use_traits_and_types<T>()
    where T: UsagesTrait01
{
    let x = 0u64;

    let _x = my_function(x);

    let x = MyStruct { };

    let _x = my_function(x);

    let x = 0u32;

    let _x = x.as_raw_slice();
}

pub trait UsagesTrait01 { }

pub struct UsagesStruct01 { }

impl UsagesTrait01 for UsagesStruct01 { }

pub trait UsagesTrait02 { }

pub struct UsagesStruct02<T>
    where T: UsagesTrait02
{
    t: T
}

pub enum UsagesEnum {
    A: ()
}

impl UsagesTrait02 for UsagesEnum { }

pub trait UsagesTrait03 { }

pub enum UsagesGenericEnum<T>
    where T: UsagesTrait03
{
    A: (T)
}

pub struct DummyStruct { }

impl UsagesTrait03 for DummyStruct { }

pub struct UsagesStruct { }

impl UsagesStruct {
    pub fn struct_fn<T>()
        where T: UsagesTrait01
    {
    }

    pub fn struct_method<T>(self)
        where T: UsagesTrait01
    {
    }
}