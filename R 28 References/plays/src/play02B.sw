library;

pub fn play() -> u64 {
    let t = (true, 32u32, 64u64);

    by_val(t)
}

#[inline(never)]
fn by_val(value: (bool, u32, u64)) -> u64 {
    if value.0 {
        value.1.as_u64() + value.2
    }
    else {
        value.1.as_u64() - value.2
    }
}


// script {
//     entry fn main() -> (), !1 {
//         local { bool, u64, u64 } __anon_0

//         entry():
//         v0 = get_local ptr { bool, u64, u64 }, __anon_0, !5
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, ptr bool, v1, !6
//         v3 = const bool true, !7
//         store v3 to v2, !8
//         v4 = const u64 1
//         v5 = get_elem_ptr v0, ptr u64, v4, !9
//         v6 = const u64 32, !10
//         store v6 to v5, !11
//         v7 = const u64 2
//         v8 = get_elem_ptr v0, ptr u64, v7, !12
//         v9 = const u64 64, !13
//         store v9 to v8, !14
//         v10 = get_local ptr { bool, u64, u64 }, __anon_0
//         v11 = call by_val_1(v10)
//         v12 = const unit ()
//         ret () v12
//     }

//     fn by_val_1(value: ptr { bool, u64, u64 }) -> u64, !17 {
//         entry(value: ptr { bool, u64, u64 }):
//         v0 = const u64 0
//         v1 = get_elem_ptr value, ptr bool, v0, !18
//         v2 = load v1
//         cbr v2, block0(), block1(), !19

//         block0():
//         v3 = const u64 1
//         v4 = get_elem_ptr value, ptr u64, v3, !20
//         v5 = load v4
//         v6 = asm(input: v5) -> u64 input, !24 {
//         }
//         v7 = const u64 2
//         v8 = get_elem_ptr value, ptr u64, v7, !25
//         v9 = load v8
//         v10 = add v6, v9, !26
//         br block2(v10)

//         block1():
//         v11 = const u64 1
//         v12 = get_elem_ptr value, ptr u64, v11, !27
//         v13 = load v12
//         v14 = asm(input: v13) -> u64 input, !29 {
//         }
//         v15 = const u64 2
//         v16 = get_elem_ptr value, ptr u64, v15, !30
//         v17 = load v16
//         v18 = sub v14, v17, !31
//         br block2(v18)

//         block2(v19: u64):
//         ret u64 v19
//     }
// }