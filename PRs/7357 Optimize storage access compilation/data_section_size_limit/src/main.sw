contract;

// const CONST: [u8; 1048576] = [0; 1048576]; // 1 MB.
// const CONST: [u8; 4096] = [0; 4096]; // 4 KB.
// const CONST: [u8; 32768] = [0; 32768]; // 32 KB = 4 KB * 8.
const CONST: [u8; 32760] = [0; 32760]; //  4 KB * 8 - 8 bytes for function selector in old encoding compilation.

// thread 'main' panicked at sway-core/src/asm_lang/allocated_ops.rs:880:19:
// Unable to offset into the data section more than 2^12 bits. Unsupported data section length: 131072 words.

// Limit is 2^12 bits = 4096 bytes.
// 4 KB address space of 8-byte words.

// 32768 / 72 = 455.1111111111111 ~ 455 storage elements in the storage.

impl Contract {
    fn x() -> u8 {
        CONST[0]
    }
}