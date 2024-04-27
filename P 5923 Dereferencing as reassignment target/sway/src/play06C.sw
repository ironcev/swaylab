library;

#[inline(never)]
pub fn play() {
    *&mut 123u8 = 111u8;
}

// In debug mode:
// pub fn play_4() -> (), !39 {
//     local u8 __anon_0

//     entry():
//     v0 = get_local ptr u8, __anon_0
//     v1 = const u8 123, !40
//     store v1 to v0
//     v2 = ptr_to_int v0 to u64, !41
//     v3 = int_to_ptr v2 to ptr u8, !42
//     v4 = const u8 111, !43
//     store v4 to v3, !42
//     v5 = const unit ()
//     ret () v5
// }

// In release mode it is the same.