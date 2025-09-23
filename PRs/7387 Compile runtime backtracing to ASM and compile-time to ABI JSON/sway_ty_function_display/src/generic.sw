library;

pub struct GenStruct<T> { }

trait GenTrait<T> {
    fn friendly_fn_in_trait(self) -> Self;
} {
    fn friendly_provided_method_in_trait<A>(ref mut self) -> (A, Self) {
        panic;
    }

    fn friendly_provided_fn_in_trait(s: GenStruct<T>, ref mut x: T) -> (b256, T) {
        panic;
    }
}

impl<T> GenTrait<T> for GenStruct<T> {
    fn friendly_fn_in_trait(self) -> Self {
        panic;
    }
}

impl<T> GenStruct<T> {
    pub fn friendly_fn_in_struct() -> (T, Self) {
        panic;
    }

    pub fn friendly_method_in_struct<A>(self, ref mut x: T, a: A) {
        panic;
    }
}

pub fn friendly_fn_in_module<T>(ref mut x: T) -> [b256; 0] {
    panic;
}
    
pub fn play() {
    GenStruct::<Option<bool>> {}.friendly_fn_in_trait();
    let _ = GenStruct::<bool>::friendly_fn_in_struct();
    let s = GenStruct::<u8> {};
    let mut x: u8 = 0;
    let _ = GenStruct::friendly_provided_fn_in_trait(s, x);
    let mut b: bool = true;
    GenStruct::<bool> {}.friendly_method_in_struct(b, 42);
    let _ = GenStruct::<bool> {}.friendly_provided_method_in_trait::<GenStruct<Option<u8>>>();
    let mut x: u256 = 0;
    friendly_fn_in_module(x);
}
