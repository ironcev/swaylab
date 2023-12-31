library;

struct Struct {
    x: u64,
    y: u64,
    z: u64,
}

fn test_inc(ref mut i: u64) -> Struct {
    i = i + 11;

    Struct {
        x: 0,
        y: 0,
        z: 0,
    }
}

pub fn play() {
    let mut i = 0;

    if let Struct { x, y, z: 0 } = test_inc(i) {
        let _a = x + y;
    };

// Fixed:
// if core::ops::eq(__match_return_var_name_1.z, 0) {
//     let x: u64 = __match_return_var_name_1.x;
//     let y: u64 = __match_return_var_name_1.y;
//     let _a: u64 = core::ops::add(x, y);
// }
// else {
// }

// Original:
// if core::ops::eq(test_inc(i).z, 0) {
//     let x = test_inc(i).x;
//     let y = test_inc(i).y;
//     let _a = core::ops::add(x, y);
// }
// else {
// }
}