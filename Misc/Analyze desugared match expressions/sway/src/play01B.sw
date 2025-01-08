library;

use ::lib::*;
use ::lib::Option::*;

#[inline(never)]
pub fn play(o: Option<Output>, a: bool, b: bool) -> bool {
    match o {
        Some(s) => match s {
            Output::Coin => a,
            Output::Change => b,
            _ => false,
        },
        _ => false,
    }
}

// 192 bytes.


// pub fn play_0(o: ptr { u64, ( { u64 } | () ) }, a !10: bool, b !11: bool) -> bool, !15 {
//     local { u64, ( { u64 } | () ) } __matched_value_2

//     entry(o: ptr { u64, ( { u64 } | () ) }, a: bool, b: bool):
//     v0 = get_local ptr { u64, ( { u64 } | () ) }, __matched_value_2, !16
//     mem_copy_val v0, o
//     v1 = const u64 0
//     v2 = get_elem_ptr o, ptr u64, v1
//     v3 = load v2
//     v4 = const u64 0, !17
//     v5 = cmp eq v3 v4, !20
//     v6 = const bool false, !21
//     cbr v5, block0(), block8(v6), !18

//     block0():
//     v7 = get_local ptr { u64, ( { u64 } | () ) }, __matched_value_2, !17
//     v8 = const u64 1
//     v9 = const u64 0
//     v10 = get_elem_ptr v7, ptr { u64 }, v8, v9
//     v11 = const u64 0
//     v12 = get_elem_ptr v10, ptr u64, v11
//     v13 = load v12
//     v14 = const u64 0, !22
//     v15 = cmp eq v13 v14, !25
//     cbr v15, block6(a), block2(), !23

//     block2():
//     v16 = const u64 2, !22
//     v17 = cmp eq v13 v16, !28
//     cbr v17, block5(b), block4(), !26

//     block4():
//     v18 = const bool false, !29
//     br block5(v18)

//     block5(v19: bool):
//     br block6(v19)

//     block6(v20: bool):
//     br block8(v20)

//     block8(v21: bool):
//     ret bool v21
// }
