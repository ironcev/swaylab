script;

pub fn play<T>(x: (T, u64)) {
   let mut array = [1, 2, 3];
   array[x.1] = 0;
}

fn main() {
    play((0, 0));
}
