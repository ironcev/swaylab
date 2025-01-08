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
    BASE_ASSET: AssetId = AssetId::from(0xf8f8b6283d7fa5b672b530cbb84fcccb4ff8dc40f8176ef4544ddb1f1952ad07),
    TTD: AssetId = AssetId::from(0x0101010101010101010101010101010101010101010101010101010101010101),
    YES: AssetId = AssetId::from(0x0101010101010101010101010101010101010101010101010101010101010101),
    NO: AssetId = AssetId::from(0x0101010101010101010101010101010101010101010101010101010101010101),
    ORACLE: Address = Address::from(0x0101010101010101010101010101010101010101010101010101010101010101),
    USER: Address = Address::from(0x0101010101010101010101010101010101010101010101010101010101010101),    
    YES_PRICE: u64 = 7,
    NO_PRICE: u64 = 3,
    IS_YES: bool = true,
    COMMISSION_PERCENTAGE: u64 = 0,
    VRF: AssetId = AssetId::from(0x864b23e3bf2d3d0cc97c549d2212a400682f40cd8605b91002743c4873cd9074),
    REDEMPTION_YES: Address = Address::from(0x6b63804cfbf9856e68e5b6e7aef238dc8311ec55bec04df774003a2c96e0418e),
    REDEMPTION_NO: Address = Address::from(0x6b63804cfbf9856e68e5b6e7aef238dc8311ec55bec04df774003a2c96e0418e)
}

// Main predicate function
fn main() -> bool {
    
    let order_predicate = predicate_address().unwrap();
    let case = get_case();
    let output_count = output_count();

    if (case == 1) {
        if (output_count == 7) {
            return handle_redeem_case();
        } else if (output_count == 9) {
            return handle_redeem_plus_cancel_case();
        }
    } else if (case == 2) {
        return handle_cancellation_case() && output_count == 8;
    } else if (case == 3) {
        return handle_order_matching_case(order_predicate) && output_count == 6;
    }
    return false;
}

fn handle_redeem_plus_cancel_case() -> bool {
    // CANCELATION ALONG WITH REDEMPTION FLOW

    // 0th output is of type Change - (VRF)
    // 1st output is of type Change - (YES)
    // 2nd output is of type Change - (NO)
    // 3rd output is of type Change - (TTD)
    // 4th output is of type Coin - (YES)
    // 5th output is of type Coin - (NO)
    // 6th output is of type Coin - (TTD)
    // 7th output is of type Coin - (TTD) - To ORACLE as Commission
    // 8th output is of type Change - (ETH / BASE_ASSET)

    // The checks on output_to are : 
    // TTD Change (Output 3) must go to redemption predicate
    // YES Coin (Output 4) must go to redemption predicate
    // NO Coin (Output 5) must go to redemption predicate
    // TTD Coin (Output 7) must go to redemption predicate
    // TTD Coint (Output 7) = COMMISSION (checks in the redemption predicate)

    let mut winning_amount = output_amount(4).unwrap();
    if winning_amount > output_amount(5).unwrap() {
        winning_amount = output_amount(5).unwrap();
    }

    return 
    // OUTPUT VALIDATIONS
    validate_output(0, VRF, 2)
    && validate_output(1, YES, 2) && validate_output(2, NO, 2)
    && validate_output(3, TTD, 2) && validate_output(4, YES, 0) 
    && validate_output(5, NO, 0) 
    && validate_output(6, TTD, 0) && validate_output(7, TTD, 0) 
    && validate_output(8, BASE_ASSET, 2)
    // OUTPUT TO VALIDATIONS
    && (validate_output_to(3,REDEMPTION_YES,2) || validate_output_to(3,REDEMPTION_NO,2))
    && (validate_output_to(4,REDEMPTION_YES,0) || validate_output_to(4,REDEMPTION_NO,0)) 
    && (validate_output_to(5,REDEMPTION_YES,0) || validate_output_to(5,REDEMPTION_NO,0))
    && validate_output_to(6,USER,0)
    && validate_output_to(7,ORACLE,0)
    // AMOUNT VALIDATIONS
    && output_amount(6).unwrap() >= winning_amount;

}

// Handle the redemption case logic
fn handle_redeem_case() -> bool {

    // REDEEM FLOW
    // Outputs as follows : 
    // 0. 0th output is of type Change - (VRF)
    // 1. 1st output is of type Change - (YES / NO) Winning Asset
    // 2. 2nd output is of type Change - (TTD)
    // 3. 3rd output is of type Coin - (YES / NO) Winning Asset
    // 4. 4th output is of type Coin - (TTD)
    // 5. 5th output is of type Coin - (TTD) - to ORACLE as Commission
    // 6. 6th output is of type Change - (ETH)

    // The checks on output_to are : 
    // TTD Coin (Output 4) == YES/NO Coin (Output 3)
    // TTD Coin (Output 4) must go to the USER
    // YES/NO Coin (Output 3) must go to either the REDEMPTION_YES or the REDEMPTION_NO predicate
    // TTD Coin (Output 4) == WINNING_ASSET - COMMISSION / 100 * WINNING_ASSET (Output 3)
    // TTD Coin (Output 5) must go to ORACLE
    // TTD Coin (Output 5) == COMMISSION / 100 * WINNING_ASSET (Output 3)

    let wining_amount = output_amount(3).unwrap();
    let commission_amount = (COMMISSION_PERCENTAGE * wining_amount / 100);
    let winning_amount_after_commission = wining_amount - commission_amount;

    return 
    // OUTPUT VALIDATIONS
    validate_output(0, VRF, 2) && (validate_output(1, YES, 2) || validate_output(1, NO, 2))
    && validate_output(2, TTD, 2) && (validate_output(3, YES, 0) || validate_output(3, NO, 0))
    && validate_output(4, TTD, 0) && validate_output(6,BASE_ASSET,2)
    // OUTPUT TO VALIDATIONS
    && validate_output_to(4,USER,0)
    && (validate_output_to(3,REDEMPTION_YES,0) || validate_output_to(3,REDEMPTION_NO,0))
    && validate_output_to(5,ORACLE,0)
    // AMOUNT VALIDATIONS
    && output_amount(4).unwrap() == winning_amount_after_commission
    && output_amount(5).unwrap() == commission_amount;
}

