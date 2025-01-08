library;

struct S {
    x: u64,
    y: u64,
}

const CONST: u64 = 112233;

#[inline(never)]
pub fn play() {
    let r_1 = &CONST;
    let r_2 = &CONST;

    poke(r_1, r_2);
}

#[inline(never)]
fn poke<T>(_x: T, _y: T) {}

// Before optimizations:
// pub fn play_1() -> (), !12 {
//     local u64 __anon_0
//     local u64 __anon_1
//     local u64 r_1
//     local u64 r_2

//     entry():
//     v0 = get_local ptr u64, __anon_0
//     v1 = const u64 112233, !13
//     store v1 to v0
//     v2 = ptr_to_int v0 to u64, !14
//     v3 = get_local ptr u64, r_1, !15
//     store v2 to v3, !15
//     v4 = get_local ptr u64, __anon_1
//     store v1 to v4
//     v5 = ptr_to_int v4 to u64, !16
//     v6 = get_local ptr u64, r_2, !17
//     store v5 to v6, !17
//     v7 = get_local ptr u64, r_1, !18
//     v8 = load v7
//     v9 = get_local ptr u64, r_2, !19
//     v10 = load v9
//     v11 = call poke_2(v8, v10), !20
//     v12 = const unit ()
//     ret () v12
// }

// After optimizations:
// pub fn play_1() -> (), !34 {
//     local u64 __anon_0
//     local u64 __anon_1

//     entry():
//     v0 = get_local ptr u64, __anon_0
//     v1 = const u64 112233, !35
//     store v1 to v0
//     v2 = ptr_to_int v0 to u64, !36
//     v3 = get_local ptr u64, __anon_1
//     store v1 to v3
//     v4 = ptr_to_int v3 to u64, !37
//     v5 = call poke_2(v2, v4), !38
//     v6 = const unit ()
//     ret () v6
// }