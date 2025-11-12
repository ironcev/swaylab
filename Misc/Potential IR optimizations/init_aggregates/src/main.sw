library;

pub enum Option<T> {
    None: (),
    Some: T,
}

pub struct S2 {
    a: u64,
    b: u64,
}

pub struct S4 {
    a: u64,
    b: u64,
    c: u64,
    d: u64,
}

pub struct S8 {
    a: u64,
    b: u64,
    c: u64,
    d: u64,
    e: u64,
    f: u64,
    g: u64,
    h: u64,
}

pub struct C {
    x: u64,
    y: u64,
    z: u64,
}

pub struct A {
    a: u64,
    b: [u64; 10],
    c: C,
    d: (u64, u64, u64),
}

#[inline(never)]
fn poke<T>(_t: T) {}

#[test]
fn bench_baseline() {
    poke(());
}

#[test]
fn bench_zero_init_a() {
    poke(A {
        a: 0,
        b: [0; 10],
        c: C { x: 0, y: 0, z: 0 },
        d: (0, 0, 0),
    });
}

#[test]
fn bench_option_none() {
    poke(Option::<u64>::None);
}

#[test]
fn bench_zero_init_s2() {
    poke(S2 { a: 0, b: 0 });
}

#[test]
fn bench_zero_init_s2_as_array() {
    poke([0u64;2]);
}

#[test]
fn bench_zero_init_array2() {
    poke([0u64, 0u64]);
}

#[test]
fn bench_zero_init_s4() {
    poke(S4 { a: 0, b: 0, c: 0, d: 0 });
}

#[test]
fn bench_zero_init_s4_as_array() {
    poke([0u64;4]);
}

#[test]
fn bench_zero_init_array4() {
    poke([0u64, 0u64, 0u64, 0u64]);
}

#[test]
fn bench_zero_init_s8() {
    poke(S8 { a: 0, b: 0, c: 0, d: 0, e: 0, f: 0, g: 0, h: 0 });
}

#[test]
fn bench_zero_init_s8_as_array() {
    poke([0u64;8]);
}

#[test]
fn bench_zero_init_array8() {
    poke([0u64, 0u64, 0u64, 0u64, 0u64, 0u64, 0u64, 0u64]);
}

#[test]
fn bench_single_init_s2() {
    poke(S2 { a: 0, b: 42 });
}

#[test]
fn bench_single_init_s2_as_array() {
    let mut arr = [0u64;2];
    arr[1] = 42;
    poke(arr);
}

#[test]
fn bench_single_init_array2() {
    poke([0u64, 42u64]);
}

#[test]
fn bench_single_init_s4() {
    poke(S4 { a: 0, b: 42, c: 0, d: 0 });
}

#[test]
fn bench_single_init_s4_as_array() {
    let mut arr = [0u64;4];
    arr[1] = 42;
    poke(arr);
}

#[test]
fn bench_single_init_array4() {
    poke([0u64, 42u64, 0u64, 0u64]);
}

#[test]
fn bench_single_init_s8() {
    poke(S8 { a: 0, b: 42, c: 0, d: 0, e: 0, f: 0, g: 0, h: 0 });
}

#[test]
fn bench_single_init_s8_as_array() {
    let mut arr = [0u64;8];
    arr[1] = 42;
    poke(arr);
}

#[test]
fn bench_single_init_array8() {
    poke([0u64, 42u64, 0u64, 0u64, 0u64, 0u64, 0u64, 0u64]);
}

// test bench_baseline ... ok (24.5µs, 89 gas)
// test bench_option_none ... ok (23.405µs, 93 gas)
// test bench_zero_init_s2 ... ok (21.573µs, 95 gas)
// test bench_zero_init_s2_as_array ... ok (25.307µs, 93 gas)
// test bench_zero_init_array2 ... ok (20.435µs, 107 gas)
// test bench_zero_init_s4 ... ok (21.594µs, 99 gas)
// test bench_zero_init_s4_as_array ... ok (24.221µs, 93 gas)
// test bench_zero_init_array4 ... ok (10.911µs, 111 gas)
// test bench_zero_init_s8 ... ok (27.933µs, 107 gas)
// test bench_zero_init_s8_as_array ... ok (22.11µs, 93 gas)
// test bench_zero_init_array8 ... ok (36.529µs, 221 gas)
// test bench_single_init_s2 ... ok (21.989µs, 97 gas)
// test bench_single_init_s2_as_array ... ok (30.655µs, 103 gas)
// test bench_single_init_array2 ... ok (24.64µs, 109 gas)
// test bench_single_init_s4 ... ok (39.767µs, 101 gas)
// test bench_single_init_s4_as_array ... ok (11.689µs, 103 gas)
// test bench_single_init_array4 ... ok (29.524µs, 113 gas)
// test bench_single_init_s8 ... ok (23.63µs, 109 gas)
// test bench_single_init_s8_as_array ... ok (17.642µs, 103 gas)
// test bench_single_init_array8 ... ok (11.454µs, 121 gas)

