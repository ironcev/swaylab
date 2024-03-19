contract;

pub trait Sequences<TStorage> where TStorage: Storage {
    // Config functions return closures that accespt `StorageKey` and return `StorageConfig`.
    fn arithmetic(first: N, difference: N, n_th: u64) -> impl Fn(StorageKey) -> [StorageConfig<TStorage, N>]
        where N: Add + Mul + PartialOrd + AddNeutral;

    fn geometric(first: N, ratio: N, n_th: u64) -> impl Fn(StorageKey) -> [StorageConfig<TStorage, N>]
        where N: Add + Mul + PartialOrd + AddNeutral;

    /* ... */
}

impl<N> Sequences<StorageVec<N>> for StorageVec<N> where N: Add + Mul + PartialOrd + AddNeutral {
    const fn arithmetic(self_key: StorageKey, first: N, difference: N, n_th: u64) -> impl const Fn(StorageKey) -> [StorageConfig<TStorage, N>]
        where N: Add + Mul + PartialOrd + AddNeutral
    {
        |self_key: StorageKey| {
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
    }

    /* ... */
}