use core::hash::{BuildHasher, Hash};
use hashbrown::hash_map::{HashMap, RawEntryMut};
use std::sync::Arc;

#[derive(Debug, Clone, Default, Hash, PartialEq, Eq)]
pub struct SourceId {
    id: usize,
}

#[derive(Debug, Clone, Default, Hash, PartialEq, Eq)]
pub enum TypeInfo {
    #[default]
    Unknown,
    Never,
    UnknownGeneric {
        is_from_type_parameter: bool,
    },
    Placeholder,
    TypeParam(usize),
    StringSlice,
    StringArray(usize),
    UnsignedInteger(usize),
    Boolean,
    B256,
    Numeric,
    Contract,
    RawUntypedPtr,
    RawUntypedSlice,
}

#[derive(Debug, Default, Clone, Hash, PartialEq, Eq)]
pub struct TypeSourceInfo {
    pub(crate) type_info: Arc<TypeInfo>,
    pub(crate) source_id: Option<SourceId>,
}

fn compute_hash<K: Hash + ?Sized, S: BuildHasher>(hash_builder: &S, key: &K) -> u64 {
    use core::hash::Hasher;
    let mut state = hash_builder.build_hasher();
    key.hash(&mut state);
    state.finish()
}

fn compute_hash_no_heap_alloc_1(type_info: &TypeInfo, source_id: &Option<SourceId>) -> u64 {
    use core::hash::Hasher;
    let map: HashMap<(&TypeInfo, &Option<SourceId>), usize> = HashMap::new();
    
    let mut state = map.hasher().build_hasher();
    let key = (type_info, source_id);
    key.hash(&mut state);
    state.finish()
}

fn compute_hash_no_heap_alloc_2(type_info: &TypeInfo, source_id: &Option<SourceId>) -> u64 {
    use core::hash::Hasher;
    let map: HashMap<(&TypeInfo, &Option<SourceId>), usize> = HashMap::new();
    
    let mut state = map.hasher().build_hasher();
    type_info.hash(&mut state);
    source_id.hash(&mut state);
    state.finish()
}


fn compute_hash_no_heap_alloc_3(type_info: &TypeInfo, source_id: &Option<SourceId>) -> u64 {
    use hashbrown::hash_map::DefaultHashBuilder;
    use core::hash::Hasher;
    let hasher = DefaultHashBuilder::default();
    
    let mut state = hasher.build_hasher();
    type_info.hash(&mut state);
    source_id.hash(&mut state);
    state.finish()
}

fn main() {
    let mut map: HashMap<TypeSourceInfo, usize> = HashMap::new();
    
    for i in 0..20 {
        let key = TypeSourceInfo {
            type_info: Arc::new(TypeInfo::TypeParam(i)),
            source_id: Some(SourceId { id: i * 3 }),
        };
        let hash_0 = compute_hash(map.hasher(), &key);
        println!("{hash_0}");
        
        let hash_1 = compute_hash_no_heap_alloc_1(&TypeInfo::TypeParam(i), &Some(SourceId { id: i * 3 }));
        println!("{hash_1}");

        let hash_2 = compute_hash_no_heap_alloc_2(&TypeInfo::TypeParam(i), &Some(SourceId { id: i * 3 }));
        println!("{hash_2}");
        
        let hash_3 = compute_hash_no_heap_alloc_3(&TypeInfo::TypeParam(i), &Some(SourceId { id: i * 3 }));
        println!("{hash_3}");
        
        assert_eq!(hash_0, hash_1);
        assert_eq!(hash_0, hash_2);
        assert_eq!(hash_0, hash_3);
    
        let entry: RawEntryMut<_, _, _> = map.raw_entry_mut().from_hash(hash_0, |k| k == &key);
        entry.insert(key.clone(), i * 2);
        assert_eq!(map[&key], i * 2);
    }
}

