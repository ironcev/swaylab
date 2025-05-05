library;

pub fn check_even(value: u64) {
    if value % 2 != 0 {
        panic "Value was not an even number.";
    }
}