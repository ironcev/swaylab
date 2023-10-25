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
    let mut s = [0, 0];
    s[0] = s[0] + 11;
    s[1] = s[1] + 22;

    let a = s;
    assert(__addr_of(a) == __addr_of(s));

    assert(a[0] == s[0]);
    assert(a[1] == s[1]);

    a[1] + s[1] - 2
}

#[inline(never)]
fn mut_to_non_mut_with_mutation_after_assignment() -> u64 {
    let mut s = [0,  0];
    s[0] = s[0] + 11;
    s[1] = s[1] + 22;

    let a = s;
    assert(__addr_of(a) != __addr_of(s));

    assert(a[0] == 11);
    assert(a[1] == 22);

    s[0] = 0;
    s[1] = 42;

    assert(a[0] == 11);
    assert(a[1] == 22);

    assert(a[0] != s[0]);
    assert(a[1] != s[1]);

    s[1]
}

#[inline(never)]
fn non_mut_to_non_mut() -> u64 {
    let s = [0,  0];

    let a = s;

    assert(__addr_of(a) == __addr_of(s));
    assert(a[0] == s[0]);
    assert(a[1] == s[1]);

    a[1] + s[1] + 42
}

#[inline(never)]
fn non_mut_to_mut() -> u64 {
    let s = [11, 22];

    let mut a = s;

    assert(__addr_of(a) != __addr_of(s));
    assert(a[0] == s[0]);
    assert(a[1] == s[1]);

    a[0] = a[0] + 11;
    a[1] = 0;

    assert(a[0] != s[0]);
    assert(a[1] != s[1]);

    a[1] + s[1] + 20
}

#[inline(never)]
fn mut_to_mut() -> u64 {
    let mut s = [11,  22];

    s[0] = 0;
    s[1] = 0;

    let mut a = s;

    assert(__addr_of(a) != __addr_of(s));
    assert(a[0] == s[0]);
    assert(a[1] == s[1]);

    a[0] = a[0] + 11;
    a[1] = 22;

    assert(a[0] != s[0]);
    assert(a[1] != s[1]);

    a[1] + s[1] + 20
}

// script {
//     entry fn main() -> u64, !1 {
//         entry():
//         v0 = call non_mut_to_mut_0(), !2
//         v1 = const u64 42, !3
//         v2 = cmp eq v0 v1, !4
//         v3 = call assert_49(v2), !5
//         v4 = call mut_to_mut_16(), !6
//         v5 = const u64 42, !7
//         v6 = cmp eq v4 v5, !8
//         v7 = call assert_49(v6), !9
//         v8 = call non_mut_to_non_mut_28(), !10
//         v9 = const u64 42, !11
//         v10 = cmp eq v8 v9, !12
//         v11 = call assert_49(v10), !13
//         v12 = call mut_to_non_mut_with_mutation_after_assignment_35(), !14
//         v13 = const u64 42, !15
//         v14 = cmp eq v12 v13, !16
//         v15 = call assert_49(v14), !17
//         v16 = call mut_to_non_mut_without_mutation_after_assignment_47(), !18
//         v17 = const u64 42, !19
//         v18 = cmp eq v16 v17, !20
//         v19 = call assert_49(v18), !21
//         ret u64 v16
//     }

//     fn non_mut_to_mut_0() -> u64, !24 {
//         local [u64; 2] __anon_0
//         local mut [u64; 2] a

