trait ConstantId {
    const ID: u32;
}

trait GenericConstantId<T> {
    const ID: T;
}

struct Struct { }

impl Struct {
    const ID: u32 = 3;
}

impl ConstantId for Struct {
    const ID: u32 = 5;
}

impl GenericConstantId<u64> for Struct {
    const ID: u64 = 7;
}

fn test() {
    assert_eq!(3, Struct::ID);
    assert_eq!(5, <Struct as ConstantId>::ID);
    assert_eq!(7, <Struct as GenericConstantId<u64>>::ID);
}

fn main() {
    test();
}

