library;

#[inline(never)]
pub fn play() {
    let mut x = 123u8;

    x = 111u8;

    poke(x);
}

#[inline(never)]
fn poke<T>(_x: T) {}

//     pub fn play_0() -> (), !6 {
//         local mut u8 x

//         entry():
//         v0 = get_local ptr u8, x, !7
//         v1 = const u8 123, !8
//         store v1 to v0, !7
//         v2 = get_local ptr u8, x, !9
//         v3 = const u8 111, !10
//         store v3 to v2, !9
//         v4 = get_local ptr u8, x, !11
//         v5 = load v4
//         v6 = call poke_1(v5), !12
//         v7 = const unit ()
//         ret () v7
//     }

