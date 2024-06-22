library;

#[inline(never)]
pub fn play() {
    let x = 123;
}

// Initial:
// pub fn play_1() -> (), !12 {
//     local u64 x

//     entry():
//     v0 = get_local ptr u64, x, !13
//     v1 = const u64 123, !14
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