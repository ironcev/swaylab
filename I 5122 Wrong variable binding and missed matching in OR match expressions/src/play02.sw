library;

enum Enum {
    A: (u64),
    B: (u64),
}

pub fn play() -> () {
    let e = Enum::A(0);

    let _x = match e {
        Enum::A(1) => 1011,
        Enum::B(11) => 2011,
        Enum::A(22) => 1022,
        Enum::B(22) => 2022,
        Enum::A(_) => 1099,
        Enum::B(_) => 2099,
    };

// Final:
// if (core::ops::eq(EnumTag(__matched_value_1), 0)
// && core::ops::eq(UnsafeDowncast(__matched_value_1, A: (u64), 1)) {
//     1011
// }
// else if (core::ops::eq(EnumTag(__matched_value_1), 1)
// && core::ops::eq(UnsafeDowncast(__matched_value_1, B: (u64), 11)) {
//     2011
// }
// else if (core::ops::eq(EnumTag(__matched_value_1), 0)
// && core::ops::eq(UnsafeDowncast(__matched_value_1, A: (u64), 22)) {
//     1022
// }
// else if (core::ops::eq(EnumTag(__matched_value_1), 1)
// && core::ops::eq(UnsafeDowncast(__matched_value_1, B: (u64), 22)) {
//     2022
// }
// else if core::ops::eq(EnumTag(__matched_value_1), 0) {
//     1099
// }
// else if core::ops::eq(EnumTag(__matched_value_1), 1) {
//     2099
// }
// else {
//     __revert(14757395258967588866)
// }

// Original:
// if core::ops::eq(EnumTag(__match_return_var_name_1), 0)
// && core::ops::eq(UnsafeDowncast(__match_return_var_name_1, A), 1) {
//     1011
// }
// else if core::ops::eq(EnumTag(__match_return_var_name_1), 1)
// && core::ops::eq(UnsafeDowncast(__match_return_var_name_1, B), 11) {
//     2011
// }
// else if core::ops::eq(EnumTag(__match_return_var_name_1), 0)
// && core::ops::eq(UnsafeDowncast(__match_return_var_name_1, A), 22) {
//     1022
// }
// else if core::ops::eq(EnumTag(__match_return_var_name_1), 1)
// && core::ops::eq(UnsafeDowncast(__match_return_var_name_1, B), 22) {
//     2022
// }
// else if core::ops::eq(EnumTag(__match_return_var_name_1), 0) {
//     1099
// }
// else if core::ops::eq(EnumTag(__match_return_var_name_1), 1) {
//     2099
// }
// else {
//     2099
// }

    poke(Enum::B(0));
}

fn poke<T>(_x: T) { }
