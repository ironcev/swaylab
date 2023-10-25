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

// script {
//     entry fn main() -> (), !1 {
//         local [u64; 10000] __anon_0
//         local mut [u64; 10000] a

//         entry():
//         v0 = get_local ptr [u64; 10000], __anon_0, !5
//         v1 = const u64 0
//         v2 = get_elem_ptr v0, ptr u64, v1, !2
//         v3 = const u64 0, !6
//         store v3 to v2, !7
//         v4 = const u64 1
//         v5 = get_elem_ptr v0, ptr u64, v4, !2
//         v6 = const u64 0, !6
//         store v6 to v5, !8
//         v7 = const u64 2
//         v8 = get_elem_ptr v0, ptr u64, v7, !2
//         v9 = const u64 0, !6
//         store v9 to v8, !9

// etc. etc. until the compiler panics:

// thread 'main' panicked at sway-core/src/asm_lang/allocated_ops.rs:695:19:
// Unable to offset into the data section more than 2^12 bits. Unsupported data section length.