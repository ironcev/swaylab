script;

struct S {
    x: u64,
}

fn main() -> u64 {
    let ret = u64_value(11);
    assert(ret == 42);

    let ret = struct_value(S { x: 11 });
    assert(ret == 42);

    let ret = array_value([11]);
    assert(ret == 42);

    ret
}

#[inline(never)]
fn array_value(init: [u64;1]) -> u64 {
    let mut a = init;
    let mut c_a_1 = a;
    let mut c_a_2 = c_a_1;
    assert(a[0] == init[0]);
    assert(c_a_1[0] == init[0]);
    assert(c_a_2[0] == init[0]);

    c_a_1[0] = 2*init[0];
    c_a_2[0] = 3*init[0];
    assert(a[0] == init[0]);
    assert(c_a_1[0] == 2*init[0]);
    assert(c_a_2[0] == 3*init[0]);

    42
}

#[inline(never)]
fn struct_value(init: S) -> u64 {
    let mut a = init;
    let mut c_a_1 = a;
    let mut c_a_2 = c_a_1;
    assert(a.x == init.x);
    assert(c_a_1.x == init.x);
    assert(c_a_2.x == init.x);

    c_a_1.x = 2*init.x;
    c_a_2.x = 3*init.x;
    assert(a.x == init.x);
    assert(c_a_1.x == 2*init.x);
    assert(c_a_2.x == 3*init.x);

    42
}

#[inline(never)]
fn u64_value(init: u64) -> u64 {
    let mut a = init;
    let mut c_a_1 = a;
    let mut c_a_2 = c_a_1;
    assert(a == init);
    assert(c_a_1 == init);
    assert(c_a_2 == init);

    c_a_1 = 2*init;
    c_a_2 = 3*init;
    assert(a == init);
    assert(c_a_1 == 2*init);
    assert(c_a_2 == 3*init);

    42
}

// script {
//     entry fn main() -> u64, !1 {
//         local { u64 } __anon_0
//         local [u64; 1] __anon_1

//         entry():
//         v0 = const u64 11, !2
//         v1 = call u64_value_0(v0), !3
//         v2 = const u64 42, !4
//         v3 = cmp eq v1 v2, !5
//         v4 = call assert_11(v3), !6
//         v5 = get_local ptr { u64 }, __anon_0, !7
//         v6 = const u64 0
//         v7 = get_elem_ptr v5, ptr u64, v6
//         v8 = const u64 11, !8
//         store v8 to v7, !7
//         v9 = get_local ptr { u64 }, __anon_0
//         v10 = call struct_value_10(v9)
//         v11 = const u64 42, !9
//         v12 = cmp eq v10 v11, !10
//         v13 = call assert_11(v12), !11
//         v14 = get_local ptr [u64; 1], __anon_1, !12
//         v15 = const u64 0
//         v16 = get_elem_ptr v14, ptr u64, v15
//         v17 = const u64 11, !13
//         store v17 to v16, !12
//         v18 = get_local ptr [u64; 1], __anon_1
//         v19 = call array_value_16(v18)
//         v20 = const u64 42, !14
//         v21 = cmp eq v19 v20, !15
//         v22 = call assert_11(v21), !16
//         ret u64 v19
//     }

//     fn u64_value_0(init !17: u64) -> u64, !20 {
//         entry(init: u64):
//         v0 = cmp eq init init, !21
//         v1 = call assert_11(v0), !22
//         v2 = cmp eq init init, !23
//         v3 = call assert_11(v2), !24
//         v4 = cmp eq init init, !25
//         v5 = call assert_11(v4), !26
//         v6 = const u64 2, !27
//         v7 = mul v6, init, !28
//         v8 = const u64 3, !29
//         v9 = mul v8, init, !30
//         v10 = cmp eq init init, !31
//         v11 = call assert_11(v10), !32
//         v12 = const u64 2, !33
//         v13 = mul v12, init, !34
//         v14 = cmp eq v7 v13, !35
//         v15 = call assert_11(v14), !36
//         v16 = const u64 3, !37
//         v17 = mul v16, init, !38
//         v18 = cmp eq v9 v17, !39
//         v19 = call assert_11(v18), !40
//         v20 = const u64 42, !41
//         ret u64 v20
//     }

//     fn struct_value_10(init: ptr { u64 }) -> u64, !43 {
//         entry(init: ptr { u64 }):
//         v0 = const u64 0
//         v1 = get_elem_ptr init, ptr u64, v0
//         v2 = load v1
//         v3 = const u64 0
//         v4 = get_elem_ptr init, ptr u64, v3
//         v5 = load v4
//         v6 = const u64 0
//         v7 = get_elem_ptr init, ptr u64, v6, !44
//         v8 = load v7
//         v9 = const u64 0
//         v10 = get_elem_ptr init, ptr u64, v9, !44
//         v11 = load v10
//         v12 = cmp eq v8 v11, !45
//         v13 = call assert_11(v12), !46
//         v14 = const u64 0
//         v15 = get_elem_ptr init, ptr u64, v14, !44
//         v16 = load v15
//         v17 = cmp eq v2 v16, !47
//         v18 = call assert_11(v17), !48
//         v19 = const u64 0
//         v20 = get_elem_ptr init, ptr u64, v19, !44
//         v21 = load v20
//         v22 = cmp eq v5 v21, !49
//         v23 = call assert_11(v22), !50
//         v24 = const u64 0
//         v25 = get_elem_ptr init, ptr u64, v24, !44
//         v26 = load v25
//         v27 = const u64 2, !51
//         v28 = mul v27, v26, !52
//         v29 = const u64 0
//         v30 = get_elem_ptr init, ptr u64, v29, !44
//         v31 = load v30
//         v32 = const u64 3, !53
//         v33 = mul v32, v31, !54
//         v34 = const u64 0
//         v35 = get_elem_ptr init, ptr u64, v34, !44
//         v36 = load v35
//         v37 = const u64 0
//         v38 = get_elem_ptr init, ptr u64, v37, !44
//         v39 = load v38
//         v40 = cmp eq v36 v39, !55
//         v41 = call assert_11(v40), !56
//         v42 = const u64 0
//         v43 = get_elem_ptr init, ptr u64, v42, !44
//         v44 = load v43
//         v45 = const u64 2, !57
//         v46 = mul v45, v44, !58
//         v47 = cmp eq v28 v46, !59
//         v48 = call assert_11(v47), !60
//         v49 = const u64 0
//         v50 = get_elem_ptr init, ptr u64, v49, !44
//         v51 = load v50
//         v52 = const u64 3, !61
//         v53 = mul v52, v51, !62
//         v54 = cmp eq v33 v53, !63
//         v55 = call assert_11(v54), !64
//         v56 = const u64 42, !65
//         ret u64 v56
//     }

//     pub fn assert_11(condition !67: bool) -> (), !68 {
//         entry(condition: bool):
//         v0 = const bool false, !70
//         v1 = cmp eq condition v0, !71
//         cbr v1, block0(), block1(), !71

//         block0():
//         v2 = const u64 18446744073709486084, !73
//         revert v2, !77

//         block1():
//         v3 = const unit ()
//         ret () v3
//     }

//     fn array_value_16(init: ptr [u64; 1]) -> u64, !79 {
//         entry(init: ptr [u64; 1]):
//         v0 = const u64 0
//         v1 = get_elem_ptr init, ptr u64, v0
//         v2 = load v1
//         v3 = const u64 0
//         v4 = get_elem_ptr init, ptr u64, v3
//         v5 = load v4
//         v6 = const u64 0, !80
//         v7 = get_elem_ptr init, ptr u64, v6, !81
//         v8 = load v7
//         v9 = const u64 0, !82
//         v10 = get_elem_ptr init, ptr u64, v9, !83
//         v11 = load v10
//         v12 = cmp eq v8 v11, !84
//         v13 = call assert_11(v12), !85
//         v14 = const u64 0, !86
//         v15 = get_elem_ptr init, ptr u64, v14, !87
//         v16 = load v15
//         v17 = cmp eq v2 v16, !88
//         v18 = call assert_11(v17), !89
//         v19 = const u64 0, !90
//         v20 = get_elem_ptr init, ptr u64, v19, !91
//         v21 = load v20
//         v22 = cmp eq v5 v21, !92
//         v23 = call assert_11(v22), !93
//         v24 = const u64 0, !94
//         v25 = get_elem_ptr init, ptr u64, v24, !95
//         v26 = load v25
//         v27 = const u64 2, !96
//         v28 = mul v27, v26, !97
//         v29 = const u64 0, !98
//         v30 = get_elem_ptr init, ptr u64, v29, !99
//         v31 = load v30
//         v32 = const u64 3, !100
//         v33 = mul v32, v31, !101
//         v34 = const u64 0, !102
//         v35 = get_elem_ptr init, ptr u64, v34, !103
//         v36 = load v35
//         v37 = const u64 0, !104
//         v38 = get_elem_ptr init, ptr u64, v37, !105
//         v39 = load v38
//         v40 = cmp eq v36 v39, !106
//         v41 = call assert_11(v40), !107
//         v42 = const u64 0, !108
//         v43 = get_elem_ptr init, ptr u64, v42, !109
//         v44 = load v43
//         v45 = const u64 2, !110
//         v46 = mul v45, v44, !111
//         v47 = cmp eq v28 v46, !112
//         v48 = call assert_11(v47), !113
//         v49 = const u64 0, !114
//         v50 = get_elem_ptr init, ptr u64, v49, !115
//         v51 = load v50
//         v52 = const u64 3, !116
//         v53 = mul v52, v51, !117
//         v54 = cmp eq v33 v53, !118
//         v55 = call assert_11(v54), !119
//         v56 = const u64 42, !120
//         ret u64 v56
//     }
// }

// For the record, with the constants, everything got optimized away :-)
// script {
//     entry fn main() -> (), !1 {
//         entry():
//         v0 = const bool true, !2
//         v1 = call assert_0(v0), !3
//         v2 = const bool true, !4
//         v3 = call assert_0(v2), !5
//         v4 = const bool true, !6
//         v5 = call assert_0(v4), !7
//         v6 = const bool true, !8
//         v7 = call assert_0(v6), !9
//         v8 = const bool true, !10
//         v9 = call assert_0(v8), !11
//         v10 = const bool true, !12
//         v11 = call assert_0(v10), !13
//         v12 = const unit ()
//         ret () v12
//     }

//     pub fn assert_0(condition !15: bool) -> (), !16 {
//         entry(condition: bool):
//         v0 = const bool false, !18
//         v1 = cmp eq condition v0, !19
//         cbr v1, block0(), block1(), !19

//         block0():
//         v2 = const u64 18446744073709486084, !21
//         revert v2, !25

//         block1():
//         v3 = const unit ()
//         ret () v3
//     }
// }
