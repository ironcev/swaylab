library;

#[inline(never)]
pub fn play(b: bool) -> u64 {
    let x = if b {
        poke(b);
        1
    } else {
        poke(123);
        2
    };

    x
}

#[inline(never)]
fn poke<T>(_x: T) { }

// pub fn play_0(b !5: bool) -> u64, !8 {
//     entry(b: bool):
//     cbr b, block0(), block1(), !9

//     block0():
//     v0 = call poke_1(b), !10
//     v1 = const u64 1, !11
//     br block2(v1)

//     block1():
//     v2 = const u64 123, !12
//     v3 = call poke_2(v2), !13
//     v4 = const u64 2, !14
//     br block2(v4)

//     block2(v5: u64):
//     ret u64 v5
// }

// fn poke_1(_x !15: bool) -> (), !17 {
//     entry(_x: bool):
//     v0 = const unit ()
//     ret () v0
// }

// fn poke_2(_x !15: u64) -> (), !18 {
//     entry(_x: u64):
//     v0 = const unit ()
//     ret () v0
// }
