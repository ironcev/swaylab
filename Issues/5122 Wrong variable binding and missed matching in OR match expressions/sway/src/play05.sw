library;

enum Enum {
    A: (u64, u64, u64),
    B: (u64, u64, u64),
    C: (u64, u64, u64),
}

pub fn play() -> () {
    let e = Enum::A((0, 0, 0));

    // BUG: Mismatched types. expected: (u64, u64, u64) found:    ({unknown}, u64, u64).
    // let _x = match e {
    //     Enum::A((1u64, 1u64, x)) | Enum::B((1u64, x, 1u64)) | Enum::C((x, 1u64, 1u64)) => x,
    //     _ => 111,
    // };

    let _x = match e {
        Enum::A((_, _, x)) | Enum::B((_, x, _)) | Enum::C((x, _, _)) => x,
    };

// Final:
// {
//     let __matched_or_variant_index_1: u64 = if core::ops::eq(EnumTag(__matched_value_1), 0) {
//         1
//     }
//     else if core::ops::eq(EnumTag(__matched_value_1), 1) {
//         2
//     }
//     else if core::ops::eq(EnumTag(__matched_value_1), 2) {
//         3
//     }
//     else {
//         0
//     };

//     if core::ops::neq(__matched_or_variant_index_1, 0) {
//         let __matched_or_variant_variables_1: (u64) = if core::ops::eq(__matched_or_variant_index_1, 1) {
//                 (UnsafeDowncast(__matched_value_1, A: (u64, u64, u64)).2)
//             }
//             else if core::ops::eq(__matched_or_variant_index_1, 2) {
//                 (UnsafeDowncast(__matched_value_1, B: (u64, u64, u64)).1)
//             }
//             else if core::ops::eq(__matched_or_variant_index_1, 3) {
//                 (UnsafeDowncast(__matched_value_1, C: (u64, u64, u64)).0)
//             }
//             else {
//                 __revert(14757395258967588865)
//             };

//         let x: u64 = __matched_or_variant_variables_1.0;
//         x
//     }
//     else {
//         __revert(14757395258967588866)
//     }
// }

    let _x = match e {
        Enum::A((1, 1, 1)) | Enum::B((2, 2, 2)) | Enum::C((3, 3, 3)) => 123,
        Enum::A((_, _, x)) | Enum::B((_, x, _)) | Enum::C((x, _, _)) => x,
        Enum::A((y, _, _)) | Enum::B((_, y, _)) | Enum::C((_, _, y)) => y,
    };

// Final:
// if ((core::ops::eq(EnumTag(__matched_value_2), 0)
// && (core::ops::eq(UnsafeDowncast(__matched_value_2, A: (u64, u64, u64)).0, 1)
// && (core::ops::eq(UnsafeDowncast(__matched_value_2, A: (u64, u64, u64)).1, 1)
// && core::ops::eq(UnsafeDowncast(__matched_value_2, A: (u64, u64, u64)).2, 1))))
// || ((core::ops::eq(EnumTag(__matched_value_2), 1)
// && (core::ops::eq(UnsafeDowncast(__matched_value_2, B: (u64, u64, u64)).0, 2)
// && (core::ops::eq(UnsafeDowncast(__matched_value_2, B: (u64, u64, u64)).1, 2)
// && core::ops::eq(UnsafeDowncast(__matched_value_2, B: (u64, u64, u64)).2, 2))))
// || (core::ops::eq(EnumTag(__matched_value_2), 2)
// && (core::ops::eq(UnsafeDowncast(__matched_value_2, C: (u64, u64, u64)).0, 3)
// && (core::ops::eq(UnsafeDowncast(__matched_value_2, C: (u64, u64, u64)).1, 3)
// && core::ops::eq(UnsafeDowncast(__matched_value_2, C: (u64, u64, u64)).2, 3)))))) {
//     123
// }
// else {
//     let __matched_or_variant_index_1: u64 = if core::ops::eq(EnumTag(__matched_value_2), 0) {
//         1
//     }
//     else if core::ops::eq(EnumTag(__matched_value_2), 1) {
//         2
//     }
//     else if core::ops::eq(EnumTag(__matched_value_2), 2) {
//         3
//     }
//     else {
//         0
//     };

//     if core::ops::neq(__matched_or_variant_index_1, 0) {
//         let __matched_or_variant_variables_1: (u64) = if core::ops::eq(__matched_or_variant_index_1, 1) {
//                 (UnsafeDowncast(__matched_value_2, A: (u64, u64, u64)).2)
//             }
//             else if core::ops::eq(__matched_or_variant_index_1, 2) {
//                 (UnsafeDowncast(__matched_value_2, B: (u64, u64, u64)).1)
//             }
//             else if core::ops::eq(__matched_or_variant_index_1, 3) {
//                 (UnsafeDowncast(__matched_value_2, C: (u64, u64, u64)).0)
//             }
//             else {
//                 __revert(14757395258967588865)
//             };

//         let x: u64 = __matched_or_variant_variables_1.0;
//         x
// }
// else {
//     let __matched_or_variant_index_1: u64 = if core::ops::eq(EnumTag(__matched_value_2), 0) {
//     1
// }
// else if core::ops::eq(EnumTag(__matched_value_2), 1) {
//     2
// }
// else if core::ops::eq(EnumTag(__matched_value_2), 2) {
//     3
// }
// else {
//     0
// };
//     if core::ops::neq(__matched_or_variant_index_1, 0) {
//     let __matched_or_variant_variables_1: (u64) = if core::ops::eq(__matched_or_variant_index_1, 1) {
//     (UnsafeDowncast(__matched_value_2, A: (u64, u64, u64)).0)
// }
// else if core::ops::eq(__matched_or_variant_index_1, 2) {
//     (UnsafeDowncast(__matched_value_2, B: (u64, u64, u64)).1)
// }
// else if core::ops::eq(__matched_or_variant_index_1, 3) {
//     (UnsafeDowncast(__matched_value_2, C: (u64, u64, u64)).2)
// }
// else {
//     __revert(14757395258967588865)
// };
//     let y: u64 = __matched_or_variant_variables_1.0;
//     y
// }
// else {
//     __revert(14757395258967588866)
// }
// }
// }



// First step (variables still not properly extracted):
// if (core::ops::eq(EnumTag(__match_return_var_name_1), 0)
// || (core::ops::eq(EnumTag(__match_return_var_name_1), 1)
// || core::ops::eq(EnumTag(__match_return_var_name_1), 2))) {
//     let x = UnsafeDowncast(__match_return_var_name_1, A: (u64, u64, u64)).2;
//     let x = UnsafeDowncast(__match_return_var_name_1, B: (u64, u64, u64)).1;
//     let x = UnsafeDowncast(__match_return_var_name_1, C: (u64, u64, u64)).0;
//     x
// }
// else {
//     let x = UnsafeDowncast(__match_return_var_name_1, A: (u64, u64, u64)).2;
//     let x = UnsafeDowncast(__match_return_var_name_1, B: (u64, u64, u64)).1;
//     let x = UnsafeDowncast(__match_return_var_name_1, C: (u64, u64, u64)).0;
//     x
// }

// Original:
// if (
//         (
//             core::ops::eq(EnumTag(__match_return_var_name_1), 2)
//             || (core::ops::eq(EnumTag(__match_return_var_name_1), 1)
//                 || core::ops::eq(EnumTag(__match_return_var_name_1), 0))
//         )
//         &&
//         (
//             (
//                 core::ops::eq(EnumTag(__match_return_var_name_1), 1)
//                 || core::ops::eq(EnumTag(__match_return_var_name_1), 0)
//             )
//             &&
//             (
//                 (
//                     core::ops::eq(EnumTag(__match_return_var_name_1), 2)
//                     || core::ops::eq(EnumTag(__match_return_var_name_1), 0)
//                 )
//                 &&
//                 (
//                     core::ops::eq(EnumTag(__match_return_var_name_1), 0)
//                     &&
//                     (
//                         (
//                             core::ops::eq(EnumTag(__match_return_var_name_1), 2)
//                             || core::ops::eq(EnumTag(__match_return_var_name_1), 1)
//                         )
//                         &&
//                         (
//                             core::ops::eq(EnumTag(__match_return_var_name_1), 1)
//                             &&
//                             core::ops::eq(EnumTag(__match_return_var_name_1), 2)
//                         )
//                     )
//                 )
//             )
//         )
//     ) {
//     let x = UnsafeDowncast(__match_return_var_name_1, C: (u64, u64, u64)).0;
//     x
// }
// else {
//     let x = UnsafeDowncast(__match_return_var_name_1, C: (u64, u64, u64)).0;
//     x
// }

    poke(Enum::B((0, 0, 0)));
    poke(Enum::C((0, 0, 0)));
}

fn poke<T>(_x: T) { }
