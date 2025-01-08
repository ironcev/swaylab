contract;

storage {
    x: u64 = 0,
}

abi Abi {
    #[storage(read)]
    fn main();
}

impl Abi for Contract {
    #[storage(read)]
    fn main() {
        // let x = read();
        // poke(x);
        // let x = try_read();
        // poke(x);
        // let x = multiple_reads();
        // poke(x);
        let x = multiple_try_reads();
        poke(x);
    }
}

// #[inline(never)]
// #[storage(read)]
// fn read() -> u64 {
//     storage.x.read()
// }

// #[inline(never)]
// #[storage(read)]
// fn try_read() -> u64 {
//     storage.x.try_read().unwrap()
// }

// #[inline(never)]
// #[storage(read)]
// fn multiple_reads() -> u64 {
//     let mut x = 0;
//     x += storage.x.read();
//     x += storage.x.read();
//     x += storage.x.read();
//     x += storage.x.read();
//     x
// }

#[inline(never)]
#[storage(read)]
fn multiple_try_reads() -> u64 {
    let mut x = 0;
    x += storage.x.try_read().unwrap();
    x += storage.x.try_read().unwrap();
    x += storage.x.try_read().unwrap();
    x += storage.x.try_read().unwrap();
    x
}

#[inline(never)]
fn poke<T>(_x: T) { }