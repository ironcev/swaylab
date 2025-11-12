contract;

use contract_libs::deque::*;
pub struct MyStruct {
    bits: b256,
    val: u64,
    op: Option<u64>,
}
impl PartialEq for MyStruct {
    fn eq(self, other: Self) -> bool {
        self.bits == other.bits && self.val == other.val && self.op == other.op
    }
}
impl Eq for MyStruct {}
abi DequeTest {
    #[storage(read)]
    fn is_empty() -> bool;
    #[storage(read)]
    fn front() -> Option<(MyStruct, u64)>;
    #[storage(read)]
    fn back() -> Option<MyStruct>;
    #[storage(read, write)]
    fn push_back(val: MyStruct) -> u64;
    #[storage(read, write)]
    fn pop_front() -> Option<MyStruct>;
    #[storage(read, write)]
    fn remove(key: u64) -> bool;
    #[storage(read)]
    fn get(key: u64) -> Option<MyStruct>;
}
storage {
    deque: SparseDeque<MyStruct> = SparseDeque {},
}
impl DequeTest for Contract {
    #[storage(read)]
    fn is_empty() -> bool {
        storage.deque.is_empty()
    }
    #[storage(read)]
    fn front() -> Option<(MyStruct, u64)> {
        match storage.deque.front() {
            None => None,
            Some((val_key, head)) => {
                Some((val_key.read(), head))
            }
        }
    }
    #[storage(read)]
    fn back() -> Option<MyStruct> {
        match storage.deque.back() {
            None => None,
            Some(val_key) => {
                Some(val_key.read())
            }
        }
    }
    #[storage(read, write)]
    fn push_back(val: MyStruct) -> u64 {
        storage.deque.push_back(val)
    }
    #[storage(read, write)]
    fn pop_front() -> Option<MyStruct> {
        storage.deque.pop_front()
    }
    #[storage(read, write)]
    fn remove(key: u64) -> bool {
        storage.deque.remove(key)
    }
    #[storage(read)]
    fn get(key: u64) -> Option<MyStruct> {
        storage.deque.get(key)
    }
}
fn struct_builder(num_structs: u64) -> Vec<MyStruct> {
    let mut vec = Vec::with_capacity(num_structs);
    let mut iter = 0;
    while iter < num_structs {
        let my_struct = MyStruct {
            bits: (u256::zero() + iter.as_u256() + 0x02u256).as_b256(),
            val: iter + 1,
            op: if iter % 2 == 0 { Some(iter) } else { None },
        };
        vec.push(my_struct);
        iter += 1;
    }
    vec
}

