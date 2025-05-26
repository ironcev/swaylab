library;

pub fn check_odd(value: u64) {
    if value % 2 == 0 {
        panic "Value was not an odd number.";
    }
}