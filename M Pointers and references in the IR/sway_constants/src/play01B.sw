library;

struct A {
   a : u64
}

fn foo(a : u64) -> A {
  A { a }
}

#[inline(never)]
pub fn play() -> u64 {
    const B : A = foo(32);
    B.a
}

// script {
//     entry fn main() -> (), !3 {
//         local u64 _

//         entry():
//         v0 = call play_0(), !4
//         v1 = get_local ptr u64, _, !5
//         store v0 to v1, !5
//         v2 = const unit ()
//         ret () v2
//     }

//     pub fn play_0() -> u64, !8 {
//         local { u64 } B

//         entry():
//         v0 = get_local ptr { u64 }, B, !9
//         v1 = const { u64 } { u64 32 }, !10
//         store v1 to v0, !9
//         v2 = get_local ptr { u64 }, B, !11
//         v3 = const u64 0
//         v4 = get_elem_ptr v2, ptr u64, v3, !12
//         v5 = load v4
//         ret u64 v5
//     }
// }
