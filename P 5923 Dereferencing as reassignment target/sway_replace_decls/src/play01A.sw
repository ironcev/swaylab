library;

trait Indexable {
    fn get_index(self) -> u64;
}

fn function<T>(x: T) -> u64 where T: Indexable {
    x.get_index()
}

struct S { }

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
pub fn play() -> u64 {
   let _ = function(0);
   let _ = function(S { });
   
   let mut array = [1, 2, 3];
   
   array[function(0)] = 0;
   array[function(S { })] = 0;

   42
}