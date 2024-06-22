library;

#[inline(never)]
pub fn play() {
    let x = "str";
}

// Initial:
// pub fn play_1() -> (), !12 {
//     local { u64, u64 } __anon_0
//     local slice __anon_1
//     local slice x

//     entry():
//     v0 = const string<3> "str"
//     v1 = ptr_to_int v0 to u64, !13
//     v2 = get_local ptr { u64, u64 }, __anon_0, !13
//     v3 = const u64 0
//     v4 = get_elem_ptr v2, ptr u64, v3
//     store v1 to v4, !13
//     v5 = const u64 1
//     v6 = get_elem_ptr v2, ptr u64, v5
//     v7 = const u64 3
//     store v7 to v6, !13
//     v8 = get_local ptr slice, __anon_1, !13
//     mem_copy_bytes v8, v2, 16
//     v9 = load v8
//     v10 = get_local ptr slice, x, !14
//     store v9 to v10, !14
//     v11 = const unit ()
//     ret () v11
// }

// Final:
// pub fn play_1() -> (), !44 {
//     local { u64, u64 } __anon_0
//     local slice __anon_1
//     local string<3> __const = const string<3> "str"

//     entry():
//     v0 = get_local ptr string<3>, __const
//     v1 = ptr_to_int v0 to u64, !45
//     v2 = get_local ptr { u64, u64 }, __anon_0, !45
//     v3 = const u64 0
//     v4 = get_elem_ptr v2, ptr u64, v3
//     store v1 to v4, !45
//     v5 = const u64 1
//     v6 = get_elem_ptr v2, ptr u64, v5
//     v7 = const u64 3
//     store v7 to v6, !45
//     v8 = get_local ptr slice, __anon_1, !45
//     mem_copy_bytes v8, v2, 16
//     v9 = const unit ()
//     ret () v9
// }

// Final after fix:
// pub fn play_1() -> (), !44 {
//     entry():
//     v0 = const unit ()
//     ret () v0
// }