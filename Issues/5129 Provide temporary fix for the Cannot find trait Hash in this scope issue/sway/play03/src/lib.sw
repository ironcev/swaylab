// Taken from: https://github.com/FuelLabs/sway/issues/5084
library;

use std::{
    constants::ZERO_B256, 
    hash::sha256
};

#[test]
fn test_hash_trait() {
    let my_val = ZERO_B256;

    let digest = sha256(my_val);
}