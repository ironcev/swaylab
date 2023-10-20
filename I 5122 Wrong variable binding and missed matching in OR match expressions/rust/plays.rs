fn dca_01() -> u64 {
    return 0;

    42*1
}

fn dca_02() -> u64 {
    return 0;

    return 42*2;
}

fn dca_03(a: u64) -> u64 {
    if a > 0 {
        return 0;
    }
    else {
        return 0;
    }

    return 42*3;
}

fn revert_01() -> u64 {
    panic!();

    42*1
}

fn revert_02() -> u64 {
    panic!();

    return 42*2;
}

fn revert_03(a: u64) -> u64 {
    if a > 0 {
        panic!();
    }
    else {
        return 0;
    }

    return 42*3;
}

fn main() -> () {
    let _ = dca_01();
    let _ = dca_02();
    let _ = dca_03(0);

    let _ = revert_01();
    let _ = revert_02();
    let _ = revert_03(0);
}


// warning: unreachable expression
//  --> src/main.rs:4:5
//   |
// 2 |     return 0;
//   |     -------- any code following this expression is unreachable
// 3 |
// 4 |     42*1
//   |     ^^^^ unreachable expression
//   |
//   = note: `#[warn(unreachable_code)]` on by default
// 
// warning: unreachable statement
//   --> src/main.rs:10:5
//    |
// 8  |     return 0;
//    |     -------- any code following this expression is unreachable
// 9  |
// 10 |     return 42*2;
//    |     ^^^^^^^^^^^^ unreachable statement
// 
// warning: unreachable statement
//   --> src/main.rs:21:5
//    |
// 15 |         return 0;
//    |         -------- any code following this expression is unreachable
// ...
// 21 |     return 42*3;
//    |     ^^^^^^^^^^^^ unreachable statement
// 
// warning: unreachable expression
//   --> src/main.rs:27:5
//    |
// 25 |     panic!();
//    |     -------- any code following this expression is unreachable
// 26 |
// 27 |     42*1
//    |     ^^^^ unreachable expression
// 
// warning: unreachable statement
//   --> src/main.rs:33:5
//    |
// 31 |     panic!();
//    |     -------- any code following this expression is unreachable
// 32 |
// 33 |     return 42*2;
//    |     ^^^^^^^^^^^^ unreachable statement
// 
// warning: unreachable statement
//   --> src/main.rs:44:5
//    |
// 41 |         return 0;
//    |         -------- any code following this expression is unreachable
// ...
// 44 |     return 42*3;
//    |     ^^^^^^^^^^^^ unreachable statement
