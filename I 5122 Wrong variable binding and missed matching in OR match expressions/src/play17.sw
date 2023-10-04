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
