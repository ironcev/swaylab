library;

#[inline(never)]
pub fn play(b: bool) -> u64 {
    poke(
        if b {
            return 11;
        } else {
            return 22;
        }
    );

    if b {
        1
    } else {
        2
    }
}

#[inline(never)]
fn poke(_x: u64) { }

// pub fn play_0(b !5: bool) -> u64, !8 {
//     entry(b: bool):
//     cbr b, block0(), block1(), !9

//     block0():
//     v0 = const u64 11, !10
//     ret u64 v0, !11

//     block1():
//     v1 = const u64 22, !12
//     ret u64 v1, !13
// }
