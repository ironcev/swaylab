script;

struct S {
    b: bool,
    x: u64,
}

fn main() -> u64 {
    let ret = non_mut_to_mut();
    assert(ret == 42);

    let ret = mut_to_mut();
    assert(ret == 42);

    let ret = non_mut_to_non_mut();
    assert(ret == 42);

    let ret = mut_to_non_mut_with_mutation_after_assignment();
    assert(ret == 42);

    let ret = mut_to_non_mut_without_mutation_after_assignment();
    assert(ret == 42);

    ret
}

#[inline(never)]
fn mut_to_non_mut_without_mutation_after_assignment() -> u64 {
    let mut s = S { b: false, x: 0 };
    s.b = !s.b;
    s.x = s.x + 21;

    let a = s;
    assert(__addr_of(a) == __addr_of(s));

    assert(a.b == s.b);
    assert(a.x == s.x);

    a.x + s.x
}

#[inline(never)]
fn mut_to_non_mut_with_mutation_after_assignment() -> u64 {
    let mut s = S { b: false, x: 0 };
    s.b = !s.b;
    s.x = s.x + 21;

    let a = s;
    assert(__addr_of(a) != __addr_of(s));

    assert(a.b == true);
    assert(a.x == 21);

    s.b = !s.b;
    s.x = 42;

    assert(a.b == true);
    assert(a.x == 21);

    assert(a.b != s.b);
    assert(a.x != s.x);

    s.x
}

#[inline(never)]
fn non_mut_to_non_mut() -> u64 {
    let s = S { b: false, x: 0 };

    let a = s;

    assert(__addr_of(a) == __addr_of(s));
    assert(a.b == s.b);
    assert(a.x == s.x);

    a.x + s.x + 42
}

#[inline(never)]
fn non_mut_to_mut() -> u64 {
    let s = S { b: false, x: 0 };

    let mut a = s;

    assert(__addr_of(a) != __addr_of(s));
    assert(a.b == s.b);
    assert(a.x == s.x);

    a.b = !s.b;
    a.x = 11;

    assert(a.b != s.b);
    assert(a.x != s.x);

    a.x + s.x + 31
}

#[inline(never)]
fn mut_to_mut() -> u64 {
    let mut s = S { b: true, x: 100 };

    s.b = false;
    s.x = 0;

    let mut a = s;

    assert(__addr_of(a) != __addr_of(s));
    assert(a.b == s.b);
    assert(a.x == s.x);

    a.b = !s.b;
    a.x = 11;

    assert(a.b != s.b);
    assert(a.x != s.x);

    a.x + s.x + 31
}

// script {
//     entry fn main() -> u64, !1 {
//         entry():
//         v0 = call non_mut_to_mut_0(), !2
//         v1 = const u64 42, !3
//         v2 = cmp eq v0 v1, !4
//         v3 = call assert_49(v2), !5
//         v4 = call mut_to_mut_21(), !6
//         v5 = const u64 42, !7
//         v6 = cmp eq v4 v5, !8
//         v7 = call assert_49(v6), !9
//         v8 = call non_mut_to_non_mut_38(), !10
//         v9 = const u64 42, !11
//         v10 = cmp eq v8 v9, !12
//         v11 = call assert_49(v10), !13
//         v12 = call mut_to_non_mut_with_mutation_after_assignment_46(), !14
//         v13 = const u64 42, !15
//         v14 = cmp eq v12 v13, !16
//         v15 = call assert_49(v14), !17
//         v16 = call mut_to_non_mut_without_mutation_after_assignment_63(), !18
//         v17 = const u64 42, !19
//         v18 = cmp eq v16 v17, !20
//         v19 = call assert_49(v18), !21
//         ret u64 v16
//     }

//     fn non_mut_to_mut_0() -> u64, !24 {
//         local { bool, u64 } __anon_0
//         local mut { bool, u64 } a

