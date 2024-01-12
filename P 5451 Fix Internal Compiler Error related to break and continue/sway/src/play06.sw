library;

#[inline(never)]
pub fn play(b: bool) -> u64 {
    let x = poke(
        if b {
            return 11;
        } else {
            return 22;
        }
    );

    return x;
}

#[inline(never)]
fn poke(x: u64) -> u64 { x }

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

// Without CFG simplification, as expected:
// pub fn play_0(b !5: bool) -> u64, !8 {
//     local u64 x

//     entry(b: bool):
//     cbr b, block0(), block1(), !9

//     block0():
//     v0 = const u64 11, !10
//     ret u64 v0, !11

//     block1():
//     v1 = const u64 22, !12
//     ret u64 v1, !13

//     block2(v2: u64):
//     v3 = call poke_1(v2), !14
//     v4 = get_local ptr u64, x, !15
//     store v3 to v4, !15
//     v5 = get_local ptr u64, x, !16
//     v6 = load v5
//     ret u64 v6, !17
// }

// fn poke_1(x !18: u64) -> u64, !20 {
//     entry(x: u64):
//     ret u64 x
// }