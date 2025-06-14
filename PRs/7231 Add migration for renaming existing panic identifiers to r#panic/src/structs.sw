library;

struct Struct {
    panic: u64,
}

pub fn play() -> u64 {
    let panic = 42;
    let panic = Struct {
        panic: panic + panic,
    };

    let panic = panic.panic;

    panic
}
