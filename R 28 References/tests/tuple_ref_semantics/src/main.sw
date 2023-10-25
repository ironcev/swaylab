script;

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
    let mut s = (false, 0u64);
    s.0 = !s.0;
    s.1 = s.1 + 21;

    let a = s;
    assert(__addr_of(a) == __addr_of(s));

    assert(a.0 == s.0);
    assert(a.1 == s.1);

    a.1 + s.1
}

#[inline(never)]
fn mut_to_non_mut_with_mutation_after_assignment() -> u64 {
    let mut s = (false,  0);
    s.0 = !s.0;
    s.1 = s.1 + 21;

    let a = s;
    assert(__addr_of(a) != __addr_of(s));

    assert(a.0 == true);
    assert(a.1 == 21);

    s.0 = !s.0;
    s.1 = 42;

    assert(a.0 == true);
    assert(a.1 == 21);

    assert(a.0 != s.0);
    assert(a.1 != s.1);

    s.1
}

#[inline(never)]
fn non_mut_to_non_mut() -> u64 {
    let s = (false,  0);

    let a = s;

    assert(__addr_of(a) == __addr_of(s));
    assert(a.0 == s.0);
    assert(a.1 == s.1);

    a.1 + s.1 + 42
}

#[inline(never)]
fn non_mut_to_mut() -> u64 {
    let s = (false,  0);

    let mut a = s;

    assert(__addr_of(a) != __addr_of(s));
    assert(a.0 == s.0);
    assert(a.1 == s.1);

    a.0 = !s.0;
    a.1 = 11;

    assert(a.0 != s.0);
    assert(a.1 != s.1);

    a.1 + s.1 + 31
}

