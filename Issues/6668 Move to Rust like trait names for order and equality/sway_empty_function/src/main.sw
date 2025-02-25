/*
  Multiline comment at the beginning of the file.
  This is the second line.
*/// Single line comment right before the program kind.
contract;
// Single line comment right after the program kind.
/*
  Multiline comment right after the program kind.
  This is the second line.
*/mod module;
mod empty_module;

storage {
    x: u64 = 0,
}

fn empty_function_old() {}

abi Abi {
}

impl Abi for Contract {}
fn empty_function() {}