//         entry():
//         v0 = get_local ptr [u64; 2], __anon_0, !25
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, ptr u64, v1
//         v3 = const u64 11, !26
//         store v3 to v2, !25
//         v4 = const u64 1
//         v5 = get_elem_ptr v0, ptr u64, v4
//         v6 = const u64 22, !27
//         store v6 to v5, !25
//         v7 = get_local ptr [u64; 2], __anon_0, !28
//         v8 = get_local ptr [u64; 2], a, !29
//         mem_copy_val v8, v7
//         v9 = get_local ptr [u64; 2], a, !30
//         v10 = ptr_to_int v9 to u64, !31
//         v11 = get_local ptr [u64; 2], __anon_0, !32
//         v12 = ptr_to_int v11 to u64, !33
//         v13 = cmp eq v10 v12, !37
//         v14 = const bool false, !38
//         v15 = cmp eq v13 v14, !40
//         v16 = call assert_49(v15), !41
//         v17 = get_local ptr [u64; 2], a, !42
//         v18 = const u64 0, !43
//         v19 = get_elem_ptr v17, ptr u64, v18, !44
//         v20 = load v19
//         v21 = get_local ptr [u64; 2], __anon_0, !45
//         v22 = const u64 0, !46
//         v23 = get_elem_ptr v21, ptr u64, v22, !47
//         v24 = load v23
//         v25 = cmp eq v20 v24, !48
//         v26 = call assert_49(v25), !49
//         v27 = get_local ptr [u64; 2], a, !50
//         v28 = const u64 1, !51
//         v29 = get_elem_ptr v27, ptr u64, v28, !52
//         v30 = load v29
//         v31 = get_local ptr [u64; 2], __anon_0, !53
//         v32 = const u64 1, !54
//         v33 = get_elem_ptr v31, ptr u64, v32, !55
//         v34 = load v33
//         v35 = cmp eq v30 v34, !56
//         v36 = call assert_49(v35), !57
//         v37 = get_local ptr [u64; 2], a, !58
//         v38 = get_local ptr [u64; 2], a, !59
//         v39 = const u64 0, !60
//         v40 = get_elem_ptr v38, ptr u64, v39, !61
//         v41 = load v40
//         v42 = const u64 11, !62
//         v43 = add v41, v42, !63
//         v44 = const u64 0, !64
//         v45 = get_elem_ptr v37, ptr u64, v44, !58
//         store v43 to v45, !58
//         v46 = get_local ptr [u64; 2], a, !65
//         v47 = const u64 1, !66
//         v48 = get_elem_ptr v46, ptr u64, v47, !65
//         v49 = const u64 0, !67
//         store v49 to v48, !65
//         v50 = get_local ptr [u64; 2], a, !68
//         v51 = const u64 0, !69
//         v52 = get_elem_ptr v50, ptr u64, v51, !70
//         v53 = load v52
//         v54 = get_local ptr [u64; 2], __anon_0, !71
//         v55 = const u64 0, !72
//         v56 = get_elem_ptr v54, ptr u64, v55, !73
//         v57 = load v56
//         v58 = call neq_25(v53, v57), !74
//         v59 = call assert_49(v58), !75
//         v60 = get_local ptr [u64; 2], a, !76
//         v61 = const u64 1, !77
//         v62 = get_elem_ptr v60, ptr u64, v61, !78
//         v63 = load v62
//         v64 = get_local ptr [u64; 2], __anon_0, !79
//         v65 = const u64 1, !80
//         v66 = get_elem_ptr v64, ptr u64, v65, !81
//         v67 = load v66
//         v68 = call neq_25(v63, v67), !82
//         v69 = call assert_49(v68), !83
//         v70 = get_local ptr [u64; 2], a, !84
//         v71 = const u64 1, !85
//         v72 = get_elem_ptr v70, ptr u64, v71, !86
//         v73 = load v72
//         v74 = get_local ptr [u64; 2], __anon_0, !87
//         v75 = const u64 1, !88
//         v76 = get_elem_ptr v74, ptr u64, v75, !89
//         v77 = load v76
//         v78 = add v73, v77, !90
//         v79 = const u64 20, !91
//         v80 = add v78, v79, !92
//         ret u64 v80
//     }

//     fn mut_to_mut_16() -> u64, !94 {
//         local mut [u64; 2] a
//         local mut [u64; 2] s

