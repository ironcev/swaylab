library;

pub fn check_number(number: u64) {
    assert(number % 2 == 0);
    assert(number % 3 == 0);
    assert(number >= 10);
}
