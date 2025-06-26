fn main() {
    f(42);
}

#[inline(never)]
fn f(x: u64) {
    let r1 = &(x + 1);
    println!("{:p}", r1);
    
    let r1 = &(x + 1);
    println!("{:p}", r1);
}

// Debug:
// 0x7ffe60689648
// 0x7ffe606896a8
//
// Release:
// 0x7fff2faf5a18
// 0x7fff2faf5a40
