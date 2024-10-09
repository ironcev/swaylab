// Add to `forc-pkg/src/pkg.rs`. Line ~1825.
engines.te().qnd_dbg_type_engine_statistics();


// Add to `sway-core/src/type_system/engine.rs`.
access_counter: RwLock<QndDbgTypeEngineAccessCounter>,
access_counter: RwLock::new(QndDbgTypeEngineAccessCounter::default()),
access_counter: RwLock::new(self.access_counter.read().clone()),


#[derive(Default, Debug, Clone)]
struct QndDbgTypeEngineAccessCounter {
    insert: QndDbgTypesCounter,
    insert_clone_type_info: usize,
    insert_heap_alloc_type_info: usize,
    insert_heap_alloc_type_source_info: usize,
    insert_hashing: usize,
    new_unknown: usize,
    new_numeric: usize,
    new_unknown_generic: usize,
    new_placeholder: usize,
    insert_enum: usize,
    insert_struct: usize,
    insert_tuple: usize,
    insert_array: usize,
    insert_string_array: usize,
    new_contract_caller: usize,
    new_alias: usize,
    new_custom: usize,
    insert_slice: usize,
    insert_ptr: usize,
    insert_ref: usize,
    insert_trait_type: usize,
    replace: usize,
    replace_unknown: usize,
    replace_numeric: usize,
    replace_unknown_generic: usize,
    replace_placeholder: usize,
}

impl QndDbgTypeEngineAccessCounter {
    pub fn inc_insert(&mut self, ti: &TypeInfo) {
        self.insert.inc(ti);
    }

    pub fn inc_insert_clone_type_info(&mut self) {
        self.insert_clone_type_info += 1;
    }

    pub fn inc_insert_heap_alloc_type_info(&mut self) {
        self.insert_heap_alloc_type_info += 1;
    }

    pub fn inc_insert_heap_alloc_type_source_info(&mut self) {
        self.insert_heap_alloc_type_source_info += 1;
    }

    pub fn inc_insert_hashing(&mut self) {
        self.insert_hashing += 1;
    }

    pub fn inc_new(&mut self, ti: &TypeInfo) {
        match ti {
            TypeInfo::Unknown => self.new_unknown += 1,
            TypeInfo::Numeric => self.new_numeric += 1,
            TypeInfo::UnknownGeneric { .. } => self.new_unknown_generic += 1,
            TypeInfo::Placeholder(_) => self.new_placeholder += 1,
            _ => (),
        }
    }

    pub fn inc_insert_enum(&mut self) {
        self.insert_enum += 1;
    }

    pub fn inc_insert_struct(&mut self) {
        self.insert_struct += 1;
    }

    pub fn inc_insert_tuple(&mut self) {
        self.insert_tuple += 1;
    }

    pub fn inc_insert_array(&mut self) {
        self.insert_array += 1;
    }

    pub fn inc_insert_string_array(&mut self) {
        self.insert_string_array += 1;
    }

    pub fn inc_new_contract_caller(&mut self) {
        self.new_contract_caller += 1;
    }

    pub fn inc_new_alias(&mut self) {
        self.new_alias += 1;
    }

    pub fn inc_new_custom(&mut self) {
        self.new_custom += 1;
    }

    pub fn inc_insert_slice(&mut self) {
        self.insert_slice += 1;
    }

    pub fn inc_insert_ptr(&mut self) {
        self.insert_ptr += 1;
    }

    pub fn inc_insert_ref(&mut self) {
        self.insert_ref += 1;
    }

    pub fn inc_insert_trait_type(&mut self) {
        self.insert_trait_type += 1;
    }

    pub fn inc_replace(&mut self, replaced_ti: &TypeInfo) {
        self.replace += 1;
        match replaced_ti {
            TypeInfo::Unknown => self.replace_unknown += 1,
            TypeInfo::Numeric => self.replace_numeric += 1,
            TypeInfo::UnknownGeneric { .. } => self.replace_unknown_generic += 1,
            TypeInfo::Placeholder(_) => self.replace_placeholder += 1,
            _ => (),
        }
    }

