library;

pub fn play() -> u64 {
    let t = (true, 32u32, 64u64);

    let x = by_val(t);

    x.1
}

#[inline(never)]
fn by_val(value: (bool, u32, u64)) -> (bool, u64) {
    let new_value = if value.0 {
        (true, value.1.as_u64() + value.2)
    }
    else {
        (false, value.1.as_u64() - value.2)
    };

    new_value
}

// script {
//     entry fn main() -> (), !1 {
//         local { bool, u64, u64 } __anon_0
//         local { bool, u64 } __ret_val

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
//         v11 = get_local ptr { bool, u64 }, __ret_val
//         v12 = call by_val_1(v10, v11)
//         v13 = const unit ()
//         ret () v13
//     }

//     fn by_val_1(value: ptr { bool, u64, u64 }, __ret_value: ptr { bool, u64 }) -> ptr { bool, u64 }, !17 {
//         local { bool, u64 } __tmp_block_arg

//         entry(value: ptr { bool, u64, u64 }, __ret_value: ptr { bool, u64 }):
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
//         v11 = get_local ptr { bool, u64 }, __tmp_block_arg
//         v12 = const bool true, !27
//         br block2(v11, v10, v12)

//         block1():
//         v13 = const u64 1
//         v14 = get_elem_ptr value, ptr u64, v13, !28
//         v15 = load v14
//         v16 = asm(input: v15) -> u64 input, !30 {
//         }
//         v17 = const u64 2
//         v18 = get_elem_ptr value, ptr u64, v17, !31
//         v19 = load v18
//         v20 = sub v16, v19, !32
//         v21 = get_local ptr { bool, u64 }, __tmp_block_arg
//         v22 = const bool false, !33
//         br block2(v21, v20, v22)

//         block2(v23: ptr { bool, u64 }, v24: u64, v25: bool):
//         v26 = const u64 0
//         v27 = get_elem_ptr __ret_value, ptr bool, v26
//         store v25 to v27
//         v28 = const u64 1
//         v29 = get_elem_ptr __ret_value, ptr u64, v28
//         store v24 to v29
//         ret ptr { bool, u64 } __ret_value
//     }
// }
