contract;

use contract_libs::bitmap::*;
abi SellBitMapTest {
    #[storage(read)]
    fn has(price: u64) -> bool;
    #[storage(read, write)]
    fn set(price: u64);
    #[storage(read, write)]
    fn unset(price: u64);
    #[storage(read)]
    fn min() -> Option<u64>;
}
storage {
    ask_map: SellBitMap = SellBitMap {},
}
impl SellBitMapTest for Contract {
    #[storage(read)]
    fn has(price: u64) -> bool {
        storage.ask_map.has(price)
    }
    #[storage(read, write)]
    fn set(price: u64) {
        storage.ask_map.set(price);
    }
    #[storage(read, write)]
    fn unset(price: u64) {
        storage.ask_map.unset(price);
    }
    #[storage(read)]
    fn min() -> Option<u64> {
        storage.ask_map.min()
    }
}
#[test]
fn test_set_once() {
    let price_1 = 100_000_000_000u64;
    let ask_abi = abi(SellBitMapTest, CONTRACT_ID);
    assert(ask_abi.min().is_none());
    ask_abi.set(price_1);
    assert(ask_abi.has(price_1));
    assert(ask_abi.min().unwrap() == price_1);
}
#[test]
fn test_set_zero() {
    let price_1 = 0u64;
    let ask_abi = abi(SellBitMapTest, CONTRACT_ID);
    assert(ask_abi.min().is_none());
    ask_abi.set(price_1);
    assert(ask_abi.has(price_1));
    assert(ask_abi.min().unwrap() == price_1);
}
#[test]
fn test_set_max() {
    let price_1 = u64::max();
    let ask_abi = abi(SellBitMapTest, CONTRACT_ID);
    assert(ask_abi.min().is_none());
    ask_abi.set(price_1);
    assert(ask_abi.has(price_1));
    assert(ask_abi.min().unwrap() == price_1);
}
#[test]
fn test_set_twice() {
    let price_1 = 100_000_000_000u64;
    let ask_abi = abi(SellBitMapTest, CONTRACT_ID);
    assert(ask_abi.min().is_none());
    ask_abi.set(price_1);
    assert(ask_abi.has(price_1));
    assert(ask_abi.min().unwrap() == price_1);
    ask_abi.set(price_1);
    assert(ask_abi.has(price_1));
    assert(ask_abi.min().unwrap() == price_1);
}
#[test]
fn test_set_two() {
    let price_1 = 100_000_000_000u64;
    let price_2 = 99_000_000_000u64;
    let ask_abi = abi(SellBitMapTest, CONTRACT_ID);
    ask_abi.set(price_1);
    assert(ask_abi.has(price_1));
    assert(ask_abi.min().unwrap() == price_1);
    ask_abi.set(price_2);
    assert(ask_abi.has(price_1));
    assert(ask_abi.has(price_2));
    assert(ask_abi.min().unwrap() == price_2);
}
#[test]
fn test_set_many() {
    let price_1 = 100_000_000u64;
    let price_2 = 99_000_000u64;
    let price_3 = 101_000_000u64;
    let price_4 = 98_000_000u64;
    let price_5 = 102_000_000u64;
    let price_6 = 97_000_000u64;
    let price_7 = 103_000_000u64;
    let ask_abi = abi(SellBitMapTest, CONTRACT_ID);
    assert(ask_abi.min().is_none());
    ask_abi.set(price_1);
    assert(ask_abi.has(price_1));
    assert(ask_abi.min().unwrap() == price_1);
    ask_abi.set(price_2);
    assert(ask_abi.has(price_1));
    assert(ask_abi.has(price_2));
    assert(ask_abi.min().unwrap() == price_2);
    ask_abi.set(price_3);
    assert(ask_abi.has(price_1));
    assert(ask_abi.has(price_2));
    assert(ask_abi.has(price_3));
    assert(ask_abi.min().unwrap() == price_2);
    ask_abi.set(price_4);
    assert(ask_abi.has(price_1));
    assert(ask_abi.has(price_2));
    assert(ask_abi.has(price_3));
    assert(ask_abi.has(price_4));
    assert(ask_abi.min().unwrap() == price_4);
    ask_abi.set(price_5);
    assert(ask_abi.has(price_1));
    assert(ask_abi.has(price_2));
    assert(ask_abi.has(price_3));
    assert(ask_abi.has(price_4));
    assert(ask_abi.has(price_5));
    assert(ask_abi.min().unwrap() == price_4);
    ask_abi.set(price_6);
    assert(ask_abi.has(price_1));
    assert(ask_abi.has(price_2));
    assert(ask_abi.has(price_3));
    assert(ask_abi.has(price_4));
    assert(ask_abi.has(price_5));
    assert(ask_abi.has(price_6));
    assert(ask_abi.min().unwrap() == price_6);
    ask_abi.set(price_7);
    assert(ask_abi.has(price_1));
    assert(ask_abi.has(price_2));
    assert(ask_abi.has(price_3));
    assert(ask_abi.has(price_4));
    assert(ask_abi.has(price_5));
    assert(ask_abi.has(price_6));
    assert(ask_abi.has(price_7));
    assert(ask_abi.min().unwrap() == price_6);
}
#[test]
fn test_min_empty() {
    let ask_abi = abi(SellBitMapTest, CONTRACT_ID);
    assert(ask_abi.min().is_none());
}
#[test]
fn test_has_does_not_exist() {
    let price_1 = 100_000_000_000u64;
    let price_2 = 99_000_000_000u64;
    let ask_abi = abi(SellBitMapTest, CONTRACT_ID);
    assert(!ask_abi.has(101_000_000_000u64));
    ask_abi.set(price_1);
    assert(!ask_abi.has(101_000_000_000u64));
    ask_abi.set(price_2);
    assert(!ask_abi.has(101_000_000_000u64));
}
#[test]
fn test_unset_once() {
    let price_1 = 100_000_000_000u64;
    let ask_abi = abi(SellBitMapTest, CONTRACT_ID);
    assert(ask_abi.min().is_none());
    ask_abi.set(price_1);
    assert(ask_abi.has(price_1));
    assert(ask_abi.min().unwrap() == price_1);
    ask_abi.unset(price_1);
    assert(ask_abi.min().is_none());
    assert(!ask_abi.has(price_1));
}
#[test]
fn test_unset_on_set_twice() {
    let price_1 = 100_000_000_000u64;
    let ask_abi = abi(SellBitMapTest, CONTRACT_ID);
    assert(ask_abi.min().is_none());
    ask_abi.set(price_1);
    ask_abi.set(price_1);
    assert(ask_abi.has(price_1));
    assert(ask_abi.min().unwrap() == price_1);
    ask_abi.unset(price_1);
    assert(ask_abi.min().is_none());
    assert(!ask_abi.has(price_1));
}
#[test]
fn test_unset_min() {
    let price_1 = 100_000_000_000u64;
    let price_2 = 101_000_000_000u64;
    let ask_abi = abi(SellBitMapTest, CONTRACT_ID);
    assert(ask_abi.min().is_none());
    ask_abi.set(price_1);
    ask_abi.set(price_2);
    assert(ask_abi.has(price_1));
    assert(ask_abi.has(price_2));
    assert(ask_abi.min().unwrap() == price_1);
    ask_abi.unset(price_1);
    assert(!ask_abi.has(price_1));
    assert(ask_abi.has(price_2));
    assert(ask_abi.min().unwrap() == price_2);
}
#[test]
fn test_unset_not_min() {
    let price_1 = 100_000_000_000u64;
    let price_2 = 101_000_000_000u64;
    let ask_abi = abi(SellBitMapTest, CONTRACT_ID);
    assert(ask_abi.min().is_none());
    ask_abi.set(price_1);
    ask_abi.set(price_2);
    assert(ask_abi.has(price_1));
    assert(ask_abi.has(price_2));
    assert(ask_abi.min().unwrap() == price_1);
    ask_abi.unset(price_2);
    assert(ask_abi.has(price_1));
    assert(!ask_abi.has(price_2));
    assert(ask_abi.min().unwrap() == price_1);
}
#[test]
fn test_unset_many() {
    let price_1 = 100_000_000_000u64;
    let price_2 = 99_000_000_000u64;
    let price_3 = 101_000_000_000u64;
    let price_4 = 98_000_000_000u64;
    let price_5 = 102_000_000_000u64;
    let price_6 = 97_000_000_000u64;
    let price_7 = 103_000_000_000u64;
    let ask_abi = abi(SellBitMapTest, CONTRACT_ID);
    ask_abi.set(price_1);
    ask_abi.set(price_2);
    ask_abi.set(price_3);
    ask_abi.set(price_4);
    ask_abi.set(price_5);
    ask_abi.set(price_6);
    ask_abi.set(price_7);
    assert(ask_abi.has(price_1));
    assert(ask_abi.has(price_2));
    assert(ask_abi.has(price_3));
    assert(ask_abi.has(price_4));
    assert(ask_abi.has(price_5));
    assert(ask_abi.has(price_6));
    assert(ask_abi.has(price_7));
    assert(ask_abi.min().unwrap() == price_6);
    ask_abi.unset(price_1);
    assert(!ask_abi.has(price_1));
    assert(ask_abi.has(price_2));
    assert(ask_abi.has(price_3));
    assert(ask_abi.has(price_4));
    assert(ask_abi.has(price_5));
    assert(ask_abi.has(price_6));
    assert(ask_abi.has(price_7));
    assert(ask_abi.min().unwrap() == price_6);
    ask_abi.unset(price_2);
    assert(!ask_abi.has(price_1));
    assert(!ask_abi.has(price_2));
    assert(ask_abi.has(price_3));
    assert(ask_abi.has(price_4));
    assert(ask_abi.has(price_5));
    assert(ask_abi.has(price_6));
    assert(ask_abi.has(price_7));
    assert(ask_abi.min().unwrap() == price_6);
    ask_abi.unset(price_3);
    assert(!ask_abi.has(price_1));
    assert(!ask_abi.has(price_2));
    assert(!ask_abi.has(price_3));
    assert(ask_abi.has(price_4));
    assert(ask_abi.has(price_5));
    assert(ask_abi.has(price_6));
    assert(ask_abi.has(price_7));
    assert(ask_abi.min().unwrap() == price_6);
    ask_abi.unset(price_4);
    assert(!ask_abi.has(price_1));
    assert(!ask_abi.has(price_2));
    assert(!ask_abi.has(price_3));
    assert(!ask_abi.has(price_4));
    assert(ask_abi.has(price_5));
    assert(ask_abi.has(price_6));
    assert(ask_abi.has(price_7));
    assert(ask_abi.min().unwrap() == price_6);
    ask_abi.unset(price_5);
    assert(!ask_abi.has(price_1));
    assert(!ask_abi.has(price_2));
    assert(!ask_abi.has(price_3));
    assert(!ask_abi.has(price_4));
    assert(!ask_abi.has(price_5));
    assert(ask_abi.has(price_6));
    assert(ask_abi.has(price_7));
    assert(ask_abi.min().unwrap() == price_6);
    ask_abi.unset(price_6);
    assert(!ask_abi.has(price_1));
    assert(!ask_abi.has(price_2));
    assert(!ask_abi.has(price_3));
    assert(!ask_abi.has(price_4));
    assert(!ask_abi.has(price_5));
    assert(!ask_abi.has(price_6));
    assert(ask_abi.has(price_7));
    assert(ask_abi.min().unwrap() == price_7);
    ask_abi.unset(price_7);
    assert(!ask_abi.has(price_1));
    assert(!ask_abi.has(price_2));
    assert(!ask_abi.has(price_3));
    assert(!ask_abi.has(price_4));
    assert(!ask_abi.has(price_5));
    assert(!ask_abi.has(price_6));
    assert(!ask_abi.has(price_7));
    assert(ask_abi.min().is_none());
}
#[test]
fn test_unset_empty() {
    let ask_abi = abi(SellBitMapTest, CONTRACT_ID);
    assert(!ask_abi.has(100_000_000_000u64));
    ask_abi.unset(100_000_000_000u64);
    assert(ask_abi.min().is_none());
    assert(!ask_abi.has(100_000_000_000u64));
}
#[test]
fn test_unset_does_not_exist() {
    let price_1 = 100_000_000_000u64;
    let price_2 = 102_000_000_000u64;
    let ask_abi = abi(SellBitMapTest, CONTRACT_ID);
    assert(!ask_abi.has(101_000_000_000u64));
    assert(!ask_abi.has(price_1));
    assert(!ask_abi.has(price_2));
    ask_abi.unset(101_000_000_000u64);
    assert(!ask_abi.has(101_000_000_000u64));
    assert(!ask_abi.has(price_1));
    assert(!ask_abi.has(price_2));
    ask_abi.set(price_1);
    assert(!ask_abi.has(101_000_000_000u64));
    assert(ask_abi.has(price_1));
    assert(!ask_abi.has(price_2));
    ask_abi.unset(101_000_000_000u64);
    assert(!ask_abi.has(101_000_000_000u64));
    assert(ask_abi.has(price_1));
    assert(!ask_abi.has(price_2));
    ask_abi.set(price_2);
    assert(!ask_abi.has(101_000_000_000u64));
    assert(ask_abi.has(price_1));
    assert(ask_abi.has(price_2));
    ask_abi.unset(101_000_000_000u64);
    assert(!ask_abi.has(101_000_000_000u64));
    assert(ask_abi.has(price_1));
    assert(ask_abi.has(price_2));
}
