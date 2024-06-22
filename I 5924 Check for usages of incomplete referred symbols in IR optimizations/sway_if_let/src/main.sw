script;

enum E {
    A: u64,
    B: u64,
    C: u64,
}

fn main() -> u64 {
    let x = E::A(112233);

    let result_1 = if let E::A(_x) = x {
        1100
    } else {
        1111
    };

    // result_1

    let result_2 = if let E::B(_x) = x {
        2200
    } else {
        2211
    };

    // result_1 + result_2

    let result_3 = if let E::C(_x) = x {
        3300
    } else {
        3311
    };

    result_1 + result_2 + result_3
}