//         entry():
//         v0 = get_local ptr [u64; 2], s, !95
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, ptr u64, v1
//         v3 = const u64 11, !96
//         store v3 to v2
//         v4 = const u64 1
//         v5 = get_elem_ptr v0, ptr u64, v4
//         v6 = const u64 22, !97
//         store v6 to v5
//         v7 = get_local ptr [u64; 2], s, !98
//         v8 = const u64 0, !99
//         v9 = get_elem_ptr v7, ptr u64, v8, !98
//         v10 = const u64 0, !100
//         store v10 to v9, !98
//         v11 = get_local ptr [u64; 2], s, !101
//         v12 = const u64 1, !102
//         v13 = get_elem_ptr v11, ptr u64, v12, !101
//         v14 = const u64 0, !103
//         store v14 to v13, !101
//         v15 = get_local ptr [u64; 2], s, !104
//         v16 = get_local ptr [u64; 2], a, !105
//         mem_copy_val v16, v15
//         v17 = get_local ptr [u64; 2], a, !106
//         v18 = ptr_to_int v17 to u64, !107
//         v19 = get_local ptr [u64; 2], s, !108
//         v20 = ptr_to_int v19 to u64, !109
//         v21 = cmp eq v18 v20, !111
//         v22 = const bool false, !38
//         v23 = cmp eq v21 v22, !112
//         v24 = call assert_49(v23), !113
//         v25 = get_local ptr [u64; 2], a, !114
//         v26 = const u64 0, !115
//         v27 = get_elem_ptr v25, ptr u64, v26, !116
//         v28 = load v27
//         v29 = get_local ptr [u64; 2], s, !117
//         v30 = const u64 0, !118
//         v31 = get_elem_ptr v29, ptr u64, v30, !119
//         v32 = load v31
//         v33 = cmp eq v28 v32, !120
//         v34 = call assert_49(v33), !121
//         v35 = get_local ptr [u64; 2], a, !122
//         v36 = const u64 1, !123
//         v37 = get_elem_ptr v35, ptr u64, v36, !124
//         v38 = load v37
//         v39 = get_local ptr [u64; 2], s, !125
//         v40 = const u64 1, !126
//         v41 = get_elem_ptr v39, ptr u64, v40, !127
//         v42 = load v41
//         v43 = cmp eq v38 v42, !128
//         v44 = call assert_49(v43), !129
//         v45 = get_local ptr [u64; 2], a, !130
//         v46 = get_local ptr [u64; 2], a, !131
//         v47 = const u64 0, !132
//         v48 = get_elem_ptr v46, ptr u64, v47, !133
//         v49 = load v48
//         v50 = const u64 11, !134
//         v51 = add v49, v50, !135
//         v52 = const u64 0, !136
//         v53 = get_elem_ptr v45, ptr u64, v52, !130
//         store v51 to v53, !130
//         v54 = get_local ptr [u64; 2], a, !137
//         v55 = const u64 1, !138
//         v56 = get_elem_ptr v54, ptr u64, v55, !137
//         v57 = const u64 22, !139
//         store v57 to v56, !137
//         v58 = get_local ptr [u64; 2], a, !140
//         v59 = const u64 0, !141
//         v60 = get_elem_ptr v58, ptr u64, v59, !142
//         v61 = load v60
//         v62 = get_local ptr [u64; 2], s, !143
//         v63 = const u64 0, !144
//         v64 = get_elem_ptr v62, ptr u64, v63, !145
//         v65 = load v64
//         v66 = call neq_25(v61, v65), !146
//         v67 = call assert_49(v66), !147
//         v68 = get_local ptr [u64; 2], a, !148
//         v69 = const u64 1, !149
//         v70 = get_elem_ptr v68, ptr u64, v69, !150
//         v71 = load v70
//         v72 = get_local ptr [u64; 2], s, !151
//         v73 = const u64 1, !152
//         v74 = get_elem_ptr v72, ptr u64, v73, !153
//         v75 = load v74
//         v76 = call neq_25(v71, v75), !154
//         v77 = call assert_49(v76), !155
//         v78 = get_local ptr [u64; 2], a, !156
//         v79 = const u64 1, !157
//         v80 = get_elem_ptr v78, ptr u64, v79, !158
//         v81 = load v80
//         v82 = get_local ptr [u64; 2], s, !159
//         v83 = const u64 1, !160
//         v84 = get_elem_ptr v82, ptr u64, v83, !161
//         v85 = load v84
//         v86 = add v81, v85, !162
//         v87 = const u64 20, !163
//         v88 = add v86, v87, !164
//         ret u64 v88
//     }

