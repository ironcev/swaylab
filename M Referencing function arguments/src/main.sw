script;

fn main() {
    function(0u8);
    function(0x0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f20u256);
}

#[inline(never)]
fn function<T>(a: T) {
    let _ = &a;
}

// fn function_1(a !12: u8) -> (), !15 {
//     local u64 _

//     entry(a: u8):
//     v0 = ptr_to_int a to u64
//     v1 = int_to_ptr v0 to ptr u8
//     v2 = ptr_to_int v1 to u64, !16
//     v3 = get_local ptr u64, _, !17
//     store v2 to v3, !17
//     v4 = const unit ()
//     ret () v4
// }

// fn function_2(a !12: u256) -> (), !18 {
//     local u64 _

//     entry(a: u256):
//     v0 = ptr_to_int a to u64
//     v1 = int_to_ptr v0 to ptr u256
//     v2 = ptr_to_int v1 to u64, !16
//     v3 = get_local ptr u64, _, !17
//     store v2 to v3, !17
//     v4 = const unit ()
//     ret () v4
// }
