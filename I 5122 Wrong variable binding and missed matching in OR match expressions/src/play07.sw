library;

struct Struct {
    x: u64,
    y: u64,
    z: u64,
}

pub fn play() -> () {
    let s = Struct { x: 111, y: 222, z: 333, };

    let _x = match s {
        Struct { x, y: 222, z: 333 } | Struct { x: 101, y: x, z: 303 } | Struct { x: 101, y: 202, z: x } => x,
        _ => 9999,
    };

// if ((core::ops::eq(__match_return_var_name_1.x, 101)
// || (core::ops::eq(__match_return_var_name_1.x, 101)
// || core::ops::eq(__match_return_var_name_1.y, 222)))
// && ((core::ops::eq(__match_return_var_name_1.y, 202)
// || (core::ops::eq(__match_return_var_name_1.x, 101)
// || core::ops::eq(__match_return_var_name_1.y, 222)))
// && ((core::ops::eq(__match_return_var_name_1.x, 101)
// || core::ops::eq(__match_return_var_name_1.y, 222))
// && ((core::ops::eq(__match_return_var_name_1.x, 101)
// || core::ops::eq(__match_return_var_name_1.y, 222))
// && ((core::ops::eq(__match_return_var_name_1.y, 202)
// || core::ops::eq(__match_return_var_name_1.y, 222))
// && (core::ops::eq(__match_return_var_name_1.y, 222)
// && ((core::ops::eq(__match_return_var_name_1.x, 101)
// || (core::ops::eq(__match_return_var_name_1.z, 303)
// || core::ops::eq(__match_return_var_name_1.y, 222)))
// && ((core::ops::eq(__match_return_var_name_1.y, 202)
// || (core::ops::eq(__match_return_var_name_1.z, 303)
// || core::ops::eq(__match_return_var_name_1.y, 222)))
// && ((core::ops::eq(__match_return_var_name_1.z, 303)
// || core::ops::eq(__match_return_var_name_1.y, 222))
// && ((core::ops::eq(__match_return_var_name_1.x, 101)
// || (core::ops::eq(__match_return_var_name_1.x, 101)
// || core::ops::eq(__match_return_var_name_1.z, 333)))
// && ((core::ops::eq(__match_return_var_name_1.y, 202)
// || (core::ops::eq(__match_return_var_name_1.x, 101)
// || core::ops::eq(__match_return_var_name_1.z, 333)))
// && ((core::ops::eq(__match_return_var_name_1.x, 101)
// || core::ops::eq(__match_return_var_name_1.z, 333))
// && ((core::ops::eq(__match_return_var_name_1.x, 101)
// || core::ops::eq(__match_return_var_name_1.z, 333))
// && ((core::ops::eq(__match_return_var_name_1.y, 202)
// || core::ops::eq(__match_return_var_name_1.z, 333))
// && (core::ops::eq(__match_return_var_name_1.z, 333)
// && ((core::ops::eq(__match_return_var_name_1.x, 101)
// || (core::ops::eq(__match_return_var_name_1.z, 303)
// || core::ops::eq(__match_return_var_name_1.z, 333)))
// && ((core::ops::eq(__match_return_var_name_1.y, 202)
// || (core::ops::eq(__match_return_var_name_1.z, 303)
// || core::ops::eq(__match_return_var_name_1.z, 333)))
// && (core::ops::eq(__match_return_var_name_1.z, 303)
// || core::ops::eq(__match_return_var_name_1.z, 333))))))))))))))))))) {
//     let x = __match_return_var_name_1.z;
//     x
// }
// else {
//     9999
// }
}