//         entry():
//         v0 = get_local ptr { bool, u64 }, __anon_0, !25
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, ptr bool, v1
//         v3 = const bool false, !26
//         store v3 to v2, !25
//         v4 = const u64 1
//         v5 = get_elem_ptr v0, ptr u64, v4
//         v6 = const u64 0, !27
//         store v6 to v5, !25
//         v7 = get_local ptr { bool, u64 }, __anon_0, !28
//         v8 = get_local ptr { bool, u64 }, a, !29
//         mem_copy_val v8, v7
//         v9 = get_local ptr { bool, u64 }, a, !30
//         v10 = ptr_to_int v9 to u64, !31
//         v11 = get_local ptr { bool, u64 }, __anon_0, !32
//         v12 = ptr_to_int v11 to u64, !33
//         v13 = cmp eq v10 v12, !37
//         v14 = const bool false, !38
//         v15 = cmp eq v13 v14, !40
//         v16 = call assert_49(v15), !41
//         v17 = get_local ptr { bool, u64 }, a, !42
//         v18 = const u64 0
//         v19 = get_elem_ptr v17, ptr bool, v18, !43
//         v20 = load v19
//         v21 = get_local ptr { bool, u64 }, __anon_0, !44
//         v22 = const u64 0
//         v23 = get_elem_ptr v21, ptr bool, v22, !43
//         v24 = load v23
//         v25 = cmp eq v20 v24, !45
//         v26 = call assert_49(v25), !46
//         v27 = get_local ptr { bool, u64 }, a, !47
//         v28 = const u64 1
//         v29 = get_elem_ptr v27, ptr u64, v28, !48
//         v30 = load v29
//         v31 = get_local ptr { bool, u64 }, __anon_0, !49
//         v32 = const u64 1
//         v33 = get_elem_ptr v31, ptr u64, v32, !48
//         v34 = load v33
//         v35 = cmp eq v30 v34, !50
//         v36 = call assert_49(v35), !51
//         v37 = get_local ptr { bool, u64 }, a, !52
//         v38 = get_local ptr { bool, u64 }, __anon_0, !53
//         v39 = const u64 0
//         v40 = get_elem_ptr v38, ptr bool, v39, !43
//         v41 = load v40
//         v42 = const bool false, !38
//         v43 = cmp eq v41 v42, !54
//         v44 = const u64 0
//         v45 = get_elem_ptr v37, ptr bool, v44, !52
//         store v43 to v45, !52
//         v46 = get_local ptr { bool, u64 }, a, !55
//         v47 = const u64 1
//         v48 = get_elem_ptr v46, ptr u64, v47, !55
//         v49 = const u64 11, !56
//         store v49 to v48, !55
//         v50 = get_local ptr { bool, u64 }, a, !57
//         v51 = const u64 0
//         v52 = get_elem_ptr v50, ptr bool, v51, !43
//         v53 = load v52
//         v54 = get_local ptr { bool, u64 }, __anon_0, !58
//         v55 = const u64 0
//         v56 = get_elem_ptr v54, ptr bool, v55, !43
//         v57 = load v56
//         v58 = cmp eq v53 v57, !60
//         v59 = const bool false, !38
//         v60 = cmp eq v58 v59, !61
//         v61 = call assert_49(v60), !62
//         v62 = get_local ptr { bool, u64 }, a, !63
//         v63 = const u64 1
//         v64 = get_elem_ptr v62, ptr u64, v63, !48
//         v65 = load v64
//         v66 = get_local ptr { bool, u64 }, __anon_0, !64
//         v67 = const u64 1
//         v68 = get_elem_ptr v66, ptr u64, v67, !48
//         v69 = load v68
//         v70 = cmp eq v65 v69, !66
//         v71 = const bool false, !38
//         v72 = cmp eq v70 v71, !67
//         v73 = call assert_49(v72), !68
//         v74 = get_local ptr { bool, u64 }, a, !69
//         v75 = const u64 1
//         v76 = get_elem_ptr v74, ptr u64, v75, !48
//         v77 = load v76
//         v78 = get_local ptr { bool, u64 }, __anon_0, !70
//         v79 = const u64 1
//         v80 = get_elem_ptr v78, ptr u64, v79, !48
//         v81 = load v80
//         v82 = add v77, v81, !71
//         v83 = const u64 31, !72
//         v84 = add v82, v83, !73
//         ret u64 v84
//     }

