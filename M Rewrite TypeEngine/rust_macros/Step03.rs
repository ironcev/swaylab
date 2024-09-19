use std::sync::Arc;

pub struct SourceId {
    id: u32,
}

pub struct TypeSourceInfo {
    pub(crate) type_info: Arc<TypeInfo>,
    pub(crate) source_id: Option<SourceId>,
}

pub enum IntegerBits {
    Eight,
    Sixteen,
    ThirtyTwo,
    SixtyFour,
    V256,
}

pub enum TypeInfo {
    Unknown,
    Never,
    UnknownGeneric {},
    Placeholder(),
    TypeParam(usize),
    StringSlice,
    StringArray(usize),
    UnsignedInteger(IntegerBits),
    Enum,
    Struct,
    Boolean,
    Tuple(Vec<usize>),
    ContractCaller {},
    Custom {},
    B256,
    Numeric,
    Contract,
    ErrorRecovery,
    Array,
    Storage {},
    RawUntypedPtr,
    RawUntypedSlice,
    Ptr(usize),
    Slice(usize),
    Alias {    },
    TraitType {    },
    Ref {    },
}

pub struct TypeId(usize);

macro_rules! define_unchangeable_built_in_types_methods {
    (@step $_idx:expr,) => {};

    (@step $idx:expr, ($fn_name:ident, $ti:expr), $(($tail_fn_name:ident, $tail_ti:expr),)*) => {
        pub fn $fn_name(&self) -> TypeId {
            TypeId($idx)
        }

        define_unchangeable_built_in_types_methods!(@step $idx + 1, $(($tail_fn_name, $tail_ti),)*);
    };

    ($(($fn_name:ident, $ti:expr),)*) => {
        pub fn type_id_of_unit(&self) -> TypeId {
            TypeId(0)
        }
    
        define_unchangeable_built_in_types_methods!(@step 1, $(($fn_name, $ti),)*);
        
        fn insert_unchangeable_built_in_types(&mut self) {
            let tsi = TypeSourceInfo {
                type_info: TypeInfo::Tuple(vec![]).into(),
                source_id: None,
            };
            self.slab.push(tsi);
            
            $(
                let tsi = TypeSourceInfo {
                    type_info: $ti.into(),
                    source_id: None,
                };
                self.slab.push(tsi);
            )*
        }

        /// Returns the [TypeId] of the `type_info` only if the type info is
        /// an unchangeable built-in type, otherwise `None`.
        fn get_unchangeable_built_in_type_id(&self, type_info: &TypeInfo) -> Option<TypeId> {
            match type_info {
                TypeInfo::Tuple(v) if v.is_empty() => Some(self.type_id_of_unit()),
                $(
                    $ti => Some(self.$fn_name()),
                )*
                _ => None
            }
        }
    }
}

struct S {
    slab: Vec<TypeSourceInfo>,
}

impl S {
    define_unchangeable_built_in_types_methods!(
        (type_id_of_bool, TypeInfo::Boolean),
        (type_id_of_u8, TypeInfo::UnsignedInteger(IntegerBits::Eight)),
        (type_id_of_u16, TypeInfo::UnsignedInteger(IntegerBits::Sixteen)),
        (type_id_of_never, TypeInfo::Never),
    );
}

