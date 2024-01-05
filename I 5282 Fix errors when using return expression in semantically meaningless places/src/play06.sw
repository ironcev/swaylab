library;

#[inline(never)]
pub fn play() -> u64 {
    let _ = __size_of_val(return 123u64);

    42
}
