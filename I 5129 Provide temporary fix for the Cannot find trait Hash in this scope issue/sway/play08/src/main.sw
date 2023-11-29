script;

mod lib;
mod other_lib;
mod trait_impls;

use std::hash::sha256;

use lib::{FirstStruct, SecondStruct, ThirdStruct, A, function};
use trait_impls::*;

fn main() {
    let _ = std::hash::sha256(123u8);

    let _ = sha256(123u8);

    let s = FirstStruct::<A> {};
    s.method(A {});

    let s = SecondStruct::<u8> {};
    s.method(0u8);

    let s = ThirdStruct {};
    s.method_01(0u8);
    s.method_02(A {});
    ThirdStruct::associated_function(A {});

    function(A {});

    let a = A {};

    a.trait_method(A {});

    A::trait_associated_function(A {});

    function_with_trait_alias(A {});

    function_with_duplicated_trait(A {});
}
