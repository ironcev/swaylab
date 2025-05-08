script;

use std::bytes::Bytes;

// Bytecode size: 2384.
fn main() {
    let vec: Vec<u8> = Vec::new();
    let bytes: Bytes = vec.into();      // 2136.
    let vec: Vec<u8> = bytes.into();    // 1888.

    let _ = vec == vec;                 // 1840.
    for _ in vec.iter() { }             // 1624.  len() -> len: 1592.

    let _ = bytes == bytes;
    for _ in bytes.iter() { }           // 1544.

    // Bytes::ptr() removal:            // 1456.
    // Bytes::capacity() removal:       // 1456.
    // Bytes::len() removal:            // 1432.

    // Vec::ptr() removal:              // 1432.
    // Vec::capacity() removal:         // 1432.
    // Vec::len() removal:              // 1336.

    // Fix `From<Vec<u8>> for Bytes`:   // 1416.
    // Fix `From<Bytes> for Vec<u8>`:   // 1488.
}
