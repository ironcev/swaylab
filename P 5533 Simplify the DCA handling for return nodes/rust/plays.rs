// ---------------------------------------------

fn fun() -> [u64;3] {
    let a = 123u64;
    return [0u64, return [1, 2, 3], a];
}

// 3 |     return [0u64, return [1, 2, 3], a];
//   |                   ----------------  ^ unreachable expression
//   |                   |
//   |                   any code following this expression is unreachable

// ---------------------------------------------
