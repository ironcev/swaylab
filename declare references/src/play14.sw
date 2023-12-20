library;

type MyU64 = u64;
// The error below happens only when passing to function
// and when are mixinf `u64` with the alias `MyU64` in the definition of `TupleOfU64` below.
// If we do not mix, everything works.
type TupleOfU64 = (u64, MyU64);
//type TupleOfU64 = (u64, u64); // This works.
//type TupleOfU64 = (MyU64, MyU64); // This also works.

fn type_aliases() {
    let r: MyU64 = 123;
    let t: TupleOfU64 = (r, r);

    passing_type_alias(t);
}

fn passing_type_alias(x: TupleOfU64) {
    let _x: (u64, u64) = x; // ERROR:
//                       ^ Mismatched types.
// expected: (u64, u64)
// found:    TupleOfU64.
// help: Variable declaration's type annotation does not match up with the assigned expression's type.
}

#[inline(never)]
pub fn play() {
    type_aliases();

    // All these examples work fine.
    // It is only in the function call that the error is reported.
    let r: MyU64 = 123;
    let t: TupleOfU64 = (r, r);
    let x: (u64, u64) = t;
    let y: (MyU64, MyU64) = x;
}
