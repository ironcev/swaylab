contract;

abi Abi {
    #[storage(read)]
    fn quad();
    #[storage(read)]
    fn word();
}

impl Abi for Contract {
    #[storage(read)]
    #[inline(never)]
    fn quad() {
        let b = __state_load_quad(b256::zero(), __addr_of(b256::zero()), 4);

        if b {
            poke(b);
        } else {
            poke(!b);
        }
    }
    #[storage(read)]
    #[inline(never)]
    fn word() {
        let w = __state_load_word(b256::zero());

        if w == 0 {
            poke(w);
        } else {
            poke(w + 1);
        }
    }
}

#[inline(never)]
fn poke<T>(_x: T) {}
