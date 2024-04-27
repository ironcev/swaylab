library;

struct S {
    x: u8,
}
//_^ This is a struct, not a variable.

impl S {
    fn method(self) {}
}

trait Trait {}
//^^^^^^^^^^^^^^ This is a trait, not a variable.

fn function() {
    ()
}
//| |_^ This is a function, not a variable.

enum E {
    A: (),
}


pub fn play() {
    S = 123;

    Trait = 123;

    function = 123;

    //--- Below we have the same errors but removed through deduplication.
    S.x = 123;

    Trait.x = 123;

    function.x = 123;
    //---

    let s = S { x: 0 };
    s.method() = 123;
//  ^^^^^^^^^^ This expression cannot be assigned to.

    E::A = 123;
//  ^^^^ This expression cannot be assigned to.

    E = 123;
}