// library {
//     entry fn bench_baseline() -> (), !4 {
//         entry():
//         v0 = const unit (), !5
//         v1 = call poke_0(v0), !8
//         v2 = const unit ()
//         ret () v2
//     }

//     fn poke_0(_t !9: ()) -> (), !13 {
//         entry(_t: ()):
//         v0 = const unit ()
//         ret () v0
//     }

//     entry fn bench_option_none() -> (), !17 {
//         local { u64, ( () | u64 ) } __anon_0

//         entry():
//         v0 = get_local __ptr { u64, ( () | u64 ) }, __anon_0, !18
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, __ptr u64, v1, !18
//         v3 = const u64 0, !18
//         store v3 to v2, !18
//         v4 = get_local __ptr { u64, ( () | u64 ) }, __anon_0
//         v5 = call poke_1(v4)
//         v6 = const unit ()
//         ret () v6
//     }

//     fn poke_1(_t: __ptr { u64, ( () | u64 ) }) -> (), !19 {
//         entry(_t: __ptr { u64, ( () | u64 ) }):
//         v0 = const unit ()
//         ret () v0
//     }

//     entry fn bench_zero_init_s2() -> (), !23 {
//         local { u64, u64 } __anon_0

//         entry():
//         v0 = get_local __ptr { u64, u64 }, __anon_0, !24
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, __ptr u64, v1
//         v3 = const u64 0, !25
//         store v3 to v2, !24
//         v4 = const u64 1
//         v5 = get_elem_ptr v0, __ptr u64, v4
//         v6 = const u64 0, !26
//         store v6 to v5, !24
//         v7 = get_local __ptr { u64, u64 }, __anon_0
//         v8 = call poke_2(v7)
//         v9 = const unit ()
//         ret () v9
//     }

//     fn poke_2(_t: __ptr { u64, u64 }) -> (), !27 {
//         entry(_t: __ptr { u64, u64 }):
//         v0 = const unit ()
//         ret () v0
//     }

//     entry fn bench_zero_init_s2_as_array() -> (), !31 {
//         local [u64; 2] __anon_0

//         entry():
//         v0 = get_local __ptr [u64; 2], __anon_0, !32
//         mem_clear_val v0
//         v1 = get_local __ptr [u64; 2], __anon_0
//         v2 = call poke_3(v1)
//         v3 = const unit ()
//         ret () v3
//     }

//     fn poke_3(_t: __ptr [u64; 2]) -> (), !33 {
//         entry(_t: __ptr [u64; 2]):
//         v0 = const unit ()
//         ret () v0
//     }

//     entry fn bench_zero_init_array2() -> (), !37 {
//         local [u64; 2] __anon_0

//         entry():
//         v0 = get_local __ptr [u64; 2], __anon_0, !38
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, __ptr u64, v1
//         v3 = const u64 0, !39
//         store v3 to v2, !38
//         v4 = const u64 1
//         v5 = get_elem_ptr v0, __ptr u64, v4
//         v6 = const u64 0, !40
//         store v6 to v5, !38
//         v7 = get_local __ptr [u64; 2], __anon_0
//         v8 = call poke_3(v7)
//         v9 = const unit ()
//         ret () v9
//     }

//     entry fn bench_zero_init_s4() -> (), !44 {
//         local { u64, u64, u64, u64 } __anon_0

//         entry():
//         v0 = get_local __ptr { u64, u64, u64, u64 }, __anon_0, !45
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, __ptr u64, v1
//         v3 = const u64 0, !46
//         store v3 to v2, !45
//         v4 = const u64 1
//         v5 = get_elem_ptr v0, __ptr u64, v4
//         v6 = const u64 0, !47
//         store v6 to v5, !45
//         v7 = const u64 2
//         v8 = get_elem_ptr v0, __ptr u64, v7
//         v9 = const u64 0, !48
//         store v9 to v8, !45
//         v10 = const u64 3
//         v11 = get_elem_ptr v0, __ptr u64, v10
//         v12 = const u64 0, !49
//         store v12 to v11, !45
//         v13 = get_local __ptr { u64, u64, u64, u64 }, __anon_0
//         v14 = call poke_4(v13)
//         v15 = const unit ()
//         ret () v15
//     }

