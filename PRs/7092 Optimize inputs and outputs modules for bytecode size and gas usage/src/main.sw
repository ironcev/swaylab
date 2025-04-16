script;

// Bytecode size: 5688.
fn main() {
    let _ = std::tx::tx_witnesses_count();                  // 5664.

    let _ = std::inputs::input_count();                     // 5576.
    let _ = std::inputs::input_amount(0);                   // 5528.
    let _ = std::inputs::input_coin_owner(0);               // 5552. <<-- Increase because of the new function added.
    let _ = std::inputs::input_predicate_data::<u64>(0);    // 5400.
    let _ = std::inputs::input_asset_id(0);                 // 5336.
    let _ = std::inputs::input_witness_index(0);            // 5272.
    let _ = std::inputs::input_predicate_length(0);         // 5208.
    // let _ = std::inputs::input_predicate_pointer(0);
    let _ = std::inputs::input_predicate(0);                // 4776.
    let _ = std::inputs::input_predicate_data_length(0);    // 4712.
    let _ = std::inputs::input_message_sender(0);           // 4664.
    let _ = std::inputs::input_message_recipient(0);        // 4624.
    let _ = std::inputs::input_message_nonce(0);            // 4576.
    let _ = std::inputs::input_message_data_length(0);      // 4448.
    let _ = std::inputs::input_message_data(0, 0);          // 3960.

    let _ = std::outputs::output_count();                   // 3784.
    // let _ = std::outputs::output_pointer(0);
    let _ = std::outputs::output_amount(0);                 // 3064.
    let _ = std::outputs::output_asset_id(0);               // 2848.
    let _ = std::outputs::output_asset_to(0);               // 2544.

    // let _ = std::outputs::output_asset_id_and_to(0);
}

// Calling: 912.
//      let _ = std::outputs::output_asset_id(0);
//      let _ = std::outputs::output_asset_to(0);
// Calling: 696.
//      let _ = std::outputs::output_asset_id_and_to(0);
