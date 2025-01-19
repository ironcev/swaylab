/*
  Multiline comment at the beginning of the file.
  This is the second line.
*/

// Single line comment right before the program kind.
contract;
// Single line comment right after the program kind.
/*
  Multiline comment right after the program kind.
  This is the second line.
*/

mod module;
mod empty_module;

fn calculate_slot_address() -> b256 {
    b256::zero()
}

storage {
    x: u64 = 0,
    y in b256::zero(): u64 = 0,
    z: u64 = 0,
    a
      in calculate_slot_address(): u64 = 0,
    b in 0x0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f20: u64 = 0,
}

// Single line comment above.
fn ref_mut_fn(/* Inline comment before ref mut.*/ ref mut /* Inline comment after ref mut.*/ x: /* Inline comment before type.*/ u64) {}
// Single line comment below.

struct S {}

fn another_ref_mut_fn(ref mut arg: S) {}

fn ref_mut_fn_multiple_ref_mut_args(ref mut arg: S, x: u64, ref mut s: S, y: u8) {}

abi Abi { }

impl Abi for Contract {
}
