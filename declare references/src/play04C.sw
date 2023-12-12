library;

struct A {
    x: u64,
}

#[inline(never)]
pub fn play() {
    let a = A { x: 123 };
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
//         local { u64 } __anon_0

//         entry():
//         v0 = get_local ptr { u64 }, __anon_0, !7
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, ptr u64, v1
//         v3 = const u64 123, !8
//         store v3 to v2, !7
//         v4 = get_local ptr { u64 }, __anon_0, !9
//         v5 = ptr_to_int v4 to u64, !10
//         v6 = asm(r: v5) -> u64 r, !11 {
//         }
//         v7 = const u64 0
//         log u64 v6, v7, !15
//         v8 = const unit ()
//         ret () v8
//     }
// }
