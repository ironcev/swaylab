library;

struct S {
    x: u64,
    y: u64,
}

const CONST: S = S { x: 0, y: 0, };

#[inline(never)]
pub fn play() {
    let p_s_1 = __addr_of(CONST);
    let p_s_2 = __addr_of(CONST);

    poke(p_s_1, p_s_2);
}

#[inline(never)]
fn poke<T>(_x: T, _y: T) {}

// pub fn play_1() -> (), !34 {
//     local { u64, u64 } __const0 = const { u64, u64 } { u64 0, u64 0 }

//     entry():
//     v0 = get_local ptr { u64, u64 }, __const0
//     v1 = ptr_to_int v0 to u64, !35
//     v2 = ptr_to_int v0 to u64, !36
//     v3 = call poke_2(v1, v2), !37
//     v4 = const unit ()
//     ret () v4
// }

