library;

struct S {
    b: bool,
    x: u32,
    y: u64,
}

#[inline(never)]
pub fn play() -> u64 {
    let mut a: [S;2] = [S { b: false, x: 11, y: 22};2];

    let mut a_0 = a[0];
    a_0.b = true;
    a_0.x = 42;
    a_0.y = 42;
    
    a[0].y
    // a_0.y
}

// script {
//     entry fn main() -> u64, !1 {
//         entry():
//         v0 = call play_0(), !2
//         ret u64 v0
//     }

//     pub fn play_0() -> u64, !6 {
//         entry():
//         v0 = const u64 22, !7
//         ret u64 v0
//     }
// }


// script {
//     entry fn main() -> u64, !1 {
//         entry():
//         v0 = call play_0(), !2
//         ret u64 v0
//     }

//     pub fn play_0() -> u64, !6 {
//         entry():
//         v0 = const u64 42, !7
//         ret u64 v0
//     }
// }