//     pub fn neq_25(self !165: u64, other !166: u64) -> bool, !167 {
//         entry(self: u64, other: u64):
//         v0 = cmp eq self other, !36
//         v1 = const bool false, !38
//         v2 = cmp eq v0 v1, !39
//         ret bool v2
//     }

//     fn non_mut_to_non_mut_28() -> u64, !169 {
//         local [u64; 2] __anon_0

//         entry():
//         v0 = get_local ptr [u64; 2], __anon_0, !170
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, ptr u64, v1
//         v3 = const u64 0, !171
//         store v3 to v2, !170
//         v4 = const u64 1
//         v5 = get_elem_ptr v0, ptr u64, v4
//         v6 = const u64 0, !172
//         store v6 to v5, !170
//         v7 = get_local ptr [u64; 2], __anon_0, !173
//         v8 = ptr_to_int v7 to u64, !174
//         v9 = get_local ptr [u64; 2], __anon_0, !175
//         v10 = ptr_to_int v9 to u64, !176
//         v11 = cmp eq v8 v10, !177
//         v12 = call assert_49(v11), !178
//         v13 = get_local ptr [u64; 2], __anon_0, !179
//         v14 = const u64 0, !180
//         v15 = get_elem_ptr v13, ptr u64, v14, !181
//         v16 = load v15
//         v17 = get_local ptr [u64; 2], __anon_0, !182
//         v18 = const u64 0, !183
//         v19 = get_elem_ptr v17, ptr u64, v18, !184
//         v20 = load v19
//         v21 = cmp eq v16 v20, !185
//         v22 = call assert_49(v21), !186
//         v23 = get_local ptr [u64; 2], __anon_0, !187
//         v24 = const u64 1, !188
//         v25 = get_elem_ptr v23, ptr u64, v24, !189
//         v26 = load v25
//         v27 = get_local ptr [u64; 2], __anon_0, !190
//         v28 = const u64 1, !191
//         v29 = get_elem_ptr v27, ptr u64, v28, !192
//         v30 = load v29
//         v31 = cmp eq v26 v30, !193
//         v32 = call assert_49(v31), !194
//         v33 = get_local ptr [u64; 2], __anon_0, !195
//         v34 = const u64 1, !196
//         v35 = get_elem_ptr v33, ptr u64, v34, !197
//         v36 = load v35
//         v37 = get_local ptr [u64; 2], __anon_0, !198
//         v38 = const u64 1, !199
//         v39 = get_elem_ptr v37, ptr u64, v38, !200
//         v40 = load v39
//         v41 = add v36, v40, !201
//         v42 = const u64 42, !202
//         v43 = add v41, v42, !203
//         ret u64 v43
//     }

//     fn mut_to_non_mut_with_mutation_after_assignment_35() -> u64, !205 {
//         local [u64; 2] a
//         local mut [u64; 2] s

