library;

struct S {
    x: u64,
    y: u64,
}

#[inline(never)]
pub fn play() {
    const CONST: S = S { x: 0, y: 0, };

    let p_s_1 = __addr_of(CONST);
    let p_s_2 = __addr_of(CONST);

    poke(p_s_1, p_s_2);
}

#[inline(never)]
fn poke<T>(_x: T, _y: T) {}

// pub fn play_1() -> (), !34 {
//     local { u64, u64 } CONST

//     entry():
//     v0 = get_local ptr { u64, u64 }, CONST, !35
//     v1 = const u64 0
//     v2 = get_elem_ptr v0, ptr u64, v1
//     v3 = const u64 0
//     store v3 to v2
//     v4 = const u64 1
//     v5 = get_elem_ptr v0, ptr u64, v4
//     v6 = const u64 0
//     store v6 to v5
//     v7 = get_local ptr { u64, u64 }, CONST, !36
//     v8 = ptr_to_int v7 to u64, !37
//     v9 = get_local ptr { u64, u64 }, CONST, !38
//     v10 = ptr_to_int v9 to u64, !39
//     v11 = call poke_2(v8, v10), !40
//     v12 = const unit ()
//     ret () v12
// }
