library;

pub trait MyTrait {
    fn my_fun(self) -> u64;
}

pub struct S {}

impl MyTrait for S {
    fn my_fun(self) -> u64 {
        11
    }
}

pub fn func<T>(t: T) -> u64
    where T: MyTrait
{
    t.my_fun()
}