//         entry():
//         v0 = get_local ptr [u64; 2], s, !206
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, ptr u64, v1
//         v3 = const u64 0, !207
//         store v3 to v2
//         v4 = const u64 1
//         v5 = get_elem_ptr v0, ptr u64, v4
//         v6 = const u64 0, !208
//         store v6 to v5
//         v7 = get_local ptr [u64; 2], s, !209
//         v8 = get_local ptr [u64; 2], s, !210
//         v9 = const u64 0, !211
//         v10 = get_elem_ptr v8, ptr u64, v9, !212
//         v11 = load v10
//         v12 = const u64 11, !213
//         v13 = add v11, v12, !214
//         v14 = const u64 0, !215
//         v15 = get_elem_ptr v7, ptr u64, v14, !209
//         store v13 to v15, !209
//         v16 = get_local ptr [u64; 2], s, !216
//         v17 = get_local ptr [u64; 2], s, !217
//         v18 = const u64 1, !218
//         v19 = get_elem_ptr v17, ptr u64, v18, !219
//         v20 = load v19
//         v21 = const u64 22, !220
//         v22 = add v20, v21, !221
//         v23 = const u64 1, !222
//         v24 = get_elem_ptr v16, ptr u64, v23, !216
//         store v22 to v24, !216
//         v25 = get_local ptr [u64; 2], s, !223
//         v26 = get_local ptr [u64; 2], a, !224
//         mem_copy_val v26, v25
//         v27 = get_local ptr [u64; 2], a, !225
//         v28 = ptr_to_int v27 to u64, !226
//         v29 = get_local ptr [u64; 2], s, !227
//         v30 = ptr_to_int v29 to u64, !228
//         v31 = cmp eq v28 v30, !230
//         v32 = const bool false, !38
//         v33 = cmp eq v31 v32, !231
//         v34 = call assert_49(v33), !232
//         v35 = get_local ptr [u64; 2], a, !233
//         v36 = const u64 0, !234
//         v37 = get_elem_ptr v35, ptr u64, v36, !235
//         v38 = load v37
//         v39 = const u64 11, !236
//         v40 = cmp eq v38 v39, !237
//         v41 = call assert_49(v40), !238
//         v42 = get_local ptr [u64; 2], a, !239
//         v43 = const u64 1, !240
//         v44 = get_elem_ptr v42, ptr u64, v43, !241
//         v45 = load v44
//         v46 = const u64 22, !242
//         v47 = cmp eq v45 v46, !243
//         v48 = call assert_49(v47), !244
//         v49 = get_local ptr [u64; 2], s, !245
//         v50 = const u64 0, !246
//         v51 = get_elem_ptr v49, ptr u64, v50, !245
//         v52 = const u64 0, !247
//         store v52 to v51, !245
//         v53 = get_local ptr [u64; 2], s, !248
//         v54 = const u64 1, !249
//         v55 = get_elem_ptr v53, ptr u64, v54, !248
//         v56 = const u64 42, !250
//         store v56 to v55, !248
//         v57 = get_local ptr [u64; 2], a, !251
//         v58 = const u64 0, !252
//         v59 = get_elem_ptr v57, ptr u64, v58, !253
//         v60 = load v59
//         v61 = const u64 11, !254
//         v62 = cmp eq v60 v61, !255
//         v63 = call assert_49(v62), !256
//         v64 = get_local ptr [u64; 2], a, !257
//         v65 = const u64 1, !258
//         v66 = get_elem_ptr v64, ptr u64, v65, !259
//         v67 = load v66
//         v68 = const u64 22, !260
//         v69 = cmp eq v67 v68, !261
//         v70 = call assert_49(v69), !262
//         v71 = get_local ptr [u64; 2], a, !263
//         v72 = const u64 0, !264
//         v73 = get_elem_ptr v71, ptr u64, v72, !265
//         v74 = load v73
//         v75 = get_local ptr [u64; 2], s, !266
//         v76 = const u64 0, !267
//         v77 = get_elem_ptr v75, ptr u64, v76, !268
//         v78 = load v77
//         v79 = call neq_25(v74, v78), !269
//         v80 = call assert_49(v79), !270
//         v81 = get_local ptr [u64; 2], a, !271
//         v82 = const u64 1, !272
//         v83 = get_elem_ptr v81, ptr u64, v82, !273
//         v84 = load v83
//         v85 = get_local ptr [u64; 2], s, !274
//         v86 = const u64 1, !275
//         v87 = get_elem_ptr v85, ptr u64, v86, !276
//         v88 = load v87
//         v89 = call neq_25(v84, v88), !277
//         v90 = call assert_49(v89), !278
//         v91 = get_local ptr [u64; 2], s, !279
//         v92 = const u64 1, !280
//         v93 = get_elem_ptr v91, ptr u64, v92, !281
//         v94 = load v93
//         ret u64 v94
//     }

