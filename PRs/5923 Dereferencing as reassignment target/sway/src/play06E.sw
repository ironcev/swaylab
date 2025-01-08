library;

struct S {
    x: u8,
}

#[inline(never)]
pub fn play() {
    let mut s = S { x: 123u8 };
    let r_s = &mut s;

    *r_s = S { x: 111u8 };

    poke(s);
}

#[inline(never)]
fn poke<T>(_x: T) {}

// Debug final:

// pub fn play_0() -> (), !6 {
//     local mut { u8 } __anon_0
//     local { u8 } __anon_1
//     local { u8 } __tmp_arg
//     local u64 r_s

//     entry():
//     v0 = get_local ptr { u8 }, __anon_0, !7
//     v1 = const u64 0
//     v2 = get_elem_ptr v0, ptr u8, v1
//     v3 = const u8 123, !8
//     store v3 to v2, !7
//     v4 = get_local ptr { u8 }, __anon_0, !9
//     v5 = ptr_to_int v4 to u64, !10
//     v6 = get_local ptr u64, r_s, !11
//     store v5 to v6, !11
//     v7 = get_local ptr { u8 }, __anon_1, !12
//     v8 = const u64 0
//     v9 = get_elem_ptr v7, ptr u8, v8
//     v10 = const u8 111, !13
//     store v10 to v9, !12
//     v11 = get_local ptr u64, r_s, !14
//     v12 = load v11
//     v13 = int_to_ptr v12 to ptr { u8 }, !15
//     mem_copy_val v13, v7
//     v14 = get_local ptr { u8 }, __anon_0, !16
//     v15 = get_local ptr { u8 }, __tmp_arg
//     mem_copy_val v15, v14
//     v16 = call poke_1(v15)
//     v17 = const unit ()
//     ret () v17
// }


// Release final (before implementing support for references in DCE):

// pub fn play_0() -> (), !6 {
//     local mut { u8 } __anon_0
//     local { u8 } __tmp_arg

//     entry():
//     v0 = get_local ptr { u8 }, __anon_0, !7
//     v1 = const u64 0
//     v2 = get_elem_ptr v0, ptr u8, v1
//     v3 = const u8 123, !8
//     store v3 to v2, !7
//     v4 = get_local ptr { u8 }, __anon_0, !9
//     v5 = get_local ptr { u8 }, __tmp_arg
//     mem_copy_val v5, v4
//     v6 = call poke_1(v5)
//     v7 = const unit ()
//     ret () v7
// }
