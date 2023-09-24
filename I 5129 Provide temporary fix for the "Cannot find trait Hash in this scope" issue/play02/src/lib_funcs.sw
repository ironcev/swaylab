library;

use ::lib_traits::*;

pub fn my_func<A, B>(_x: A, _y: B) -> u64
    where A: MyTrait,
          B: MySecondTrait
{
    0
}
