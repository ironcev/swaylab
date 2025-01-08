library;

struct S {
    x: u8,
}

#[inline(never)]
pub fn play() {
    let mut s = S { x: 123u8 };

    s = S { x: 111u8 };

    poke(s);
}

#[inline(never)]
fn poke<T>(_x: T) {}

// First pass:
// pub fn play_0() -> (), !6 {
//     local { u8 } __anon_0
//     local { u8 } __anon_1
//     local mut { u8 } s

//     entry():
//     v0 = get_local ptr { u8 }, __anon_0, !7
//     v1 = const u64 0
//     v2 = get_elem_ptr v0, ptr u8, v1
//     v3 = const u8 123, !8
//     store v3 to v2, !7
//     v4 = load v0
//     v5 = get_local ptr { u8 }, s, !9
//     store v4 to v5, !9
//     v6 = get_local ptr { u8 }, s, !10
//     v7 = get_local ptr { u8 }, __anon_1, !11
//     v8 = const u64 0
//     v9 = get_elem_ptr v7, ptr u8, v8
//     v10 = const u8 111, !12
//     store v10 to v9, !11
//     v11 = load v7
//     store v11 to v6, !10
//     v12 = get_local ptr { u8 }, s, !13
//     v13 = load v12
//     v14 = call poke_1(v13), !14
//     v15 = const unit ()
//     ret () v15
// }


// Last pass in debug mode:
// pub fn play_0() -> (), !6 {
//     local { u8 } __anon_1
//     local { u8 } __tmp_arg

//     entry():
//     v0 = get_local ptr { u8 }, __anon_1, !7
//     v1 = const u64 0
//     v2 = get_elem_ptr v0, ptr u8, v1
//     v3 = const u8 111, !8
//     store v3 to v2, !7
//     v4 = get_local ptr { u8 }, __tmp_arg
//     mem_copy_val v4, v0
//     v5 = call poke_1(v4)
//     v6 = const unit ()
//     ret () v6
// }