//     fn mut_to_mut_21() -> u64, !75 {
//         local mut { bool, u64 } a
//         local mut { bool, u64 } s

//         entry():
//         v0 = get_local ptr { bool, u64 }, s, !76
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, ptr bool, v1
//         v3 = const bool true, !77
//         store v3 to v2
//         v4 = const u64 1
//         v5 = get_elem_ptr v0, ptr u64, v4
//         v6 = const u64 100, !78
//         store v6 to v5
//         v7 = get_local ptr { bool, u64 }, s, !79
//         v8 = const u64 0
//         v9 = get_elem_ptr v7, ptr bool, v8, !79
//         v10 = const bool false, !80
//         store v10 to v9, !79
//         v11 = get_local ptr { bool, u64 }, s, !81
//         v12 = const u64 1
//         v13 = get_elem_ptr v11, ptr u64, v12, !81
//         v14 = const u64 0, !82
//         store v14 to v13, !81
//         v15 = get_local ptr { bool, u64 }, s, !83
//         v16 = get_local ptr { bool, u64 }, a, !84
//         mem_copy_val v16, v15
//         v17 = get_local ptr { bool, u64 }, a, !85
//         v18 = ptr_to_int v17 to u64, !86
//         v19 = get_local ptr { bool, u64 }, s, !87
//         v20 = ptr_to_int v19 to u64, !88
//         v21 = cmp eq v18 v20, !90
//         v22 = const bool false, !38
//         v23 = cmp eq v21 v22, !91
//         v24 = call assert_49(v23), !92
//         v25 = get_local ptr { bool, u64 }, a, !93
//         v26 = const u64 0
//         v27 = get_elem_ptr v25, ptr bool, v26, !43
//         v28 = load v27
//         v29 = get_local ptr { bool, u64 }, s, !94
//         v30 = const u64 0
//         v31 = get_elem_ptr v29, ptr bool, v30, !43
//         v32 = load v31
//         v33 = cmp eq v28 v32, !95
//         v34 = call assert_49(v33), !96
//         v35 = get_local ptr { bool, u64 }, a, !97
//         v36 = const u64 1
//         v37 = get_elem_ptr v35, ptr u64, v36, !48
//         v38 = load v37
//         v39 = get_local ptr { bool, u64 }, s, !98
//         v40 = const u64 1
//         v41 = get_elem_ptr v39, ptr u64, v40, !48
//         v42 = load v41
//         v43 = cmp eq v38 v42, !99
//         v44 = call assert_49(v43), !100
//         v45 = get_local ptr { bool, u64 }, a, !101
//         v46 = get_local ptr { bool, u64 }, s, !102
//         v47 = const u64 0
//         v48 = get_elem_ptr v46, ptr bool, v47, !43
//         v49 = load v48
//         v50 = const bool false, !38
//         v51 = cmp eq v49 v50, !103
//         v52 = const u64 0
//         v53 = get_elem_ptr v45, ptr bool, v52, !101
//         store v51 to v53, !101
//         v54 = get_local ptr { bool, u64 }, a, !104
//         v55 = const u64 1
//         v56 = get_elem_ptr v54, ptr u64, v55, !104
//         v57 = const u64 11, !105
//         store v57 to v56, !104
//         v58 = get_local ptr { bool, u64 }, a, !106
//         v59 = const u64 0
//         v60 = get_elem_ptr v58, ptr bool, v59, !43
//         v61 = load v60
//         v62 = get_local ptr { bool, u64 }, s, !107
//         v63 = const u64 0
//         v64 = get_elem_ptr v62, ptr bool, v63, !43
//         v65 = load v64
//         v66 = cmp eq v61 v65, !109
//         v67 = const bool false, !38
//         v68 = cmp eq v66 v67, !110
//         v69 = call assert_49(v68), !111
//         v70 = get_local ptr { bool, u64 }, a, !112
//         v71 = const u64 1
//         v72 = get_elem_ptr v70, ptr u64, v71, !48
//         v73 = load v72
//         v74 = get_local ptr { bool, u64 }, s, !113
//         v75 = const u64 1
//         v76 = get_elem_ptr v74, ptr u64, v75, !48
//         v77 = load v76
//         v78 = cmp eq v73 v77, !115
//         v79 = const bool false, !38
//         v80 = cmp eq v78 v79, !116
//         v81 = call assert_49(v80), !117
//         v82 = get_local ptr { bool, u64 }, a, !118
//         v83 = const u64 1
//         v84 = get_elem_ptr v82, ptr u64, v83, !48
//         v85 = load v84
//         v86 = get_local ptr { bool, u64 }, s, !119
//         v87 = const u64 1
//         v88 = get_elem_ptr v86, ptr u64, v87, !48
//         v89 = load v88
//         v90 = add v85, v89, !120
//         v91 = const u64 31, !121
//         v92 = add v90, v91, !122
//         ret u64 v92
//     }

