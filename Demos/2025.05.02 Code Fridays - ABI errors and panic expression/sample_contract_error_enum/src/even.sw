library;

use ::errors::EvenOddError;

pub fn check_even(value: u64) {
    if value % 2 != 0 {
        panic EvenOddError::NotEven(value);
    }
}