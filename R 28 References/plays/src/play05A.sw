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
    
    if a[0].b {
        (a[1].x + a[1].x).as_u64()
    }
    else {
        a[1].y - a[1].y
    }
}

// script {
//     entry fn main() -> (), !1 {
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
//         v40 = call add_2(v26, v39), !23
//         br play_0_while(v40), !2

//         play_0_end_while():
//         v41 = get_local ptr [{ bool, u64, u64 }; 2], a, !25
//         v42 = const u64 0, !26
//         v43 = get_elem_ptr v41, ptr { bool, u64, u64 }, v42, !28
//         v44 = const u64 0
//         v45 = get_elem_ptr v43, ptr bool, v44, !30
//         v46 = load v45, !2
//         cbr v46, play_0_block0(), play_0_block1(), !32

//         play_0_block0():
//         v47 = get_local ptr [{ bool, u64, u64 }; 2], a, !34
//         v48 = const u64 1, !35
//         v49 = get_elem_ptr v47, ptr { bool, u64, u64 }, v48, !37
//         v50 = const u64 1
//         v51 = get_elem_ptr v49, ptr u64, v50, !39
//         v52 = load v51, !2
//         v53 = get_local ptr [{ bool, u64, u64 }; 2], a, !41
//         v54 = const u64 1, !42
//         v55 = get_elem_ptr v53, ptr { bool, u64, u64 }, v54, !44
//         v56 = const u64 1
//         v57 = get_elem_ptr v55, ptr u64, v56, !45
//         v58 = load v57, !2
//         v59 = call add_2(v52, v58), !47
//         v60 = asm(input: v59) -> u64 input, !49 {
//         }
//         br play_0_block2(v60), !2

//         play_0_block1():
//         v61 = get_local ptr [{ bool, u64, u64 }; 2], a, !51
//         v62 = const u64 1, !52
//         v63 = get_elem_ptr v61, ptr { bool, u64, u64 }, v62, !54
//         v64 = const u64 2
//         v65 = get_elem_ptr v63, ptr u64, v64, !56
//         v66 = load v65, !2
//         v67 = get_local ptr [{ bool, u64, u64 }; 2], a, !58
//         v68 = const u64 1, !59
//         v69 = get_elem_ptr v67, ptr { bool, u64, u64 }, v68, !61
//         v70 = const u64 2
//         v71 = get_elem_ptr v69, ptr u64, v70, !62
//         v72 = load v71, !2
//         v73 = sub v66, v72, !64
//         br play_0_block2(v73), !2

//         play_0_block2(v74: u64):
//         v75 = const unit ()
//         ret () v75
//     }

//     pub fn add_2(self !66: u64, other !67: u64) -> u64, !68 {
//         entry(self: u64, other: u64):
//         v0 = add self, other
//         v1 = const u64 4294967295, !70
//         v2 = cmp gt v0 v1
//         cbr v2, block0(), block1(), !71

//         block0():
//         v3 = const u64 0, !72
//         revert v3, !73

//         block1():
//         ret u64 v0
//     }
// }
