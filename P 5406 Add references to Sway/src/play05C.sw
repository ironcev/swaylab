library;

#[inline(never)]
pub fn play() {
    let a = true;
    let r1 = &a;
    let r1_addr = asm(r: r1) { r: raw_ptr };
    log(r1_addr);
}

// script {
//     entry fn main() -> (), !1 {
//         entry():
//         v0 = call play_0(), !2
//         v1 = const unit ()
//         ret () v1
//     }

//     pub fn play_0() -> (), !6 {
//         local bool a

//         entry():
//         v0 = get_local ptr bool, a, !7
//         v1 = const bool true, !8
//         store v1 to v0, !7
//         v2 = get_local ptr bool, a, !9
//         v3 = ptr_to_int v2 to u64, !10
//         v4 = asm(r: v3) -> u64 r, !11 {
//         }
//         v5 = const u64 0
//         log u64 v4, v5, !15
//         v6 = const unit ()
//         ret () v6
//     }
// }
