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

    let ptr_a = __addr_of(a);
    let ptr_c_a_1 = __addr_of(c_a_1);
    let ptr_c_a_2 = __addr_of(c_a_2);
    assert(ptr_a != ptr_c_a_1);
    assert(ptr_c_a_1 != ptr_c_a_2);
    assert(ptr_c_a_2 != ptr_a);

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

    let ptr_a = __addr_of(a);
    let ptr_c_a_1 = __addr_of(c_a_1);
    let ptr_c_a_2 = __addr_of(c_a_2);
    assert(ptr_a != ptr_c_a_1);
    assert(ptr_c_a_1 != ptr_c_a_2);
    assert(ptr_c_a_2 != ptr_a);

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

    // ERROR: Unsupported argument type to intrinsic "addr_of". Hint: Only a reference type can be used as argument here
    // let ptr_a = __addr_of(a);
    // let ptr_c_a_1 = __addr_of(c_a_1);
    // let ptr_c_a_2 = __addr_of(c_a_2);
    // assert(ptr_a != ptr_c_a_1);
    // assert(ptr_c_a_1 != ptr_c_a_2);
    // assert(ptr_c_a_2 != ptr_a);

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
//         v4 = call assert_20(v3), !6
//         v5 = get_local ptr { u64 }, __anon_0, !7
//         v6 = const u64 0
//         v7 = get_elem_ptr v5, ptr u64, v6
//         v8 = const u64 11, !8
//         store v8 to v7, !7
//         v9 = get_local ptr { u64 }, __anon_0
//         v10 = call struct_value_10(v9)
//         v11 = const u64 42, !9
//         v12 = cmp eq v10 v11, !10
//         v13 = call assert_20(v12), !11
//         v14 = get_local ptr [u64; 1], __anon_1, !12
//         v15 = const u64 0
//         v16 = get_elem_ptr v14, ptr u64, v15
//         v17 = const u64 11, !13
//         store v17 to v16, !12
//         v18 = get_local ptr [u64; 1], __anon_1
//         v19 = call array_value_19(v18)
//         v20 = const u64 42, !14
//         v21 = cmp eq v19 v20, !15
//         v22 = call assert_20(v21), !16
//         ret u64 v19
//     }

//     fn u64_value_0(init !17: u64) -> u64, !20 {
//         entry(init: u64):
//         v0 = cmp eq init init, !21
//         v1 = call assert_20(v0), !22
//         v2 = cmp eq init init, !23
//         v3 = call assert_20(v2), !24
//         v4 = cmp eq init init, !25
//         v5 = call assert_20(v4), !26
//         v6 = const u64 2, !27
//         v7 = mul v6, init, !28
//         v8 = const u64 3, !29
//         v9 = mul v8, init, !30
//         v10 = cmp eq init init, !31
//         v11 = call assert_20(v10), !32
//         v12 = const u64 2, !33
//         v13 = mul v12, init, !34
//         v14 = cmp eq v7 v13, !35
//         v15 = call assert_20(v14), !36
//         v16 = const u64 3, !37
//         v17 = mul v16, init, !38
//         v18 = cmp eq v9 v17, !39
//         v19 = call assert_20(v18), !40
//         v20 = const u64 42, !41
//         ret u64 v20
//     }

//     fn struct_value_10(init: ptr { u64 }) -> u64, !43 {
//         local mut { u64 } c_a_1
//         local mut { u64 } c_a_2

