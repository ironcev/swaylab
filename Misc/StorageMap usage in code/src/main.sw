contract;

use std::identity::Identity;
use std::address::Address;
use std::hash::Hash;
use std::hash::sha256;

abi StorageMapDemo {
    #[storage(read, write)]
    fn demo();
}

impl StorageMapDemo for Contract {
    #[storage(read, write)]
    fn demo() {
        let map_01 = StorageKey::<StorageMap<Identity, bool>>::new(b256::zero(), 0, b256::zero());
        let map_02 = StorageKey::<StorageMap<Identity, u64>>::new(b256::zero(), 0, sha256(b256::zero()));

        let identity = Identity::Address(Address::zero());

        map_01.insert(identity, true);
        map_02.insert(identity, 112233);

        let bool_val = map_01.get(identity).read();
        assert_eq(bool_val, true);

        let u64_val = map_02.get(identity).read();
        assert_eq(u64_val, 112233);
    }
}

#[test]
fn test() {
    let caller = abi(StorageMapDemo, CONTRACT_ID);
    caller.demo();
}