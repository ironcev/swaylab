library;

pub fn play() -> () {
    let s = (0u64, 0u64);

    let _x = match s {
        (11, 111) | (22, 222) | (33, 333) => 5555,
        _ => 9999,
    };

// First step (variables still not properly extracted):
// if ((core::ops::eq(__match_return_var_name_1.0, 11)
// && core::ops::eq(__match_return_var_name_1.1, 111))
// || ((core::ops::eq(__match_return_var_name_1.0, 22)
// && core::ops::eq(__match_return_var_name_1.1, 222))
// || (core::ops::eq(__match_return_var_name_1.0, 33)
// && core::ops::eq(__match_return_var_name_1.1, 333)))) {
//     5555
// }
// else {
//     9999
// }

// Original:
// if ((core::ops::eq(__match_return_var_name_1.0, 33)
// || (core::ops::eq(__match_return_var_name_1.0, 22)
// || core::ops::eq(__match_return_var_name_1.0, 11)))
// && ((core::ops::eq(__match_return_var_name_1.1, 333)
// || (core::ops::eq(__match_return_var_name_1.0, 22)
// || core::ops::eq(__match_return_var_name_1.0, 11)))
// && ((core::ops::eq(__match_return_var_name_1.0, 33)
// || (core::ops::eq(__match_return_var_name_1.1, 222)
// || core::ops::eq(__match_return_var_name_1.0, 11)))
// && ((core::ops::eq(__match_return_var_name_1.1, 333)
// || (core::ops::eq(__match_return_var_name_1.1, 222)
// || core::ops::eq(__match_return_var_name_1.0, 11)))
// && ((core::ops::eq(__match_return_var_name_1.0, 33)
// || (core::ops::eq(__match_return_var_name_1.0, 22)
// || core::ops::eq(__match_return_var_name_1.1, 111)))
// && ((core::ops::eq(__match_return_var_name_1.1, 333)
// || (core::ops::eq(__match_return_var_name_1.0, 22)
// || core::ops::eq(__match_return_var_name_1.1, 111)))
// && ((core::ops::eq(__match_return_var_name_1.0, 33)
// || (core::ops::eq(__match_return_var_name_1.1, 222)
// || core::ops::eq(__match_return_var_name_1.1, 111)))
// && (core::ops::eq(__match_return_var_name_1.1, 333)
// || (core::ops::eq(__match_return_var_name_1.1, 222)
// || core::ops::eq(__match_return_var_name_1.1, 111)))))))))) {
//     5555
// }
// else {
//     9999
// }
}
