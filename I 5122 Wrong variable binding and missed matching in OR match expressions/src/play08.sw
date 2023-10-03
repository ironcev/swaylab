library;

struct Struct {
    x: u64,
    y: u64,
    z: u64,
}

pub fn play() -> () {
    let s = Struct { x: 111, y: 222, z: 333, };

    let _x = match s {
        Struct { x: 111, y: 122, z: 133 } | Struct { x: 211, y: 222, z: 233 } | Struct { x: 311, y: 322, z: 333 } => 5555,
        _ => 9999,
    };

// if ((core::ops::eq(__match_return_var_name_1.x, 311)
// || (core::ops::eq(__match_return_var_name_1.x, 211)
// || core::ops::eq(__match_return_var_name_1.x, 111)))
// && ((core::ops::eq(__match_return_var_name_1.y, 322)
// || (core::ops::eq(__match_return_var_name_1.x, 211)
// || core::ops::eq(__match_return_var_name_1.x, 111)))
// && ((core::ops::eq(__match_return_var_name_1.z, 333)
// || (core::ops::eq(__match_return_var_name_1.x, 211)
// || core::ops::eq(__match_return_var_name_1.x, 111)))
// && ((core::ops::eq(__match_return_var_name_1.x, 311)
// || (core::ops::eq(__match_return_var_name_1.y, 222)
// || core::ops::eq(__match_return_var_name_1.x, 111)))
// && ((core::ops::eq(__match_return_var_name_1.y, 322)
// || (core::ops::eq(__match_return_var_name_1.y, 222)
// || core::ops::eq(__match_return_var_name_1.x, 111)))
// && ((core::ops::eq(__match_return_var_name_1.z, 333)
// || (core::ops::eq(__match_return_var_name_1.y, 222)
// || core::ops::eq(__match_return_var_name_1.x, 111)))
// && ((core::ops::eq(__match_return_var_name_1.x, 311)
// || (core::ops::eq(__match_return_var_name_1.z, 233)
// || core::ops::eq(__match_return_var_name_1.x, 111)))
// && ((core::ops::eq(__match_return_var_name_1.y, 322)
// || (core::ops::eq(__match_return_var_name_1.z, 233)
// || core::ops::eq(__match_return_var_name_1.x, 111)))
// && ((core::ops::eq(__match_return_var_name_1.z, 333)
// || (core::ops::eq(__match_return_var_name_1.z, 233)
// || core::ops::eq(__match_return_var_name_1.x, 111)))
// && ((core::ops::eq(__match_return_var_name_1.x, 311)
// || (core::ops::eq(__match_return_var_name_1.x, 211)
// || core::ops::eq(__match_return_var_name_1.y, 122)))
// && ((core::ops::eq(__match_return_var_name_1.y, 322)
// || (core::ops::eq(__match_return_var_name_1.x, 211)
// || core::ops::eq(__match_return_var_name_1.y, 122)))
// && ((core::ops::eq(__match_return_var_name_1.z, 333)
// || (core::ops::eq(__match_return_var_name_1.x, 211)
// || core::ops::eq(__match_return_var_name_1.y, 122)))
// && ((core::ops::eq(__match_return_var_name_1.x, 311)
// || (core::ops::eq(__match_return_var_name_1.y, 222)
// || core::ops::eq(__match_return_var_name_1.y, 122)))
// && ((core::ops::eq(__match_return_var_name_1.y, 322)
// || (core::ops::eq(__match_return_var_name_1.y, 222)
// || core::ops::eq(__match_return_var_name_1.y, 122)))
// && ((core::ops::eq(__match_return_var_name_1.z, 333)
// || (core::ops::eq(__match_return_var_name_1.y, 222)
// || core::ops::eq(__match_return_var_name_1.y, 122)))
// && ((core::ops::eq(__match_return_var_name_1.x, 311)
// || (core::ops::eq(__match_return_var_name_1.z, 233)
// || core::ops::eq(__match_return_var_name_1.y, 122)))
// && ((core::ops::eq(__match_return_var_name_1.y, 322)
// || (core::ops::eq(__match_return_var_name_1.z, 233)
// || core::ops::eq(__match_return_var_name_1.y, 122)))
// && ((core::ops::eq(__match_return_var_name_1.z, 333)
// || (core::ops::eq(__match_return_var_name_1.z, 233)
// || core::ops::eq(__match_return_var_name_1.y, 122)))
// && ((core::ops::eq(__match_return_var_name_1.x, 311)
// || (core::ops::eq(__match_return_var_name_1.x, 211)
// || core::ops::eq(__match_return_var_name_1.z, 133)))
// && ((core::ops::eq(__match_return_var_name_1.y, 322)
// || (core::ops::eq(__match_return_var_name_1.x, 211)
// || core::ops::eq(__match_return_var_name_1.z, 133)))
// && ((core::ops::eq(__match_return_var_name_1.z, 333)
// || (core::ops::eq(__match_return_var_name_1.x, 211)
// || core::ops::eq(__match_return_var_name_1.z, 133)))
// && ((core::ops::eq(__match_return_var_name_1.x, 311)
// || (core::ops::eq(__match_return_var_name_1.y, 222)
// || core::ops::eq(__match_return_var_name_1.z, 133)))
// && ((core::ops::eq(__match_return_var_name_1.y, 322)
// || (core::ops::eq(__match_return_var_name_1.y, 222)
// || core::ops::eq(__match_return_var_name_1.z, 133)))
// && ((core::ops::eq(__match_return_var_name_1.z, 333)
// || (core::ops::eq(__match_return_var_name_1.y, 222)
// || core::ops::eq(__match_return_var_name_1.z, 133)))
// && ((core::ops::eq(__match_return_var_name_1.x, 311)
// || (core::ops::eq(__match_return_var_name_1.z, 233)
// || core::ops::eq(__match_return_var_name_1.z, 133)))
// && ((core::ops::eq(__match_return_var_name_1.y, 322)
// || (core::ops::eq(__match_return_var_name_1.z, 233)
// || core::ops::eq(__match_return_var_name_1.z, 133)))
// && (core::ops::eq(__match_return_var_name_1.z, 333)
// || (core::ops::eq(__match_return_var_name_1.z, 233)
// || core::ops::eq(__match_return_var_name_1.z, 133))))))))))))))))))))))))))))) {
//     5555
// }
// else {
//     9999
// }
}
