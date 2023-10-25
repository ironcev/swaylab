library;

pub fn play() -> u64 {
    let mut a: [u64;5] = [0;5];

    let mut i = 0;
    while i < 5 {
        a[i] = i;
        i = i + 1;
    }
    
    if a[0] == 1 {
        a[3] + a[4]
    }
    else {
        a[3] - a[4]
    }
}

// script {
//     entry fn main() -> (), !1 {
//         local mut [u64; 5] a

//         entry():
//         v0 = get_local ptr [u64; 5], a, !5
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, ptr u64, v1
//         v3 = const u64 0, !6
//         store v3 to v2
//         v4 = const u64 1
//         v5 = get_elem_ptr v0, ptr u64, v4
//         v6 = const u64 0, !6
//         store v6 to v5
//         v7 = const u64 2
//         v8 = get_elem_ptr v0, ptr u64, v7
//         v9 = const u64 0, !6
//         store v9 to v8
//         v10 = const u64 3
//         v11 = get_elem_ptr v0, ptr u64, v10
//         v12 = const u64 0, !6
//         store v12 to v11
//         v13 = const u64 4
//         v14 = get_elem_ptr v0, ptr u64, v13
//         v15 = const u64 0, !6
//         store v15 to v14
//         v16 = const u64 0, !7
//         br play_0_while(v16), !2

//         play_0_while(v17: u64):
//         v18 = const u64 5, !8
//         v19 = cmp lt v17 v18, !10
//         cbr v19, play_0_while_body(), play_0_end_while(), !2

//         play_0_while_body():
//         v20 = get_local ptr [u64; 5], a, !12
//         v21 = get_elem_ptr v20, ptr u64, v17, !13
//         store v17 to v21, !14
//         v22 = const u64 1, !15
//         v23 = add v17, v22, !17
//         br play_0_while(v23), !2

//         play_0_end_while():
//         v24 = get_local ptr [u64; 5], a, !19
//         v25 = const u64 0, !20
//         v26 = get_elem_ptr v24, ptr u64, v25, !22
//         v27 = load v26, !2
//         v28 = const u64 1, !23
//         v29 = cmp eq v27 v28, !25
//         cbr v29, play_0_block0(), play_0_block1(), !26

//         play_0_block0():
//         v30 = get_local ptr [u64; 5], a, !28
//         v31 = const u64 3, !29
//         v32 = get_elem_ptr v30, ptr u64, v31, !31
//         v33 = load v32, !2
//         v34 = get_local ptr [u64; 5], a, !33
//         v35 = const u64 4, !34
//         v36 = get_elem_ptr v34, ptr u64, v35, !36
//         v37 = load v36, !2
//         v38 = add v33, v37, !38
//         br play_0_block2(v38), !2

//         play_0_block1():
//         v39 = get_local ptr [u64; 5], a, !40
//         v40 = const u64 3, !41
//         v41 = get_elem_ptr v39, ptr u64, v40, !43
//         v42 = load v41, !2
//         v43 = get_local ptr [u64; 5], a, !45
//         v44 = const u64 4, !46
//         v45 = get_elem_ptr v43, ptr u64, v44, !48
//         v46 = load v45, !2
//         v47 = sub v42, v46, !50
//         br play_0_block2(v47), !2

//         play_0_block2(v48: u64):
//         v49 = const unit ()
//         ret () v49
//     }
// }
