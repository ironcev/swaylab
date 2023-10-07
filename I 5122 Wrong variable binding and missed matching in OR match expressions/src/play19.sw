library;

enum Enum {
    A: (u64),
    B: (u64),
}

pub fn play() -> () {
    let e = Some(Enum::A(0));

    let _x = match e {
        Some(
            Enum::A(111)
            | Enum::A(122)
            | Enum::B(211)
            | Enum::B(222)
        ) => 1111,
        None => 2222,
        _ => 9999,
    };

// if (core::ops::eq(EnumTag(__match_return_var_name_1), 1)
// && ((core::ops::eq(EnumTag(UnsafeDowncast(__match_return_var_name_1, Some: T)), 0)
// && core::ops::eq(UnsafeDowncast(UnsafeDowncast(__match_return_var_name_1, Some: T), A: (u64), 111))
// || ((core::ops::eq(EnumTag(UnsafeDowncast(__match_return_var_name_1, Some: T)), 0)
// && core::ops::eq(UnsafeDowncast(UnsafeDowncast(__match_return_var_name_1, Some: T), A: (u64), 122))
// || ((core::ops::eq(EnumTag(UnsafeDowncast(__match_return_var_name_1, Some: T)), 1)
// && core::ops::eq(UnsafeDowncast(UnsafeDowncast(__match_return_var_name_1, Some: T), B: (u64), 211))
// || (core::ops::eq(EnumTag(UnsafeDowncast(__match_return_var_name_1, Some: T)), 1)
// && core::ops::eq(UnsafeDowncast(UnsafeDowncast(__match_return_var_name_1, Some: T), B: (u64), 222)))))) {
//     1111
// }
// else if core::ops::eq(EnumTag(__match_return_var_name_1), 0) {
//     2222
// }
// else {
//     9999
// }
}
