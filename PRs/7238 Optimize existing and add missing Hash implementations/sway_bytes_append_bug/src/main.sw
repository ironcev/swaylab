script;

use std::bytes::Bytes;

fn main() { }

#[test]
fn bytes_append_bug() {
    let mut first = Bytes::new();
    let mut other = Bytes::new();

    other.push(111);
    
    first.append(other);

    first.set(0, 222);

    assert_eq(other.get(0).unwrap(), 111);
}
