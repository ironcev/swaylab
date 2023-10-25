library;

struct S {
    b: bool,
    x: u32,
    y: u64,
}

pub fn play() -> u64 {
    let mut a: [S;2] = [S { b: true, x: 32, y: 64};2];

    let mut i = 0u32;
    while i < 2 {
        a[i] = S { b: false, x: i, y: i.as_u64() };
        i = i + 1;
    }
    
    by_val(a[1]).y
}

#[inline(never)]
fn by_val(value: S) -> S {
    S { b: true, x: value.x - 1, y: value.y + 1 }
}

// script {
//     entry fn main() -> (), !1 {
//         local { bool, u64, u64 } __ret_val
//         local { bool, u64, u64 } __tmp_arg
//         local mut [{ bool, u64, u64 }; 2] a

//         entry():
//         v0 = get_local ptr [{ bool, u64, u64 }; 2], a, !5
//         v1 = const u64 0
//         v2 = const u64 0
//         v3 = get_elem_ptr v0, ptr bool, v1, v2
//         v4 = const bool true, !6
//         store v4 to v3
//         v5 = const u64 0
//         v6 = const u64 1
//         v7 = get_elem_ptr v0, ptr u64, v5, v6
//         v8 = const u64 32, !7
//         store v8 to v7
//         v9 = const u64 0
//         v10 = const u64 2
//         v11 = get_elem_ptr v0, ptr u64, v9, v10
//         v12 = const u64 64, !8
//         store v12 to v11
//         v13 = const u64 1
//         v14 = const u64 0
//         v15 = get_elem_ptr v0, ptr bool, v13, v14
//         v16 = const bool true, !6
//         store v16 to v15
//         v17 = const u64 1
//         v18 = const u64 1
//         v19 = get_elem_ptr v0, ptr u64, v17, v18
//         v20 = const u64 32, !7
//         store v20 to v19
//         v21 = const u64 1
//         v22 = const u64 2
//         v23 = get_elem_ptr v0, ptr u64, v21, v22
//         v24 = const u64 64, !8
//         store v24 to v23
//         v25 = const u64 0, !9
//         br play_0_while(v25), !2

//         play_0_while(v26: u64):
//         v27 = const u64 2, !10
//         v28 = cmp lt v26 v27, !12
//         cbr v28, play_0_while_body(), play_0_end_while(), !2

//         play_0_while_body():
//         v29 = get_local ptr [{ bool, u64, u64 }; 2], a, !14
//         v30 = asm(input: v26) -> u64 input, !18 {
//         }
//         v31 = get_elem_ptr v29, ptr { bool, u64, u64 }, v26, !19
//         v32 = const u64 0
//         v33 = get_elem_ptr v31, ptr bool, v32
//         v34 = const bool false, !20
//         store v34 to v33
//         v35 = const u64 1
//         v36 = get_elem_ptr v31, ptr u64, v35
//         store v26 to v36
//         v37 = const u64 2
//         v38 = get_elem_ptr v31, ptr u64, v37
//         store v30 to v38
//         v39 = const u64 1, !21
//         v40 = add v26, v39, !23
//         v41 = const u64 4294967295, !25
//         v42 = cmp gt v40 v41, !26
//         cbr v42, play_0_add_2_block0(), play_0_while(v40), !29

//         play_0_add_2_block0():
//         v43 = const u64 0, !30
//         revert v43, !32

//         play_0_end_while():
//         v44 = get_local ptr [{ bool, u64, u64 }; 2], a, !34
//         v45 = const u64 1, !35
//         v46 = get_elem_ptr v44, ptr { bool, u64, u64 }, v45, !37
//         v47 = get_local ptr { bool, u64, u64 }, __tmp_arg
//         mem_copy_val v47, v46
//         v48 = get_local ptr { bool, u64, u64 }, __ret_val
//         v49 = call by_val_5(v47, v48)
//         v50 = const unit ()
//         ret () v50
//     }

//     fn by_val_5(value: ptr { bool, u64, u64 }, __ret_value: ptr { bool, u64, u64 }) -> ptr { bool, u64, u64 }, !40 {
//         entry(value: ptr { bool, u64, u64 }, __ret_value: ptr { bool, u64, u64 }):
//         v0 = const u64 1
//         v1 = get_elem_ptr value, ptr u64, v0, !41
//         v2 = load v1
//         v3 = const u64 1, !42
//         v4 = sub v2, v3, !43
//         v5 = const u64 2
//         v6 = get_elem_ptr value, ptr u64, v5, !44
//         v7 = load v6
//         v8 = const u64 1, !45
//         v9 = add v7, v8, !46
//         v10 = const u64 0
//         v11 = get_elem_ptr __ret_value, ptr bool, v10
//         v12 = const bool true, !47
//         store v12 to v11
//         v13 = const u64 1
//         v14 = get_elem_ptr __ret_value, ptr u64, v13
//         store v4 to v14
//         v15 = const u64 2
//         v16 = get_elem_ptr __ret_value, ptr u64, v15
//         store v9 to v16
//         ret ptr { bool, u64, u64 } __ret_value
//     }
// }
