contract;

// Ignition costs:

// "srw": 294,
// "srwq": {
//   "HeavyOperation": {
//     "base": 311,
//     "gas_per_unit": 312
//   }
// },

// "sww": 7833,
// "swwq": {
//   "HeavyOperation": {
//     "base": 7838,
//     "gas_per_unit": 8156
//   }
// },



struct Struct {
    first: u64,
    second: u64,
    third: u64,
}

storage {
    value: Struct = Struct {
        first: 0,
        second: 0,
        third: 0,
    },
}

impl Contract {
    // fn initialize() {
    //     storage.value.write(Struct {
    //         first: 0,
    //         second: 0,
    //         third: 0,
    //     });
    // }

    #[storage(write)]
    fn read_write_second_whole_struct() {
        let mut s = storage.value.read();
        s.second = 42;
        storage.value.write(s);
    }

    #[storage(write)]
    fn read_write_second_only_field() {
        let mut second = storage.value.second.read();
        second = 42;
        storage.value.second.write(second);
    }

    #[storage(write)]
    fn read_write_second_whole_struct_roundtrip() {
        let s = storage.value.read();
        storage.value.write(s);
    }

    #[storage(write)]
    fn read_write_second_only_field_roundtrip() {
        let second = storage.value.second.read();
        storage.value.second.write(second);
    }

    #[storage(read)]
    fn assert(second_expected: u64) {
        let s = storage.value.read();
        assert_eq(s.first, 0);
        assert_eq(s.second, second_expected);
        assert_eq(s.third, 0);
    }
}

#[test]
fn bench_baseline() {
    let caller = abi(SrwAndSwwAbi, CONTRACT_ID);
    // caller.initialize();
    caller.assert(0);
}

#[test]
fn bench_read_write_second_whole_struct() {
    let caller = abi(SrwAndSwwAbi, CONTRACT_ID);
    // caller.initialize();
    caller.read_write_second_whole_struct();
    caller.assert(42);
}

#[test]
fn bench_read_write_second_only_field() {
    let caller = abi(SrwAndSwwAbi, CONTRACT_ID);
    // caller.initialize();
    caller.read_write_second_only_field();
    caller.assert(42);
}

#[test]
fn bench_g_roundtrip_baseline() {
    let caller = abi(SrwAndSwwAbi, CONTRACT_ID);
    // caller.initialize();
    caller.assert(0);
}

#[test]
fn bench_g_roundtrip_read_write_second_whole_struct() {
    let caller = abi(SrwAndSwwAbi, CONTRACT_ID);
    // caller.initialize();
    caller.read_write_second_whole_struct_roundtrip();
    caller.assert(0);
}

#[test]
fn bench_g_roundtrip_read_write_second_only_field() {
    let caller = abi(SrwAndSwwAbi, CONTRACT_ID);
    // caller.initialize();
    caller.read_write_second_only_field_roundtrip();
    caller.assert(0);
}