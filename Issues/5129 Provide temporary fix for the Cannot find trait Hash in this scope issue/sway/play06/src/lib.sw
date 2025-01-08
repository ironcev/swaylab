library;

use ::my_trait::MyTrait;
use ::my_trait::MyTrait as MyTraitAlias;

pub struct S {}

impl MyTraitAlias for S {
//impl MyTrait for S {
    fn my_fun(self) -> u64 {
        11
    }
}

pub fn func<T>(t: T) -> u64
    where T: MyTraitAlias
{
    t.my_fun()
}
