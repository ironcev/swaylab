contract;

use contract_libs::heap::*;
abi MinHeapTest {
    #[storage(read)]
    fn len() -> u64;
    #[storage(read)]
    fn is_empty() -> bool;
    #[storage(read, write)]
    fn push(value: u64);
    #[storage(read, write)]
    fn pop() -> Option<u64>;
    #[storage(read, write)]
    fn remove(val: u64) -> bool;
    #[storage(read)]
    fn peek() -> Option<u64>;
}
storage {
    min_heap: MinHeap<u64> = MinHeap {},
}
impl MinHeapTest for Contract {
    #[storage(read)]
    fn len() -> u64 {
        storage.min_heap.len()
    }
    #[storage(read)]
    fn is_empty() -> bool {
        storage.min_heap.is_empty()
    }
    #[storage(read, write)]
    fn push(value: u64) {
        storage.min_heap.push(value);
    }
    #[storage(read, write)]
    fn pop() -> Option<u64> {
        storage.min_heap.pop()
    }
    #[storage(read, write)]
    fn remove(val: u64) -> bool {
        storage.min_heap.remove(val)
    }
    #[storage(read)]
    fn peek() -> Option<u64> {
        storage.min_heap.peek()
    }
}
#[test]
fn test_push_once() {
    let price_1 = 100_000_000_000u64;
    let min_abi = abi(MinHeapTest, CONTRACT_ID);
    assert(min_abi.peek().is_none());
    assert(min_abi.is_empty());
    assert(min_abi.len() == 0);
    min_abi.push(price_1);
    assert(min_abi.peek().unwrap() == price_1);
    assert(!min_abi.is_empty());
    assert(min_abi.len() == 1);
}
#[test]
fn test_push_twice() {
    let price_1 = 100_000_000_000u64;
    let min_abi = abi(MinHeapTest, CONTRACT_ID);
    assert(min_abi.peek().is_none());
    assert(min_abi.is_empty());
    assert(min_abi.len() == 0);
    min_abi.push(price_1);
    assert(min_abi.peek().unwrap() == price_1);
    assert(!min_abi.is_empty());
    assert(min_abi.len() == 1);
    min_abi.push(price_1);
    assert(min_abi.peek().unwrap() == price_1);
    assert(!min_abi.is_empty());
    assert(min_abi.len() == 2);
}
#[test]
fn test_push_below() {
    let price_1 = 100_000_000_000u64;
    let price_2 = 99_000_000_000u64;
    let min_abi = abi(MinHeapTest, CONTRACT_ID);
    min_abi.push(price_1);
    assert(min_abi.peek().unwrap() == price_1);
    assert(!min_abi.is_empty());
    assert(min_abi.len() == 1);
    min_abi.push(price_2);
    assert(min_abi.peek().unwrap() == price_2);
    assert(min_abi.len() == 2);
    assert(!min_abi.is_empty());
}
#[test]
fn test_push_below_and_above() {
    let price_1 = 100_000_000_000u64;
    let price_2 = 99_000_000_000u64;
    let price_3 = 101_000_000_000u64;
    let min_abi = abi(MinHeapTest, CONTRACT_ID);
    min_abi.push(price_1);
    assert(min_abi.len() == 1);
    assert(min_abi.peek().unwrap() == price_1);
    assert(!min_abi.is_empty());
    min_abi.push(price_2);
    assert(min_abi.len() == 2);
    assert(min_abi.peek().unwrap() == price_2);
    assert(!min_abi.is_empty());
    min_abi.push(price_3);
    assert(min_abi.len() == 3);
    assert(min_abi.peek().unwrap() == price_2);
    assert(!min_abi.is_empty());
}
#[test]
fn test_push_many() {
    let price_1 = 100_000_000_000u64;
    let price_2 = 99_000_000_000u64;
    let price_3 = 101_000_000_000u64;
    let price_4 = 98_000_000_000u64;
    let price_5 = 102_000_000_000u64;
    let price_6 = 97_000_000_000u64;
    let price_7 = 103_000_000_000u64;
    let min_abi = abi(MinHeapTest, CONTRACT_ID);
    min_abi.push(price_1);
    assert(min_abi.peek().unwrap() == price_1);
    min_abi.push(price_2);
    assert(min_abi.len() == 2);
    assert(min_abi.peek().unwrap() == price_2);
    min_abi.push(price_3);
    assert(min_abi.len() == 3);
    assert(min_abi.peek().unwrap() == price_2);
    min_abi.push(price_4);
    assert(min_abi.len() == 4);
    assert(min_abi.peek().unwrap() == price_4);
    min_abi.push(price_5);
    assert(min_abi.len() == 5);
    assert(min_abi.peek().unwrap() == price_4);
    min_abi.push(price_6);
    assert(min_abi.len() == 6);
    assert(min_abi.peek().unwrap() == price_6);
    min_abi.push(price_7);
    assert(min_abi.len() == 7);
    assert(min_abi.peek().unwrap() == price_6);
}
#[test]
fn test_peek_empty() {
    let min_abi = abi(MinHeapTest, CONTRACT_ID);
    assert(min_abi.peek().is_none());
}
#[test]
fn test_pop_once() {
    let price_1 = 100_000_000_000u64;
    let min_abi = abi(MinHeapTest, CONTRACT_ID);
    assert(min_abi.peek().is_none());
    min_abi.push(price_1);
    assert(min_abi.peek().unwrap() == price_1);
    assert(!min_abi.is_empty());
    let res = min_abi.pop();
    assert(res.is_some());
    assert(res.unwrap() == price_1);
    assert(min_abi.len() == 0);
    assert(min_abi.is_empty());
}
#[test]
fn test_pop_many() {
    let price_1 = 100_000_000_000u64;
    let price_2 = 99_000_000_000u64;
    let price_3 = 101_000_000_000u64;
    let price_4 = 98_000_000_000u64;
    let price_5 = 102_000_000_000u64;
    let price_6 = 97_000_000_000u64;
    let price_7 = 103_000_000_000u64;
    let min_abi = abi(MinHeapTest, CONTRACT_ID);
    min_abi.push(price_1);
    min_abi.push(price_2);
    min_abi.push(price_3);
    min_abi.push(price_4);
    min_abi.push(price_5);
    min_abi.push(price_6);
    min_abi.push(price_7);
    let res_1 = min_abi.pop().unwrap();
    assert(res_1 == price_6);
    assert(min_abi.len() == 6);
    assert(!min_abi.is_empty());
    let res_2 = min_abi.pop().unwrap();
    assert(res_2 == price_4);
    assert(min_abi.len() == 5);
    assert(!min_abi.is_empty());
    let res_3 = min_abi.pop().unwrap();
    assert(res_3 == price_2);
    assert(min_abi.len() == 4);
    assert(!min_abi.is_empty());
    let res_4 = min_abi.pop().unwrap();
    assert(res_4 == price_1);
    assert(min_abi.len() == 3);
    assert(!min_abi.is_empty());
    let res_5 = min_abi.pop().unwrap();
    assert(res_5 == price_3);
    assert(min_abi.len() == 2);
    assert(!min_abi.is_empty());
    let res_6 = min_abi.pop().unwrap();
    assert(res_6 == price_5);
    assert(min_abi.len() == 1);
    assert(!min_abi.is_empty());
    let res_7 = min_abi.pop().unwrap();
    assert(res_7 == price_7);
    assert(min_abi.len() == 0);
    assert(min_abi.is_empty());
}
#[test]
fn test_pop_empty() {
    let min_abi = abi(MinHeapTest, CONTRACT_ID);
    assert(min_abi.pop().is_none());
}
#[test]
fn test_remove_once() {
    let price_1 = 100_000_000_000u64;
    let min_abi = abi(MinHeapTest, CONTRACT_ID);
    min_abi.push(price_1);
    assert(min_abi.peek().unwrap() == price_1);
    assert(!min_abi.is_empty());
    assert(min_abi.remove(price_1));
    assert(min_abi.len() == 0);
    assert(min_abi.is_empty());
}
#[test]
fn test_remove_below_after_push_above() {
    let price_1 = 100_000_000_000u64;
    let price_2 = 101_000_000_000u64;
    let min_abi = abi(MinHeapTest, CONTRACT_ID);
    min_abi.push(price_1);
    min_abi.push(price_2);
    assert(min_abi.peek().unwrap() == price_1);
    assert(!min_abi.is_empty());
    assert(min_abi.remove(price_1));
    assert(min_abi.len() == 1);
    assert(!min_abi.is_empty());
    assert(min_abi.peek().unwrap() == price_2);
}
#[test]
fn test_remove_below_after_push_below() {
    let price_1 = 100_000_000_000u64;
    let price_2 = 99_000_000_000u64;
    let min_abi = abi(MinHeapTest, CONTRACT_ID);
    min_abi.push(price_1);
    min_abi.push(price_2);
    assert(min_abi.peek().unwrap() == price_2);
    assert(!min_abi.is_empty());
    assert(min_abi.remove(price_2));
    assert(min_abi.len() == 1);
    assert(!min_abi.is_empty());
    assert(min_abi.peek().unwrap() == price_1);
}
#[test]
fn test_remove_above_after_push_below() {
    let price_1 = 100_000_000_000u64;
    let price_2 = 99_000_000_000u64;
    let min_abi = abi(MinHeapTest, CONTRACT_ID);
    min_abi.push(price_1);
    min_abi.push(price_2);
    assert(min_abi.peek().unwrap() == price_2);
    assert(!min_abi.is_empty());
    assert(min_abi.remove(price_2));
    assert(min_abi.len() == 1);
    assert(!min_abi.is_empty());
    assert(min_abi.peek().unwrap() == price_1);
}
#[test]
fn test_remove_above_after_push_above() {
    let price_1 = 100_000_000_000u64;
    let price_2 = 101_000_000_000u64;
    let min_abi = abi(MinHeapTest, CONTRACT_ID);
    min_abi.push(price_1);
    min_abi.push(price_2);
    assert(min_abi.peek().unwrap() == price_1);
    assert(!min_abi.is_empty());
    assert(min_abi.remove(price_1));
    assert(min_abi.len() == 1);
    assert(!min_abi.is_empty());
    assert(min_abi.peek().unwrap() == price_2);
}
#[test]
fn test_remove_many() {
    let price_1 = 100_000_000_000u64;
    let price_2 = 99_000_000_000u64;
    let price_3 = 101_000_000_000u64;
    let price_4 = 98_000_000_000u64;
    let price_5 = 102_000_000_000u64;
    let price_6 = 97_000_000_000u64;
    let price_7 = 103_000_000_000u64;
    let min_abi = abi(MinHeapTest, CONTRACT_ID);
    min_abi.push(price_1);
    min_abi.push(price_2);
    min_abi.push(price_3);
    min_abi.push(price_4);
    min_abi.push(price_5);
    min_abi.push(price_6);
    min_abi.push(price_7);
    assert(min_abi.remove(price_1));
    assert(min_abi.len() == 6);
    assert(!min_abi.is_empty());
    assert(min_abi.peek().unwrap() == price_6);
    assert(min_abi.remove(price_2));
    assert(min_abi.len() == 5);
    assert(!min_abi.is_empty());
    assert(min_abi.peek().unwrap() == price_6);
    assert(min_abi.remove(price_3));
    assert(min_abi.len() == 4);
    assert(!min_abi.is_empty());
    assert(min_abi.peek().unwrap() == price_6);
    assert(min_abi.remove(price_4));
    assert(min_abi.len() == 3);
    assert(!min_abi.is_empty());
    assert(min_abi.peek().unwrap() == price_6);
    assert(min_abi.remove(price_5));
    assert(min_abi.len() == 2);
    assert(!min_abi.is_empty());
    assert(min_abi.peek().unwrap() == price_6);
    assert(min_abi.remove(price_6));
    assert(min_abi.len() == 1);
    assert(!min_abi.is_empty());
    assert(min_abi.peek().unwrap() == price_7);
    assert(min_abi.remove(price_7));
    assert(min_abi.len() == 0);
    assert(min_abi.is_empty());
}
#[test]
fn test_remove_empty() {
    let min_abi = abi(MinHeapTest, CONTRACT_ID);
    assert(!min_abi.remove(0u64));
}
#[test]
fn test_remove_does_not_exist() {
    let price_1 = 100_000_000_000u64;
    let price_2 = 102_000_000_000u64;
    let min_abi = abi(MinHeapTest, CONTRACT_ID);
    assert(!min_abi.remove(101_000_000_000u64));
    min_abi.push(price_1);
    assert(!min_abi.remove(101_000_000_000u64));
    min_abi.push(price_2);
    assert(!min_abi.remove(101_000_000_000u64));
}
