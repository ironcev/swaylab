library;

struct Struct {
    x: u64,
    y: u64,
}

pub fn play() -> () {
//     let s = (0u64, 0u64);

//     if let (_, x) = s {
//         let _a = x + x;
//     };

// // if true {
// //     let x = s.1;
// //     let _a = core::ops::add(x, x);
// // }
// // else {
// // }

//     if let (_, x) = s {
//         let _a = x + x;
//     }
//     else if let (_, y) = s {
//         let _a = y * y;
//     }
//     else if let (k, j) = s {
//         let _a = k * j;
//     };

// // if true {
// //     let x = s.1;
// //     let _a = core::ops::add(x, x);
// // }
// // else {
// //     if true {
// //         let y = s.1;
// //         let _a = core::ops::multiply(y, y);
// //     }
// //     else {
// //         if true {
// //             let k = s.0;
// //             let j = s.1;
// //             let _a = core::ops::multiply(k, j);
// //         }
// //         else {
// //         }
// //     }
// // }

//     if let (_, x) = test_tuple() {
//         let _a = x + x;
//     }
//     else if let (_, y) = test_tuple() {
//         let _a = y * y;
//     }
//     else if let (k, j) = test_tuple() {
//         let _a = k * j;
//     };

// // if true {
// //     let x = test_tuple().1;
// //     let _a = core::ops::add(x, x);
// // }
// // else {
// //     if true {
// //         let y = test_tuple().1;
// //         let _a = core::ops::multiply(y, y);
// //     }
// //     else {
// //         if true {
// //             let k = test_tuple().0;
// //             let j = test_tuple().1;
// //             let _a = core::ops::multiply(k, j);
// //         }
// //         else {
// //         }
// //     }
// // }

//     if let Struct { x, y:_ } = test_struct() {
//         let _a = x + x;
//     }
//     else if let Struct { x:_, y } = test_struct() {
//         let _a = y * y;
//     }
//     else if let Struct { x: k, y: j } = test_struct() {
//         let _a = k * j;
//     };

// // if true {
// //     let x = test_struct().x;
// //     let _a = core::ops::add(x, x);
// // }
// // else {
// //     if true {
// //         let y = test_struct().y;
// //         let _a = core::ops::multiply(y, y);
// //     }
// //     else {
// //         if true {
// //             let k = test_struct().x;
// //             let j = test_struct().y;
// //             let _a = core::ops::multiply(k, j);
// //         }
// //         else {
// //         }
// //     }
// // }

//     if let Struct { x, y: 222 } = test_struct() {
//         let _a = x + x;
//     }
//     else if let Struct { x: 111, y } = test_struct() {
//         let _a = y * y;
//     }
//     else if let Struct { x: k, y: j } = test_struct() {
//         let _a = k * j;
//     };

// // if core::ops::eq(test_struct().y, 222) {
// //     let x = test_struct().x;
// //     let _a = core::ops::add(x, x);
// // }
// // else {
// //     if core::ops::eq(test_struct().x, 111) {
// //         let y = test_struct().y;
// //         let _a = core::ops::multiply(y, y);
// //     }
// //     else {
// //         if true {
// //             let k = test_struct().x;
// //             let j = test_struct().y;
// //             let _a = core::ops::multiply(k, j);
// //         }
// //         else {
// //         }
// //     }
// // }

    let _x = match test_struct() {
        Struct { x, y:_ } => {
            let _a = x + x;
        },
        Struct { x:_, y } => {
            let _a = y * y;
        },
        Struct { x: k, y: j } => {
            let _a = k * j;
        }
    };

// if true {
//     let x = __match_return_var_name_1.x;
//     let _a = core::ops::add(x, x);
// }
// else if true {
//     let y = __match_return_var_name_1.y;
//     let _a = core::ops::multiply(y, y);
// }
// else {
//     let k = __match_return_var_name_1.x;
//     let j = __match_return_var_name_1.y;
//     let _a = core::ops::multiply(k, j);
// }
}

fn test_tuple() -> (u64, u64) {
    (0, 0)
}

fn test_struct() -> Struct {
    Struct {
        x: 0,
        y: 0,
    }
}