//     fn non_mut_to_non_mut_38() -> u64, !124 {
//         local { bool, u64 } __anon_0

//         entry():
//         v0 = get_local ptr { bool, u64 }, __anon_0, !125
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, ptr bool, v1
//         v3 = const bool false, !126
//         store v3 to v2, !125
//         v4 = const u64 1
//         v5 = get_elem_ptr v0, ptr u64, v4
//         v6 = const u64 0, !127
//         store v6 to v5, !125
//         v7 = get_local ptr { bool, u64 }, __anon_0, !128
//         v8 = ptr_to_int v7 to u64, !129
//         v9 = get_local ptr { bool, u64 }, __anon_0, !130
//         v10 = ptr_to_int v9 to u64, !131
//         v11 = cmp eq v8 v10, !132
//         v12 = call assert_49(v11), !133
//         v13 = get_local ptr { bool, u64 }, __anon_0, !134
//         v14 = const u64 0
//         v15 = get_elem_ptr v13, ptr bool, v14, !43
//         v16 = load v15
//         v17 = get_local ptr { bool, u64 }, __anon_0, !135
//         v18 = const u64 0
//         v19 = get_elem_ptr v17, ptr bool, v18, !43
//         v20 = load v19
//         v21 = cmp eq v16 v20, !136
//         v22 = call assert_49(v21), !137
//         v23 = get_local ptr { bool, u64 }, __anon_0, !138
//         v24 = const u64 1
//         v25 = get_elem_ptr v23, ptr u64, v24, !48
//         v26 = load v25
//         v27 = get_local ptr { bool, u64 }, __anon_0, !139
//         v28 = const u64 1
//         v29 = get_elem_ptr v27, ptr u64, v28, !48
//         v30 = load v29
//         v31 = cmp eq v26 v30, !140
//         v32 = call assert_49(v31), !141
//         v33 = get_local ptr { bool, u64 }, __anon_0, !142
//         v34 = const u64 1
//         v35 = get_elem_ptr v33, ptr u64, v34, !48
//         v36 = load v35
//         v37 = get_local ptr { bool, u64 }, __anon_0, !143
//         v38 = const u64 1
//         v39 = get_elem_ptr v37, ptr u64, v38, !48
//         v40 = load v39
//         v41 = add v36, v40, !144
//         v42 = const u64 42, !145
//         v43 = add v41, v42, !146
//         ret u64 v43
//     }

//     fn mut_to_non_mut_with_mutation_after_assignment_46() -> u64, !148 {
//         local { bool, u64 } a
//         local mut { bool, u64 } s