#[inline(never)]
fn mut_to_mut() -> u64 {
    let mut s = (true,  100);

    s.0 = false;
    s.1 = 0;

    let mut a = s;

    assert(__addr_of(a) != __addr_of(s));
    assert(a.0 == s.0);
    assert(a.1 == s.1);

    a.0 = !s.0;
    a.1 = 11;

    assert(a.0 != s.0);
    assert(a.1 != s.1);

    a.1 + s.1 + 31
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
//         v2 = get_elem_ptr v0, ptr bool, v1, !25
//         v3 = const bool false, !26
//         store v3 to v2, !25
//         v4 = const u64 1
//         v5 = get_elem_ptr v0, ptr u64, v4, !25
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
//         v23 = get_elem_ptr v21, ptr bool, v22, !45
//         v24 = load v23
//         v25 = cmp eq v20 v24, !46
//         v26 = call assert_49(v25), !47
//         v27 = get_local ptr { bool, u64 }, a, !48
//         v28 = const u64 1
//         v29 = get_elem_ptr v27, ptr u64, v28, !49
//         v30 = load v29
//         v31 = get_local ptr { bool, u64 }, __anon_0, !50
//         v32 = const u64 1
//         v33 = get_elem_ptr v31, ptr u64, v32, !51
//         v34 = load v33
//         v35 = cmp eq v30 v34, !52
//         v36 = call assert_49(v35), !53
//         v37 = get_local ptr { bool, u64 }, a, !54
//         v38 = get_local ptr { bool, u64 }, __anon_0, !55
//         v39 = const u64 0
//         v40 = get_elem_ptr v38, ptr bool, v39, !56
//         v41 = load v40
//         v42 = const bool false, !38
//         v43 = cmp eq v41 v42, !57
//         v44 = const u64 0
//         v45 = get_elem_ptr v37, ptr bool, v44, !54
//         store v43 to v45, !54
//         v46 = get_local ptr { bool, u64 }, a, !58
//         v47 = const u64 1
//         v48 = get_elem_ptr v46, ptr u64, v47, !58
//         v49 = const u64 11, !59
//         store v49 to v48, !58
//         v50 = get_local ptr { bool, u64 }, a, !60
//         v51 = const u64 0
//         v52 = get_elem_ptr v50, ptr bool, v51, !61
//         v53 = load v52
//         v54 = get_local ptr { bool, u64 }, __anon_0, !62
//         v55 = const u64 0
//         v56 = get_elem_ptr v54, ptr bool, v55, !63
//         v57 = load v56
//         v58 = cmp eq v53 v57, !65
//         v59 = const bool false, !38
//         v60 = cmp eq v58 v59, !66
//         v61 = call assert_49(v60), !67
//         v62 = get_local ptr { bool, u64 }, a, !68
//         v63 = const u64 1
//         v64 = get_elem_ptr v62, ptr u64, v63, !69
//         v65 = load v64
//         v66 = get_local ptr { bool, u64 }, __anon_0, !70
//         v67 = const u64 1
//         v68 = get_elem_ptr v66, ptr u64, v67, !71
//         v69 = load v68
//         v70 = cmp eq v65 v69, !73
//         v71 = const bool false, !38
//         v72 = cmp eq v70 v71, !74
//         v73 = call assert_49(v72), !75
//         v74 = get_local ptr { bool, u64 }, a, !76
//         v75 = const u64 1
//         v76 = get_elem_ptr v74, ptr u64, v75, !77
//         v77 = load v76
//         v78 = get_local ptr { bool, u64 }, __anon_0, !78
//         v79 = const u64 1
//         v80 = get_elem_ptr v78, ptr u64, v79, !79
//         v81 = load v80
//         v82 = add v77, v81, !80
//         v83 = const u64 31, !81
//         v84 = add v82, v83, !82
//         ret u64 v84
//     }

//     fn mut_to_mut_21() -> u64, !84 {
//         local mut { bool, u64 } a
//         local mut { bool, u64 } s

//         entry():
//         v0 = get_local ptr { bool, u64 }, s, !85
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, ptr bool, v1
//         v3 = const bool true, !86
//         store v3 to v2
//         v4 = const u64 1
//         v5 = get_elem_ptr v0, ptr u64, v4
//         v6 = const u64 100, !87
//         store v6 to v5
//         v7 = get_local ptr { bool, u64 }, s, !88
//         v8 = const u64 0
//         v9 = get_elem_ptr v7, ptr bool, v8, !88
//         v10 = const bool false, !89
//         store v10 to v9, !88
//         v11 = get_local ptr { bool, u64 }, s, !90
//         v12 = const u64 1
//         v13 = get_elem_ptr v11, ptr u64, v12, !90
//         v14 = const u64 0, !91
//         store v14 to v13, !90
//         v15 = get_local ptr { bool, u64 }, s, !92
//         v16 = get_local ptr { bool, u64 }, a, !93
//         mem_copy_val v16, v15
//         v17 = get_local ptr { bool, u64 }, a, !94
//         v18 = ptr_to_int v17 to u64, !95
//         v19 = get_local ptr { bool, u64 }, s, !96
//         v20 = ptr_to_int v19 to u64, !97
//         v21 = cmp eq v18 v20, !99
//         v22 = const bool false, !38
//         v23 = cmp eq v21 v22, !100
//         v24 = call assert_49(v23), !101
//         v25 = get_local ptr { bool, u64 }, a, !102
//         v26 = const u64 0
//         v27 = get_elem_ptr v25, ptr bool, v26, !103
//         v28 = load v27
//         v29 = get_local ptr { bool, u64 }, s, !104
//         v30 = const u64 0
//         v31 = get_elem_ptr v29, ptr bool, v30, !105
//         v32 = load v31
//         v33 = cmp eq v28 v32, !106
//         v34 = call assert_49(v33), !107
//         v35 = get_local ptr { bool, u64 }, a, !108
//         v36 = const u64 1
//         v37 = get_elem_ptr v35, ptr u64, v36, !109
//         v38 = load v37
//         v39 = get_local ptr { bool, u64 }, s, !110
//         v40 = const u64 1
//         v41 = get_elem_ptr v39, ptr u64, v40, !111
//         v42 = load v41
//         v43 = cmp eq v38 v42, !112
//         v44 = call assert_49(v43), !113
//         v45 = get_local ptr { bool, u64 }, a, !114
//         v46 = get_local ptr { bool, u64 }, s, !115
//         v47 = const u64 0
//         v48 = get_elem_ptr v46, ptr bool, v47, !116
//         v49 = load v48
//         v50 = const bool false, !38
//         v51 = cmp eq v49 v50, !117
//         v52 = const u64 0
//         v53 = get_elem_ptr v45, ptr bool, v52, !114
//         store v51 to v53, !114
//         v54 = get_local ptr { bool, u64 }, a, !118
//         v55 = const u64 1
//         v56 = get_elem_ptr v54, ptr u64, v55, !118
//         v57 = const u64 11, !119
//         store v57 to v56, !118
//         v58 = get_local ptr { bool, u64 }, a, !120
//         v59 = const u64 0
//         v60 = get_elem_ptr v58, ptr bool, v59, !121
//         v61 = load v60
//         v62 = get_local ptr { bool, u64 }, s, !122
//         v63 = const u64 0
//         v64 = get_elem_ptr v62, ptr bool, v63, !123
//         v65 = load v64
//         v66 = cmp eq v61 v65, !125
//         v67 = const bool false, !38
//         v68 = cmp eq v66 v67, !126
//         v69 = call assert_49(v68), !127
//         v70 = get_local ptr { bool, u64 }, a, !128
//         v71 = const u64 1
//         v72 = get_elem_ptr v70, ptr u64, v71, !129
//         v73 = load v72
//         v74 = get_local ptr { bool, u64 }, s, !130
//         v75 = const u64 1
//         v76 = get_elem_ptr v74, ptr u64, v75, !131
//         v77 = load v76
//         v78 = cmp eq v73 v77, !133
//         v79 = const bool false, !38
//         v80 = cmp eq v78 v79, !134
//         v81 = call assert_49(v80), !135
//         v82 = get_local ptr { bool, u64 }, a, !136
//         v83 = const u64 1
//         v84 = get_elem_ptr v82, ptr u64, v83, !137
//         v85 = load v84
//         v86 = get_local ptr { bool, u64 }, s, !138
//         v87 = const u64 1
//         v88 = get_elem_ptr v86, ptr u64, v87, !139
//         v89 = load v88
//         v90 = add v85, v89, !140
//         v91 = const u64 31, !141
//         v92 = add v90, v91, !142
//         ret u64 v92
//     }

//     fn non_mut_to_non_mut_38() -> u64, !144 {
//         local { bool, u64 } __anon_0

//         entry():
//         v0 = get_local ptr { bool, u64 }, __anon_0, !145
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, ptr bool, v1, !145
//         v3 = const bool false, !146
//         store v3 to v2, !145
//         v4 = const u64 1
//         v5 = get_elem_ptr v0, ptr u64, v4, !145
//         v6 = const u64 0, !147
//         store v6 to v5, !145
//         v7 = get_local ptr { bool, u64 }, __anon_0, !148
//         v8 = ptr_to_int v7 to u64, !149
//         v9 = get_local ptr { bool, u64 }, __anon_0, !150
//         v10 = ptr_to_int v9 to u64, !151
//         v11 = cmp eq v8 v10, !152
//         v12 = call assert_49(v11), !153
//         v13 = get_local ptr { bool, u64 }, __anon_0, !154
//         v14 = const u64 0
//         v15 = get_elem_ptr v13, ptr bool, v14, !155
//         v16 = load v15
//         v17 = get_local ptr { bool, u64 }, __anon_0, !156
//         v18 = const u64 0
//         v19 = get_elem_ptr v17, ptr bool, v18, !157
//         v20 = load v19
//         v21 = cmp eq v16 v20, !158
//         v22 = call assert_49(v21), !159
//         v23 = get_local ptr { bool, u64 }, __anon_0, !160
//         v24 = const u64 1
//         v25 = get_elem_ptr v23, ptr u64, v24, !161
//         v26 = load v25
//         v27 = get_local ptr { bool, u64 }, __anon_0, !162
//         v28 = const u64 1
//         v29 = get_elem_ptr v27, ptr u64, v28, !163
//         v30 = load v29
//         v31 = cmp eq v26 v30, !164
//         v32 = call assert_49(v31), !165
//         v33 = get_local ptr { bool, u64 }, __anon_0, !166
//         v34 = const u64 1
//         v35 = get_elem_ptr v33, ptr u64, v34, !167
//         v36 = load v35
//         v37 = get_local ptr { bool, u64 }, __anon_0, !168
//         v38 = const u64 1
//         v39 = get_elem_ptr v37, ptr u64, v38, !169
//         v40 = load v39
//         v41 = add v36, v40, !170
//         v42 = const u64 42, !171
//         v43 = add v41, v42, !172
//         ret u64 v43
//     }

//     fn mut_to_non_mut_with_mutation_after_assignment_46() -> u64, !174 {
//         local { bool, u64 } a
//         local mut { bool, u64 } s

//         entry():
//         v0 = get_local ptr { bool, u64 }, s, !175
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, ptr bool, v1
//         v3 = const bool false, !176
//         store v3 to v2
//         v4 = const u64 1
//         v5 = get_elem_ptr v0, ptr u64, v4
//         v6 = const u64 0, !177
//         store v6 to v5
//         v7 = get_local ptr { bool, u64 }, s, !178
//         v8 = get_local ptr { bool, u64 }, s, !179
//         v9 = const u64 0
//         v10 = get_elem_ptr v8, ptr bool, v9, !180
//         v11 = load v10
//         v12 = const bool false, !38
//         v13 = cmp eq v11 v12, !181
//         v14 = const u64 0
//         v15 = get_elem_ptr v7, ptr bool, v14, !178
//         store v13 to v15, !178
//         v16 = get_local ptr { bool, u64 }, s, !182
//         v17 = get_local ptr { bool, u64 }, s, !183
//         v18 = const u64 1
//         v19 = get_elem_ptr v17, ptr u64, v18, !184
//         v20 = load v19
//         v21 = const u64 21, !185
//         v22 = add v20, v21, !186
//         v23 = const u64 1
//         v24 = get_elem_ptr v16, ptr u64, v23, !182
//         store v22 to v24, !182
//         v25 = get_local ptr { bool, u64 }, s, !187
//         v26 = get_local ptr { bool, u64 }, a, !188
//         mem_copy_val v26, v25
//         v27 = get_local ptr { bool, u64 }, a, !189
//         v28 = ptr_to_int v27 to u64, !190
//         v29 = get_local ptr { bool, u64 }, s, !191
//         v30 = ptr_to_int v29 to u64, !192
//         v31 = cmp eq v28 v30, !194
//         v32 = const bool false, !38
//         v33 = cmp eq v31 v32, !195
//         v34 = call assert_49(v33), !196
//         v35 = get_local ptr { bool, u64 }, a, !197
//         v36 = const u64 0
//         v37 = get_elem_ptr v35, ptr bool, v36, !198
//         v38 = load v37
//         v39 = const bool true, !199
//         v40 = cmp eq v38 v39, !200
//         v41 = call assert_49(v40), !201
//         v42 = get_local ptr { bool, u64 }, a, !202
//         v43 = const u64 1
//         v44 = get_elem_ptr v42, ptr u64, v43, !203
//         v45 = load v44
//         v46 = const u64 21, !204
//         v47 = cmp eq v45 v46, !205
//         v48 = call assert_49(v47), !206
//         v49 = get_local ptr { bool, u64 }, s, !207
//         v50 = get_local ptr { bool, u64 }, s, !208
//         v51 = const u64 0
//         v52 = get_elem_ptr v50, ptr bool, v51, !209
//         v53 = load v52
//         v54 = cmp eq v53 v12, !210
//         v55 = const u64 0
//         v56 = get_elem_ptr v49, ptr bool, v55, !207
//         store v54 to v56, !207
//         v57 = get_local ptr { bool, u64 }, s, !211
//         v58 = const u64 1
//         v59 = get_elem_ptr v57, ptr u64, v58, !211
//         v60 = const u64 42, !212
//         store v60 to v59, !211
//         v61 = get_local ptr { bool, u64 }, a, !213
//         v62 = const u64 0
//         v63 = get_elem_ptr v61, ptr bool, v62, !214
//         v64 = load v63
//         v65 = const bool true, !215
//         v66 = cmp eq v64 v65, !216
//         v67 = call assert_49(v66), !217
//         v68 = get_local ptr { bool, u64 }, a, !218
//         v69 = const u64 1
//         v70 = get_elem_ptr v68, ptr u64, v69, !219
//         v71 = load v70
//         v72 = const u64 21, !220
//         v73 = cmp eq v71 v72, !221
//         v74 = call assert_49(v73), !222
//         v75 = get_local ptr { bool, u64 }, a, !223
//         v76 = const u64 0
//         v77 = get_elem_ptr v75, ptr bool, v76, !224
//         v78 = load v77
//         v79 = get_local ptr { bool, u64 }, s, !225
//         v80 = const u64 0
//         v81 = get_elem_ptr v79, ptr bool, v80, !226
//         v82 = load v81
//         v83 = cmp eq v78 v82, !228
//         v84 = const bool false, !38
//         v85 = cmp eq v83 v84, !229
//         v86 = call assert_49(v85), !230
//         v87 = get_local ptr { bool, u64 }, a, !231
//         v88 = const u64 1
//         v89 = get_elem_ptr v87, ptr u64, v88, !232
//         v90 = load v89
//         v91 = get_local ptr { bool, u64 }, s, !233
//         v92 = const u64 1
//         v93 = get_elem_ptr v91, ptr u64, v92, !234
//         v94 = load v93
//         v95 = cmp eq v90 v94, !236
//         v96 = const bool false, !38
//         v97 = cmp eq v95 v96, !237
//         v98 = call assert_49(v97), !238
//         v99 = get_local ptr { bool, u64 }, s, !239
//         v100 = const u64 1
//         v101 = get_elem_ptr v99, ptr u64, v100, !240
//         v102 = load v101
//         ret u64 v102
//     }

//     pub fn assert_49(condition !242: bool) -> (), !243 {
//         entry(condition: bool):
//         v0 = const bool false, !38
//         v1 = cmp eq condition v0, !244
//         cbr v1, block0(), block1(), !244

//         block0():
//         v2 = const u64 18446744073709486084, !246
//         revert v2, !250

//         block1():
//         v3 = const unit ()
//         ret () v3
//     }

//     fn mut_to_non_mut_without_mutation_after_assignment_63() -> u64, !252 {
//         local mut { bool, u64 } s

//         entry():
//         v0 = get_local ptr { bool, u64 }, s, !253
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, ptr bool, v1
//         v3 = const bool false, !254
//         store v3 to v2
//         v4 = const u64 1
//         v5 = get_elem_ptr v0, ptr u64, v4
//         v6 = const u64 0, !255
//         store v6 to v5
//         v7 = get_local ptr { bool, u64 }, s, !256
//         v8 = get_local ptr { bool, u64 }, s, !257
//         v9 = const u64 0
//         v10 = get_elem_ptr v8, ptr bool, v9, !258
//         v11 = load v10
//         v12 = const bool false, !38
//         v13 = cmp eq v11 v12, !259
//         v14 = const u64 0
//         v15 = get_elem_ptr v7, ptr bool, v14, !256
//         store v13 to v15, !256
//         v16 = get_local ptr { bool, u64 }, s, !260
//         v17 = get_local ptr { bool, u64 }, s, !261
//         v18 = const u64 1
//         v19 = get_elem_ptr v17, ptr u64, v18, !262
//         v20 = load v19
//         v21 = const u64 21, !263
//         v22 = add v20, v21, !264
//         v23 = const u64 1
//         v24 = get_elem_ptr v16, ptr u64, v23, !260
//         store v22 to v24, !260
//         v25 = get_local ptr { bool, u64 }, s, !265
//         v26 = ptr_to_int v25 to u64, !266
//         v27 = get_local ptr { bool, u64 }, s, !267
//         v28 = ptr_to_int v27 to u64, !268
//         v29 = cmp eq v26 v28, !269
//         v30 = call assert_49(v29), !270
//         v31 = get_local ptr { bool, u64 }, s, !271
//         v32 = const u64 0
//         v33 = get_elem_ptr v31, ptr bool, v32, !272
//         v34 = load v33
//         v35 = get_local ptr { bool, u64 }, s, !273
//         v36 = const u64 0
//         v37 = get_elem_ptr v35, ptr bool, v36, !274
//         v38 = load v37
//         v39 = cmp eq v34 v38, !275
//         v40 = call assert_49(v39), !276
//         v41 = get_local ptr { bool, u64 }, s, !277
//         v42 = const u64 1
//         v43 = get_elem_ptr v41, ptr u64, v42, !278
//         v44 = load v43
//         v45 = get_local ptr { bool, u64 }, s, !279
//         v46 = const u64 1
//         v47 = get_elem_ptr v45, ptr u64, v46, !280
//         v48 = load v47
//         v49 = cmp eq v44 v48, !281
//         v50 = call assert_49(v49), !282
//         v51 = get_local ptr { bool, u64 }, s, !283
//         v52 = const u64 1
//         v53 = get_elem_ptr v51, ptr u64, v52, !284
//         v54 = load v53
//         v55 = get_local ptr { bool, u64 }, s, !285
//         v56 = const u64 1
//         v57 = get_elem_ptr v55, ptr u64, v56, !286
//         v58 = load v57
//         v59 = add v54, v58, !287
//         ret u64 v59
//     }
// }
