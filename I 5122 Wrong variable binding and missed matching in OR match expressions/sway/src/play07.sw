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

// Final:
{
    let __matched_or_variant_index_1: u64 = if (core::ops::eq(__matched_value_1.y, 222)
        && core::ops::eq(__matched_value_1.z, 333)) {
            1
        }
        else if (core::ops::eq(__matched_value_1.x, 101)
        && core::ops::eq(__matched_value_1.z, 303)) {
            2
        }
        else if (core::ops::eq(__matched_value_1.x, 101)
        && core::ops::eq(__matched_value_1.y, 202)) {
            3
        }
        else {
            0
        };

    if core::ops::neq(__matched_or_variant_index_1, 0) {
        let __matched_or_variant_variables_1: (u64) = if core::ops::eq(__matched_or_variant_index_1, 1) {
                (__matched_value_1.x)
            }
            else if core::ops::eq(__matched_or_variant_index_1, 2) {
                (__matched_value_1.y)
            }
            else if core::ops::eq(__matched_or_variant_index_1, 3) {
                (__matched_value_1.z)
            }
            else {
                __revert(14757395258967588865)
            };

        let x: u64 = __matched_or_variant_variables_1.0;
        x
    }
    else if true {
        9999
    }
    else {
        __revert(14757395258967588866)
    }
}


// First step (variables still not properly extracted):
// if ((core::ops::eq(__match_return_var_name_1.y, 222)
// && core::ops::eq(__match_return_var_name_1.z, 333))
// || ((core::ops::eq(__match_return_var_name_1.x, 101)
// && core::ops::eq(__match_return_var_name_1.z, 303))
// || (core::ops::eq(__match_return_var_name_1.x, 101)
// && core::ops::eq(__match_return_var_name_1.y, 202)))) {
//     let x = __match_return_var_name_1.x;
//     let x = __match_return_var_name_1.y;
//     let x = __match_return_var_name_1.z;
//     x
// }
// else {
//     9999
// }

// Original;
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
