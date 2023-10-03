library;

struct StructA { }

struct StructB {
    a: StructA,
}

pub fn play() -> () {
    let a = StructA { };
    let s = StructB { a };

    let _x = match s {
        StructB { a: StructA {} } => 5555,
        _ => 9999,
    };

// if true {
//     5555
// }
// else {
//     9999
// }
}
