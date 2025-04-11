predicate;

fn main() -> bool {
    assert_eq(1, 1);

    true
}

// error
//   --> /home/kebradalaonda/p/sway/sway-lib-std/src/logging.sw:34:5
//    |
// 32 |     T: AbiEncode,
// 33 | {
// 34 |     __log::<T>(value);
//    |     ^^^^^^^^^^^^^^^^^ Using intrinsic "log" in a predicate is not allowed.
// 35 | }
//    |
