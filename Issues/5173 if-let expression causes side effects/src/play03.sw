library;

pub fn play() -> () {
    let s = (0u64, 0u64);

    if let (_, x) = s {
        let _a = x + x;
        _a
    }
    else {
        let _a = s.0;
        _a
    };

// Fixed:
// if true {
//     let x: u64 = __match_return_var_name_1.1;
//     let _a: u64 = core::ops::add(x, x);
//     _a
// }
// else {
//     let _a: u64 = s.0;
//     _a
// }

// Original:
// if true {
//     let x = s.1;
//     let _a = core::ops::add(x, x);
//     _a
// }
// else {
//     let _a = s.0;
//     _a
// }
}
