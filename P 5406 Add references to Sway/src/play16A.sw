library;

trait New {
    fn new() -> Self;
}

impl New for bool {
    fn new() -> Self {
        true
    }
}

#[inline(never)]
fn outher_test<T>() where T: New
{
    inner_test::<T>()
}

#[inline(always)]
fn inner_test<T>() where T: New
{
    let _ = T::new();
}

#[inline(never)]
pub fn play() {
    // let _x = bool::new();
    // let _x = inner_test::<bool>();
    outher_test::<bool>();
}