//         entry():
//         v0 = get_local ptr { bool, u64 }, s, !149
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, ptr bool, v1
//         v3 = const bool false, !150
//         store v3 to v2
//         v4 = const u64 1
//         v5 = get_elem_ptr v0, ptr u64, v4
//         v6 = const u64 0, !151
//         store v6 to v5
//         v7 = get_local ptr { bool, u64 }, s, !152
//         v8 = get_local ptr { bool, u64 }, s, !153
//         v9 = const u64 0
//         v10 = get_elem_ptr v8, ptr bool, v9, !43
//         v11 = load v10
//         v12 = const bool false, !38
//         v13 = cmp eq v11 v12, !154
//         v14 = const u64 0
//         v15 = get_elem_ptr v7, ptr bool, v14, !152
//         store v13 to v15, !152
//         v16 = get_local ptr { bool, u64 }, s, !155
//         v17 = get_local ptr { bool, u64 }, s, !156
//         v18 = const u64 1
//         v19 = get_elem_ptr v17, ptr u64, v18, !48
//         v20 = load v19
//         v21 = const u64 21, !157
//         v22 = add v20, v21, !158
//         v23 = const u64 1
//         v24 = get_elem_ptr v16, ptr u64, v23, !155
//         store v22 to v24, !155
//         v25 = get_local ptr { bool, u64 }, s, !159
//         v26 = get_local ptr { bool, u64 }, a, !160
//         mem_copy_val v26, v25
//         v27 = get_local ptr { bool, u64 }, a, !161
//         v28 = ptr_to_int v27 to u64, !162
//         v29 = get_local ptr { bool, u64 }, s, !163
//         v30 = ptr_to_int v29 to u64, !164
//         v31 = cmp eq v28 v30, !166
//         v32 = const bool false, !38
//         v33 = cmp eq v31 v32, !167
//         v34 = call assert_49(v33), !168
//         v35 = get_local ptr { bool, u64 }, a, !169
//         v36 = const u64 0
//         v37 = get_elem_ptr v35, ptr bool, v36, !43
//         v38 = load v37
//         v39 = const bool true, !170
//         v40 = cmp eq v38 v39, !171
//         v41 = call assert_49(v40), !172
//         v42 = get_local ptr { bool, u64 }, a, !173
//         v43 = const u64 1
//         v44 = get_elem_ptr v42, ptr u64, v43, !48
//         v45 = load v44
//         v46 = const u64 21, !174
//         v47 = cmp eq v45 v46, !175
//         v48 = call assert_49(v47), !176
//         v49 = get_local ptr { bool, u64 }, s, !177
//         v50 = get_local ptr { bool, u64 }, s, !178
//         v51 = const u64 0
//         v52 = get_elem_ptr v50, ptr bool, v51, !43
//         v53 = load v52
//         v54 = cmp eq v53 v12, !179
//         v55 = const u64 0
//         v56 = get_elem_ptr v49, ptr bool, v55, !177
//         store v54 to v56, !177
//         v57 = get_local ptr { bool, u64 }, s, !180
//         v58 = const u64 1
//         v59 = get_elem_ptr v57, ptr u64, v58, !180
//         v60 = const u64 42, !181
//         store v60 to v59, !180
//         v61 = get_local ptr { bool, u64 }, a, !182
//         v62 = const u64 0
//         v63 = get_elem_ptr v61, ptr bool, v62, !43
//         v64 = load v63
//         v65 = const bool true, !183
//         v66 = cmp eq v64 v65, !184
//         v67 = call assert_49(v66), !185
//         v68 = get_local ptr { bool, u64 }, a, !186
//         v69 = const u64 1
//         v70 = get_elem_ptr v68, ptr u64, v69, !48
//         v71 = load v70
//         v72 = const u64 21, !187
//         v73 = cmp eq v71 v72, !188
//         v74 = call assert_49(v73), !189
//         v75 = get_local ptr { bool, u64 }, a, !190
//         v76 = const u64 0
//         v77 = get_elem_ptr v75, ptr bool, v76, !43
//         v78 = load v77
//         v79 = get_local ptr { bool, u64 }, s, !191
//         v80 = const u64 0
//         v81 = get_elem_ptr v79, ptr bool, v80, !43
//         v82 = load v81
//         v83 = cmp eq v78 v82, !193
//         v84 = const bool false, !38
//         v85 = cmp eq v83 v84, !194
//         v86 = call assert_49(v85), !195
//         v87 = get_local ptr { bool, u64 }, a, !196
//         v88 = const u64 1
//         v89 = get_elem_ptr v87, ptr u64, v88, !48
//         v90 = load v89
//         v91 = get_local ptr { bool, u64 }, s, !197
//         v92 = const u64 1
//         v93 = get_elem_ptr v91, ptr u64, v92, !48
//         v94 = load v93
//         v95 = cmp eq v90 v94, !199
//         v96 = const bool false, !38
//         v97 = cmp eq v95 v96, !200
//         v98 = call assert_49(v97), !201
//         v99 = get_local ptr { bool, u64 }, s, !202
//         v100 = const u64 1
//         v101 = get_elem_ptr v99, ptr u64, v100, !48
//         v102 = load v101
//         ret u64 v102
//     }

