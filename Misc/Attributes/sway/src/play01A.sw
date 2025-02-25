library;

#[fallback]
#[test]
#[storage(read)]
enum A {
    A: (),
}

#[non_existing_attribute]
// ------------------------- Unknown attribute: "non_existing_attribute".  <<<--- WARNING.
enum B {
    A: (),
}

#[inline(never)]
pub fn play() {
    let _ = A::A;
    let _ = B::A;
    inlined_or_not();
    storage_fn();
    invalid_cfg();
    multiple_cfg();
    allow_something();
}

#[inline(always)]
#[inline(never)]
// In Sway ok.
// In Rust:
//     warning: unused attribute
//     warning: this was previously accepted by the compiler but is being phased out; it will become a hard error in a future release!
pub fn inlined_or_not() {
}

#[test]
#[test]
#[test]
// In Sway ok.
// In Rust: warning: duplicated attribute
fn test() {}

#[storage()]
// #[storage(non_existing)]
//           ^^^^^^^^^^^^ invalid argument for 'storage' attribute
#[storage(read, read, read, read)]
#[storage(read = false)]
fn storage_fn() {}

// #[cfg(invalid)]
// WARNING: Unexpected attribute value: "invalid" for attribute: "cfg" expected value "target" or "program_type" or "experimental_new_encoding" or "experimental_storage_domains" or "experimental_references" or "experimental_error_type"
// ERROR:   Unexpected attribute value: "invalid" for attribute: "cfg"
fn invalid_cfg() {}

#[cfg(target = "fuel", experimental_new_encoding = true)]
//--- Attribute: "cfg" expected exactly 1 argument(s) received 2.
#[cfg(target = "fuel", experimental_new_encoding)]
//--- Attribute: "cfg" expected exactly 1 argument(s) received 2.
fn multiple_cfg() {}

#[allow(something)]
//----- Unexpected attribute value: "something" for attribute: "allow" expected value "dead_code" or "deprecated"
#[allow(something = false)]
#[allow(deprecated = false)]
fn allow_something() {}