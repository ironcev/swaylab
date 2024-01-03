library;

#[inline(never)]
fn function(x: u64) -> u64 {
    x
}

#[inline(never)]
pub fn play() -> u64 {
    function(return 123u64);

    let x = 111u64;

    function(x)
}
