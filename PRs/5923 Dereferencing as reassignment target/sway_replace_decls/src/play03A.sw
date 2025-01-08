library;

fn function<T>(_x: T) -> u64 {
    0
}

pub struct S { }

#[inline(never)]
pub fn play<T>(x: T) -> u64 {
   let mut array = [1, 2, 3];
   
   array[function(x)] = 0;

   42
}