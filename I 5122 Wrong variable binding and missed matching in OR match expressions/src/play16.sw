library;

pub fn play() -> () {
    let s = (0u64, 0u64);

    if let (_, x) = s {
        let _a = x + x;
        _a
    };

// Mismatched types.
// expected: u64
// found:    ().
// help: all branches of a match statement must return the same type
}
