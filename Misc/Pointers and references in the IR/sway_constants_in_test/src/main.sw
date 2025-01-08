script;

struct S { }

impl S {
    const S_C: u64 = 0;
}

fn main() {}

#[test]
fn test() {
    let a = S::S_C;
}
