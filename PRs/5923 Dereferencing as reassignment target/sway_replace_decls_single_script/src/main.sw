script;

fn function<T>(_x: T) -> u64 {
    0
}

pub fn play<T>(x: T) {
   let mut array = [1, 2, 3];
   array[function(x)] = 0;
}

fn main() {
    play(0);
}
