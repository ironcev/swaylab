script;

struct S {}

impl S {
    const S_A: u8 = 11;
    const S_B: u8 = Self::S_A;
}

fn main() {
    let _ = S::S_B;
}