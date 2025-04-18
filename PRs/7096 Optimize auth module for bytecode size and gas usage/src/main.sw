script;

// Bytecode size: 2480.
fn main() {
    let _ = std::auth::predicate_address();    // 2464.
    let _ = std::auth::caller_addresses();     // 2104.
    let _ = std::auth::caller_address();       // 1200.
}