    pub fn print_counters(&self) {
        println!("Type engine access:");
        println!("    insert():                {:>8}", self.insert.total);
        println!("        Clone TypeInfo:            {:>8}", self.insert_clone_type_info);
        println!("        Heap-alloc TypeInfo:       {:>8}", self.insert_heap_alloc_type_info);
        println!("        Heap-alloc TypeSourceInfo: {:>8}", self.insert_heap_alloc_type_source_info);
        println!("        Hash calculation:          {:>8}", self.insert_hashing);
        println!("        --------------------------");
        self.insert.print_counters(8);
        println!("    new_unknown():           {:>8}", self.new_unknown);
        println!("    new_numeric():           {:>8}", self.new_numeric);
        println!("    new_unknown_generic():   {:>8}", self.new_unknown_generic);
        println!("    new_placeholder():       {:>8}", self.new_placeholder);
        println!();
        println!("    new_contract_caller():   {:>8}", self.new_contract_caller);
        println!("    new_alias():             {:>8}", self.new_alias);
        println!("    new_custom():            {:>8}", self.new_custom);
        println!();
        println!("    insert_enum():           {:>8}", self.insert_enum);
        println!("    insert_struct():         {:>8}", self.insert_struct);
        println!("    insert_tuple():          {:>8}", self.insert_tuple);
        println!("    insert_array():          {:>8}", self.insert_array);
        println!("    insert_string_array():   {:>8}", self.insert_string_array);
        println!("    insert_slice():          {:>8}", self.insert_slice);
        println!("    insert_ptr():            {:>8}", self.insert_ptr);
        println!("    insert_ref():            {:>8}", self.insert_ref);
        println!("    insert_trait_type():     {:>8}", self.insert_trait_type);
        println!();
        println!("    replace():               {:>8}", self.replace);
        println!("        {:20}: {:>8}", "Unknowns", self.replace_unknown);
        println!("        {:20}: {:>8}", "Numerics", self.replace_numeric);
        println!("        {:20}: {:>8}", "Unknown generics", self.replace_unknown_generic);
        println!("        {:20}: {:>8}", "Placeholders", self.replace_placeholder);
    }
}

#[derive(Default, Debug, Clone)]
struct QndDbgTypesCounter {
    unknowns: usize,
    nevers: usize,
    unknown_generics: usize,
    placeholders: usize,
    type_params: usize,
    string_slices: usize,
    string_arrays: usize,
    unsigned_integers: usize,
    enums: usize,
    structs: usize,
    booleans: usize,
    units: usize,
    tuples: usize,
    contract_callers: usize,
    customs: usize,
    b256s: usize,
    numerics: usize,
    contracts: usize,
    error_recoveries: usize,
    arrays: usize,
    storages: usize,
    raw_ptrs: usize,
    raw_slices: usize,
    ptrs: usize,
    slices: usize,
    aliases: usize,
    trait_types: usize,
    refs: usize,
    total: usize,
}

impl QndDbgTypesCounter {
    fn inc(&mut self, ti: &TypeInfo) {
        self.total += 1;
        match ti {
            TypeInfo::Unknown => self.unknowns += 1,
            TypeInfo::Never => self.nevers += 1,
            TypeInfo::UnknownGeneric { .. } => self.unknown_generics += 1,
            TypeInfo::Placeholder(_) => self.placeholders += 1,
            TypeInfo::TypeParam(_) => self.type_params += 1,
            TypeInfo::StringSlice => self.string_slices += 1,
            TypeInfo::StringArray(_) => self.string_arrays += 1,
            TypeInfo::UnsignedInteger(_) => self.unsigned_integers += 1,
            TypeInfo::Enum(_) => self.enums += 1,
            TypeInfo::Struct(_) => self.structs += 1,
            TypeInfo::Boolean => self.booleans += 1,
            TypeInfo::Tuple(v) if v.is_empty() => self.units += 1,
            TypeInfo::Tuple(_) => self.tuples += 1,
            TypeInfo::ContractCaller { .. } => self.contract_callers += 1,
            TypeInfo::Custom { .. } => self.customs += 1,
            TypeInfo::B256 => self.b256s += 1,
            TypeInfo::Numeric => self.numerics += 1,
            TypeInfo::Contract => self.contracts += 1,
            TypeInfo::ErrorRecovery(_) => self.error_recoveries += 1,
            TypeInfo::Array(_, _) => self.arrays += 1,
            TypeInfo::RawUntypedPtr => self.raw_ptrs += 1,
            TypeInfo::RawUntypedSlice => self.raw_slices += 1,
            TypeInfo::Ptr(_) => self.ptrs += 1,
            TypeInfo::Slice(_) => self.slices += 1,
            TypeInfo::Alias { .. } => self.aliases += 1,
            TypeInfo::TraitType { .. } => self.trait_types += 1,
            TypeInfo::Ref { .. } => self.refs += 1,
        }
    }

