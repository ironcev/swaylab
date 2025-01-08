fn main() {
    let v = 0u64;
    match v {
        1 => (),
        1 | 1 => (),
        _ => (),
    };
}

// warning: unreachable pattern
//  --> src/main.rs:6:9
//   |
// 6 |         1 | 1 => (),
//   |         ^^^^^
//   |
//   = note: `#[warn(unreachable_patterns)]` on by default
