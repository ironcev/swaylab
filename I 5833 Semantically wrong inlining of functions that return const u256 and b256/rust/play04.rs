struct S {
    x: u64,
    y: u64,
}

const CONST: S = S { x: 0, y: 0, };

fn main() {
    println!("a: {:p}", a());
    println!("b: {:p}", b());
}

fn a() -> &'static S {
    &CONST
}

fn b() -> &'static S {
    &CONST
}

// a: 0x55966df9f000
// b: 0x55966df9f000


// MIR
// const CONST: S = {
//     let mut _0: S;
// 
//     bb0: {
//         _0 = S { x: const 0_u64, y: const 0_u64 };
//         return;
//     }
// }
// 
// fn main() -> () {
//     let mut _0: ();
//     let _1: ();
//     let mut _2: std::fmt::Arguments<'_>;
//     let mut _3: &[&str];
//     let mut _4: &[core::fmt::rt::Argument<'_>];
//     let _5: &[core::fmt::rt::Argument<'_>; 1];
//     let _6: [core::fmt::rt::Argument<'_>; 1];
//     let mut _7: core::fmt::rt::Argument<'_>;
//     let _8: &&S;
//     let _9: &S;
//     let _10: ();
//     let mut _11: std::fmt::Arguments<'_>;
//     let mut _12: &[&str];
//     let mut _13: &[core::fmt::rt::Argument<'_>];
//     let _14: &[core::fmt::rt::Argument<'_>; 1];
//     let _15: [core::fmt::rt::Argument<'_>; 1];
//     let mut _16: core::fmt::rt::Argument<'_>;
//     let _17: &&S;
//     let _18: &S;
//     let mut _19: &[&str; 2];
//     let mut _20: &[&str; 2];
// 
//     bb0: {
//         _20 = const main::promoted[1];
//         _3 = _20 as &[&str] (PointerCoercion(Unsize));
//         _9 = a() -> [return: bb1, unwind continue];
//     }
// 
//     bb1: {
//         _8 = &_9;
//         _7 = core::fmt::rt::Argument::<'_>::new_pointer::<&S>(_8) -> [return: bb2, unwind continue];
//     }
// 
//     bb2: {
//         _6 = [move _7];
//         _5 = &_6;
//         _4 = _5 as &[core::fmt::rt::Argument<'_>] (PointerCoercion(Unsize));
//         _2 = Arguments::<'_>::new_v1(move _3, move _4) -> [return: bb3, unwind continue];
//     }
// 
//     bb3: {
//         _1 = _print(move _2) -> [return: bb4, unwind continue];
//     }
// 
//     bb4: {
//         _19 = const main::promoted[0];
//         _12 = _19 as &[&str] (PointerCoercion(Unsize));
//         _18 = b() -> [return: bb5, unwind continue];
//     }
// 
//     bb5: {
//         _17 = &_18;
//         _16 = core::fmt::rt::Argument::<'_>::new_pointer::<&S>(_17) -> [return: bb6, unwind continue];
//     }
// 
//     bb6: {
//         _15 = [move _16];
//         _14 = &_15;
//         _13 = _14 as &[core::fmt::rt::Argument<'_>] (PointerCoercion(Unsize));
//         _11 = Arguments::<'_>::new_v1(move _12, move _13) -> [return: bb7, unwind continue];
//     }
// 
//     bb7: {
//         _10 = _print(move _11) -> [return: bb8, unwind continue];
//     }
// 
//     bb8: {
//         return;
//     }
// }
// 
// const main::promoted[0]: &[&str; 2] = {
//     let mut _0: &[&str; 2];
//     let mut _1: [&str; 2];
// 
//     bb0: {
//         _1 = [const "b: ", const "\n"];
//         _0 = &_1;
//         return;
//     }
// }
// 
// const main::promoted[1]: &[&str; 2] = {
//     let mut _0: &[&str; 2];
//     let mut _1: [&str; 2];
// 
//     bb0: {
//         _1 = [const "a: ", const "\n"];
//         _0 = &_1;
//         return;
//     }
// }
// 
// fn a() -> &S {
//     let mut _0: &S;
// 
//     bb0: {
//         _0 = const a::promoted[0];
//         return;
//     }
// }
// 
// const a::promoted[0]: &S = {
//     let mut _0: &S;
//     let mut _1: S;
// 
//     bb0: {
//         _1 = const CONST;
//         _0 = &_1;
//         return;
//     }
// }
// 
// fn b() -> &S {
//     let mut _0: &S;
// 
//     bb0: {
//         _0 = const b::promoted[0];
//         return;
//     }
// }
// 
// const b::promoted[0]: &S = {
//     let mut _0: &S;
//     let mut _1: S;
// 
//     bb0: {
//         _1 = const CONST;
//         _0 = &_1;
//         return;
//     }
// }
