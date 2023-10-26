script;

struct A {
    a: u64,
}

struct B {
    a: A,
}

fn main() -> u64 {
    let ret = values_only();
    assert(ret == 42);

    let ret = with_addr_of();
    assert(ret == 42);

    ret
}

#[inline(never)]
fn values_only() -> u64 {
    let mut a = A { a: 11 };
    let mut b = B { a: a };
    let mut t = (b, b);
    let mut arr = [t, t];

    a.a = 111;
    b.a.a = 222;
    t.0.a.a = 3330;
    t.1.a.a = 3331;
    arr[0].0.a.a = 4440;
    arr[0].1.a.a = 4440;
    arr[1].0.a.a = 5550;
    arr[1].1.a.a = 5550;

    assert(a.a == 111);
    assert(b.a.a == 222);
    assert(t.0.a.a == 3330);
    assert(t.1.a.a == 3331);
    assert(arr[0].0.a.a == 4440);
    assert(arr[0].1.a.a == 4440);
    assert(arr[1].0.a.a == 5550);
    assert(arr[1].1.a.a == 5550);

    42
}

#[inline(never)]
fn with_addr_of() -> u64 {
    let mut a = A { a: 11 };
    let mut b = B { a: a };
    let mut t = (b, b);
    let mut arr = [t, t];

    a.a = 111;
    b.a.a = 222;
    t.0.a.a = 3330;
    t.1.a.a = 3331;
    arr[0].0.a.a = 4440;
    arr[0].1.a.a = 4440;
    arr[1].0.a.a = 5550;
    arr[1].1.a.a = 5550;

    assert(a.a == 111);
    assert(b.a.a == 222);
    assert(t.0.a.a == 3330);
    assert(t.1.a.a == 3331);
    assert(arr[0].0.a.a == 4440);
    assert(arr[0].1.a.a == 4440);
    assert(arr[1].0.a.a == 5550);
    assert(arr[1].1.a.a == 5550);

    let ptr_a = __addr_of(a);
    let ptr_b = __addr_of(b);
    let ptr_t = __addr_of(t);
    let ptr_arr = __addr_of(arr);
    assert(ptr_a != ptr_b);
    assert(ptr_b != ptr_t);
    assert(ptr_t != ptr_arr);
    assert(ptr_arr != ptr_a);

    42
}

// script {
//     entry fn main() -> u64, !1 {
//         entry():
//         v0 = call values_only_0(), !2
//         v1 = const u64 42, !3
//         v2 = cmp eq v0 v1, !4
//         v3 = call assert_1(v2), !5
//         v4 = call with_addr_of_9(), !6
//         v5 = const u64 42, !7
//         v6 = cmp eq v4 v5, !8
//         v7 = call assert_1(v6), !9
//         ret u64 v4
//     }

//     fn values_only_0() -> u64, !12 {
//         entry():
//         v0 = const u64 111, !13
//         v1 = const u64 111, !14
//         v2 = cmp eq v0 v1, !15
//         v3 = call assert_1(v2), !16
//         v4 = const u64 222, !17
//         v5 = const u64 222, !18
//         v6 = cmp eq v4 v5, !19
//         v7 = call assert_1(v6), !20
//         v8 = const u64 3330, !21
//         v9 = const u64 3330, !22
//         v10 = cmp eq v8 v9, !23
//         v11 = call assert_1(v10), !24
//         v12 = const u64 3331, !25
//         v13 = const u64 3331, !26
//         v14 = cmp eq v12 v13, !27
//         v15 = call assert_1(v14), !28
//         v16 = const u64 4440, !29
//         v17 = const u64 4440, !30
//         v18 = cmp eq v16 v17, !31
//         v19 = call assert_1(v18), !32
//         v20 = const u64 4440, !33
//         v21 = const u64 4440, !34
//         v22 = cmp eq v20 v21, !35
//         v23 = call assert_1(v22), !36
//         v24 = const u64 5550, !37
//         v25 = const u64 5550, !38
//         v26 = cmp eq v24 v25, !39
//         v27 = call assert_1(v26), !40
//         v28 = const u64 5550, !41
//         v29 = const u64 5550, !42
//         v30 = cmp eq v28 v29, !43
//         v31 = call assert_1(v30), !44
//         v32 = const u64 42, !45
//         ret u64 v32
//     }

