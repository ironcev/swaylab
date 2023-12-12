library;

fn test_return_return() -> u64 {
    return return 0;
}

fn test_return_reassignment() -> u64 {
    let mut a = 0u64;
    return a = 1;
}

pub fn play() {
    let _ = test_return_return();
    let _ = test_return_reassignment();
}
