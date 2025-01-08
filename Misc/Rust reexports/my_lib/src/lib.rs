pub use rand::Rng;
pub use rand::thread_rng;
pub use rand::seq::SliceRandom;

pub fn get_random_number() -> u32 {
    let mut rng = thread_rng();
    rng.gen_range(0..100)
}

pub fn shuffle_vec<T>(vec: &mut [T]) {
    vec.shuffle(&mut thread_rng());
}