//     fn poke_4(_t: __ptr { u64, u64, u64, u64 }) -> (), !50 {
//         entry(_t: __ptr { u64, u64, u64, u64 }):
//         v0 = const unit ()
//         ret () v0
//     }

//     entry fn bench_zero_init_s4_as_array() -> (), !54 {
//         local [u64; 4] __anon_0

//         entry():
//         v0 = get_local __ptr [u64; 4], __anon_0, !55
//         mem_clear_val v0
//         v1 = get_local __ptr [u64; 4], __anon_0
//         v2 = call poke_5(v1)
//         v3 = const unit ()
//         ret () v3
//     }

//     fn poke_5(_t: __ptr [u64; 4]) -> (), !56 {
//         entry(_t: __ptr [u64; 4]):
//         v0 = const unit ()
//         ret () v0
//     }

//     entry fn bench_zero_init_array4() -> (), !60 {
//         local [u64; 4] __anon_0

//         entry():
//         v0 = get_local __ptr [u64; 4], __anon_0, !61
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, __ptr u64, v1
//         v3 = const u64 0, !62
//         store v3 to v2, !61
//         v4 = const u64 1
//         v5 = get_elem_ptr v0, __ptr u64, v4
//         v6 = const u64 0, !63
//         store v6 to v5, !61
//         v7 = const u64 2
//         v8 = get_elem_ptr v0, __ptr u64, v7
//         v9 = const u64 0, !64
//         store v9 to v8, !61
//         v10 = const u64 3
//         v11 = get_elem_ptr v0, __ptr u64, v10
//         v12 = const u64 0, !65
//         store v12 to v11, !61
//         v13 = get_local __ptr [u64; 4], __anon_0
//         v14 = call poke_5(v13)
//         v15 = const unit ()
//         ret () v15
//     }

//     entry fn bench_zero_init_s8() -> (), !69 {
//         local { u64, u64, u64, u64, u64, u64, u64, u64 } __anon_0

//         entry():
//         v0 = get_local __ptr { u64, u64, u64, u64, u64, u64, u64, u64 }, __anon_0, !70
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, __ptr u64, v1
//         v3 = const u64 0, !71
//         store v3 to v2, !70
//         v4 = const u64 1
//         v5 = get_elem_ptr v0, __ptr u64, v4
//         v6 = const u64 0, !72
//         store v6 to v5, !70
//         v7 = const u64 2
//         v8 = get_elem_ptr v0, __ptr u64, v7
//         v9 = const u64 0, !73
//         store v9 to v8, !70
//         v10 = const u64 3
//         v11 = get_elem_ptr v0, __ptr u64, v10
//         v12 = const u64 0, !74
//         store v12 to v11, !70
//         v13 = const u64 4
//         v14 = get_elem_ptr v0, __ptr u64, v13
//         v15 = const u64 0, !75
//         store v15 to v14, !70
//         v16 = const u64 5
//         v17 = get_elem_ptr v0, __ptr u64, v16
//         v18 = const u64 0, !76
//         store v18 to v17, !70
//         v19 = const u64 6
//         v20 = get_elem_ptr v0, __ptr u64, v19
//         v21 = const u64 0, !77
//         store v21 to v20, !70
//         v22 = const u64 7
//         v23 = get_elem_ptr v0, __ptr u64, v22
//         v24 = const u64 0, !78
//         store v24 to v23, !70
//         v25 = get_local __ptr { u64, u64, u64, u64, u64, u64, u64, u64 }, __anon_0
//         v26 = call poke_6(v25)
//         v27 = const unit ()
//         ret () v27
//     }

//     fn poke_6(_t: __ptr { u64, u64, u64, u64, u64, u64, u64, u64 }) -> (), !79 {
//         entry(_t: __ptr { u64, u64, u64, u64, u64, u64, u64, u64 }):
//         v0 = const unit ()
//         ret () v0
//     }

//     entry fn bench_zero_init_s8_as_array() -> (), !83 {
//         local [u64; 8] __anon_0

//         entry():
//         v0 = get_local __ptr [u64; 8], __anon_0, !84
//         mem_clear_val v0
//         v1 = get_local __ptr [u64; 8], __anon_0
//         v2 = call poke_7(v1)
//         v3 = const unit ()
//         ret () v3
//     }

//     fn poke_7(_t: __ptr [u64; 8]) -> (), !85 {
//         entry(_t: __ptr [u64; 8]):
//         v0 = const unit ()
//         ret () v0
//     }

//     entry fn bench_zero_init_array8() -> (), !89 {
//         local [u64; 8] __anon_0

