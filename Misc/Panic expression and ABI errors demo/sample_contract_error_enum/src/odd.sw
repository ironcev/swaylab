library;

use ::errors::EvenOddError;

pub fn check_odd(value: u64) {
    if value % 2 == 0 {
        panic EvenOddError::NotOdd(value);
    }
}