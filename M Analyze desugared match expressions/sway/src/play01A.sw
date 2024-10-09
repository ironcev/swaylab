library;

use ::lib::*;
use ::lib::Option::*;

#[inline(never)]
pub fn play(o: Option<Output>, a: bool, b: bool) -> bool {
    match o {
        Some(Output::Coin) => a,
        Some(Output::Change) => b,
        _ => false,
    }
}

// 208 bytes.

// pub fn play_0(o: ptr { u64, ( { u64 } | () ) }, a !10: bool, b !11: bool) -> bool, !15 {
//     local { u64, ( { u64 } | () ) } __matched_value_1

//     entry(o: ptr { u64, ( { u64 } | () ) }, a: bool, b: bool):
//     v0 = get_local ptr { u64, ( { u64 } | () ) }, __matched_value_1, !16
//     mem_copy_val v0, o
//     v1 = const u64 0
//     v2 = get_elem_ptr o, ptr u64, v1
//     v3 = load v2
//     v4 = const u64 0, !17
//     v5 = cmp eq v3 v4, !20
//     cbr v5, block0(), block1(v5), !18

//     block0():
//     v6 = get_local ptr { u64, ( { u64 } | () ) }, __matched_value_1, !17
//     v7 = const u64 1
//     v8 = const u64 0
//     v9 = get_elem_ptr v6, ptr { u64 }, v7, v8
//     v10 = const u64 0
//     v11 = get_elem_ptr v9, ptr u64, v10, !21
//     v12 = load v11
//     v13 = const u64 0, !21
//     v14 = cmp eq v12 v13, !22
//     br block1(v14), !18

//     block1(v15: bool):
//     cbr v15, block9(a), block3(), !18

//     block3():
//     v16 = get_local ptr { u64, ( { u64 } | () ) }, __matched_value_1, !17
//     v17 = const u64 0
//     v18 = get_elem_ptr v16, ptr u64, v17, !17
//     v19 = load v18
//     v20 = const u64 0, !17
//     v21 = cmp eq v19 v20, !25
//     cbr v21, block4(), block5(v21), !23

//     block4():
//     v22 = get_local ptr { u64, ( { u64 } | () ) }, __matched_value_1, !17
//     v23 = const u64 1
//     v24 = const u64 0
//     v25 = get_elem_ptr v22, ptr { u64 }, v23, v24
//     v26 = const u64 0
//     v27 = get_elem_ptr v25, ptr u64, v26, !26
//     v28 = load v27
//     v29 = const u64 2, !26
//     v30 = cmp eq v28 v29, !27
//     br block5(v30), !23

//     block5(v31: bool):
//     cbr v31, block8(b), block7(), !23

//     block7():
//     v32 = const bool false, !28
//     br block8(v32)

//     block8(v33: bool):
//     br block9(v33)

//     block9(v34: bool):
//     ret bool v34
// }
