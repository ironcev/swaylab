library;

pub trait Indexable {
    fn get_index(self) -> u64;
}

fn function<T>(x: T) -> u64 where T: Indexable {
    x.get_index()
}

pub struct S { }

impl Indexable for u64 {
    fn get_index(self) -> u64 {
        self
    }
}

impl Indexable for S {
    fn get_index(self) -> u64 {
        0
    }
}

#[inline(never)]
pub fn play<T>(x: T) -> u64 where T: Indexable {
   let mut array = [1, 2, 3];
   
   array[function(x)] = 0;

   42
}