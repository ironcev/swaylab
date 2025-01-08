library;

pub fn play() -> u64 {
    let mut a: [u64;10000] = [0;10000];

    let mut i = 0;
    while i < 5 {
        a[i] = i;
        i = i + 1;
    }
    
    if a[0] == 1 {
        a[3] + a[4]
    }
    else {
        a[3] - a[4]
    }
}
