impl<T> StorageVec<T> {
    const fn init(elements: [T]) -> impl const Fn(StorageKey) -> [StorageConfig<Self, T>] {
        |self_key: StorageKey| {
            let result: [StorageConfig<Self, T>] = [];

            let mut i = 0;
            while i < elements.len() {
                let element_key = Self::element_storage_key(self_key, i);

                result += [StorageConfig::new(element_key, elements[i]];

                i += 1;
            }

            result
        }
    }
}

impl<TStorage> StorageVec<TStorage> where TStorage: Storage {
    const fn init<TConfig, T>(element_configs: [TConfig]) -> impl const Fn(StorageKey) -> [StorageConfig<Self, T>] 
        where TConfig: Fn(StorageKey) -> [StorageConfig<TStorage, T>] 
    {
        |self_key: StorageKey| {
            let result: [StorageConfig<Self, T>] = [];

            let mut i = 0;
            while i < element_configs.len() {
                let element_key = Self::element_storage_key(self_key, i);

                let elements = element_configs[i](element_key).cast::<Self>();

                result += [elements];

                i += 1;
            }

            result
        }
    }
}

impl<TStorage> StorageMap<TKey, TStorage> where TStorage: Storage {
    const fn init<TConfig, T>(element_configs: [(TKey, TConfig)]) -> impl const Fn(StorageKey) -> [StorageConfig<Self, T>] 
        where TConfig: Fn(StorageKey) -> [StorageConfig<TStorage, T>] 
    {
        |self_key: StorageKey| {
            let result: [StorageConfig<Self, T>] = [];

            let mut i = 0;
            while i < element_configs.len() {
                let element_key = Self::value_storage_key(self_key, element_configs[i].0);

                let elements = element_configs[i].1(element_key).cast::<Self, T>();

                result += [elements];

                i += 1;
            }

            result
        }
    }
}

impl<A, B> MyTwoVecStorage<A, B> {
    const fn init(a_elements: [A], b_elements: [B]) -> impl const Fn(StorageKey) -> ([StorageConfig<Self, A>], [StorageConfig<Self, B>]) {
        |self_key: StorageKey| {
            let a_key = StorageKey::new(sha256((self_key, "a")), 0);
            let b_key = StorageKey::new(sha256((self_key, "b")), 0);
            
            (StorageVec<A>::init(a_elements).cast::<Self>(), StorageVec<B>::init(b_elements).cast::<Self>())
        }
    }
}

impl<AStorage, BStorage> MyTwoVecStorage<AStorage, BStorage>
    where AStorage: Storage, BStorage: Storage
{
    const fn init<AConfig, BConfig, A, B>(a_element_configs: [AConfig], b_element_configs: [BConfig]) -> impl const Fn(StorageKey) -> ([StorageConfig<Self, A>], [StorageConfig<Self, B>]) {
        where AConfig: Fn(StorageKey) -> [StorageConfig<AStorage, A>],
              BConfig: Fn(StorageKey) -> [StorageConfig<BStorage, B>] 
        |self_key: StorageKey| {
            let a_key = StorageKey::new(sha256((self_key, "a")), 0);
            let b_key = StorageKey::new(sha256((self_key, "b")), 0);
            
            (StorageVec<AStorage>::init(a_element_configs).cast::<Self>(), StorageVec<BConfig>::init(b_element_configs).cast::<Self>())
        }
    }
}

/* In this case we would also need combinations like <A, BStorage>, <AStroage, B> to be completely user friendly. */