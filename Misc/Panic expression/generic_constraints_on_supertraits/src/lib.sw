library;

mod abi_encode;

trait Supertrait {}

trait Trait: Supertrait {}

struct S {}

impl Supertrait for S {}
impl Trait for S {}

fn generic_fn_with_a_constraint_on_trait<T>(t: T) where T: Trait {
    generic_fn_with_a_constraint_on_supertrait(t);
}

fn generic_fn_with_a_constraint_on_supertrait<T>(_t: T) where T: Supertrait { }

pub fn test_monomorphization() {
    generic_fn_with_a_constraint_on_trait(S {});
}
