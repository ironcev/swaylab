contract;

impl Contract {
    #[storage(write)]
    fn test_function() {
        let _ = __state_store_quad(b256::zero(), asm() { zero: raw_ptr }, 0);
    }
}
