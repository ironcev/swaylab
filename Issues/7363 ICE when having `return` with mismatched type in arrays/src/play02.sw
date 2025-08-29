library;

fn in_array() -> u64 {
    let _ = [return true, return true];
    // error: Internal compiler error: Verification failed: Function in_array_2 return type must match its RET instructions.
    42
}

fn in_length_1_array() -> u64 {
    let _ = [return true];
    42
}

fn in_length_2_array_first() -> u64 {
    let _ = [return true, 0];
    42
}

fn in_length_2_array_second() -> u64 {
    let _ = [0, return true];
    42
}

pub fn play() {
    let _ = in_array();
    let _ = in_length_1_array();
    let _ = in_length_2_array_first();
    let _ = in_length_2_array_second();
}