// Handle the cancellation case logic
fn handle_cancellation_case() -> bool {
    
    // CANCELLATION
    // 0th output is of type Change - (VRF)
    // 1st output is of type Change - (TTD)
    // 2nd output is of type Change - (YES)
    // 3rd output is of type Change - (NO)
    // 4th output is of type Coin - (TTD)
    // 5th output is of type Coin - (YES)
    // 6th output is of type Coin - (NO)
    // 7th output is of type Change - (ETH)

    // The checks on output_to are : 
    // TTD Coin (Output 4) == YES Coin (Output 5)
    // TTD Coin (Output 4) == NO Coin (Output 6)
    // TTD Coin (Output 4) must go to USER
    // YES Change (Output 2) must go to order predicate 
    // NO Change (Output 3) must go to order predicate
    // We dont need to check the last two conditions as 
    // 1. Change of YES, NO will be 0 in case of cancellation
    // 2. User performs the transaction so it's fine within trust assumptions

    let ttd_amount = output_amount(4).unwrap();

    return 
    // OUTPUT VALIDATIONS
    validate_output(0, VRF, 2) && validate_output(1, TTD, 2) 
    && validate_output(2, YES, 2) && validate_output(3, NO, 2) 
    && validate_output(4, TTD, 0) && validate_output(5, YES, 0)
    && validate_output(6, NO, 0) && validate_output(7, BASE_ASSET, 2)
    // OUTPUT TO VALIDATIONS
    && validate_output_to(4, USER, 0)
    // AMOUNT VALIDATIONS
    && ttd_amount == output_amount(5).unwrap() && ttd_amount == output_amount(6).unwrap();
}

// Handle the order matching case logic
fn handle_order_matching_case(order_predicate:Address) -> bool {

    // ORDER MATCHING
    // 0th output is of type Change - (VRF)
    // 1st output is of type Change - (NO)
    // 2nd output is of type Change - (YES)
    // 3rd output is of type Coin - (YES)
    // 4th output is of type Coin - (NO)
    // 5th output is of type Change - (ETH / BASE_ASSET)

    // The checks on output_to are : 
    // YES_PRICE * YES Coin (Output 3) >= NO_PRICE * NO Coin (Output 4)
    // YES_PRICE + NO_PRICE >= 100
    // If IS_YES == true then 
    //      NO Change (Output 1) must go to order predicate
    //      YES Coin (Output 3) must go to order predicate
    // Else 
    //      YES Change (Output 2) must go to order predicate
    //      NO Coin (Output 4) must go to the order predicate




    return 
    // OUTPUT VALIDATIONS
    validate_output(0, VRF, 2) 
    && validate_output(1, NO, 2) && validate_output(2, YES, 2) 
    && validate_output(3, YES, 0) && validate_output(4, NO, 0) 
    && validate_output(5, BASE_ASSET, 2) 
    // OUTPUT TO VALIDATIONS
    && 
    (
        (IS_YES && validate_output_to(1, order_predicate, 2) && validate_output_to(3, order_predicate, 0))
        ||
        (validate_output_to(2, order_predicate, 2) && validate_output_to(4, order_predicate, 0))
    )
    // AMOUNT VALIDATIONS
    && (YES_PRICE + NO_PRICE >= 100) 
    && 
    (
        (IS_YES && YES_PRICE * output_amount(3).unwrap() >= NO_PRICE * output_amount(4).unwrap())
        || 
        (!IS_YES && NO_PRICE * output_amount(4).unwrap() >= YES_PRICE * output_amount(3).unwrap())
    )

}

fn validate_output(index: u64, expected_asset_id: AssetId, expected_asset_type: u64) -> bool {
    match output_type(index) {
        Some(Output::Coin) => output_asset_id(index) == expected_asset_id && expected_asset_type == 0,
        Some(Output::Change) => output_asset_id(index) == expected_asset_id && expected_asset_type == 2,
        _ => false,
    }
}

fn validate_output_to(index: u64, expected_address_to: Address, expected_asset_type: u64) -> bool {
    match output_type(index) {
        Some(Output::Coin) => output_asset_to(index) == expected_address_to && expected_asset_type == 0,
        Some(Output::Change) => output_asset_to(index) == expected_address_to && expected_asset_type == 2,
        _ => false,
    }
}

// Helper functions
pub fn output_asset_id(index: u64) -> AssetId {
    return AssetId::from(__gtf::<b256>(index, GTF_OUTPUT_COIN_ASSET_ID));
}

pub fn output_asset_to(index: u64) -> Address {
    return Address::from(__gtf::<b256>(index, GTF_OUTPUT_COIN_TO));
}

// Get case based on input
fn get_case() -> u64 {
    if input_count() == 0 {
        return 0;
    }
    if input_type(0).unwrap() != Input::Coin {
        return 0;
    }
    if input_asset_id(0).unwrap() != VRF {
        return 0;
    };
    if input_coin_owner(0).unwrap() == ORACLE {
        return 1;
    } else if input_coin_owner(0).unwrap() == USER {
        return 2;
    }
    return 3;
}
