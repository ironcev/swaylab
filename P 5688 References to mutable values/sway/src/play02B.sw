library;

pub fn play() {
    let ref_test: u64 = &123;

    let _ = *ref_test == 123;
}
