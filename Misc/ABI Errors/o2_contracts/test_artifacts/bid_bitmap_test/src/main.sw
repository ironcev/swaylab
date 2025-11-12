contract;

use contract_libs::bitmap::*;
abi BuyBitMapTest {
    #[storage(read)]
    fn has(price: u64) -> bool;
    #[storage(read, write)]
    fn set(price: u64);
    #[storage(read, write)]
    fn unset(price: u64);
    #[storage(read)]
    fn max() -> Option<u64>;
}
storage {
    bid_map: BuyBitMap = BuyBitMap {},
}
impl BuyBitMapTest for Contract {
    #[storage(read)]
    fn has(price: u64) -> bool {
        storage.bid_map.has(price)
    }
    #[storage(read, write)]
    fn set(price: u64) {
        storage.bid_map.set(price);
    }
    #[storage(read, write)]
    fn unset(price: u64) {
        storage.bid_map.unset(price);
    }
    #[storage(read)]
    fn max() -> Option<u64> {
        storage.bid_map.max()
    }
}
#[test]
fn test_set_once() {
    let price_1 = 100u64;
    let bid_abi = abi(BuyBitMapTest, CONTRACT_ID);
    assert(bid_abi.max().is_none());
    bid_abi.set(price_1);
    assert(bid_abi.has(price_1));
    assert(bid_abi.max().unwrap() == price_1);
}
#[test]
fn test_set_zero() {
    let price_1 = 0u64;
    let bid_abi = abi(BuyBitMapTest, CONTRACT_ID);
    assert(bid_abi.max().is_none());
    bid_abi.set(price_1);
    assert(bid_abi.has(price_1));
    assert(bid_abi.max().unwrap() == price_1);
}
#[test]
fn test_set_max() {
    let price_1 = u64::max();
    let bid_abi = abi(BuyBitMapTest, CONTRACT_ID);
    assert(bid_abi.max().is_none());
    bid_abi.set(price_1);
    assert(bid_abi.has(price_1));
    assert(bid_abi.max().unwrap() == price_1);
}
#[test]
fn test_set_twice() {
    let price_1 = 100u64;
    let bid_abi = abi(BuyBitMapTest, CONTRACT_ID);
    assert(bid_abi.max().is_none());
    bid_abi.set(price_1);
    assert(bid_abi.has(price_1));
    assert(bid_abi.max().unwrap() == price_1);
    bid_abi.set(price_1);
    assert(bid_abi.has(price_1));
    assert(bid_abi.max().unwrap() == price_1);
}
#[test]
fn test_set_two() {
    let price_1 = 100u64;
    let price_2 = 99u64;
    let bid_abi = abi(BuyBitMapTest, CONTRACT_ID);
    assert(bid_abi.max().is_none());
    bid_abi.set(price_1);
    assert(bid_abi.has(price_1));
    assert(bid_abi.max().unwrap() == price_1);
    bid_abi.set(price_2);
    assert(bid_abi.has(price_1));
    assert(bid_abi.has(price_2));
    assert(bid_abi.max().unwrap() == price_1);
}
#[test]
fn test_set_many() {
    let price_1 = 100u64;
    let price_2 = 99u64;
    let price_3 = 101u64;
    let price_4 = 98u64;
    let price_5 = 102u64;
    let price_6 = 97u64;
    let price_7 = 103u64;
    let bid_abi = abi(BuyBitMapTest, CONTRACT_ID);
    assert(bid_abi.max().is_none());
    bid_abi.set(price_1);
    assert(bid_abi.has(price_1));
    assert(bid_abi.max().unwrap() == price_1);
    bid_abi.set(price_2);
    assert(bid_abi.has(price_1));
    assert(bid_abi.has(price_2));
    assert(bid_abi.max().unwrap() == price_1);
    bid_abi.set(price_3);
    assert(bid_abi.has(price_1));
    assert(bid_abi.has(price_2));
    assert(bid_abi.has(price_3));
    assert(bid_abi.max().unwrap() == price_3);
    bid_abi.set(price_4);
    assert(bid_abi.has(price_1));
    assert(bid_abi.has(price_2));
    assert(bid_abi.has(price_3));
    assert(bid_abi.has(price_4));
    assert(bid_abi.max().unwrap() == price_3);
    bid_abi.set(price_5);
    assert(bid_abi.has(price_1));
    assert(bid_abi.has(price_2));
    assert(bid_abi.has(price_3));
    assert(bid_abi.has(price_4));
    assert(bid_abi.has(price_5));
    assert(bid_abi.max().unwrap() == price_5);
    bid_abi.set(price_6);
    assert(bid_abi.has(price_1));
    assert(bid_abi.has(price_2));
    assert(bid_abi.has(price_3));
    assert(bid_abi.has(price_4));
    assert(bid_abi.has(price_5));
    assert(bid_abi.has(price_6));
    assert(bid_abi.max().unwrap() == price_5);
    bid_abi.set(price_7);
    assert(bid_abi.has(price_1));
    assert(bid_abi.has(price_2));
    assert(bid_abi.has(price_3));
    assert(bid_abi.has(price_4));
    assert(bid_abi.has(price_5));
    assert(bid_abi.has(price_6));
    assert(bid_abi.has(price_7));
    assert(bid_abi.max().unwrap() == price_7);
}
#[test]
fn test_min_empty() {
    let bid_abi = abi(BuyBitMapTest, CONTRACT_ID);
    assert(bid_abi.max().is_none());
}
#[test]
fn test_has_does_not_exist() {
    let price_1 = 100u64;
    let price_2 = 99u64;
    let bid_abi = abi(BuyBitMapTest, CONTRACT_ID);
    assert(!bid_abi.has(101u64));
    bid_abi.set(price_1);
    assert(!bid_abi.has(101u64));
    bid_abi.set(price_2);
    assert(!bid_abi.has(101u64));
}
#[test]
fn test_unset_once() {
    let price_1 = 100u64;
    let bid_abi = abi(BuyBitMapTest, CONTRACT_ID);
    assert(bid_abi.max().is_none());
    bid_abi.set(price_1);
    assert(bid_abi.has(price_1));
    assert(bid_abi.max().unwrap() == price_1);
    bid_abi.unset(price_1);
    assert(bid_abi.max().is_none());
    assert(!bid_abi.has(price_1));
}
#[test]
fn test_unset_on_set_twice() {
    let price_1 = 100u64;
    let bid_abi = abi(BuyBitMapTest, CONTRACT_ID);
    assert(bid_abi.max().is_none());
    bid_abi.set(price_1);
    bid_abi.set(price_1);
    assert(bid_abi.has(price_1));
    assert(bid_abi.max().unwrap() == price_1);
    bid_abi.unset(price_1);
    assert(bid_abi.max().is_none());
    assert(!bid_abi.has(price_1));
}
#[test]
fn test_unset_max() {
    let price_1 = 100u64;
    let price_2 = 101u64;
    let bid_abi = abi(BuyBitMapTest, CONTRACT_ID);
    assert(bid_abi.max().is_none());
    bid_abi.set(price_1);
    bid_abi.set(price_2);
    assert(bid_abi.has(price_1));
    assert(bid_abi.has(price_2));
    assert(bid_abi.max().unwrap() == price_2);
    bid_abi.unset(price_2);
    assert(bid_abi.has(price_1));
    assert(!bid_abi.has(price_2));
    assert(bid_abi.max().unwrap() == price_1);
}
#[test]
fn test_unset_not_max() {
    let price_1 = 100u64;
    let price_2 = 101u64;
    let bid_abi = abi(BuyBitMapTest, CONTRACT_ID);
    assert(bid_abi.max().is_none());
    bid_abi.set(price_1);
    bid_abi.set(price_2);
    assert(bid_abi.has(price_1));
    assert(bid_abi.has(price_2));
    assert(bid_abi.max().unwrap() == price_2);
    bid_abi.unset(price_1);
    assert(!bid_abi.has(price_1));
    assert(bid_abi.has(price_2));
    assert(bid_abi.max().unwrap() == price_2);
}
#[test]
fn test_unset_many() {
    let price_1 = 100u64;
    let price_2 = 99u64;
    let price_3 = 101u64;
    let price_4 = 98u64;
    let price_5 = 102u64;
    let price_6 = 97u64;
    let price_7 = 103u64;
    let bid_abi = abi(BuyBitMapTest, CONTRACT_ID);
    bid_abi.set(price_1);
    bid_abi.set(price_2);
    bid_abi.set(price_3);
    bid_abi.set(price_4);
    bid_abi.set(price_5);
    bid_abi.set(price_6);
    bid_abi.set(price_7);
    assert(bid_abi.has(price_1));
    assert(bid_abi.has(price_2));
    assert(bid_abi.has(price_3));
    assert(bid_abi.has(price_4));
    assert(bid_abi.has(price_5));
    assert(bid_abi.has(price_6));
    assert(bid_abi.has(price_7));
    assert(bid_abi.max().unwrap() == price_7);
    bid_abi.unset(price_1);
    assert(!bid_abi.has(price_1));
    assert(bid_abi.has(price_2));
    assert(bid_abi.has(price_3));
    assert(bid_abi.has(price_4));
    assert(bid_abi.has(price_5));
    assert(bid_abi.has(price_6));
    assert(bid_abi.has(price_7));
    assert(bid_abi.max().unwrap() == price_7);
    bid_abi.unset(price_2);
    assert(!bid_abi.has(price_1));
    assert(!bid_abi.has(price_2));
    assert(bid_abi.has(price_3));
    assert(bid_abi.has(price_4));
    assert(bid_abi.has(price_5));
    assert(bid_abi.has(price_6));
    assert(bid_abi.has(price_7));
    assert(bid_abi.max().unwrap() == price_7);
    bid_abi.unset(price_3);
    assert(!bid_abi.has(price_1));
    assert(!bid_abi.has(price_2));
    assert(!bid_abi.has(price_3));
    assert(bid_abi.has(price_4));
    assert(bid_abi.has(price_5));
    assert(bid_abi.has(price_6));
    assert(bid_abi.has(price_7));
    assert(bid_abi.max().unwrap() == price_7);
    bid_abi.unset(price_4);
    assert(!bid_abi.has(price_1));
    assert(!bid_abi.has(price_2));
    assert(!bid_abi.has(price_3));
    assert(!bid_abi.has(price_4));
    assert(bid_abi.has(price_5));
    assert(bid_abi.has(price_6));
    assert(bid_abi.has(price_7));
    assert(bid_abi.max().unwrap() == price_7);
    bid_abi.unset(price_5);
    assert(!bid_abi.has(price_1));
    assert(!bid_abi.has(price_2));
    assert(!bid_abi.has(price_3));
    assert(!bid_abi.has(price_4));
    assert(!bid_abi.has(price_5));
    assert(bid_abi.has(price_6));
    assert(bid_abi.has(price_7));
    assert(bid_abi.max().unwrap() == price_7);
    bid_abi.unset(price_6);
    assert(!bid_abi.has(price_1));
    assert(!bid_abi.has(price_2));
    assert(!bid_abi.has(price_3));
    assert(!bid_abi.has(price_4));
    assert(!bid_abi.has(price_5));
    assert(!bid_abi.has(price_6));
    assert(bid_abi.has(price_7));
    assert(bid_abi.max().unwrap() == price_7);
    bid_abi.unset(price_7);
    assert(!bid_abi.has(price_1));
    assert(!bid_abi.has(price_2));
    assert(!bid_abi.has(price_3));
    assert(!bid_abi.has(price_4));
    assert(!bid_abi.has(price_5));
    assert(!bid_abi.has(price_6));
    assert(!bid_abi.has(price_7));
    assert(bid_abi.max().is_none());
}
#[test]
fn test_unset_empty() {
    let bid_abi = abi(BuyBitMapTest, CONTRACT_ID);
    assert(!bid_abi.has(100u64));
    bid_abi.unset(100u64);
    assert(bid_abi.max().is_none());
    assert(!bid_abi.has(100u64));
}
#[test]
fn test_unset_does_not_exist() {
    let price_1 = 100u64;
    let price_2 = 102u64;
    let bid_abi = abi(BuyBitMapTest, CONTRACT_ID);
    assert(!bid_abi.has(101u64));
    assert(!bid_abi.has(price_1));
    assert(!bid_abi.has(price_2));
    bid_abi.unset(101u64);
    assert(!bid_abi.has(101u64));
    assert(!bid_abi.has(price_1));
    assert(!bid_abi.has(price_2));
    bid_abi.set(price_1);
    assert(!bid_abi.has(101u64));
    assert(bid_abi.has(price_1));
    assert(!bid_abi.has(price_2));
    bid_abi.unset(101u64);
    assert(!bid_abi.has(101u64));
    assert(bid_abi.has(price_1));
    assert(!bid_abi.has(price_2));
    bid_abi.set(price_2);
    assert(!bid_abi.has(101u64));
    assert(bid_abi.has(price_1));
    assert(bid_abi.has(price_2));
    bid_abi.unset(101u64);
    assert(!bid_abi.has(101u64));
    assert(bid_abi.has(price_1));
    assert(bid_abi.has(price_2));
}
