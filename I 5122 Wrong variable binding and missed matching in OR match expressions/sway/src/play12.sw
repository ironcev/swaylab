library;

struct StructA {
    a: u64,
}

struct StructB {
    a: StructA,
}

pub fn play() -> () {
    const CONST_A = StructA { a: 1111 };
    let s = StructB { a: CONST_A };

    let _x = match s {
        StructB { a: CONST_A } => 5555,
        //           ^^^^^^^ Unimplemented feature: constant values of this type are not supported yet    
        _ => 9999,
    };
}
