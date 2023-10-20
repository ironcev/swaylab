library;

enum Enum {
    A: (u64, u64),
    B: (u64, u64),
    C: (u64, u64),
}

pub fn play() -> () {
    let e = Enum::A((0, 0));

    let _x = match e {
        Enum::A((_, x)) => x,
        Enum::B((y, _)) => y,
        Enum::C((a, b)) => a + b,
    };

// Final:
// if core::ops::eq(EnumTag(__matched_value_1), 0) {
//     let x: u64 = UnsafeDowncast(__matched_value_1, A: (u64, u64)).1;
//     x
// }
// else if core::ops::eq(EnumTag(__matched_value_1), 1) {
//     let y: u64 = UnsafeDowncast(__matched_value_1, B: (u64, u64)).0;
//     y
// }
// else if core::ops::eq(EnumTag(__matched_value_1), 2) {
//     let a: u64 = UnsafeDowncast(__matched_value_1, C: (u64, u64)).0;
//     let b: u64 = UnsafeDowncast(__matched_value_1, C: (u64, u64)).1;
//     core::ops::add(a, b)
// }
// else {
//     __revert(14757395258967588866)
// }

// Original:
// if core::ops::eq(EnumTag(__match_return_var_name_1), 0) {
//     let x = UnsafeDowncast(__match_return_var_name_1, A: (u64, u64)).1;
//     x
// }
// else if core::ops::eq(EnumTag(__match_return_var_name_1), 1) {
//     let y = UnsafeDowncast(__match_return_var_name_1, B: (u64, u64)).0;
//     y
// }
// else if core::ops::eq(EnumTag(__match_return_var_name_1), 2) {
//     let a = UnsafeDowncast(__match_return_var_name_1, C: (u64, u64)).0;
//     let b = UnsafeDowncast(__match_return_var_name_1, C: (u64, u64)).1;
//     core::ops::add(a, b)
// }
// else {
//     let a = UnsafeDowncast(__match_return_var_name_1, C: (u64, u64)).0;
//     let b = UnsafeDowncast(__match_return_var_name_1, C: (u64, u64)).1;
//     core::ops::add(a, b)
// }

    poke(Enum::B((0, 0)));
    poke(Enum::C((0, 0)));
}

fn poke<T>(_x: T) { }