//     fn mut_to_non_mut_without_mutation_after_assignment_47() -> u64, !283 {
//         local mut [u64; 2] s

//         entry():
//         v0 = get_local ptr [u64; 2], s, !284
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, ptr u64, v1
//         v3 = const u64 0, !285
//         store v3 to v2
//         v4 = const u64 1
//         v5 = get_elem_ptr v0, ptr u64, v4
//         v6 = const u64 0, !286
//         store v6 to v5
//         v7 = get_local ptr [u64; 2], s, !287
//         v8 = get_local ptr [u64; 2], s, !288
//         v9 = const u64 0, !289
//         v10 = get_elem_ptr v8, ptr u64, v9, !290
//         v11 = load v10
//         v12 = const u64 11, !291
//         v13 = add v11, v12, !292
//         v14 = const u64 0, !293
//         v15 = get_elem_ptr v7, ptr u64, v14, !287
//         store v13 to v15, !287
//         v16 = get_local ptr [u64; 2], s, !294
//         v17 = get_local ptr [u64; 2], s, !295
//         v18 = const u64 1, !296
//         v19 = get_elem_ptr v17, ptr u64, v18, !297
//         v20 = load v19
//         v21 = const u64 22, !298
//         v22 = add v20, v21, !299
//         v23 = const u64 1, !300
//         v24 = get_elem_ptr v16, ptr u64, v23, !294
//         store v22 to v24, !294
//         v25 = get_local ptr [u64; 2], s, !301
//         v26 = ptr_to_int v25 to u64, !302
//         v27 = get_local ptr [u64; 2], s, !303
//         v28 = ptr_to_int v27 to u64, !304
//         v29 = cmp eq v26 v28, !305
//         v30 = call assert_49(v29), !306
//         v31 = get_local ptr [u64; 2], s, !307
//         v32 = const u64 0, !308
//         v33 = get_elem_ptr v31, ptr u64, v32, !309
//         v34 = load v33
//         v35 = get_local ptr [u64; 2], s, !310
//         v36 = const u64 0, !311
//         v37 = get_elem_ptr v35, ptr u64, v36, !312
//         v38 = load v37
//         v39 = cmp eq v34 v38, !313
//         v40 = call assert_49(v39), !314
//         v41 = get_local ptr [u64; 2], s, !315
//         v42 = const u64 1, !316
//         v43 = get_elem_ptr v41, ptr u64, v42, !317
//         v44 = load v43
//         v45 = get_local ptr [u64; 2], s, !318
//         v46 = const u64 1, !319
//         v47 = get_elem_ptr v45, ptr u64, v46, !320
//         v48 = load v47
//         v49 = cmp eq v44 v48, !321
//         v50 = call assert_49(v49), !322
//         v51 = get_local ptr [u64; 2], s, !323
//         v52 = const u64 1, !324
//         v53 = get_elem_ptr v51, ptr u64, v52, !325
//         v54 = load v53
//         v55 = get_local ptr [u64; 2], s, !326
//         v56 = const u64 1, !327
//         v57 = get_elem_ptr v55, ptr u64, v56, !328
//         v58 = load v57
//         v59 = add v54, v58, !329
//         v60 = const u64 2, !330
//         v61 = sub v59, v60, !331
//         ret u64 v61
//     }

//     pub fn assert_49(condition !333: bool) -> (), !334 {
//         entry(condition: bool):
//         v0 = const bool false, !38
//         v1 = cmp eq condition v0, !335
//         cbr v1, block0(), block1(), !335

//         block0():
//         v2 = const u64 18446744073709486084, !337
//         revert v2, !341

//         block1():
//         v3 = const unit ()
//         ret () v3
//     }
// }
