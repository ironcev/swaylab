library;

struct S {}

pub fn play() {
    let _ = &mut &mut 0;

    let _ = &mut&mut0;
    //           ^^^^ Variable "mut0" does not exist in this scope.

    let _ = &mut&mut 0;

    let _ = & & 0;
}
