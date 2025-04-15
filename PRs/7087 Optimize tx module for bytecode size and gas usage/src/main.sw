script;

fn main() {
    original();
}

// Bytecode size: 1792.
#[inline(always)]
fn original() {
    let _ = std::tx::tx_script_length();               // 1768.
    let _ = std::tx::tx_script_data_length();          // 1744.
    // let _ = std::tx::tx_script_start_pointer();
    // let _ = std::tx::tx_script_data_start_pointer();
    let _ = std::tx::tx_script_data::<u64>();          // 1440.
    let _ = std::tx::tx_script_bytecode::<u64>();      // 1568.
    let _ = std::tx::tx_script_bytecode_hash();        // 984.
    let _ = std::tx::tx_witnesses_count();             // 960.
    // let _ = std::tx::tx_witness_pointer(0);
    let _ = std::tx::tx_witness_data::<u64>(0);        // 744.
}