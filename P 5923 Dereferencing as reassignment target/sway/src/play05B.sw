library;

struct S {
    x: u8,
}

#[inline(never)]
pub fn play() {
    let mut s = S { x: 123u8 };

    s.x = 111u8;

    poke(s);
}

#[inline(never)]
fn poke<T>(_x: T) {}

// pub fn play_0() -> (), !6 {
//     local { u8 } __anon_0
//     local { u8 } __tmp_arg
//     local mut { u8 } s

//     entry():
//     v0 = get_local ptr { u8 }, __anon_0, !7
//     v1 = const u64 0
//     v2 = get_elem_ptr v0, ptr u8, v1
//     v3 = const u8 123, !8
//     store v3 to v2, !7
//     v4 = get_local ptr { u8 }, s, !9
//     mem_copy_val v4, v0
//     v5 = get_local ptr { u8 }, s, !10
//     v6 = const u64 0
//     v7 = get_elem_ptr v5, ptr u8, v6, !10
//     v8 = const u8 111, !11
//     store v8 to v7, !10
//     v9 = get_local ptr { u8 }, s, !12
//     v10 = get_local ptr { u8 }, __tmp_arg
//     mem_copy_val v10, v9
//     v11 = call poke_1(v10)
//     v12 = const unit ()
//     ret () v12
// }

