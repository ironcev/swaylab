contract;

use contract_libs::heap::*;
abi MaxHeapTest {
    #[storage(read)]
    fn len() -> u64;
    #[storage(read)]
    fn is_empty() -> bool;
    #[storage(read, write)]
    fn push(value: u8);
    #[storage(read, write)]
    fn pop() -> Option<u8>;
    #[storage(read, write)]
    fn remove(val: u8) -> bool;
    #[storage(read)]
    fn peek() -> Option<u8>;
}
storage {
    max_heap: MaxHeap<u8> = MaxHeap {},
}
impl MaxHeapTest for Contract {
    #[storage(read)]
    fn len() -> u64 {
        storage.max_heap.len()
    }
    #[storage(read)]
    fn is_empty() -> bool {
        storage.max_heap.is_empty()
    }
    #[storage(read, write)]
    fn push(value: u8) {
        storage.max_heap.push(value);
    }
    #[storage(read, write)]
    fn pop() -> Option<u8> {
        storage.max_heap.pop()
    }
    #[storage(read, write)]
    fn remove(val: u8) -> bool {
        storage.max_heap.remove(val)
    }
    #[storage(read)]
    fn peek() -> Option<u8> {
        storage.max_heap.peek()
    }
}
#[test]
fn test_push_once() {
    let price_1 = 100u8;
    let max_abi = abi(MaxHeapTest, CONTRACT_ID);
    assert(max_abi.peek().is_none());
    assert(max_abi.is_empty());
    assert(max_abi.len() == 0);
    max_abi.push(price_1);
    assert(max_abi.peek().unwrap() == price_1);
    assert(!max_abi.is_empty());
    assert(max_abi.len() == 1);
}
#[test]
fn test_push_twice() {
    let price_1 = 100u8;
    let max_abi = abi(MaxHeapTest, CONTRACT_ID);
    assert(max_abi.peek().is_none());
    assert(max_abi.is_empty());
    assert(max_abi.len() == 0);
    max_abi.push(price_1);
    assert(max_abi.peek().unwrap() == price_1);
    assert(!max_abi.is_empty());
    assert(max_abi.len() == 1);
    max_abi.push(price_1);
    assert(max_abi.peek().unwrap() == price_1);
    assert(!max_abi.is_empty());
    assert(max_abi.len() == 2);
}
#[test]
fn test_push_below() {
    let price_1 = 100u8;
    let price_2 = 99u8;
    let max_abi = abi(MaxHeapTest, CONTRACT_ID);
    max_abi.push(price_1);
    assert(max_abi.peek().unwrap() == price_1);
    assert(!max_abi.is_empty());
    assert(max_abi.len() == 1);
    max_abi.push(price_2);
    assert(max_abi.peek().unwrap() == price_1);
    assert(max_abi.len() == 2);
    assert(!max_abi.is_empty());
}
#[test]
fn test_push_below_and_above() {
    let price_1 = 100u8;
    let price_2 = 99u8;
    let price_3 = 101u8;
    let max_abi = abi(MaxHeapTest, CONTRACT_ID);
    max_abi.push(price_1);
    assert(max_abi.len() == 1);
    assert(max_abi.peek().unwrap() == price_1);
    assert(!max_abi.is_empty());
    max_abi.push(price_2);
    assert(max_abi.len() == 2);
    assert(max_abi.peek().unwrap() == price_1);
    assert(!max_abi.is_empty());
    max_abi.push(price_3);
    assert(max_abi.len() == 3);
    assert(max_abi.peek().unwrap() == price_3);
    assert(!max_abi.is_empty());
}
#[test]
fn test_push_many() {
    let price_1 = 100u8;
    let price_2 = 99u8;
    let price_3 = 101u8;
    let price_4 = 98u8;
    let price_5 = 102u8;
    let price_6 = 97u8;
    let price_7 = 103u8;
    let max_abi = abi(MaxHeapTest, CONTRACT_ID);
    max_abi.push(price_1);
    assert(max_abi.peek().unwrap() == price_1);
    max_abi.push(price_2);
    assert(max_abi.len() == 2);
    assert(max_abi.peek().unwrap() == price_1);
    max_abi.push(price_3);
    assert(max_abi.len() == 3);
    assert(max_abi.peek().unwrap() == price_3);
    max_abi.push(price_4);
    assert(max_abi.len() == 4);
    assert(max_abi.peek().unwrap() == price_3);
    max_abi.push(price_5);
    assert(max_abi.len() == 5);
    assert(max_abi.peek().unwrap() == price_5);
    max_abi.push(price_6);
    assert(max_abi.len() == 6);
    assert(max_abi.peek().unwrap() == price_5);
    max_abi.push(price_7);
    assert(max_abi.len() == 7);
    assert(max_abi.peek().unwrap() == price_7);
}
#[test]
fn test_peek_empty() {
    let max_abi = abi(MaxHeapTest, CONTRACT_ID);
    assert(max_abi.peek().is_none());
}
#[test]
fn test_pop_once() {
    let price_1 = 100u8;
    let max_abi = abi(MaxHeapTest, CONTRACT_ID);
    assert(max_abi.peek().is_none());
    max_abi.push(price_1);
    assert(max_abi.peek().unwrap() == price_1);
    assert(!max_abi.is_empty());
    let res = max_abi.pop();
    assert(res.is_some());
    assert(res.unwrap() == price_1);
    assert(max_abi.len() == 0);
    assert(max_abi.is_empty());
}
#[test]
fn test_pop_many() {
    let price_1 = 100u8;
    let price_2 = 99u8;
    let price_3 = 101u8;
    let price_4 = 98u8;
    let price_5 = 102u8;
    let price_6 = 97u8;
    let price_7 = 103u8;
    let max_abi = abi(MaxHeapTest, CONTRACT_ID);
    max_abi.push(price_1);
    max_abi.push(price_2);
    max_abi.push(price_3);
    max_abi.push(price_4);
    max_abi.push(price_5);
    max_abi.push(price_6);
    max_abi.push(price_7);
    let res_1 = max_abi.pop().unwrap();
    assert(res_1 == price_7);
    assert(max_abi.len() == 6);
    assert(!max_abi.is_empty());
    let res_2 = max_abi.pop().unwrap();
    assert(res_2 == price_5);
    assert(max_abi.len() == 5);
    assert(!max_abi.is_empty());
    let res_3 = max_abi.pop().unwrap();
    assert(res_3 == price_3);
    assert(max_abi.len() == 4);
    assert(!max_abi.is_empty());
    let res_4 = max_abi.pop().unwrap();
    assert(res_4 == price_1);
    assert(max_abi.len() == 3);
    assert(!max_abi.is_empty());
    let res_5 = max_abi.pop().unwrap();
    assert(res_5 == price_2);
    assert(max_abi.len() == 2);
    assert(!max_abi.is_empty());
    let res_6 = max_abi.pop().unwrap();
    assert(res_6 == price_4);
    assert(max_abi.len() == 1);
    assert(!max_abi.is_empty());
    let res_7 = max_abi.pop().unwrap();
    assert(res_7 == price_6);
    assert(max_abi.len() == 0);
    assert(max_abi.is_empty());
}
#[test]
fn test_pop_empty() {
    let max_abi = abi(MaxHeapTest, CONTRACT_ID);
    assert(max_abi.pop().is_none());
}
#[test]
fn test_remove_once() {
    let price_1 = 100u8;
    let max_abi = abi(MaxHeapTest, CONTRACT_ID);
    max_abi.push(price_1);
    assert(max_abi.peek().unwrap() == price_1);
    assert(!max_abi.is_empty());
    assert(max_abi.remove(price_1));
    assert(max_abi.len() == 0);
    assert(max_abi.is_empty());
}
#[test]
fn test_remove_below_after_push_above() {
    let price_1 = 100u8;
    let price_2 = 101u8;
    let max_abi = abi(MaxHeapTest, CONTRACT_ID);
    max_abi.push(price_1);
    max_abi.push(price_2);
    assert(max_abi.peek().unwrap() == price_2);
    assert(!max_abi.is_empty());
    assert(max_abi.remove(price_1));
    assert(max_abi.len() == 1);
    assert(!max_abi.is_empty());
    assert(max_abi.peek().unwrap() == price_2);
}
#[test]
fn test_remove_below_after_push_below() {
    let price_1 = 100u8;
    let price_2 = 99u8;
    let max_abi = abi(MaxHeapTest, CONTRACT_ID);
    max_abi.push(price_1);
    max_abi.push(price_2);
    assert(max_abi.peek().unwrap() == price_1);
    assert(!max_abi.is_empty());
    assert(max_abi.remove(price_2));
    assert(max_abi.len() == 1);
    assert(!max_abi.is_empty());
    assert(max_abi.peek().unwrap() == price_1);
}
#[test]
fn test_remove_above_after_push_below() {
    let price_1 = 100u8;
    let price_2 = 99u8;
    let max_abi = abi(MaxHeapTest, CONTRACT_ID);
    max_abi.push(price_1);
    max_abi.push(price_2);
    assert(max_abi.peek().unwrap() == price_1);
    assert(!max_abi.is_empty());
    assert(max_abi.remove(price_1));
    assert(max_abi.len() == 1);
    assert(!max_abi.is_empty());
    assert(max_abi.peek().unwrap() == price_2);
}
#[test]
fn test_remove_above_after_push_above() {
    let price_1 = 100u8;
    let price_2 = 101u8;
    let max_abi = abi(MaxHeapTest, CONTRACT_ID);
    max_abi.push(price_1);
    max_abi.push(price_2);
    assert(max_abi.peek().unwrap() == price_2);
    assert(!max_abi.is_empty());
    assert(max_abi.remove(price_2));
    assert(max_abi.len() == 1);
    assert(!max_abi.is_empty());
    assert(max_abi.peek().unwrap() == price_1);
}
#[test]
fn test_remove_many() {
    let price_1 = 100u8;
    let price_2 = 99u8;
    let price_3 = 101u8;
    let price_4 = 98u8;
    let price_5 = 102u8;
    let price_6 = 97u8;
    let price_7 = 103u8;
    let max_abi = abi(MaxHeapTest, CONTRACT_ID);
    max_abi.push(price_1);
    max_abi.push(price_2);
    max_abi.push(price_3);
    max_abi.push(price_4);
    max_abi.push(price_5);
    max_abi.push(price_6);
    max_abi.push(price_7);
    assert(max_abi.remove(price_1));
    assert(max_abi.len() == 6);
    assert(!max_abi.is_empty());
    assert(max_abi.peek().unwrap() == price_7);
    assert(max_abi.remove(price_2));
    assert(max_abi.len() == 5);
    assert(!max_abi.is_empty());
    assert(max_abi.peek().unwrap() == price_7);
    assert(max_abi.remove(price_3));
    assert(max_abi.len() == 4);
    assert(!max_abi.is_empty());
    assert(max_abi.peek().unwrap() == price_7);
    assert(max_abi.remove(price_4));
    assert(max_abi.len() == 3);
    assert(!max_abi.is_empty());
    assert(max_abi.peek().unwrap() == price_7);
    assert(max_abi.remove(price_5));
    assert(max_abi.len() == 2);
    assert(!max_abi.is_empty());
    assert(max_abi.peek().unwrap() == price_7);
    assert(max_abi.remove(price_6));
    assert(max_abi.len() == 1);
    assert(!max_abi.is_empty());
    assert(max_abi.peek().unwrap() == price_7);
    assert(max_abi.remove(price_7));
    assert(max_abi.len() == 0);
    assert(max_abi.is_empty());
}
#[test]
fn test_remove_empty() {
    let max_abi = abi(MaxHeapTest, CONTRACT_ID);
    assert(!max_abi.remove(0u8));
}
#[test]
fn test_remove_does_not_exist() {
    let price_1 = 100u8;
    let price_2 = 102u8;
    let max_abi = abi(MaxHeapTest, CONTRACT_ID);
    assert(!max_abi.remove(101u8));
    max_abi.push(price_1);
    assert(!max_abi.remove(101u8));
    max_abi.push(price_2);
    assert(!max_abi.remove(101u8));
}