//     pub fn assert_49(condition !204: bool) -> (), !205 {
//         entry(condition: bool):
//         v0 = const bool false, !38
//         v1 = cmp eq condition v0, !206
//         cbr v1, block0(), block1(), !206

//         block0():
//         v2 = const u64 18446744073709486084, !208
//         revert v2, !212

//         block1():
//         v3 = const unit ()
//         ret () v3
//     }

//     fn mut_to_non_mut_without_mutation_after_assignment_63() -> u64, !214 {
//         local mut { bool, u64 } s

//         entry():
//         v0 = get_local ptr { bool, u64 }, s, !215
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, ptr bool, v1
//         v3 = const bool false, !216
//         store v3 to v2
//         v4 = const u64 1
//         v5 = get_elem_ptr v0, ptr u64, v4
//         v6 = const u64 0, !217
//         store v6 to v5
//         v7 = get_local ptr { bool, u64 }, s, !218
//         v8 = get_local ptr { bool, u64 }, s, !219
//         v9 = const u64 0
//         v10 = get_elem_ptr v8, ptr bool, v9, !43
//         v11 = load v10
//         v12 = const bool false, !38
//         v13 = cmp eq v11 v12, !220
//         v14 = const u64 0
//         v15 = get_elem_ptr v7, ptr bool, v14, !218
//         store v13 to v15, !218
//         v16 = get_local ptr { bool, u64 }, s, !221
//         v17 = get_local ptr { bool, u64 }, s, !222
//         v18 = const u64 1
//         v19 = get_elem_ptr v17, ptr u64, v18, !48
//         v20 = load v19
//         v21 = const u64 21, !223
//         v22 = add v20, v21, !224
//         v23 = const u64 1
//         v24 = get_elem_ptr v16, ptr u64, v23, !221
//         store v22 to v24, !221
//         v25 = get_local ptr { bool, u64 }, s, !225
//         v26 = ptr_to_int v25 to u64, !226
//         v27 = get_local ptr { bool, u64 }, s, !227
//         v28 = ptr_to_int v27 to u64, !228
//         v29 = cmp eq v26 v28, !229
//         v30 = call assert_49(v29), !230
//         v31 = get_local ptr { bool, u64 }, s, !231
//         v32 = const u64 0
//         v33 = get_elem_ptr v31, ptr bool, v32, !43
//         v34 = load v33
//         v35 = get_local ptr { bool, u64 }, s, !232
//         v36 = const u64 0
//         v37 = get_elem_ptr v35, ptr bool, v36, !43
//         v38 = load v37
//         v39 = cmp eq v34 v38, !233
//         v40 = call assert_49(v39), !234
//         v41 = get_local ptr { bool, u64 }, s, !235
//         v42 = const u64 1
//         v43 = get_elem_ptr v41, ptr u64, v42, !48
//         v44 = load v43
//         v45 = get_local ptr { bool, u64 }, s, !236
//         v46 = const u64 1
//         v47 = get_elem_ptr v45, ptr u64, v46, !48
//         v48 = load v47
//         v49 = cmp eq v44 v48, !237
//         v50 = call assert_49(v49), !238
//         v51 = get_local ptr { bool, u64 }, s, !239
//         v52 = const u64 1
//         v53 = get_elem_ptr v51, ptr u64, v52, !48
//         v54 = load v53
//         v55 = get_local ptr { bool, u64 }, s, !240
//         v56 = const u64 1
//         v57 = get_elem_ptr v55, ptr u64, v56, !48
//         v58 = load v57
//         v59 = add v54, v58, !241
//         ret u64 v59
//     }
// }