    fn print_counters(&self, indent: usize) {
        print_counter(indent, "Unknowns", self.unknowns);
        print_counter(indent, "Nevers", self.nevers);
        print_counter(indent, "Unknown generics", self.unknown_generics);
        print_counter(indent, "Placeholders", self.placeholders);
        print_counter(indent, "Type parameters", self.type_params);
        print_counter(indent, "String slices", self.string_slices);
        print_counter(indent, "String arrays", self.string_arrays);
        print_counter(indent, "Unsigned integers", self.unsigned_integers);
        print_counter(indent, "Enums", self.enums);
        print_counter(indent, "Structs", self.structs);
        print_counter(indent, "Booleans", self.booleans);
        print_counter(indent, "Units", self.units);
        print_counter(indent, "Tuples", self.tuples);
        print_counter(indent, "Contract callers", self.contract_callers);
        print_counter(indent, "Customs", self.customs);
        print_counter(indent, "B256s", self.b256s);
        print_counter(indent, "Numerics", self.numerics);
        print_counter(indent, "Contracts", self.contracts);
        print_counter(indent, "Error recoveries", self.error_recoveries);
        print_counter(indent, "Arrays", self.arrays);
        print_counter(indent, "Storages", self.storages);
        print_counter(indent, "Raw pointers", self.raw_ptrs);
        print_counter(indent, "Raw slices", self.raw_slices);
        print_counter(indent, "Pointers", self.ptrs);
        print_counter(indent, "Aliases", self.aliases);
        print_counter(indent, "Trait types", self.trait_types);
        print_counter(indent, "References", self.refs);

        fn print_counter(indent: usize, type_name: &str, value: usize) {
            if value > 0 {
                println!("{:indent$}{type_name:20}: {:>8}", "", value);
            }
        }
    }
}

impl ConcurrentSlab<TypeSourceInfo> {
    pub fn qnd_dbg_concurrent_slab_statistics(&self) {
        let inner = self.inner.read();
        println!("Concurrent slab:");
        println!("    Length:            {:>8}", self.len());
        println!("    Capacity:          {:>8}", inner.items.capacity());
        println!("    Free slots:        {:>8}", inner.free_list.len());
        let types_with_source_id = inner.items.iter().flatten().fold(0, |sum, ti| if ti.source_id.is_some() { sum + 1 } else { sum });
        println!("    With source id:    {types_with_source_id:>8}");
        println!("    Without source id: {:>8}", self.len() - types_with_source_id);
    }
}

impl TypeEngine {
    pub fn qnd_dbg_type_engine_statistics(&self) {
        // Concurrent slab statistics.
        self.slab.qnd_dbg_concurrent_slab_statistics();

        println!();

        // Hash map statistics.
        let shareable_types = self.shareable_types.read();
        println!("Hash map content      : {:>8} types", shareable_types.len());
        println!("    Length            : {:>8}", shareable_types.len());
        println!("    Capacity          : {:>8}", shareable_types.capacity());
        let types_with_source_id = shareable_types.keys().fold(0, |sum, ti| if ti.source_id.is_some() { sum + 1 } else { sum });
        println!("    With source id    : {types_with_source_id:>8}");
        println!("    Without source id : {:>8}", shareable_types.len() - types_with_source_id);
        println!("    -------------------");

        let mut counter = QndDbgTypesCounter::default();
        for val in shareable_types.keys() {
            counter.inc(&val.type_info);
        }
        counter.print_counters(4);

        println!();

        // Type engine content statistics.
        let mut counter = QndDbgTypesCounter::default();
        for val in self.slab.values() {
            counter.inc(&val.type_info);
        }
        println!("Type engine content     : {:>8} types", counter.total);
        counter.print_counters(4);

        println!();

        // Type engine access statistics.
        self.access_counter.read().print_counters();

        println!();
    }
}


self.access_counter.write().inc_new(&self.singleton_types.read().unknown.type_info);
self.access_counter.write().inc_new(&self.singleton_types.read().numeric.type_info);
self.access_counter.write().inc_new(&tsi.type_info);
self.access_counter.write().inc_insert_enum();
self.access_counter.write().inc_insert(&ty);
self.access_counter.write().inc_insert_heap_alloc_type_source_info();
self.access_counter.write().inc_insert_hashing();
self.access_counter.write().inc_replace(&type_source_info.type_info);

