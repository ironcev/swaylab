script;

struct Struct { }

impl Struct {
    const X = 5;
    fn a() -> u32 { 0 }
}

fn main() {
    log(Struct::X);
    log(Struct::a());
}

