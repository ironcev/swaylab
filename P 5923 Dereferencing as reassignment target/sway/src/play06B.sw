library;

#[inline(never)]
pub fn play() {
    let mut x = 123u8;

    *&mut x = 111u8;

    poke(x);
}

#[inline(never)]
fn poke<T>(_x: T) {}

// Before fixing the DCE elimination of dereferencing:
// Before DCE:
// pub fn play_2() -> (), !24 {
//     local mut u8 x
//
//     entry():
//     v0 = get_local ptr u8, x, !25
//     v1 = const u8 123, !26
//     store v1 to v0, !25
//     v2 = get_local ptr u8, x, !27
//     v3 = ptr_to_int v2 to u64, !28
//     v4 = int_to_ptr v3 to ptr u8, !29
//     v5 = const u8 111, !30
//     store v5 to v4, !29
//     v6 = get_local ptr u8, x, !31
//     v7 = load v6
//     v8 = call poke_3(v7), !32
//     v9 = const unit ()
//     ret () v9
// }

// After DCE:
// pub fn play_2() -> (), !21 {
//     local mut u8 x
//
//     entry():
//     v0 = get_local ptr u8, x, !22
//     v1 = const u8 123, !23
//     store v1 to v0, !22
//     v2 = get_local ptr u8, x, !24
//     v3 = load v2
//     v4 = call poke_3(v3), !25
//     v5 = const unit ()
//     ret () v5
// }