#[test]
fn test_push_single() {
    let deque_abi = abi(DequeTest, CONTRACT_ID);
    let my_struct_1 = struct_builder(1).get(0).unwrap();
    assert(deque_abi.is_empty());
    assert(deque_abi.front().is_none());
    assert(deque_abi.back().is_none());
    let key_1 = deque_abi.push_back(my_struct_1);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_1);
    assert(deque_abi.front().unwrap().1 == key_1);
    assert(deque_abi.back().unwrap() == my_struct_1);
    assert(deque_abi.get(key_1).unwrap() == my_struct_1);
}
#[test]
fn test_push_double() {
    let deque_abi = abi(DequeTest, CONTRACT_ID);
    let my_struct_1 = struct_builder(1).get(0).unwrap();
    let key_1 = deque_abi.push_back(my_struct_1);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_1);
    assert(deque_abi.front().unwrap().1 == key_1);
    assert(deque_abi.back().unwrap() == my_struct_1);
    assert(deque_abi.get(key_1).unwrap() == my_struct_1);
    let key_2 = deque_abi.push_back(my_struct_1);
    assert(key_1 != key_2);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_1);
    assert(deque_abi.front().unwrap().1 == key_1);
    assert(deque_abi.back().unwrap() == my_struct_1);
    assert(deque_abi.get(key_1).unwrap() == my_struct_1);
    assert(deque_abi.get(key_2).unwrap() == my_struct_1);
}
#[test]
fn test_push_two() {
    let deque_abi = abi(DequeTest, CONTRACT_ID);
    let struct_vec = struct_builder(2);
    let my_struct_1 = struct_vec.get(0).unwrap();
    let my_struct_2 = struct_vec.get(1).unwrap();
    let key_1 = deque_abi.push_back(my_struct_1);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_1);
    assert(deque_abi.front().unwrap().1 == key_1);
    assert(deque_abi.back().unwrap() == my_struct_1);
    assert(deque_abi.get(key_1).unwrap() == my_struct_1);
    let key_2 = deque_abi.push_back(my_struct_2);
    assert(key_1 != key_2);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_1);
    assert(deque_abi.front().unwrap().1 == key_1);
    assert(deque_abi.back().unwrap() == my_struct_2);
    assert(deque_abi.get(key_1).unwrap() == my_struct_1);
    assert(deque_abi.get(key_2).unwrap() == my_struct_2);
}
#[test]
fn test_push_many() {
    let deque_abi = abi(DequeTest, CONTRACT_ID);
    let struct_vec = struct_builder(10);
    let my_struct_1 = struct_vec.get(0).unwrap();
    let my_struct_2 = struct_vec.get(1).unwrap();
    let my_struct_3 = struct_vec.get(2).unwrap();
    let my_struct_4 = struct_vec.get(3).unwrap();
    let my_struct_5 = struct_vec.get(4).unwrap();
    let my_struct_6 = struct_vec.get(5).unwrap();
    let my_struct_7 = struct_vec.get(6).unwrap();
    let my_struct_8 = struct_vec.get(7).unwrap();
    let my_struct_9 = struct_vec.get(8).unwrap();
    let my_struct_10 = struct_vec.get(9).unwrap();
    let key_1 = deque_abi.push_back(my_struct_1);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_1);
    assert(deque_abi.front().unwrap().1 == key_1);
    assert(deque_abi.back().unwrap() == my_struct_1);
    assert(deque_abi.get(key_1).unwrap() == my_struct_1);
    let key_2 = deque_abi.push_back(my_struct_2);
    assert(key_1 != key_2);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_1);
    assert(deque_abi.front().unwrap().1 == key_1);
    assert(deque_abi.back().unwrap() == my_struct_2);
    assert(deque_abi.get(key_1).unwrap() == my_struct_1);
    assert(deque_abi.get(key_2).unwrap() == my_struct_2);
    let key_3 = deque_abi.push_back(my_struct_3);
    assert(key_1 != key_3);
    assert(key_2 != key_3);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_1);
    assert(deque_abi.front().unwrap().1 == key_1);
    assert(deque_abi.back().unwrap() == my_struct_3);
    assert(deque_abi.get(key_1).unwrap() == my_struct_1);
    assert(deque_abi.get(key_2).unwrap() == my_struct_2);
    assert(deque_abi.get(key_3).unwrap() == my_struct_3);
    let key_4 = deque_abi.push_back(my_struct_4);
    assert(key_1 != key_4);
    assert(key_2 != key_4);
    assert(key_3 != key_4);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_1);
    assert(deque_abi.front().unwrap().1 == key_1);
    assert(deque_abi.back().unwrap() == my_struct_4);
    assert(deque_abi.get(key_1).unwrap() == my_struct_1);
    assert(deque_abi.get(key_2).unwrap() == my_struct_2);
    assert(deque_abi.get(key_3).unwrap() == my_struct_3);
    assert(deque_abi.get(key_4).unwrap() == my_struct_4);
    let key_5 = deque_abi.push_back(my_struct_5);
    assert(key_1 != key_5);
    assert(key_2 != key_5);
    assert(key_3 != key_5);
    assert(key_4 != key_5);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_1);
    assert(deque_abi.front().unwrap().1 == key_1);
    assert(deque_abi.back().unwrap() == my_struct_5);
    assert(deque_abi.get(key_1).unwrap() == my_struct_1);
    assert(deque_abi.get(key_2).unwrap() == my_struct_2);
    assert(deque_abi.get(key_3).unwrap() == my_struct_3);
    assert(deque_abi.get(key_4).unwrap() == my_struct_4);
    assert(deque_abi.get(key_5).unwrap() == my_struct_5);
    let key_6 = deque_abi.push_back(my_struct_6);
    assert(key_1 != key_6);
    assert(key_2 != key_6);
    assert(key_3 != key_6);
    assert(key_4 != key_6);
    assert(key_5 != key_6);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_1);
    assert(deque_abi.front().unwrap().1 == key_1);
    assert(deque_abi.back().unwrap() == my_struct_6);
    assert(deque_abi.get(key_1).unwrap() == my_struct_1);
    assert(deque_abi.get(key_2).unwrap() == my_struct_2);
    assert(deque_abi.get(key_3).unwrap() == my_struct_3);
    assert(deque_abi.get(key_4).unwrap() == my_struct_4);
    assert(deque_abi.get(key_5).unwrap() == my_struct_5);
    assert(deque_abi.get(key_6).unwrap() == my_struct_6);
    let key_7 = deque_abi.push_back(my_struct_7);
    assert(key_1 != key_7);
    assert(key_2 != key_7);
    assert(key_3 != key_7);
    assert(key_4 != key_7);
    assert(key_5 != key_7);
    assert(key_6 != key_7);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_1);
    assert(deque_abi.front().unwrap().1 == key_1);
    assert(deque_abi.back().unwrap() == my_struct_7);
    assert(deque_abi.get(key_1).unwrap() == my_struct_1);
    assert(deque_abi.get(key_2).unwrap() == my_struct_2);
    assert(deque_abi.get(key_3).unwrap() == my_struct_3);
    assert(deque_abi.get(key_4).unwrap() == my_struct_4);
    assert(deque_abi.get(key_5).unwrap() == my_struct_5);
    assert(deque_abi.get(key_6).unwrap() == my_struct_6);
    assert(deque_abi.get(key_7).unwrap() == my_struct_7);
    let key_8 = deque_abi.push_back(my_struct_8);
    assert(key_1 != key_8);
    assert(key_2 != key_8);
    assert(key_3 != key_8);
    assert(key_4 != key_8);
    assert(key_5 != key_8);
    assert(key_6 != key_8);
    assert(key_7 != key_8);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_1);
    assert(deque_abi.front().unwrap().1 == key_1);
    assert(deque_abi.back().unwrap() == my_struct_8);
    assert(deque_abi.get(key_1).unwrap() == my_struct_1);
    assert(deque_abi.get(key_2).unwrap() == my_struct_2);
    assert(deque_abi.get(key_3).unwrap() == my_struct_3);
    assert(deque_abi.get(key_4).unwrap() == my_struct_4);
    assert(deque_abi.get(key_5).unwrap() == my_struct_5);
    assert(deque_abi.get(key_6).unwrap() == my_struct_6);
    assert(deque_abi.get(key_7).unwrap() == my_struct_7);
    assert(deque_abi.get(key_8).unwrap() == my_struct_8);
    let key_9 = deque_abi.push_back(my_struct_9);
    assert(key_1 != key_9);
    assert(key_2 != key_9);
    assert(key_3 != key_9);
    assert(key_4 != key_9);
    assert(key_5 != key_9);
    assert(key_6 != key_9);
    assert(key_7 != key_9);
    assert(key_8 != key_9);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_1);
    assert(deque_abi.front().unwrap().1 == key_1);
    assert(deque_abi.back().unwrap() == my_struct_9);
    assert(deque_abi.get(key_1).unwrap() == my_struct_1);
    assert(deque_abi.get(key_2).unwrap() == my_struct_2);
    assert(deque_abi.get(key_3).unwrap() == my_struct_3);
    assert(deque_abi.get(key_4).unwrap() == my_struct_4);
    assert(deque_abi.get(key_5).unwrap() == my_struct_5);
    assert(deque_abi.get(key_6).unwrap() == my_struct_6);
    assert(deque_abi.get(key_7).unwrap() == my_struct_7);
    assert(deque_abi.get(key_8).unwrap() == my_struct_8);
    assert(deque_abi.get(key_9).unwrap() == my_struct_9);
    let key_10 = deque_abi.push_back(my_struct_10);
    assert(key_1 != key_10);
    assert(key_2 != key_10);
    assert(key_3 != key_10);
    assert(key_4 != key_10);
    assert(key_5 != key_10);
    assert(key_6 != key_10);
    assert(key_7 != key_10);
    assert(key_8 != key_10);
    assert(key_9 != key_10);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_1);
    assert(deque_abi.front().unwrap().1 == key_1);
    assert(deque_abi.back().unwrap() == my_struct_10);
    assert(deque_abi.get(key_1).unwrap() == my_struct_1);
    assert(deque_abi.get(key_2).unwrap() == my_struct_2);
    assert(deque_abi.get(key_3).unwrap() == my_struct_3);
    assert(deque_abi.get(key_4).unwrap() == my_struct_4);
    assert(deque_abi.get(key_5).unwrap() == my_struct_5);
    assert(deque_abi.get(key_6).unwrap() == my_struct_6);
    assert(deque_abi.get(key_7).unwrap() == my_struct_7);
    assert(deque_abi.get(key_8).unwrap() == my_struct_8);
    assert(deque_abi.get(key_9).unwrap() == my_struct_9);
    assert(deque_abi.get(key_10).unwrap() == my_struct_10);
}
#[test]
fn test_empty_deque() {
    let deque_abi = abi(DequeTest, CONTRACT_ID);
    assert(deque_abi.is_empty());
    assert(deque_abi.front().is_none());
    assert(deque_abi.back().is_none());
}
#[test]
fn test_pop_single() {
    let deque_abi = abi(DequeTest, CONTRACT_ID);
    let my_struct_1 = struct_builder(1).get(0).unwrap();
    let key_1 = deque_abi.push_back(my_struct_1);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_1);
    assert(deque_abi.front().unwrap().1 == key_1);
    assert(deque_abi.back().unwrap() == my_struct_1);
    assert(deque_abi.get(key_1).unwrap() == my_struct_1);
    let result_1 = deque_abi.pop_front().unwrap();
    assert(result_1 == my_struct_1);
    assert(deque_abi.is_empty());
    assert(deque_abi.front().is_none());
    assert(deque_abi.back().is_none());
    assert(deque_abi.pop_front().is_none());
    assert(deque_abi.get(key_1).is_none());
}
#[test]
fn test_pop_double() {
    let deque_abi = abi(DequeTest, CONTRACT_ID);
    let my_struct_1 = struct_builder(1).get(0).unwrap();
    let key_1 = deque_abi.push_back(my_struct_1);
    let key_2 = deque_abi.push_back(my_struct_1);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_1);
    assert(deque_abi.front().unwrap().1 == key_1);
    assert(deque_abi.back().unwrap() == my_struct_1);
    assert(deque_abi.get(key_1).unwrap() == my_struct_1);
    assert(deque_abi.get(key_2).unwrap() == my_struct_1);
    let result_1 = deque_abi.pop_front().unwrap();
    assert(result_1 == my_struct_1);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_1);
    assert(deque_abi.front().unwrap().1 == key_2);
    assert(deque_abi.back().unwrap() == my_struct_1);
    assert(deque_abi.get(key_1).is_none());
    assert(deque_abi.get(key_2).unwrap() == my_struct_1);
    let result_2 = deque_abi.pop_front().unwrap();
    assert(result_2 == my_struct_1);
    assert(deque_abi.is_empty());
    assert(deque_abi.front().is_none());
    assert(deque_abi.back().is_none());
    assert(deque_abi.pop_front().is_none());
    assert(deque_abi.get(key_1).is_none());
    assert(deque_abi.get(key_2).is_none());
}
#[test]
fn test_pop_two() {
    let deque_abi = abi(DequeTest, CONTRACT_ID);
    let struct_vec = struct_builder(2);
    let my_struct_1 = struct_vec.get(0).unwrap();
    let my_struct_2 = struct_vec.get(1).unwrap();
    let key_1 = deque_abi.push_back(my_struct_1);
    let key_2 = deque_abi.push_back(my_struct_2);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_1);
    assert(deque_abi.front().unwrap().1 == key_1);
    assert(deque_abi.back().unwrap() == my_struct_2);
    assert(deque_abi.get(key_1).unwrap() == my_struct_1);
    assert(deque_abi.get(key_2).unwrap() == my_struct_2);
    let result_1 = deque_abi.pop_front().unwrap();
    assert(result_1 == my_struct_1);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_2);
    assert(deque_abi.front().unwrap().1 == key_2);
    assert(deque_abi.back().unwrap() == my_struct_2);
    assert(deque_abi.get(key_1).is_none());
    assert(deque_abi.get(key_2).unwrap() == my_struct_2);
    let result_2 = deque_abi.pop_front().unwrap();
    assert(result_2 == my_struct_2);
    assert(deque_abi.is_empty());
    assert(deque_abi.front().is_none());
    assert(deque_abi.back().is_none());
    assert(deque_abi.pop_front().is_none());
    assert(deque_abi.get(key_1).is_none());
    assert(deque_abi.get(key_2).is_none());
}
#[test]
fn test_pop_many() {
    let deque_abi = abi(DequeTest, CONTRACT_ID);
    let struct_vec = struct_builder(10);
    let my_struct_1 = struct_vec.get(0).unwrap();
    let my_struct_2 = struct_vec.get(1).unwrap();
    let my_struct_3 = struct_vec.get(2).unwrap();
    let my_struct_4 = struct_vec.get(3).unwrap();
    let my_struct_5 = struct_vec.get(4).unwrap();
    let my_struct_6 = struct_vec.get(5).unwrap();
    let my_struct_7 = struct_vec.get(6).unwrap();
    let my_struct_8 = struct_vec.get(7).unwrap();
    let my_struct_9 = struct_vec.get(8).unwrap();
    let my_struct_10 = struct_vec.get(9).unwrap();
    let key_1 = deque_abi.push_back(my_struct_1);
    let key_2 = deque_abi.push_back(my_struct_2);
    let key_3 = deque_abi.push_back(my_struct_3);
    let key_4 = deque_abi.push_back(my_struct_4);
    let key_5 = deque_abi.push_back(my_struct_5);
    let key_6 = deque_abi.push_back(my_struct_6);
    let key_7 = deque_abi.push_back(my_struct_7);
    let key_8 = deque_abi.push_back(my_struct_8);
    let key_9 = deque_abi.push_back(my_struct_9);
    let key_10 = deque_abi.push_back(my_struct_10);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_1);
    assert(deque_abi.front().unwrap().1 == key_1);
    assert(deque_abi.back().unwrap() == my_struct_10);
    assert(deque_abi.get(key_1).unwrap() == my_struct_1);
    assert(deque_abi.get(key_2).unwrap() == my_struct_2);
    assert(deque_abi.get(key_3).unwrap() == my_struct_3);
    assert(deque_abi.get(key_4).unwrap() == my_struct_4);
    assert(deque_abi.get(key_5).unwrap() == my_struct_5);
    assert(deque_abi.get(key_6).unwrap() == my_struct_6);
    assert(deque_abi.get(key_7).unwrap() == my_struct_7);
    assert(deque_abi.get(key_8).unwrap() == my_struct_8);
    assert(deque_abi.get(key_9).unwrap() == my_struct_9);
    assert(deque_abi.get(key_10).unwrap() == my_struct_10);
    let result_1 = deque_abi.pop_front().unwrap();
    assert(result_1 == my_struct_1);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_2);
    assert(deque_abi.front().unwrap().1 == key_2);
    assert(deque_abi.back().unwrap() == my_struct_10);
    assert(deque_abi.get(key_1).is_none());
    assert(deque_abi.get(key_2).unwrap() == my_struct_2);
    assert(deque_abi.get(key_3).unwrap() == my_struct_3);
    assert(deque_abi.get(key_4).unwrap() == my_struct_4);
    assert(deque_abi.get(key_5).unwrap() == my_struct_5);
    assert(deque_abi.get(key_6).unwrap() == my_struct_6);
    assert(deque_abi.get(key_7).unwrap() == my_struct_7);
    assert(deque_abi.get(key_8).unwrap() == my_struct_8);
    assert(deque_abi.get(key_9).unwrap() == my_struct_9);
    assert(deque_abi.get(key_10).unwrap() == my_struct_10);
    let result_2 = deque_abi.pop_front().unwrap();
    assert(result_2 == my_struct_2);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_3);
    assert(deque_abi.front().unwrap().1 == key_3);
    assert(deque_abi.back().unwrap() == my_struct_10);
    assert(deque_abi.get(key_1).is_none());
    assert(deque_abi.get(key_2).is_none());
    assert(deque_abi.get(key_3).unwrap() == my_struct_3);
    assert(deque_abi.get(key_4).unwrap() == my_struct_4);
    assert(deque_abi.get(key_5).unwrap() == my_struct_5);
    assert(deque_abi.get(key_6).unwrap() == my_struct_6);
    assert(deque_abi.get(key_7).unwrap() == my_struct_7);
    assert(deque_abi.get(key_8).unwrap() == my_struct_8);
    assert(deque_abi.get(key_9).unwrap() == my_struct_9);
    assert(deque_abi.get(key_10).unwrap() == my_struct_10);
    let result_3 = deque_abi.pop_front().unwrap();
    assert(result_3 == my_struct_3);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_4);
    assert(deque_abi.front().unwrap().1 == key_4);
    assert(deque_abi.back().unwrap() == my_struct_10);
    assert(deque_abi.get(key_1).is_none());
    assert(deque_abi.get(key_2).is_none());
    assert(deque_abi.get(key_3).is_none());
    assert(deque_abi.get(key_4).unwrap() == my_struct_4);
    assert(deque_abi.get(key_5).unwrap() == my_struct_5);
    assert(deque_abi.get(key_6).unwrap() == my_struct_6);
    assert(deque_abi.get(key_7).unwrap() == my_struct_7);
    assert(deque_abi.get(key_8).unwrap() == my_struct_8);
    assert(deque_abi.get(key_9).unwrap() == my_struct_9);
    assert(deque_abi.get(key_10).unwrap() == my_struct_10);
    let result_4 = deque_abi.pop_front().unwrap();
    assert(result_4 == my_struct_4);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_5);
    assert(deque_abi.front().unwrap().1 == key_5);
    assert(deque_abi.back().unwrap() == my_struct_10);
    assert(deque_abi.get(key_1).is_none());
    assert(deque_abi.get(key_2).is_none());
    assert(deque_abi.get(key_3).is_none());
    assert(deque_abi.get(key_4).is_none());
    assert(deque_abi.get(key_5).unwrap() == my_struct_5);
    assert(deque_abi.get(key_6).unwrap() == my_struct_6);
    assert(deque_abi.get(key_7).unwrap() == my_struct_7);
    assert(deque_abi.get(key_8).unwrap() == my_struct_8);
    assert(deque_abi.get(key_9).unwrap() == my_struct_9);
    assert(deque_abi.get(key_10).unwrap() == my_struct_10);
    let result_5 = deque_abi.pop_front().unwrap();
    assert(result_5 == my_struct_5);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_6);
    assert(deque_abi.front().unwrap().1 == key_6);
    assert(deque_abi.back().unwrap() == my_struct_10);
    assert(deque_abi.get(key_1).is_none());
    assert(deque_abi.get(key_2).is_none());
    assert(deque_abi.get(key_3).is_none());
    assert(deque_abi.get(key_4).is_none());
    assert(deque_abi.get(key_5).is_none());
    assert(deque_abi.get(key_6).unwrap() == my_struct_6);
    assert(deque_abi.get(key_7).unwrap() == my_struct_7);
    assert(deque_abi.get(key_8).unwrap() == my_struct_8);
    assert(deque_abi.get(key_9).unwrap() == my_struct_9);
    assert(deque_abi.get(key_10).unwrap() == my_struct_10);
    let result_6 = deque_abi.pop_front().unwrap();
    assert(result_6 == my_struct_6);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_7);
    assert(deque_abi.front().unwrap().1 == key_7);
    assert(deque_abi.back().unwrap() == my_struct_10);
    assert(deque_abi.get(key_1).is_none());
    assert(deque_abi.get(key_2).is_none());
    assert(deque_abi.get(key_3).is_none());
    assert(deque_abi.get(key_4).is_none());
    assert(deque_abi.get(key_5).is_none());
    assert(deque_abi.get(key_6).is_none());
    assert(deque_abi.get(key_7).unwrap() == my_struct_7);
    assert(deque_abi.get(key_8).unwrap() == my_struct_8);
    assert(deque_abi.get(key_9).unwrap() == my_struct_9);
    assert(deque_abi.get(key_10).unwrap() == my_struct_10);
    let result_7 = deque_abi.pop_front().unwrap();
    assert(result_7 == my_struct_7);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_8);
    assert(deque_abi.front().unwrap().1 == key_8);
    assert(deque_abi.back().unwrap() == my_struct_10);
    assert(deque_abi.get(key_1).is_none());
    assert(deque_abi.get(key_2).is_none());
    assert(deque_abi.get(key_3).is_none());
    assert(deque_abi.get(key_4).is_none());
    assert(deque_abi.get(key_5).is_none());
    assert(deque_abi.get(key_6).is_none());
    assert(deque_abi.get(key_7).is_none());
    assert(deque_abi.get(key_8).unwrap() == my_struct_8);
    assert(deque_abi.get(key_9).unwrap() == my_struct_9);
    assert(deque_abi.get(key_10).unwrap() == my_struct_10);
    let result_8 = deque_abi.pop_front().unwrap();
    assert(result_8 == my_struct_8);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_9);
    assert(deque_abi.front().unwrap().1 == key_9);
    assert(deque_abi.back().unwrap() == my_struct_10);
    assert(deque_abi.get(key_1).is_none());
    assert(deque_abi.get(key_2).is_none());
    assert(deque_abi.get(key_3).is_none());
    assert(deque_abi.get(key_4).is_none());
    assert(deque_abi.get(key_5).is_none());
    assert(deque_abi.get(key_6).is_none());
    assert(deque_abi.get(key_7).is_none());
    assert(deque_abi.get(key_8).is_none());
    assert(deque_abi.get(key_9).unwrap() == my_struct_9);
    assert(deque_abi.get(key_10).unwrap() == my_struct_10);
    let result_9 = deque_abi.pop_front().unwrap();
    assert(result_9 == my_struct_9);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_10);
    assert(deque_abi.front().unwrap().1 == key_10);
    assert(deque_abi.back().unwrap() == my_struct_10);
    assert(deque_abi.get(key_1).is_none());
    assert(deque_abi.get(key_2).is_none());
    assert(deque_abi.get(key_3).is_none());
    assert(deque_abi.get(key_4).is_none());
    assert(deque_abi.get(key_5).is_none());
    assert(deque_abi.get(key_6).is_none());
    assert(deque_abi.get(key_7).is_none());
    assert(deque_abi.get(key_8).is_none());
    assert(deque_abi.get(key_9).is_none());
    assert(deque_abi.get(key_10).unwrap() == my_struct_10);
    let result_10 = deque_abi.pop_front().unwrap();
    assert(result_10 == my_struct_10);
    assert(deque_abi.is_empty());
    assert(deque_abi.front().is_none());
    assert(deque_abi.back().is_none());
    assert(deque_abi.pop_front().is_none());
    assert(deque_abi.get(key_1).is_none());
    assert(deque_abi.get(key_2).is_none());
    assert(deque_abi.get(key_3).is_none());
    assert(deque_abi.get(key_4).is_none());
    assert(deque_abi.get(key_5).is_none());
    assert(deque_abi.get(key_6).is_none());
    assert(deque_abi.get(key_7).is_none());
    assert(deque_abi.get(key_8).is_none());
    assert(deque_abi.get(key_9).is_none());
    assert(deque_abi.get(key_10).is_none());
}
#[test]
fn test_pop_empty() {
    let deque_abi = abi(DequeTest, CONTRACT_ID);
    assert(deque_abi.pop_front().is_none());
}
#[test]
fn test_remove_empty() {
    let deque_abi = abi(DequeTest, CONTRACT_ID);
    let result_1 = deque_abi.remove(0);
    assert(!result_1);
}
#[test]
fn test_remove_single() {
    let deque_abi = abi(DequeTest, CONTRACT_ID);
    let my_struct_1 = struct_builder(1).get(0).unwrap();
    let key_1 = deque_abi.push_back(my_struct_1);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_1);
    assert(deque_abi.front().unwrap().1 == key_1);
    assert(deque_abi.back().unwrap() == my_struct_1);
    assert(deque_abi.get(key_1).unwrap() == my_struct_1);
    let result_1 = deque_abi.remove(key_1);
    assert(result_1);
    assert(deque_abi.is_empty());
    assert(deque_abi.front().is_none());
    assert(deque_abi.back().is_none());
    assert(deque_abi.pop_front().is_none());
    assert(deque_abi.get(key_1).is_none());
}
#[test]
fn test_remove_double() {
    let deque_abi = abi(DequeTest, CONTRACT_ID);
    let my_struct_1 = struct_builder(1).get(0).unwrap();
    let key_1 = deque_abi.push_back(my_struct_1);
    let key_2 = deque_abi.push_back(my_struct_1);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_1);
    assert(deque_abi.front().unwrap().1 == key_1);
    assert(deque_abi.back().unwrap() == my_struct_1);
    assert(deque_abi.get(key_1).unwrap() == my_struct_1);
    assert(deque_abi.get(key_2).unwrap() == my_struct_1);
    let result_1 = deque_abi.remove(key_1);
    assert(result_1);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_1);
    assert(deque_abi.front().unwrap().1 == key_2);
    assert(deque_abi.back().unwrap() == my_struct_1);
    assert(deque_abi.get(key_1).is_none());
    assert(deque_abi.get(key_2).unwrap() == my_struct_1);
    let result_2 = deque_abi.remove(key_2);
    assert(result_2);
    assert(deque_abi.is_empty());
    assert(deque_abi.front().is_none());
    assert(deque_abi.back().is_none());
    assert(deque_abi.pop_front().is_none());
    assert(deque_abi.get(key_1).is_none());
    assert(deque_abi.get(key_2).is_none());
}
#[test]
fn test_remove_front() {
    let deque_abi = abi(DequeTest, CONTRACT_ID);
    let struct_vec = struct_builder(2);
    let my_struct_1 = struct_vec.get(0).unwrap();
    let my_struct_2 = struct_vec.get(1).unwrap();
    let key_1 = deque_abi.push_back(my_struct_1);
    let key_2 = deque_abi.push_back(my_struct_2);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_1);
    assert(deque_abi.front().unwrap().1 == key_1);
    assert(deque_abi.back().unwrap() == my_struct_2);
    assert(deque_abi.get(key_1).unwrap() == my_struct_1);
    assert(deque_abi.get(key_2).unwrap() == my_struct_2);
    let result_1 = deque_abi.remove(key_1);
    assert(result_1);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_2);
    assert(deque_abi.front().unwrap().1 == key_2);
    assert(deque_abi.back().unwrap() == my_struct_2);
    assert(deque_abi.get(key_1).is_none());
    assert(deque_abi.get(key_2).unwrap() == my_struct_2);
    let result_2 = deque_abi.remove(key_2);
    assert(result_2);
    assert(deque_abi.is_empty());
    assert(deque_abi.front().is_none());
    assert(deque_abi.back().is_none());
    assert(deque_abi.pop_front().is_none());
    assert(deque_abi.get(key_1).is_none());
    assert(deque_abi.get(key_2).is_none());
}
#[test]
fn test_remove_back() {
    let deque_abi = abi(DequeTest, CONTRACT_ID);
    let struct_vec = struct_builder(2);
    let my_struct_1 = struct_vec.get(0).unwrap();
    let my_struct_2 = struct_vec.get(1).unwrap();
    let key_1 = deque_abi.push_back(my_struct_1);
    let key_2 = deque_abi.push_back(my_struct_2);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_1);
    assert(deque_abi.front().unwrap().1 == key_1);
    assert(deque_abi.back().unwrap() == my_struct_2);
    assert(deque_abi.get(key_1).unwrap() == my_struct_1);
    assert(deque_abi.get(key_2).unwrap() == my_struct_2);
    let result_1 = deque_abi.remove(key_2);
    assert(result_1);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_1);
    assert(deque_abi.front().unwrap().1 == key_1);
    assert(deque_abi.back().unwrap() == my_struct_1);
    assert(deque_abi.get(key_1).unwrap() == my_struct_1);
    assert(deque_abi.get(key_2).is_none());
    let result_2 = deque_abi.remove(key_1);
    assert(result_2);
    assert(deque_abi.is_empty());
    assert(deque_abi.front().is_none());
    assert(deque_abi.back().is_none());
    assert(deque_abi.pop_front().is_none());
    assert(deque_abi.get(key_1).is_none());
    assert(deque_abi.get(key_2).is_none());
}
#[test]
fn test_remove_middle() {
    let deque_abi = abi(DequeTest, CONTRACT_ID);
    let struct_vec = struct_builder(3);
    let my_struct_1 = struct_vec.get(0).unwrap();
    let my_struct_2 = struct_vec.get(1).unwrap();
    let my_struct_3 = struct_vec.get(2).unwrap();
    let key_1 = deque_abi.push_back(my_struct_1);
    let key_2 = deque_abi.push_back(my_struct_2);
    let key_3 = deque_abi.push_back(my_struct_3);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_1);
    assert(deque_abi.front().unwrap().1 == key_1);
    assert(deque_abi.back().unwrap() == my_struct_3);
    assert(deque_abi.get(key_1).unwrap() == my_struct_1);
    assert(deque_abi.get(key_2).unwrap() == my_struct_2);
    assert(deque_abi.get(key_3).unwrap() == my_struct_3);
    let result_1 = deque_abi.remove(key_2);
    assert(result_1);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_1);
    assert(deque_abi.front().unwrap().1 == key_1);
    assert(deque_abi.back().unwrap() == my_struct_3);
    assert(deque_abi.get(key_1).unwrap() == my_struct_1);
    assert(deque_abi.get(key_2).is_none());
    assert(deque_abi.get(key_3).unwrap() == my_struct_3);
}
#[test]
fn test_remove_many() {
    let deque_abi = abi(DequeTest, CONTRACT_ID);
    let struct_vec = struct_builder(10);
    let my_struct_1 = struct_vec.get(0).unwrap();
    let my_struct_2 = struct_vec.get(1).unwrap();
    let my_struct_3 = struct_vec.get(2).unwrap();
    let my_struct_4 = struct_vec.get(3).unwrap();
    let my_struct_5 = struct_vec.get(4).unwrap();
    let my_struct_6 = struct_vec.get(5).unwrap();
    let my_struct_7 = struct_vec.get(6).unwrap();
    let my_struct_8 = struct_vec.get(7).unwrap();
    let my_struct_9 = struct_vec.get(8).unwrap();
    let my_struct_10 = struct_vec.get(9).unwrap();
    let key_1 = deque_abi.push_back(my_struct_1);
    let key_2 = deque_abi.push_back(my_struct_2);
    let key_3 = deque_abi.push_back(my_struct_3);
    let key_4 = deque_abi.push_back(my_struct_4);
    let key_5 = deque_abi.push_back(my_struct_5);
    let key_6 = deque_abi.push_back(my_struct_6);
    let key_7 = deque_abi.push_back(my_struct_7);
    let key_8 = deque_abi.push_back(my_struct_8);
    let key_9 = deque_abi.push_back(my_struct_9);
    let key_10 = deque_abi.push_back(my_struct_10);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_1);
    assert(deque_abi.front().unwrap().1 == key_1);
    assert(deque_abi.back().unwrap() == my_struct_10);
    assert(deque_abi.get(key_1).unwrap() == my_struct_1);
    assert(deque_abi.get(key_2).unwrap() == my_struct_2);
    assert(deque_abi.get(key_3).unwrap() == my_struct_3);
    assert(deque_abi.get(key_4).unwrap() == my_struct_4);
    assert(deque_abi.get(key_5).unwrap() == my_struct_5);
    assert(deque_abi.get(key_6).unwrap() == my_struct_6);
    assert(deque_abi.get(key_7).unwrap() == my_struct_7);
    assert(deque_abi.get(key_8).unwrap() == my_struct_8);
    assert(deque_abi.get(key_9).unwrap() == my_struct_9);
    assert(deque_abi.get(key_10).unwrap() == my_struct_10);
    let result_1 = deque_abi.remove(key_1);
    assert(result_1);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_2);
    assert(deque_abi.front().unwrap().1 == key_2);
    assert(deque_abi.back().unwrap() == my_struct_10);
    assert(deque_abi.get(key_1).is_none());
    assert(deque_abi.get(key_2).unwrap() == my_struct_2);
    assert(deque_abi.get(key_3).unwrap() == my_struct_3);
    assert(deque_abi.get(key_4).unwrap() == my_struct_4);
    assert(deque_abi.get(key_5).unwrap() == my_struct_5);
    assert(deque_abi.get(key_6).unwrap() == my_struct_6);
    assert(deque_abi.get(key_7).unwrap() == my_struct_7);
    assert(deque_abi.get(key_8).unwrap() == my_struct_8);
    assert(deque_abi.get(key_9).unwrap() == my_struct_9);
    assert(deque_abi.get(key_10).unwrap() == my_struct_10);
    let result_2 = deque_abi.remove(key_2);
    assert(result_2);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_3);
    assert(deque_abi.front().unwrap().1 == key_3);
    assert(deque_abi.back().unwrap() == my_struct_10);
    assert(deque_abi.get(key_1).is_none());
    assert(deque_abi.get(key_2).is_none());
    assert(deque_abi.get(key_3).unwrap() == my_struct_3);
    assert(deque_abi.get(key_4).unwrap() == my_struct_4);
    assert(deque_abi.get(key_5).unwrap() == my_struct_5);
    assert(deque_abi.get(key_6).unwrap() == my_struct_6);
    assert(deque_abi.get(key_7).unwrap() == my_struct_7);
    assert(deque_abi.get(key_8).unwrap() == my_struct_8);
    assert(deque_abi.get(key_9).unwrap() == my_struct_9);
    assert(deque_abi.get(key_10).unwrap() == my_struct_10);
    let result_3 = deque_abi.remove(key_3);
    assert(result_3);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_4);
    assert(deque_abi.front().unwrap().1 == key_4);
    assert(deque_abi.back().unwrap() == my_struct_10);
    assert(deque_abi.get(key_1).is_none());
    assert(deque_abi.get(key_2).is_none());
    assert(deque_abi.get(key_3).is_none());
    assert(deque_abi.get(key_4).unwrap() == my_struct_4);
    assert(deque_abi.get(key_5).unwrap() == my_struct_5);
    assert(deque_abi.get(key_6).unwrap() == my_struct_6);
    assert(deque_abi.get(key_7).unwrap() == my_struct_7);
    assert(deque_abi.get(key_8).unwrap() == my_struct_8);
    assert(deque_abi.get(key_9).unwrap() == my_struct_9);
    assert(deque_abi.get(key_10).unwrap() == my_struct_10);
    let result_4 = deque_abi.remove(key_4);
    assert(result_4);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_5);
    assert(deque_abi.front().unwrap().1 == key_5);
    assert(deque_abi.back().unwrap() == my_struct_10);
    assert(deque_abi.get(key_1).is_none());
    assert(deque_abi.get(key_2).is_none());
    assert(deque_abi.get(key_3).is_none());
    assert(deque_abi.get(key_4).is_none());
    assert(deque_abi.get(key_5).unwrap() == my_struct_5);
    assert(deque_abi.get(key_6).unwrap() == my_struct_6);
    assert(deque_abi.get(key_7).unwrap() == my_struct_7);
    assert(deque_abi.get(key_8).unwrap() == my_struct_8);
    assert(deque_abi.get(key_9).unwrap() == my_struct_9);
    assert(deque_abi.get(key_10).unwrap() == my_struct_10);
    let result_5 = deque_abi.remove(key_5);
    assert(result_5);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_6);
    assert(deque_abi.front().unwrap().1 == key_6);
    assert(deque_abi.back().unwrap() == my_struct_10);
    assert(deque_abi.get(key_1).is_none());
    assert(deque_abi.get(key_2).is_none());
    assert(deque_abi.get(key_3).is_none());
    assert(deque_abi.get(key_4).is_none());
    assert(deque_abi.get(key_5).is_none());
    assert(deque_abi.get(key_6).unwrap() == my_struct_6);
    assert(deque_abi.get(key_7).unwrap() == my_struct_7);
    assert(deque_abi.get(key_8).unwrap() == my_struct_8);
    assert(deque_abi.get(key_9).unwrap() == my_struct_9);
    assert(deque_abi.get(key_10).unwrap() == my_struct_10);
    let result_6 = deque_abi.remove(key_6);
    assert(result_6);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_7);
    assert(deque_abi.front().unwrap().1 == key_7);
    assert(deque_abi.back().unwrap() == my_struct_10);
    assert(deque_abi.get(key_1).is_none());
    assert(deque_abi.get(key_2).is_none());
    assert(deque_abi.get(key_3).is_none());
    assert(deque_abi.get(key_4).is_none());
    assert(deque_abi.get(key_5).is_none());
    assert(deque_abi.get(key_6).is_none());
    assert(deque_abi.get(key_7).unwrap() == my_struct_7);
    assert(deque_abi.get(key_8).unwrap() == my_struct_8);
    assert(deque_abi.get(key_9).unwrap() == my_struct_9);
    assert(deque_abi.get(key_10).unwrap() == my_struct_10);
    let result_7 = deque_abi.remove(key_7);
    assert(result_7);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_8);
    assert(deque_abi.front().unwrap().1 == key_8);
    assert(deque_abi.back().unwrap() == my_struct_10);
    assert(deque_abi.get(key_1).is_none());
    assert(deque_abi.get(key_2).is_none());
    assert(deque_abi.get(key_3).is_none());
    assert(deque_abi.get(key_4).is_none());
    assert(deque_abi.get(key_5).is_none());
    assert(deque_abi.get(key_6).is_none());
    assert(deque_abi.get(key_7).is_none());
    assert(deque_abi.get(key_8).unwrap() == my_struct_8);
    assert(deque_abi.get(key_9).unwrap() == my_struct_9);
    assert(deque_abi.get(key_10).unwrap() == my_struct_10);
    let result_8 = deque_abi.remove(key_8);
    assert(result_8);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_9);
    assert(deque_abi.front().unwrap().1 == key_9);
    assert(deque_abi.back().unwrap() == my_struct_10);
    assert(deque_abi.get(key_1).is_none());
    assert(deque_abi.get(key_2).is_none());
    assert(deque_abi.get(key_3).is_none());
    assert(deque_abi.get(key_4).is_none());
    assert(deque_abi.get(key_5).is_none());
    assert(deque_abi.get(key_6).is_none());
    assert(deque_abi.get(key_7).is_none());
    assert(deque_abi.get(key_8).is_none());
    assert(deque_abi.get(key_9).unwrap() == my_struct_9);
    assert(deque_abi.get(key_10).unwrap() == my_struct_10);
    let result_9 = deque_abi.remove(key_9);
    assert(result_9);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_10);
    assert(deque_abi.front().unwrap().1 == key_10);
    assert(deque_abi.back().unwrap() == my_struct_10);
    assert(deque_abi.get(key_1).is_none());
    assert(deque_abi.get(key_2).is_none());
    assert(deque_abi.get(key_3).is_none());
    assert(deque_abi.get(key_4).is_none());
    assert(deque_abi.get(key_5).is_none());
    assert(deque_abi.get(key_6).is_none());
    assert(deque_abi.get(key_7).is_none());
    assert(deque_abi.get(key_8).is_none());
    assert(deque_abi.get(key_9).is_none());
    assert(deque_abi.get(key_10).unwrap() == my_struct_10);
    let result_10 = deque_abi.remove(key_10);
    assert(result_10);
    assert(deque_abi.is_empty());
    assert(deque_abi.front().is_none());
    assert(deque_abi.back().is_none());
    assert(deque_abi.pop_front().is_none());
    assert(deque_abi.get(key_1).is_none());
    assert(deque_abi.get(key_2).is_none());
    assert(deque_abi.get(key_3).is_none());
    assert(deque_abi.get(key_4).is_none());
    assert(deque_abi.get(key_5).is_none());
    assert(deque_abi.get(key_6).is_none());
    assert(deque_abi.get(key_7).is_none());
    assert(deque_abi.get(key_8).is_none());
    assert(deque_abi.get(key_9).is_none());
    assert(deque_abi.get(key_10).is_none());
}
#[test]
fn test_remove_does_not_exist() {
    let deque_abi = abi(DequeTest, CONTRACT_ID);
    let my_struct_1 = struct_builder(1).get(0).unwrap();
    let key_1 = deque_abi.push_back(my_struct_1);
    let key_2 = deque_abi.push_back(my_struct_1);
    let result_1 = deque_abi.remove(key_1 + key_2 + 1); // Unique key
    assert(!result_1);
    assert(!deque_abi.is_empty());
    assert(deque_abi.front().unwrap().0 == my_struct_1);
    assert(deque_abi.front().unwrap().1 == key_1);
    assert(deque_abi.back().unwrap() == my_struct_1);
    assert(deque_abi.get(key_1).unwrap() == my_struct_1);
    assert(deque_abi.get(key_2).unwrap() == my_struct_1);
}