//         entry():
//         v0 = get_local __ptr [u64; 8], __anon_0, !90
//         v1 = const u64 0
//         br array_init_loop(v1)

//         array_init_loop(v2: u64):
//         v3 = get_elem_ptr v0, __ptr u64, v2
//         v4 = const u64 0, !91
//         store v4 to v3, !90
//         v5 = const u64 1
//         v6 = add v2, v5
//         v7 = const u64 8
//         v8 = cmp lt v6 v7
//         cbr v8, array_init_loop(v6), array_init_exit()

//         array_init_exit():
//         v9 = call poke_7(v0)
//         v10 = const unit ()
//         ret () v10
//     }

//     entry fn bench_single_init_s2() -> (), !95 {
//         local { u64, u64 } __anon_0

//         entry():
//         v0 = get_local __ptr { u64, u64 }, __anon_0, !96
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, __ptr u64, v1
//         v3 = const u64 0, !97
//         store v3 to v2, !96
//         v4 = const u64 1
//         v5 = get_elem_ptr v0, __ptr u64, v4
//         v6 = const u64 42, !98
//         store v6 to v5, !96
//         v7 = get_local __ptr { u64, u64 }, __anon_0
//         v8 = call poke_2(v7)
//         v9 = const unit ()
//         ret () v9
//     }

//     entry fn bench_single_init_s2_as_array() -> (), !102 {
//         local mut [u64; 2] arr

//         entry():
//         v0 = get_local __ptr [u64; 2], arr, !103
//         mem_clear_val v0
//         v1 = get_local __ptr [u64; 2], arr, !104
//         v2 = const u64 1, !105
//         v3 = get_elem_ptr v1, __ptr u64, v2, !104
//         v4 = const u64 42, !106
//         store v4 to v3, !104
//         v5 = get_local __ptr [u64; 2], arr
//         v6 = call poke_3(v5)
//         v7 = const unit ()
//         ret () v7
//     }

//     entry fn bench_single_init_array2() -> (), !110 {
//         local [u64; 2] __anon_0

//         entry():
//         v0 = get_local __ptr [u64; 2], __anon_0, !111
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, __ptr u64, v1
//         v3 = const u64 0, !112
//         store v3 to v2, !111
//         v4 = const u64 1
//         v5 = get_elem_ptr v0, __ptr u64, v4
//         v6 = const u64 42, !113
//         store v6 to v5, !111
//         v7 = get_local __ptr [u64; 2], __anon_0
//         v8 = call poke_3(v7)
//         v9 = const unit ()
//         ret () v9
//     }

//     entry fn bench_single_init_s4() -> (), !117 {
//         local { u64, u64, u64, u64 } __anon_0

//         entry():
//         v0 = get_local __ptr { u64, u64, u64, u64 }, __anon_0, !118
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, __ptr u64, v1
//         v3 = const u64 0, !119
//         store v3 to v2, !118
//         v4 = const u64 1
//         v5 = get_elem_ptr v0, __ptr u64, v4
//         v6 = const u64 42, !120
//         store v6 to v5, !118
//         v7 = const u64 2
//         v8 = get_elem_ptr v0, __ptr u64, v7
//         v9 = const u64 0, !121
//         store v9 to v8, !118
//         v10 = const u64 3
//         v11 = get_elem_ptr v0, __ptr u64, v10
//         v12 = const u64 0, !122
//         store v12 to v11, !118
//         v13 = get_local __ptr { u64, u64, u64, u64 }, __anon_0
//         v14 = call poke_4(v13)
//         v15 = const unit ()
//         ret () v15
//     }

//     entry fn bench_single_init_s4_as_array() -> (), !126 {
//         local mut [u64; 4] arr

//         entry():
//         v0 = get_local __ptr [u64; 4], arr, !127
//         mem_clear_val v0
//         v1 = get_local __ptr [u64; 4], arr, !128
//         v2 = const u64 1, !129
//         v3 = get_elem_ptr v1, __ptr u64, v2, !128
//         v4 = const u64 42, !130
//         store v4 to v3, !128
//         v5 = get_local __ptr [u64; 4], arr
//         v6 = call poke_5(v5)
//         v7 = const unit ()
//         ret () v7
//     }

//     entry fn bench_single_init_array4() -> (), !134 {
//         local [u64; 4] __anon_0

