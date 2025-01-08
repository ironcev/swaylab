script;

struct S {}

trait Trait<T> {}

impl<A> Trait<A> for S {}
impl<A> Trait<A> for S {}
//  ^^^^^^^^^^^^^^^^^^^^^^^^^ Conflicting implementations of trait "Trait<A>" for type "S".

fn main() -> u64  {
    0
}

// ---------------------------------


impl<A> Trait<A> for S {}
impl<B> Trait<B> for S {}

// No error on master, yes on beta-5.


// ---------------------------------

script;

struct S<T> {}

trait Trait<T> {}

impl<A> Trait<A> for S<A> {}
impl<B> Trait<B> for S<B> {}

fn main() -> u64  {
    0
}

// No error on master, yes on beta-5.