//         entry(init: ptr { u64 }):
//         v0 = get_local ptr { u64 }, c_a_1, !44
//         mem_copy_val v0, init
//         v1 = get_local ptr { u64 }, c_a_1, !45
//         v2 = get_local ptr { u64 }, c_a_2, !46
//         mem_copy_val v2, v1
//         v3 = const u64 0
//         v4 = get_elem_ptr init, ptr u64, v3, !47
//         v5 = load v4
//         v6 = const u64 0
//         v7 = get_elem_ptr init, ptr u64, v6, !47
//         v8 = load v7
//         v9 = cmp eq v5 v8, !48
//         v10 = call assert_20(v9), !49
//         v11 = get_local ptr { u64 }, c_a_1, !50
//         v12 = const u64 0
//         v13 = get_elem_ptr v11, ptr u64, v12, !47
//         v14 = load v13
//         v15 = const u64 0
//         v16 = get_elem_ptr init, ptr u64, v15, !47
//         v17 = load v16
//         v18 = cmp eq v14 v17, !51
//         v19 = call assert_20(v18), !52
//         v20 = get_local ptr { u64 }, c_a_2, !53
//         v21 = const u64 0
//         v22 = get_elem_ptr v20, ptr u64, v21, !47
//         v23 = load v22
//         v24 = const u64 0
//         v25 = get_elem_ptr init, ptr u64, v24, !47
//         v26 = load v25
//         v27 = cmp eq v23 v26, !54
//         v28 = call assert_20(v27), !55
//         v29 = get_local ptr { u64 }, c_a_1, !56
//         v30 = const u64 0
//         v31 = get_elem_ptr init, ptr u64, v30, !47
//         v32 = load v31
//         v33 = const u64 2, !57
//         v34 = mul v33, v32, !58
//         v35 = const u64 0
//         v36 = get_elem_ptr v29, ptr u64, v35, !56
//         store v34 to v36, !56
//         v37 = get_local ptr { u64 }, c_a_2, !59
//         v38 = const u64 0
//         v39 = get_elem_ptr init, ptr u64, v38, !47
//         v40 = load v39
//         v41 = const u64 3, !60
//         v42 = mul v41, v40, !61
//         v43 = const u64 0
//         v44 = get_elem_ptr v37, ptr u64, v43, !59
//         store v42 to v44, !59
//         v45 = const u64 0
//         v46 = get_elem_ptr init, ptr u64, v45, !47
//         v47 = load v46
//         v48 = const u64 0
//         v49 = get_elem_ptr init, ptr u64, v48, !47
//         v50 = load v49
//         v51 = cmp eq v47 v50, !62
//         v52 = call assert_20(v51), !63
//         v53 = get_local ptr { u64 }, c_a_1, !64
//         v54 = const u64 0
//         v55 = get_elem_ptr v53, ptr u64, v54, !47
//         v56 = load v55
//         v57 = const u64 0
//         v58 = get_elem_ptr init, ptr u64, v57, !47
//         v59 = load v58
//         v60 = const u64 2, !65
//         v61 = mul v60, v59, !66
//         v62 = cmp eq v56 v61, !67
//         v63 = call assert_20(v62), !68
//         v64 = get_local ptr { u64 }, c_a_2, !69
//         v65 = const u64 0
//         v66 = get_elem_ptr v64, ptr u64, v65, !47
//         v67 = load v66
//         v68 = const u64 0
//         v69 = get_elem_ptr init, ptr u64, v68, !47
//         v70 = load v69
//         v71 = const u64 3, !70
//         v72 = mul v71, v70, !71
//         v73 = cmp eq v67 v72, !72
//         v74 = call assert_20(v73), !73
//         v75 = ptr_to_int init to u64, !74
//         v76 = get_local ptr { u64 }, c_a_1, !75
//         v77 = ptr_to_int v76 to u64, !76
//         v78 = get_local ptr { u64 }, c_a_2, !77
//         v79 = ptr_to_int v78 to u64, !78
//         v80 = call neq_25(v75, v77), !79
//         v81 = call assert_20(v80), !80
//         v82 = call neq_25(v77, v79), !81
//         v83 = call assert_20(v82), !82
//         v84 = call neq_25(v79, v75), !83
//         v85 = call assert_20(v84), !84
//         v86 = const u64 42, !85
//         ret u64 v86
//     }

//     fn array_value_19(init: ptr [u64; 1]) -> u64, !87 {
//         local mut [u64; 1] c_a_1
//         local mut [u64; 1] c_a_2

