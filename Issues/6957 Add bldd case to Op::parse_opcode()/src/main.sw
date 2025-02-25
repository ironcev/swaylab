script;

fn main() {
    let r_b = b256::zero();
    let r_d = 0u64;
    let r_c = 0u64;
    let r_a = b256::zero();
    asm(rA: r_a, rB: r_b, rC: r_c, rD: r_d) {
        bldd rA rB rC rD;
    }
}