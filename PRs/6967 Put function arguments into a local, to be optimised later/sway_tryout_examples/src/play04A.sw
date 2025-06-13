library;

#[inline(never)]
pub fn play() {
    let my_slice: &__slice[u64] = __slice(&[1, 2, 3], 0, 3);
    let _: &u64 = __elem_at(my_slice, 0);
}

// No type correction:
// v22 = get_local ptr __slice[u64], my_slice, !19
// v23 = load v22
// v24 = asm(ptr: v23, ptr_out) -> ptr u64 ptr_out {
//     lw     ptr_out ptr i0
// }

// With type correction: