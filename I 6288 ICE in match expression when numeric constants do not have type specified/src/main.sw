script;

struct S {
    x: u64,
}

fn main() {
    let s = S { x: 0 };
    let _ = match s {
        S { x: 0 } => 0,
        S { x: 0u64 } => 0,
        _ => 0,
    };
}
