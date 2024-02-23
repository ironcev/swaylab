script;

 fn make_transaction_fail(input: u64) -> u64 {
    match revert(input) {
        () => 0,
        _ => 0,
    }
 }

 fn test_return(input: u64) -> u64 {
    revert(input) // ERROR:
//  ^^^^^^^^^^^^^
// 
//  Mismatched types.
//  expected: u64
//  found:    ().
//  help: Function body's return type does not match up with its return type annotation.
 }
 
 fn test_match(input: u64) -> u64 {
     match input {
         0 => 0,
         1 => 11,
         _ => revert(22),
     }
 }

 fn test_if(input: u64) -> u64 {
     if input == 0 {
         0
     }
     else {
         revert(input)
     }
 }


fn main() {
    let _ = make_transaction_fail(1);
    let _ = test_return(1);
    let _ = test_match(1);
    let _ = test_if(1);
}
