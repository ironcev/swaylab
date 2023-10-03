library;

struct Struct {
    x: u64,
    y: u64,
    z: u64,
}

pub fn play() -> () {
    let s = Struct { x: 111, y: 222, z: 333, };

    let _x = match s {
        Struct { x, y: _, z: _ } | Struct { x: _, y: x, z: _ } | Struct { x: _, y: _, z: x } => x,
        _ => 9999,
    };

// if true {
//     let x = __match_return_var_name_1.z;
//     x
// }
// else {
//     9999
// }
}
