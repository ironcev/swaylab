library;

#[inline(never)]
pub fn play() {
    let mut x = 123u8;
    let r_x = &mut x;

    *r_x = 111u8;

    poke(*r_x);
}

#[inline(never)]
fn poke<T>(_x: T) {}

// Before fixing the DCE elimination of dereferencing:
// Before DCE:
// pub fn play_0() -> (), !7 {
//     local u64 r_x
//     local mut u8 x
//
//     entry():
//     v0 = get_local ptr u8, x, !8
//     v1 = const u8 123, !9
//     store v1 to v0, !8
//     v2 = get_local ptr u8, x, !10
//     v3 = ptr_to_int v2 to u64, !11
//     v4 = get_local ptr u64, r_x, !12
//     store v3 to v4, !12
//     v5 = get_local ptr u64, r_x, !13
//     v6 = load v5
//     v7 = int_to_ptr v6 to ptr u8, !14
//     v8 = const u8 111, !15
//     store v8 to v7, !14
//     v9 = get_local ptr u64, r_x, !16
//     v10 = load v9
//     v11 = int_to_ptr v10 to ptr u8, !17
//     v12 = load v11
//     v13 = call poke_1(v12), !18
//     v14 = const unit ()
//     ret () v14
// }
