use my_lib::{get_random_number, shuffle_vec, Rng, thread_rng};

fn main() {
    let random_number = get_random_number();
    println!("Random number: {}", random_number);

    let mut vec = vec![1, 2, 3, 4, 5];
    shuffle_vec(&mut vec);
    println!("Shuffled vec: {:?}", vec);

    let mut rng = thread_rng();
    let random_num: u8 = rng.gen_range(1..=10);
    println!("Random number from Rng: {}", random_num);
}