//     pub fn assert_1(condition !47: bool) -> (), !48 {
//         entry(condition: bool):
//         v0 = const bool false, !50
//         v1 = cmp eq condition v0, !51
//         cbr v1, block0(), block1(), !51

//         block0():
//         v2 = const u64 18446744073709486084, !53
//         revert v2, !57

//         block1():
//         v3 = const unit ()
//         ret () v3
//     }

//     fn with_addr_of_9() -> u64, !59 {
//         local mut { u64 } a
//         local mut [{ { { u64 } }, { { u64 } } }; 2] arr
//         local mut { { u64 } } b
//         local mut { { { u64 } }, { { u64 } } } t

//         entry():
//         v0 = get_local ptr { u64 }, a, !60
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, ptr u64, v1
//         v3 = const u64 11, !61
//         store v3 to v2
//         v4 = get_local ptr { u64 }, a, !62
//         v5 = const u64 0
//         v6 = get_elem_ptr v4, ptr u64, v5
//         v7 = load v6
//         v8 = get_local ptr { { u64 } }, b, !63
//         v9 = const u64 0
//         v10 = const u64 0
//         v11 = get_elem_ptr v8, ptr u64, v9, v10
//         store v7 to v11
//         v12 = get_local ptr { { u64 } }, b, !64
//         v13 = get_local ptr { { u64 } }, b, !65
//         v14 = const u64 0
//         v15 = const u64 0
//         v16 = get_elem_ptr v12, ptr u64, v14, v15
//         v17 = load v16
//         v18 = const u64 0
//         v19 = const u64 0
//         v20 = get_elem_ptr v13, ptr u64, v18, v19
//         v21 = load v20
//         v22 = get_local ptr { { { u64 } }, { { u64 } } }, t, !66
//         v23 = const u64 0
//         v24 = const u64 0
//         v25 = const u64 0
//         v26 = get_elem_ptr v22, ptr u64, v23, v24, v25
//         store v17 to v26
//         v27 = const u64 1
//         v28 = const u64 0
//         v29 = const u64 0
//         v30 = get_elem_ptr v22, ptr u64, v27, v28, v29
//         store v21 to v30
//         v31 = get_local ptr { { { u64 } }, { { u64 } } }, t, !67
//         v32 = const u64 0
//         v33 = const u64 0
//         v34 = const u64 0
//         v35 = get_elem_ptr v31, ptr u64, v32, v33, v34
//         v36 = load v35
//         v37 = const u64 1
//         v38 = const u64 0
//         v39 = const u64 0
//         v40 = get_elem_ptr v31, ptr u64, v37, v38, v39
//         v41 = load v40
//         v42 = get_local ptr { { { u64 } }, { { u64 } } }, t, !68
//         v43 = const u64 0
//         v44 = const u64 0
//         v45 = const u64 0
//         v46 = get_elem_ptr v42, ptr u64, v43, v44, v45
//         v47 = load v46
//         v48 = const u64 1
//         v49 = const u64 0
//         v50 = const u64 0
//         v51 = get_elem_ptr v42, ptr u64, v48, v49, v50
//         v52 = load v51
//         v53 = get_local ptr [{ { { u64 } }, { { u64 } } }; 2], arr, !69
//         v54 = const u64 0
//         v55 = const u64 0
//         v56 = const u64 0
//         v57 = const u64 0
//         v58 = get_elem_ptr v53, ptr u64, v54, v55, v56, v57
//         store v36 to v58
//         v59 = const u64 0
//         v60 = const u64 1
//         v61 = const u64 0
//         v62 = const u64 0
//         v63 = get_elem_ptr v53, ptr u64, v59, v60, v61, v62
//         store v41 to v63
//         v64 = const u64 1
//         v65 = const u64 0
//         v66 = const u64 0
//         v67 = const u64 0
//         v68 = get_elem_ptr v53, ptr u64, v64, v65, v66, v67
//         store v47 to v68
//         v69 = const u64 1
//         v70 = const u64 1
//         v71 = const u64 0
//         v72 = const u64 0
//         v73 = get_elem_ptr v53, ptr u64, v69, v70, v71, v72
//         store v52 to v73
//         v74 = get_local ptr { u64 }, a, !70
//         v75 = const u64 0
//         v76 = get_elem_ptr v74, ptr u64, v75, !70
//         v77 = const u64 111, !71
//         store v77 to v76, !70
//         v78 = get_local ptr { { u64 } }, b, !72
//         v79 = const u64 0
//         v80 = const u64 0
//         v81 = get_elem_ptr v78, ptr u64, v79, v80, !72
//         v82 = const u64 222, !73
//         store v82 to v81, !72
//         v83 = get_local ptr { { { u64 } }, { { u64 } } }, t, !74
//         v84 = const u64 0
//         v85 = const u64 0
//         v86 = const u64 0
//         v87 = get_elem_ptr v83, ptr u64, v84, v85, v86, !74
//         v88 = const u64 3330, !75
//         store v88 to v87, !74
//         v89 = get_local ptr { { { u64 } }, { { u64 } } }, t, !76
//         v90 = const u64 1
//         v91 = const u64 0
//         v92 = const u64 0
//         v93 = get_elem_ptr v89, ptr u64, v90, v91, v92, !76
//         v94 = const u64 3331, !77
//         store v94 to v93, !76
//         v95 = get_local ptr [{ { { u64 } }, { { u64 } } }; 2], arr, !78
//         v96 = const u64 0, !79
//         v97 = const u64 0
//         v98 = const u64 0
//         v99 = const u64 0
//         v100 = get_elem_ptr v95, ptr u64, v96, v97, v98, v99, !78
//         v101 = const u64 4440, !80
//         store v101 to v100, !78
//         v102 = get_local ptr [{ { { u64 } }, { { u64 } } }; 2], arr, !81
//         v103 = const u64 0, !82
//         v104 = const u64 1
//         v105 = const u64 0
//         v106 = const u64 0
//         v107 = get_elem_ptr v102, ptr u64, v103, v104, v105, v106, !81
//         v108 = const u64 4440, !83
//         store v108 to v107, !81
//         v109 = get_local ptr [{ { { u64 } }, { { u64 } } }; 2], arr, !84
//         v110 = const u64 1, !85
//         v111 = const u64 0
//         v112 = const u64 0
//         v113 = const u64 0
//         v114 = get_elem_ptr v109, ptr u64, v110, v111, v112, v113, !84
//         v115 = const u64 5550, !86
//         store v115 to v114, !84
//         v116 = get_local ptr [{ { { u64 } }, { { u64 } } }; 2], arr, !87
//         v117 = const u64 1, !88
//         v118 = const u64 1
//         v119 = const u64 0
//         v120 = const u64 0
//         v121 = get_elem_ptr v116, ptr u64, v117, v118, v119, v120, !87
//         v122 = const u64 5550, !89
//         store v122 to v121, !87
//         v123 = get_local ptr { u64 }, a, !90
//         v124 = const u64 0
//         v125 = get_elem_ptr v123, ptr u64, v124, !91
//         v126 = load v125
//         v127 = const u64 111, !92
//         v128 = cmp eq v126 v127, !93
//         v129 = call assert_1(v128), !94
//         v130 = get_local ptr { { u64 } }, b, !95
//         v131 = const u64 0
//         v132 = get_elem_ptr v130, ptr { u64 }, v131, !96
//         v133 = const u64 0
//         v134 = get_elem_ptr v132, ptr u64, v133, !91
//         v135 = load v134
//         v136 = const u64 222, !97
//         v137 = cmp eq v135 v136, !98
//         v138 = call assert_1(v137), !99
//         v139 = get_local ptr { { { u64 } }, { { u64 } } }, t, !100
//         v140 = const u64 0
//         v141 = get_elem_ptr v139, ptr { { u64 } }, v140, !101
//         v142 = const u64 0
//         v143 = get_elem_ptr v141, ptr { u64 }, v142, !96
//         v144 = const u64 0
//         v145 = get_elem_ptr v143, ptr u64, v144, !91
//         v146 = load v145
//         v147 = const u64 3330, !102
//         v148 = cmp eq v146 v147, !103
//         v149 = call assert_1(v148), !104
//         v150 = get_local ptr { { { u64 } }, { { u64 } } }, t, !105
//         v151 = const u64 1
//         v152 = get_elem_ptr v150, ptr { { u64 } }, v151, !106
//         v153 = const u64 0
//         v154 = get_elem_ptr v152, ptr { u64 }, v153, !96
//         v155 = const u64 0
//         v156 = get_elem_ptr v154, ptr u64, v155, !91
//         v157 = load v156
//         v158 = const u64 3331, !107
//         v159 = cmp eq v157 v158, !108
//         v160 = call assert_1(v159), !109
//         v161 = get_local ptr [{ { { u64 } }, { { u64 } } }; 2], arr, !110
//         v162 = const u64 0, !111
//         v163 = get_elem_ptr v161, ptr { { { u64 } }, { { u64 } } }, v162, !112
//         v164 = const u64 0
//         v165 = get_elem_ptr v163, ptr { { u64 } }, v164, !113
//         v166 = const u64 0
//         v167 = get_elem_ptr v165, ptr { u64 }, v166, !96
//         v168 = const u64 0
//         v169 = get_elem_ptr v167, ptr u64, v168, !91
//         v170 = load v169
//         v171 = const u64 4440, !114
//         v172 = cmp eq v170 v171, !115
//         v173 = call assert_1(v172), !116
//         v174 = get_local ptr [{ { { u64 } }, { { u64 } } }; 2], arr, !117
//         v175 = const u64 0, !118
//         v176 = get_elem_ptr v174, ptr { { { u64 } }, { { u64 } } }, v175, !119
//         v177 = const u64 1
//         v178 = get_elem_ptr v176, ptr { { u64 } }, v177, !120
//         v179 = const u64 0
//         v180 = get_elem_ptr v178, ptr { u64 }, v179, !96
//         v181 = const u64 0
//         v182 = get_elem_ptr v180, ptr u64, v181, !91
//         v183 = load v182
//         v184 = const u64 4440, !121
//         v185 = cmp eq v183 v184, !122
//         v186 = call assert_1(v185), !123
//         v187 = get_local ptr [{ { { u64 } }, { { u64 } } }; 2], arr, !124
//         v188 = const u64 1, !125
//         v189 = get_elem_ptr v187, ptr { { { u64 } }, { { u64 } } }, v188, !126
//         v190 = const u64 0
//         v191 = get_elem_ptr v189, ptr { { u64 } }, v190, !127
//         v192 = const u64 0
//         v193 = get_elem_ptr v191, ptr { u64 }, v192, !96
//         v194 = const u64 0
//         v195 = get_elem_ptr v193, ptr u64, v194, !91
//         v196 = load v195
//         v197 = const u64 5550, !128
//         v198 = cmp eq v196 v197, !129
//         v199 = call assert_1(v198), !130
//         v200 = get_local ptr [{ { { u64 } }, { { u64 } } }; 2], arr, !131
//         v201 = const u64 1, !132
//         v202 = get_elem_ptr v200, ptr { { { u64 } }, { { u64 } } }, v201, !133
//         v203 = const u64 1
//         v204 = get_elem_ptr v202, ptr { { u64 } }, v203, !134
//         v205 = const u64 0
//         v206 = get_elem_ptr v204, ptr { u64 }, v205, !96
//         v207 = const u64 0
//         v208 = get_elem_ptr v206, ptr u64, v207, !91
//         v209 = load v208
//         v210 = const u64 5550, !135
//         v211 = cmp eq v209 v210, !136
//         v212 = call assert_1(v211), !137
//         v213 = get_local ptr { u64 }, a, !138
//         v214 = ptr_to_int v213 to u64, !139
//         v215 = get_local ptr { { u64 } }, b, !140
//         v216 = ptr_to_int v215 to u64, !141
//         v217 = get_local ptr { { { u64 } }, { { u64 } } }, t, !142
//         v218 = ptr_to_int v217 to u64, !143
//         v219 = get_local ptr [{ { { u64 } }, { { u64 } } }; 2], arr, !144
//         v220 = ptr_to_int v219 to u64, !145
//         v221 = call neq_14(v214, v216), !146
//         v222 = call assert_1(v221), !147
//         v223 = call neq_14(v216, v218), !148
//         v224 = call assert_1(v223), !149
//         v225 = call neq_14(v218, v220), !150
//         v226 = call assert_1(v225), !151
//         v227 = call neq_14(v220, v214), !152
//         v228 = call assert_1(v227), !153
//         v229 = const u64 42, !154
//         ret u64 v229
//     }

//     pub fn neq_14(self !155: u64, other !156: u64) -> bool, !157 {
//         entry(self: u64, other: u64):
//         v0 = cmp eq self other, !158
//         v1 = const bool false, !50
//         v2 = cmp eq v0 v1, !159
//         ret bool v2
//     }
// }