library;

struct A {
    x: u64,
}

impl core::ops::Eq for A {
    fn eq(self, other: Self) -> bool {
        self.x == other.x
    }
}

#[inline(never)]
pub fn play() {
    let a = A { x: 123 };
    let r1 = &a;
    let r2 = &A { x: 321 };
    let r1_addr = asm(r: r1) { r: raw_ptr };
    let r2_addr = asm(r: r2) { r: raw_ptr };
    assert(r1_addr != r2_addr);
    assert(*r1 == a);
    assert(*r1 != *r2);
    let a: A = *r1;
    log(a);
    let a: A = *&a;
    log(a);
    let a: A = *&*&a;
    log(a);
    let a: A = * * & &a;
    log(a);
}

// script {
//     entry fn main() -> (), !1 {
//         entry():
//         v0 = call play_0(), !2
//         v1 = const unit ()
//         ret () v1
//     }

//     pub fn play_0() -> (), !6 {
//         local { u64 } __anon_0
//         local { u64 } __anon_1
//         local u64 __anon_2
//         local { u64 } a_
//         local { u64 } a__
//         local { u64 } a___
//         local { u64 } a____

//         entry():
//         v0 = get_local ptr { u64 }, __anon_0, !7
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, ptr u64, v1
//         v3 = const u64 123, !8
//         store v3 to v2, !7
//         v4 = get_local ptr { u64 }, __anon_0, !9
//         v5 = ptr_to_int v4 to u64, !10
//         v6 = get_local ptr { u64 }, __anon_1, !11
//         v7 = const u64 0
//         v8 = get_elem_ptr v6, ptr u64, v7
//         v9 = const u64 321, !12
//         store v9 to v8, !11
//         v10 = ptr_to_int v6 to u64, !13
//         v11 = asm(r: v5) -> u64 r, !14 {
//         }
//         v12 = asm(r: v10) -> u64 r, !15 {
//         }
//         v13 = cmp eq v11 v12, !19
//         v14 = const bool false, !20
//         v15 = cmp eq v13 v14, !22
//         v16 = call assert_1(v15), !23
//         v17 = int_to_ptr v5 to ptr { u64 }, !24
//         v18 = const u64 0
//         v19 = get_elem_ptr v17, ptr u64, v18
//         v20 = load v19
//         v21 = get_local ptr { u64 }, __anon_0, !25
//         v22 = const u64 0
//         v23 = get_elem_ptr v21, ptr u64, v22, !27
//         v24 = load v23, !25
//         v25 = cmp eq v20 v24, !29
//         v26 = call assert_1(v25), !30
//         v27 = int_to_ptr v5 to ptr { u64 }, !31
//         v28 = int_to_ptr v10 to ptr { u64 }, !32
//         v29 = const u64 0
//         v30 = get_elem_ptr v27, ptr u64, v29
//         v31 = load v30
//         v32 = const u64 0
//         v33 = get_elem_ptr v28, ptr u64, v32
//         v34 = load v33
//         v35 = cmp eq v31 v34, !34
//         v36 = const bool false, !20
//         v37 = cmp eq v35 v36, !35
//         v38 = call assert_1(v37), !36
//         v39 = int_to_ptr v5 to ptr { u64 }, !37
//         v40 = get_local ptr { u64 }, a_, !38
//         mem_copy_val v40, v39
//         v41 = get_local ptr { u64 }, a_
//         v42 = const u64 0
//         log ptr { u64 } v41, v42
//         v43 = get_local ptr { u64 }, a_, !39
//         v44 = ptr_to_int v43 to u64, !40
//         v45 = int_to_ptr v44 to ptr { u64 }, !41
//         v46 = get_local ptr { u64 }, a__, !42
//         mem_copy_val v46, v45
//         v47 = get_local ptr { u64 }, a__
//         v48 = const u64 1
//         log ptr { u64 } v47, v48
//         v49 = get_local ptr { u64 }, a__, !43
//         v50 = ptr_to_int v49 to u64, !44
//         v51 = int_to_ptr v50 to ptr { u64 }, !45
//         v52 = ptr_to_int v51 to u64, !46
//         v53 = int_to_ptr v52 to ptr { u64 }, !47
//         v54 = get_local ptr { u64 }, a___, !48
//         mem_copy_val v54, v53
//         v55 = get_local ptr { u64 }, a___
//         v56 = const u64 2
//         log ptr { u64 } v55, v56
//         v57 = get_local ptr { u64 }, a___, !49
//         v58 = ptr_to_int v57 to u64, !50
//         v59 = get_local ptr u64, __anon_2
//         store v58 to v59
//         v60 = ptr_to_int v59 to u64, !51
//         v61 = int_to_ptr v60 to ptr u64, !52
//         v62 = load v61
//         v63 = int_to_ptr v62 to ptr { u64 }, !53
//         v64 = get_local ptr { u64 }, a____, !54
//         mem_copy_val v64, v63
//         v65 = get_local ptr { u64 }, a____
//         v66 = const u64 3
//         log ptr { u64 } v65, v66
//         v67 = const unit ()
//         ret () v67
//     }

//     pub fn assert_1(condition !56: bool) -> (), !57 {
//         entry(condition: bool):
//         v0 = const bool false, !20
//         v1 = cmp eq condition v0, !58
//         cbr v1, block0(), block1(), !58

//         block0():
//         v2 = const u64 18446744073709486084, !60
//         revert v2, !64

//         block1():
//         v3 = const unit ()
//         ret () v3
//     }
// }
