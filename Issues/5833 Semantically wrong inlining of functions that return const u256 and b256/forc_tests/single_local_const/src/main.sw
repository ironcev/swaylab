script;

struct S {
    x: u64,
}

// #[test]
// fn test_same_local_const() {
//     let ptr_to_const_1 = get_const_address_1();
//     let ptr_to_const_2 = get_const_address_2();
//     assert(ptr_to_const_1 == ptr_to_const_2);     // <<-- Same pointers.
// }

// #[inline(never)]
// fn get_const_address_1() -> raw_ptr {
//     poke(505);
//     const CONST_S: S = S { x: 11 };
//     __addr_of(CONST_S)
// }

// #[inline(never)]
// fn get_const_address_2() -> raw_ptr {
//     poke(606);
//     const CONST_S: S = S { x: 11 };
//     __addr_of(CONST_S)
// }

#[test]
fn test_different_local_consts() {
    let ptr_to_const_1 = get_const_address_different_1();
    assert(ptr_to_const_1.read::<S>().x == 1111);

    let ptr_to_const_2 = get_const_address_different_2();
    // assert(ptr_to_const_2.read::<S>().x == 2222);
    assert(ptr_to_const_2.read::<S>().x == 1111);

    // assert(ptr_to_const_1 == ptr_to_const_2);     // <<-- Same pointers.

    // assert(ptr_to_const_1.read::<S>().x == 2222);
}

#[inline(never)]
fn get_const_address_different_1() -> raw_ptr {
    poke(505);
    const CONST_S: S = S { x: 1111 };
    __addr_of(CONST_S)
}

#[inline(never)]
fn get_const_address_different_2() -> raw_ptr {
    poke(606);
    const CONST_S: S = S { x: 2222 };
    __addr_of(CONST_S)
}

fn main() {}

#[inline(never)]
fn poke<T>(_x: T) {}

// fn get_const_address_1_5() -> u64, !35 {
//     local { u64 } CONST_S

//     entry():
//     v0 = const u64 505, !36
//     v1 = call poke_6(v0), !37
//     v2 = get_local ptr { u64 }, CONST_S, !38
//     v3 = const u64 0
//     v4 = get_elem_ptr v2, ptr u64, v3
//     v5 = const u64 11
//     store v5 to v4
//     v6 = get_local ptr { u64 }, CONST_S, !39
//     v7 = ptr_to_int v6 to u64, !40
//     ret u64 v7
// }

// fn get_const_address_2_7() -> u64, !45 {
//     local { u64 } CONST_S

//     entry():
//     v0 = const u64 606, !46
//     v1 = call poke_6(v0), !47
//     v2 = get_local ptr { u64 }, CONST_S, !48
//     v3 = const u64 0
//     v4 = get_elem_ptr v2, ptr u64, v3
//     v5 = const u64 11
//     store v5 to v4
//     v6 = get_local ptr { u64 }, CONST_S, !49
//     v7 = ptr_to_int v6 to u64, !50
//     ret u64 v7
// }

// .data:
// data_0 .word 1024
// data_1 .word 505
// data_2 .word 11
// data_3 .word 606