//         entry(init: ptr [u64; 1]):
//         v0 = get_local ptr [u64; 1], c_a_1, !88
//         mem_copy_val v0, init
//         v1 = get_local ptr [u64; 1], c_a_1, !89
//         v2 = get_local ptr [u64; 1], c_a_2, !90
//         mem_copy_val v2, v1
//         v3 = const u64 0, !91
//         v4 = get_elem_ptr init, ptr u64, v3, !92
//         v5 = load v4
//         v6 = const u64 0, !93
//         v7 = get_elem_ptr init, ptr u64, v6, !94
//         v8 = load v7
//         v9 = cmp eq v5 v8, !95
//         v10 = call assert_20(v9), !96
//         v11 = get_local ptr [u64; 1], c_a_1, !97
//         v12 = const u64 0, !98
//         v13 = get_elem_ptr v11, ptr u64, v12, !99
//         v14 = load v13
//         v15 = const u64 0, !100
//         v16 = get_elem_ptr init, ptr u64, v15, !101
//         v17 = load v16
//         v18 = cmp eq v14 v17, !102
//         v19 = call assert_20(v18), !103
//         v20 = get_local ptr [u64; 1], c_a_2, !104
//         v21 = const u64 0, !105
//         v22 = get_elem_ptr v20, ptr u64, v21, !106
//         v23 = load v22
//         v24 = const u64 0, !107
//         v25 = get_elem_ptr init, ptr u64, v24, !108
//         v26 = load v25
//         v27 = cmp eq v23 v26, !109
//         v28 = call assert_20(v27), !110
//         v29 = get_local ptr [u64; 1], c_a_1, !111
//         v30 = const u64 0, !112
//         v31 = get_elem_ptr init, ptr u64, v30, !113
//         v32 = load v31
//         v33 = const u64 2, !114
//         v34 = mul v33, v32, !115
//         v35 = const u64 0, !116
//         v36 = get_elem_ptr v29, ptr u64, v35, !111
//         store v34 to v36, !111
//         v37 = get_local ptr [u64; 1], c_a_2, !117
//         v38 = const u64 0, !118
//         v39 = get_elem_ptr init, ptr u64, v38, !119
//         v40 = load v39
//         v41 = const u64 3, !120
//         v42 = mul v41, v40, !121
//         v43 = const u64 0, !122
//         v44 = get_elem_ptr v37, ptr u64, v43, !117
//         store v42 to v44, !117
//         v45 = const u64 0, !123
//         v46 = get_elem_ptr init, ptr u64, v45, !124
//         v47 = load v46
//         v48 = const u64 0, !125
//         v49 = get_elem_ptr init, ptr u64, v48, !126
//         v50 = load v49
//         v51 = cmp eq v47 v50, !127
//         v52 = call assert_20(v51), !128
//         v53 = get_local ptr [u64; 1], c_a_1, !129
//         v54 = const u64 0, !130
//         v55 = get_elem_ptr v53, ptr u64, v54, !131
//         v56 = load v55
//         v57 = const u64 0, !132
//         v58 = get_elem_ptr init, ptr u64, v57, !133
//         v59 = load v58
//         v60 = const u64 2, !134
//         v61 = mul v60, v59, !135
//         v62 = cmp eq v56 v61, !136
//         v63 = call assert_20(v62), !137
//         v64 = get_local ptr [u64; 1], c_a_2, !138
//         v65 = const u64 0, !139
//         v66 = get_elem_ptr v64, ptr u64, v65, !140
//         v67 = load v66
//         v68 = const u64 0, !141
//         v69 = get_elem_ptr init, ptr u64, v68, !142
//         v70 = load v69
//         v71 = const u64 3, !143
//         v72 = mul v71, v70, !144
//         v73 = cmp eq v67 v72, !145
//         v74 = call assert_20(v73), !146
//         v75 = ptr_to_int init to u64, !147
//         v76 = get_local ptr [u64; 1], c_a_1, !148
//         v77 = ptr_to_int v76 to u64, !149
//         v78 = get_local ptr [u64; 1], c_a_2, !150
//         v79 = ptr_to_int v78 to u64, !151
//         v80 = call neq_25(v75, v77), !152
//         v81 = call assert_20(v80), !153
//         v82 = call neq_25(v77, v79), !154
//         v83 = call assert_20(v82), !155
//         v84 = call neq_25(v79, v75), !156
//         v85 = call assert_20(v84), !157
//         v86 = const u64 42, !158
//         ret u64 v86
//     }

//     pub fn assert_20(condition !160: bool) -> (), !161 {
//         entry(condition: bool):
//         v0 = const bool false, !163
//         v1 = cmp eq condition v0, !164
//         cbr v1, block0(), block1(), !164

//         block0():
//         v2 = const u64 18446744073709486084, !166
//         revert v2, !170

//         block1():
//         v3 = const unit ()
//         ret () v3
//     }

//     pub fn neq_25(self !171: u64, other !172: u64) -> bool, !173 {
//         entry(self: u64, other: u64):
//         v0 = cmp eq self other, !174
//         v1 = const bool false, !163
//         v2 = cmp eq v0 v1, !175
//         ret bool v2
//     }
// }
