library;

struct S {}

impl S {
    fn method(self, a: u64) -> u64 {
        a
    }
}

pub fn play() {
    let _ = S {}.method(non_existing);
}
