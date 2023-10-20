library;

pub fn play() -> () {
    let s = 0u64;

    let _x = match s {
        11 | 22 | 33 => 5555,
        _ => 9999,
    };

// First step (variables still not properly extracted):
// if (core::ops::eq(__match_return_var_name_1, 11)
// || (core::ops::eq(__match_return_var_name_1, 22)
// || core::ops::eq(__match_return_var_name_1, 33))) {
//     5555
// }
// else {
//     9999
// }

// Original:
// if (core::ops::eq(__match_return_var_name_1, 33)
// || (core::ops::eq(__match_return_var_name_1, 22)
// || core::ops::eq(__match_return_var_name_1, 11))) {
//     5555
// }
// else {
//     9999
// }
}