//         entry():
//         v0 = get_local __ptr [u64; 4], __anon_0, !135
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, __ptr u64, v1
//         v3 = const u64 0, !136
//         store v3 to v2, !135
//         v4 = const u64 1
//         v5 = get_elem_ptr v0, __ptr u64, v4
//         v6 = const u64 42, !137
//         store v6 to v5, !135
//         v7 = const u64 2
//         v8 = get_elem_ptr v0, __ptr u64, v7
//         v9 = const u64 0, !138
//         store v9 to v8, !135
//         v10 = const u64 3
//         v11 = get_elem_ptr v0, __ptr u64, v10
//         v12 = const u64 0, !139
//         store v12 to v11, !135
//         v13 = get_local __ptr [u64; 4], __anon_0
//         v14 = call poke_5(v13)
//         v15 = const unit ()
//         ret () v15
//     }

//     entry fn bench_single_init_s8() -> (), !143 {
//         local { u64, u64, u64, u64, u64, u64, u64, u64 } __anon_0

//         entry():
//         v0 = get_local __ptr { u64, u64, u64, u64, u64, u64, u64, u64 }, __anon_0, !144
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, __ptr u64, v1
//         v3 = const u64 0, !145
//         store v3 to v2, !144
//         v4 = const u64 1
//         v5 = get_elem_ptr v0, __ptr u64, v4
//         v6 = const u64 42, !146
//         store v6 to v5, !144
//         v7 = const u64 2
//         v8 = get_elem_ptr v0, __ptr u64, v7
//         v9 = const u64 0, !147
//         store v9 to v8, !144
//         v10 = const u64 3
//         v11 = get_elem_ptr v0, __ptr u64, v10
//         v12 = const u64 0, !148
//         store v12 to v11, !144
//         v13 = const u64 4
//         v14 = get_elem_ptr v0, __ptr u64, v13
//         v15 = const u64 0, !149
//         store v15 to v14, !144
//         v16 = const u64 5
//         v17 = get_elem_ptr v0, __ptr u64, v16
//         v18 = const u64 0, !150
//         store v18 to v17, !144
//         v19 = const u64 6
//         v20 = get_elem_ptr v0, __ptr u64, v19
//         v21 = const u64 0, !151
//         store v21 to v20, !144
//         v22 = const u64 7
//         v23 = get_elem_ptr v0, __ptr u64, v22
//         v24 = const u64 0, !152
//         store v24 to v23, !144
//         v25 = get_local __ptr { u64, u64, u64, u64, u64, u64, u64, u64 }, __anon_0
//         v26 = call poke_6(v25)
//         v27 = const unit ()
//         ret () v27
//     }

//     entry fn bench_single_init_s8_as_array() -> (), !156 {
//         local mut [u64; 8] arr

//         entry():
//         v0 = get_local __ptr [u64; 8], arr, !157
//         mem_clear_val v0
//         v1 = get_local __ptr [u64; 8], arr, !158
//         v2 = const u64 1, !159
//         v3 = get_elem_ptr v1, __ptr u64, v2, !158
//         v4 = const u64 42, !160
//         store v4 to v3, !158
//         v5 = get_local __ptr [u64; 8], arr
//         v6 = call poke_7(v5)
//         v7 = const unit ()
//         ret () v7
//     }

//     entry fn bench_single_init_array8() -> (), !164 {
//         local [u64; 8] __anon_0

//         entry():
//         v0 = get_local __ptr [u64; 8], __anon_0, !165
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, __ptr u64, v1
//         v3 = const u64 0, !166
//         store v3 to v2, !165
//         v4 = const u64 1
//         v5 = get_elem_ptr v0, __ptr u64, v4
//         v6 = const u64 42, !167
//         store v6 to v5, !165
//         v7 = const u64 2
//         v8 = get_elem_ptr v0, __ptr u64, v7
//         v9 = const u64 0, !168
//         store v9 to v8, !165
//         v10 = const u64 3
//         v11 = get_elem_ptr v0, __ptr u64, v10
//         v12 = const u64 0, !169
//         store v12 to v11, !165
//         v13 = const u64 4
//         v14 = get_elem_ptr v0, __ptr u64, v13
//         v15 = const u64 0, !170
//         store v15 to v14, !165
//         v16 = const u64 5
//         v17 = get_elem_ptr v0, __ptr u64, v16
//         v18 = const u64 0, !171
//         store v18 to v17, !165
//         v19 = const u64 6
//         v20 = get_elem_ptr v0, __ptr u64, v19
//         v21 = const u64 0, !172
//         store v21 to v20, !165
//         v22 = const u64 7
//         v23 = get_elem_ptr v0, __ptr u64, v22
//         v24 = const u64 0, !173
//         store v24 to v23, !165
//         v25 = get_local __ptr [u64; 8], __anon_0
//         v26 = call poke_7(v25)
//         v27 = const unit ()
//         ret () v27
//     }
// }

