script;

fn main() { }

#[test]
fn vec_issue() {
    let mut vec_01 = Vec::<u64>::new();
    vec_01.push(123);

    assert(vec_01.get(0).unwrap() == 123);

    // `vec_01` get `memcpy`ed and the internal `raw_ptr`
    // still points to the same memory location which breaks
    // the "by copy" semantics.
    let mut vec_02 = vec_01;

    vec_02.set(0, 321); // This changes `vec_01` as well.

    assert(vec_01.get(0).unwrap() == 321);
}

