contract;

pub trait Sequences<TStorage> where TStorage: Storage {
    /// {first, first + difference, first + 2*difference, first + 3*difference, ..., first + (n_th - 1)*difference }
    fn arithmetic(self_key: StorageKey, first: N, difference: N, n_th: u64) -> [StorageConfig<TStorage, N>]
        // `n_th` could also be generic with proper constraints...
        // Ok, we actually only need Add trait for this :-)
        where N: Add + Mul + PartialOrd + AddNeutral; // General remark: We will need Traits like AddNeutral, MulNutral, if we ever want to do generic math.

    /// {first, first*ratio, first*ratio^2, first*ratio^3, ..., frist*ration^(n_th - 1) }
    fn geometric(self_key: StorageKey, first: N, ratio: N, n_th: u64) -> [StorageConfig<TStorage, N>]
        where N: Add + Mul + PartialOrd + AddNeutral;

    /* ... */
}

impl<N> Sequences<StorageVec<N>> for StorageVec<N> where N: Add + Mul + PartialOrd + AddNeutral {
    const fn arithmetic(self_key: StorageKey, first: N, difference: N, n_th: u64) -> [StorageConfig<Self, N>]
        where N: Add + Mul + PartialOrd + AddNeutral
    {
        let result: [StorageConfig<Self, N>] = [];

        let mut element = first;
        let mut i = 0;
        while i < n_th {
            let element_key = Self::element_storage_key(self_key, i);

            result += [StorageConfig::new(element_key, element)];

            element += difference;

            i += 1;
        }

        result
    }

    /* ... */
}

impl<N> Sequences<StorageMap<u64, N>> for StorageMap<TKey, N> where N: Add + Mul + PartialOrd + AddNeutral {
    const fn arithmetic(self_key: StorageKey, first: N, difference: N, n_th: u64) -> [StorageConfig<Self, N>]
        where N: Add + Mul + PartialOrd + AddNeutral,
              TKey: Add + Mul + PartialOrd + AddNeutral
    {
        let result: [StorageConfig<Self, N>] = [];

        let mut element = first;
        let mut i = TKey::neutral();
        while i < n_th {
            let element_key = Self::value_storage_key(self_key, i);

            result += [StorageConfig::new(element_key, element)];

            element += difference;

            i += 1;
        }

        result
    }

    /* ... */
}

storage {
    vec_01: StorageVec<u8> := StorageVec::arithmetic(self_key, 0, 1, 100),
    vec_02: StorageVec<u32> := StorageVec::geometric(self_key, 1, 2, 10),
    map_01: StorageMap<u64, u256> := StorageVec::geometric(self_key, 2, 3, 10),
}

fn main() {
    let fifth_element_of_the_sequence = storage.map_01.get(5).read();
}