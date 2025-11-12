#![no_std]
#![cfg_attr(not(test), no_main)]

#[panic_handler]
fn panic(_info: &core::panic::PanicInfo) -> ! {
    loop {}
}

#[no_mangle] 
pub extern "C" fn largest_prime_factor(n: u64) -> u64 {
    let mut n = n;

    if n <= 1 {
        return n;
    }

    let mut max_factor = 0;

    while n % 2 == 0 {
        max_factor = 2;
        n /= 2;
    }

    let mut i = 3;
    while i * i <= n {
        while n % i == 0 {
            max_factor = i;
            n /= i;
        }
        i += 2;
    }

    if n > 1 {
        max_factor = n;
    }

    max_factor
}

