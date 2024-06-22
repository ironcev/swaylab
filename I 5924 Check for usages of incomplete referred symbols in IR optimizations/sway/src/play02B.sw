library;

#[inline(never)]
pub fn play() {
    let x = 0x0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f20;
}

// Initial:
// pub fn play_1() -> (), !12 {
//     local b256 x

//     entry():
//     v0 = get_local ptr b256, x, !13
//     v1 = const b256 0x0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f20, !14
//     store v1 to v0, !13
//     v2 = const unit ()
//     ret () v2
// }

// Final:
// pub fn play_1() -> (), !44 {
//     entry():
//     v0 = const unit ()
//     ret () v0
// }
