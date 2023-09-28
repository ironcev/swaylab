use crate::lib_traits::*;

pub fn my_func_01<A>(_x: A) -> u64
    where A: MyTrait
{
    0
}

pub fn my_func_02<A, B>(_x: A, _y: B) -> u64
    where A: MyTrait,
          B: MySecondTrait
{
    0
}
