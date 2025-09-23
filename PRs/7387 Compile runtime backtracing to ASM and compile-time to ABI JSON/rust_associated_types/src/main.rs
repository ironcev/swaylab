trait Trait {
    type AssociatedType;
}

struct Struct {}

impl Trait for Struct {
    type AssociatedType = u8;
}

fn assoc_type_as_arg<T>(_t: T::AssociatedType) where T: Trait {}

fn main() {
    // assoc_type_as_arg(Struct::AssociatedType::MIN);
    // assoc_type_as_arg(<Struct as Trait>::AssociatedType::MIN);
    assoc_type_as_arg::<Struct>(<Struct as Trait>::AssociatedType::MIN);
    assoc_type_as_arg::<Struct>(0);
}

// error[E0223]: ambiguous associated type
//   --> src/main.rs:14:23
//   |
// 14 |     assoc_type_as_arg(Struct::AssociatedType::MIN);
//   |                       ^^^^^^^^^^^^^^^^^^^^^^ help: use fully-qualified syntax: `<Struct as Trait>::AssociatedType`


// error[E0283]: type annotations needed
//   --> src/main.rs:15:5
//   |
// 15 |     assoc_type_as_arg(<Struct as Trait>::AssociatedType::MIN);
//   |     ^^^^^^^^^^^^^^^^^ cannot infer type of the type parameter `T` declared on the function `assoc_type_as_arg`
