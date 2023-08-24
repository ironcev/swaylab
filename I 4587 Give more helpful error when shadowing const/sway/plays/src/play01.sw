library;

const X: u32 = 1;

pub fn play() -> () {
    const X: u32 = 2; // ERR: The name `X` is defined multiple times
    {
        const X: u32 = 3; // ERR: The name `X` is defined multiple times
    }
}
