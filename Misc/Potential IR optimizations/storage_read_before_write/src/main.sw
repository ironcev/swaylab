contract;

const VALUE: b256 = 0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef;

impl Contract {
    fn empty_call() { }

    #[storage(read)]
    fn plain_read() {
        let mut result = b256::zero();
        let _ = __state_load_quad(b256::zero(), __addr_of(result), 1);
    }

    #[storage(read)]
    fn read(expected_is_set: bool) {
        let mut result = b256::zero();
        let is_set = __state_load_quad(b256::zero(), __addr_of(result), 1);
        assert_eq(is_set, expected_is_set);
        if expected_is_set {
            assert_eq(result, VALUE);
        }
    }

    #[storage(write)]
    fn storage_write_no_read() {
        let _ = __state_store_quad(b256::zero(), __addr_of(VALUE), 1);
    }

    #[storage(write, read)]
    fn storage_read_before_write() {
        let mut result = b256::zero();
        let _ = __state_load_quad(b256::zero(), __addr_of(result), 1);
        let _ = __state_store_quad(b256::zero(), __addr_of(VALUE), 1);
    }

    #[storage(read)]
    fn storage_many_reads_before_write() {
        let mut result = b256::zero();
        let mut i = 0;
        while i < 1000 {
            let _ = __state_load_quad(b256::zero(), __addr_of(result), 1);
            i += 1;
        }
    }

    #[storage(read)]
    fn storage_many_reads_before_write_baseline() {
        let mut result = b256::zero();
        let mut i = 0;
        let _ = __state_load_quad(b256::zero(), __addr_of(result), 1);
        while i < 1000 {
            i += 1;
        }
    }

    #[storage(write)]
    fn storage_many_same_writes() {
        let mut val = u256::zero();
        let mut i = 0;
        while i < 1000 {
            let _ = __state_store_quad(b256::zero(), __addr_of(u256::zero()), 1);
            i += 1;
            val += 1;
        }
    }

    #[storage(write)]
    fn storage_many_different_writes() {
        let mut val = u256::zero();
        let mut i = 0;
        while i < 1000 {
            let _ = __state_store_quad(b256::zero(), __addr_of(val), 1);
            i += 1;
            val += 1;
        }
    }
}

#[test]
fn bench_empty_call() {
    let caller = abi(StorageReadBeforeWriteAbi, CONTRACT_ID);
    caller.empty_call();
}

#[test]
fn bench_plain_read() {
    let caller = abi(StorageReadBeforeWriteAbi, CONTRACT_ID);
    caller.plain_read();
}

#[test]
fn bench_baseline() {
    let caller = abi(StorageReadBeforeWriteAbi, CONTRACT_ID);
    caller.read(false);
}

#[test]
fn bench_storage_write_no_read() {
    let caller = abi(StorageReadBeforeWriteAbi, CONTRACT_ID);
    caller.storage_write_no_read();
    caller.read(true);
}

#[test]
fn bench_storage_read_before_write() {
    let caller = abi(StorageReadBeforeWriteAbi, CONTRACT_ID);
    caller.storage_read_before_write();
    caller.read(true);
}

#[test]
fn bench_baseline_storage_many_reads_before_write() {
    let caller = abi(StorageReadBeforeWriteAbi, CONTRACT_ID);
    caller.storage_many_reads_before_write_baseline();
}

#[test]
fn bench_storage_many_reads_before_write() {
    let caller = abi(StorageReadBeforeWriteAbi, CONTRACT_ID);
    caller.storage_many_reads_before_write();
}

#[test]
fn bench_storage_many_same_writes() {
    let caller = abi(StorageReadBeforeWriteAbi, CONTRACT_ID);
    caller.storage_many_same_writes();
}

#[test]
fn bench_storage_many_different_writes() {
    let caller = abi(StorageReadBeforeWriteAbi, CONTRACT_ID);
    caller.storage_many_different_writes();
}
