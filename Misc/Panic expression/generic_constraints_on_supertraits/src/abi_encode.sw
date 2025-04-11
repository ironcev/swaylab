library;

trait Trait: AbiEncode {}

struct S {}

impl Trait for S {}

// impl Trait for raw_ptr {}
// ^^^^^^^^^^^^^^^^^^^^^^^^^ Trait "AbiEncode" is not implemented for type "pointer".

fn generic_fn_with_a_constraint_on_trait<T>(t: T) where T: Trait {
    __log(t);
}

pub fn test_monomorphization() {
    generic_fn_with_a_constraint_on_trait(S {});
}
