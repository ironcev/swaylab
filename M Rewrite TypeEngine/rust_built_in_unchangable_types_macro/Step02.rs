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

macro_rules! define_non_changeable_built_in_types {
    (@step $_idx:expr,) => {};

    (@step $idx:expr, ($ty_friendly_name:ident, $ty_name:expr), $(($tail_ty_friendly_name:ident, $tail_ty_name:expr),)*) => {
        fn $ty_friendly_name(&self) -> TypeId {
            let _ = $ty_name;
            TypeId($idx)
        }

        define_non_changeable_built_in_types!(@step $idx + 1usize, $(($tail_ty_friendly_name, $tail_ty_name),)*);
    };

    ($(($ty_friendly_name:ident, $ty_name:expr),)*) => {
        define_non_changeable_built_in_types!(@step 0usize, $(($ty_friendly_name, $ty_name),)*);
    }
}

struct S {}

impl S {
    define_non_changeable_built_in_types!(
        (bool, TypeInfo::Boolean),
        (never, TypeInfo::Never),
        (unit, TypeInfo::Tuple(vec![])),
    );
}

