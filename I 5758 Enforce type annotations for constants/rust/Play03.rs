trait ConstantId {
    const ID: u32;
}

trait OtherConstantId {
    const ID: u32;
}

struct Struct { }

impl Struct {
    const ID: u32 = 3;
}

impl ConstantId for Struct {
    const ID: u32 = 5;
}

impl OtherConstantId for Struct {
    const ID: u32 = 7;
}

fn test() {
    assert_eq!(3, Struct::ID);
    assert_eq!(5, <Struct as ConstantId>::ID);
    assert_eq!(7, <Struct as OtherConstantId>::ID);
}

fn main() {
    test();
}

