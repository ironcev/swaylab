library;

struct A {
   a : u64
}

fn foo(a : u64) -> A {
  A { a }
}

const B : A = foo(32);

#[inline(never)]
pub fn play() -> u64 {
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
//         local { u64 } __anon_0

//         entry():
//         v0 = get_local ptr { u64 }, __anon_0
//         v1 = const { u64 } { u64 32 }, !9
//         store v1 to v0
//         v2 = const u64 0
//         v3 = get_elem_ptr v0, ptr u64, v2, !10
//         v4 = load v3
//         ret u64 v4
//     }
// }