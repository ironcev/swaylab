script;

use types::MyEnum;
use usages::{UsagesStruct, UsagesStruct01, UsagesStruct02, UsagesEnum, UsagesGenericEnum, DummyStruct, use_traits_and_types};

// Importing UsagesStruct is not enough. The trait has to be explicitly imported.
// Otherwise we get the two duplicated error messages on the definition
// of `use_traits_and_types()` and `struct_fn()` and `struct_method()`.
use usages::UsagesTrait01;

use usages::UsagesTrait02;

use usages::UsagesTrait03;

fn main() {
    use_traits_and_types::<UsagesStruct01>();

    UsagesStruct::struct_fn::<UsagesStruct01>(); // Same error like with global function.

    let s = UsagesStruct { };

    s.struct_method::<UsagesStruct01>(); // Same error like with global function.

    // Here, if we do no explicitly import `UsagesTrait02` we will get the error:
    //  Trait "UsagesTrait02" is not implemented for type "UsagesEnum".
    let _x = UsagesStruct02 { t: UsagesEnum::A };

    // Here is the same thing. We will get this error:
    //  Trait "UsagesTrait03" is not implemented for type "DummyStruct".
    let _x = UsagesGenericEnum::A(DummyStruct {});
}
