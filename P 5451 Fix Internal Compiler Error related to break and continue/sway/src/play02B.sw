library;

#[inline(never)]
pub fn play(b: bool) -> u64 {
    let x = if b {
        1
    } else {
        2
    };

    poke(x);

    x
}

#[inline(never)]
fn poke<T>(_x: T) { }

// pub fn play_0(b !5: bool) -> u64, !8 {
//     entry(b: bool):
//     v0 = const u64 1, !9
//     cbr b, block2(v0), block1(), !10

//     block1():
//     v1 = const u64 2, !11
//     br block2(v1)

//     block2(v2: u64):
//     v3 = call poke_1(v2), !12
//     ret u64 v2
// }

// fn poke_1(_x !13: u64) -> (), !15 {
//     entry(_x: u64):
//     v0 = const unit ()
//     ret () v0
// }
