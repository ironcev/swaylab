predicate;

use std::{
    auth::predicate_address,
    b512::B512,
    hash::{
        Hash,
        sha256
    },
    inputs::{
        Input,
        input_coin_owner,
        input_count,
        input_message_recipient,
        input_message_sender,
        input_type,
        input_asset_id
    },
    outputs::{
        Output,
        output_amount,
        output_count,
        output_type,
        GTF_OUTPUT_COIN_TO,
        GTF_OUTPUT_COIN_ASSET_ID
    },
    tx::{
        tx_id,
        tx_witness_data,
        tx_witnesses_count,
    },
};

// Define configurable constants
configurable {
    TTD: AssetId = AssetId::from(0x0101010101010101010101010101010101010101010101010101010101010101),
    YES: AssetId = AssetId::from(0x0101010101010101010101010101010101010101010101010101010101010101),
    NO: AssetId = AssetId::from(0x0101010101010101010101010101010101010101010101010101010101010101),
    VRF: AssetId = AssetId::from(0x864b23e3bf2d3d0cc97c549d2212a400682f40cd8605b91002743c4873cd9074),
}

fn main() -> bool {
    true

    && validate_output(0, VRF, 2)
    && validate_output(0, VRF, 2)
    && validate_output(1, YES, 2)
    && validate_output(2, NO, 2)
    && validate_output(3, TTD, 2)

    && validate_output(0, VRF, 2)
    && validate_output(0, VRF, 2)
    && validate_output(1, YES, 2)
    && validate_output(2, NO, 2)
    && validate_output(3, TTD, 2)

    && validate_output(0, VRF, 2)
    && validate_output(0, VRF, 2)
    && validate_output(1, YES, 2)
    && validate_output(2, NO, 2)
    && validate_output(3, TTD, 2)

    && validate_output(0, VRF, 2)
    && validate_output(0, VRF, 2)
    && validate_output(1, YES, 2)
    && validate_output(2, NO, 2)
    && validate_output(3, TTD, 2)
}

#[inline(never)]
fn validate_output(index: u64, expected_asset_id: AssetId, expected_asset_type: u64) -> bool {
    match output_type(index) {
        Some(Output::Coin) => output_asset_id(index) == expected_asset_id && expected_asset_type == 0,
        Some(Output::Change) => output_asset_id(index) == expected_asset_id && expected_asset_type == 2,
        _ => false,
    }
}

pub fn output_asset_id(index: u64) -> AssetId {
    return AssetId::from(__gtf::<b256>(index, GTF_OUTPUT_COIN_ASSET_ID));
}
