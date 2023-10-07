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
