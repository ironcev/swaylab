library;

struct S {
    b: bool,
    x: u32,
    y: u64,
}

pub fn play() -> u64 {
    let mut s = S { b: true, x: 32, y: 64 };
    
    by_ref(s).y
}

#[inline(never)]
fn by_ref(ref mut value: S) -> S {
    if value.b {
        S { b: true, x: value.x + 1, y: value.y - 1}
    }
    else {
        S { b: false, x: value.x - 1, y: value.y + 1}
    }
}

// script {
//     entry fn main() -> (), !1 {
//         local mut { bool, u64, u64 } __anon_0
//         local { bool, u64, u64 } __ret_val

//         entry():
//         v0 = get_local ptr { bool, u64, u64 }, __anon_0, !5
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, ptr bool, v1, !2
//         v3 = const bool true, !6
//         store v3 to v2, !7
//         v4 = const u64 1
//         v5 = get_elem_ptr v0, ptr u64, v4, !2
//         v6 = const u64 32, !8
//         store v6 to v5, !9
//         v7 = const u64 2
//         v8 = get_elem_ptr v0, ptr u64, v7, !2
//         v9 = const u64 64, !10
//         store v9 to v8, !11
//         v10 = get_local ptr { bool, u64, u64 }, __anon_0, !13
//         v11 = get_local ptr { bool, u64, u64 }, __ret_val
//         v12 = call by_ref_1(v10, v11)
//         v13 = const unit ()
//         ret () v13
//     }

//     fn by_ref_1(value !14: ptr { bool, u64, u64 }, __ret_value: ptr { bool, u64, u64 }) -> ptr { bool, u64, u64 }, !17 {
//         local { bool, u64, u64 } __tmp_block_arg

//         entry(value: ptr { bool, u64, u64 }, __ret_value: ptr { bool, u64, u64 }):
//         v0 = const u64 0
//         v1 = get_elem_ptr value, ptr bool, v0, !18
//         v2 = load v1
//         cbr v2, block0(), block1(), !19

//         block0():
//         v3 = const u64 1
//         v4 = get_elem_ptr value, ptr u64, v3, !20
//         v5 = load v4
//         v6 = const u64 1, !21
//         v7 = add v5, v6, !22
//         v8 = const u64 4294967295, !24
//         v9 = cmp gt v7 v8, !22
//         cbr v9, add_2_block0(), add_2_block1(), !27

//         add_2_block0():
//         v10 = const u64 0, !28
//         revert v10, !30

//         add_2_block1():
//         v11 = const u64 2
//         v12 = get_elem_ptr value, ptr u64, v11, !31
//         v13 = load v12
//         v14 = const u64 1, !32
//         v15 = sub v13, v14, !33
//         v16 = get_local ptr { bool, u64, u64 }, __tmp_block_arg
//         v17 = const bool true, !34
//         br block2(v16, v15, v7, v17)

//         block1():
//         v18 = const u64 1
//         v19 = get_elem_ptr value, ptr u64, v18, !20
//         v20 = load v19
//         v21 = const u64 1, !35
//         v22 = sub v20, v21, !36
//         v23 = const u64 2
//         v24 = get_elem_ptr value, ptr u64, v23, !31
//         v25 = load v24
//         v26 = const u64 1, !37
//         v27 = add v25, v26, !38
//         v28 = get_local ptr { bool, u64, u64 }, __tmp_block_arg
//         v29 = const bool false, !39
//         br block2(v28, v27, v22, v29)

//         block2(v30: ptr { bool, u64, u64 }, v31: u64, v32: u64, v33: bool):
//         v34 = const u64 0
//         v35 = get_elem_ptr __ret_value, ptr bool, v34
//         store v33 to v35
//         v36 = const u64 1
//         v37 = get_elem_ptr __ret_value, ptr u64, v36
//         store v32 to v37
//         v38 = const u64 2
//         v39 = get_elem_ptr __ret_value, ptr u64, v38
//         store v31 to v39
//         ret ptr { bool, u64, u64 } __ret_value
//     }
// }
