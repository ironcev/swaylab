library;

struct S<T> {
    x: T,
}

#[inline(never)]
pub fn play() {
    let _ = S::<u64> { x: 0u64 };
}

// TypeEngine {
//     slab: ConcurrentSlab {
//         inner: RwLock {
//             data: Inner {
//                 items: [
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Tuple(
//                                 [],
//                             ),
//                             source_id: None,
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: ErrorRecovery(
//                                 ErrorEmitted {
//                                     _priv: (),
//                                 },
//                             ),
//                             source_id: None,
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Never,
//                             source_id: None,
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: StringSlice,
//                             source_id: None,
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: UnsignedInteger(
//                                 Eight,
//                             ),
//                             source_id: None,
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: UnsignedInteger(
//                                 Sixteen,
//                             ),
//                             source_id: None,
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: UnsignedInteger(
//                                 ThirtyTwo,
//                             ),
//                             source_id: None,
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: UnsignedInteger(
//                                 SixtyFour,
//                             ),
//                             source_id: None,
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: UnsignedInteger(
//                                 V256,
//                             ),
//                             source_id: None,
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Boolean,
//                             source_id: None,
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: B256,
//                             source_id: None,
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Contract,
//                             source_id: None,
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: RawUntypedPtr,
//                             source_id: None,
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: RawUntypedSlice,
//                             source_id: None,
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Custom {
//                                 qualified_call_path: QualifiedCallPath {
//                                     call_path: CallPath {
//                                         prefixes: [],
//                                         suffix: T,
//                                         is_absolute: false,
//                                     },
//                                     qualified_path_root: None,
//                                 },
//                                 type_arguments: Some(
//                                     [],
//                                 ),
//                                 root_type_id: None,
//                             },
//                             source_id: Some(
//                                 SourceId {
//                                     id: 1048577,
//                                 },
//                             ),
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Custom {
//                                 qualified_call_path: QualifiedCallPath {
//                                     call_path: CallPath {
//                                         prefixes: [],
//                                         suffix: T,
//                                         is_absolute: false,
//                                     },
//                                     qualified_path_root: None,
//                                 },
//                                 type_arguments: None,
//                                 root_type_id: None,
//                             },
//                             source_id: Some(
//                                 SourceId {
//                                     id: 1048577,
//                                 },
//                             ),
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Struct(
//                                 DeclId(
//                                     1,
//                                 ),
//                             ),
//                             source_id: Some(
//                                 SourceId {
//                                     id: 1048577,
//                                 },
//                             ),
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Unknown,
//                             source_id: None,
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Unknown,
//                             source_id: None,
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Unknown,
//                             source_id: None,
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Unknown,
//                             source_id: None,
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: UnknownGeneric {
//                                 name: T,
//                                 trait_constraints: [],
//                                 parent: None,
//                                 is_from_type_parameter: true,
//                             },
//                             source_id: Some(
//                                 SourceId {
//                                     id: 1048577,
//                                 },
//                             ),
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Unknown,
//                             source_id: None,
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Struct(
//                                 DeclId(
//                                     1,
//                                 ),
//                             ),
//                             source_id: Some(
//                                 SourceId {
//                                     id: 1048577,
//                                 },
//                             ),
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Custom {
//                                 qualified_call_path: QualifiedCallPath {
//                                     call_path: CallPath {
//                                         prefixes: [],
//                                         suffix: S,
//                                         is_absolute: false,
//                                     },
//                                     qualified_path_root: None,
//                                 },
//                                 type_arguments: Some(
//                                     [
//                                         TypeArgument {
//                                             type_id: TypeId(
//                                                 7,
//                                             ),
//                                             initial_type_id: TypeId(
//                                                 7,
//                                             ),
//                                             span: Span {
//                                                 src (ptr): 0x0000607734eb7060,
//                                                 source_id: Some(
//                                                     SourceId {
//                                                         id: 1048577,
//                                                     },
//                                                 ),
//                                                 start: 86,
//                                                 end: 89,
//                                                 as_str(): "u64",
//                                             },
//                                             call_path_tree: Some(
//                                                 CallPathTree {
//                                                     qualified_call_path: QualifiedCallPath {
//                                                         call_path: CallPath {
//                                                             prefixes: [],
//                                                             suffix: u64,
//                                                             is_absolute: false,
//                                                         },
//                                                         qualified_path_root: None,
//                                                     },
//                                                     children: [],
//                                                 },
//                                             ),
//                                         },
//                                     ],
//                                 ),
//                                 root_type_id: None,
//                             },
//                             source_id: Some(
//                                 SourceId {
//                                     id: 1048577,
//                                 },
//                             ),
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Custom {
//                                 qualified_call_path: QualifiedCallPath {
//                                     call_path: CallPath {
//                                         prefixes: [],
//                                         suffix: S,
//                                         is_absolute: false,
//                                     },
//                                     qualified_path_root: None,
//                                 },
//                                 type_arguments: Some(
//                                     [
//                                         TypeArgument {
//                                             type_id: TypeId(
//                                                 7,
//                                             ),
//                                             initial_type_id: TypeId(
//                                                 7,
//                                             ),
//                                             span: Span {
//                                                 src (ptr): 0x0000607734eb7060,
//                                                 source_id: Some(
//                                                     SourceId {
//                                                         id: 1048577,
//                                                     },
//                                                 ),
//                                                 start: 86,
//                                                 end: 89,
//                                                 as_str(): "u64",
//                                             },
//                                             call_path_tree: Some(
//                                                 CallPathTree {
//                                                     qualified_call_path: QualifiedCallPath {
//                                                         call_path: CallPath {
//                                                             prefixes: [],
//                                                             suffix: u64,
//                                                             is_absolute: false,
//                                                         },
//                                                         qualified_path_root: None,
//                                                     },
//                                                     children: [],
//                                                 },
//                                             ),
//                                         },
//                                     ],
//                                 ),
//                                 root_type_id: None,
//                             },
//                             source_id: Some(
//                                 SourceId {
//                                     id: 1048577,
//                                 },
//                             ),
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Unknown,
//                             source_id: None,
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Tuple(
//                                 [],
//                             ),
//                             source_id: Some(
//                                 SourceId {
//                                     id: 1048576,
//                                 },
//                             ),
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Tuple(
//                                 [],
//                             ),
//                             source_id: Some(
//                                 SourceId {
//                                     id: 1048576,
//                                 },
//                             ),
//                         },
//                     ),
//                 ],
//                 free_list: [],
//             },
//         },
//     },
//     unchangeable_types_ids: RwLock {
//         data: {
//             TypeSourceInfo {
//                 type_info: Struct(
//                     DeclId(
//                         1,
//                     ),
//                 ),
//                 source_id: Some(
//                     SourceId {
//                         id: 1048577,
//                     },
//                 ),
//             }: TypeId(
//                 23,
//             ),
//         },
//     },
//     singleton_types: RwLock {
//         data: SingletonTypeSourceInfos {
//             unknown: TypeSourceInfo {
//                 type_info: Unknown,
//                 source_id: None,
//             },
//             numeric: TypeSourceInfo {
//                 type_info: Numeric,
//                 source_id: None,
//             },
//         },
//     },
//     unifications: ConcurrentSlab {
//         inner: RwLock {
//             data: Inner {
//                 items: [
//                     Some(
//                         Unification {
//                             received: TypeId(
//                                 0,
//                             ),
//                             expected: TypeId(
//                                 27,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x0000607734ef4460,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 519,
//                                 end: 532,
//                                 as_str(): "play07C::play",
//                             },
//                             help_text: "Function return type does not match up with local type annotation.",
//                             unify_kind: WithGeneric,
//                         },
//                     ),
//                     Some(
//                         Unification {
//                             received: TypeId(
//                                 0,
//                             ),
//                             expected: TypeId(
//                                 27,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x0000607734ef4460,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 519,
//                                 end: 534,
//                                 as_str(): "play07C::play()",
//                             },
//                             help_text: "",
//                             unify_kind: Default,
//                         },
//                     ),
//                     Some(
//                         Unification {
//                             received: TypeId(
//                                 0,
//                             ),
//                             expected: TypeId(
//                                 28,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x0000607734ef4460,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 519,
//                                 end: 532,
//                                 as_str(): "play07C::play",
//                             },
//                             help_text: "Function return type does not match up with local type annotation.",
//                             unify_kind: WithGeneric,
//                         },
//                     ),
//                     Some(
//                         Unification {
//                             received: TypeId(
//                                 0,
//                             ),
//                             expected: TypeId(
//                                 28,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x0000607734ef4460,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 519,
//                                 end: 534,
//                                 as_str(): "play07C::play()",
//                             },
//                             help_text: "",
//                             unify_kind: Default,
//                         },
//                     ),
//                 ],
//                 free_list: [],
//             },
//         },
//     },
//     last_replace: RwLock {
//         data: Instant {
//             tv_sec: 1403695,
//             tv_nsec: 56833315,
//         },
//     },
//     access_counter: RwLock {
//         data: QndDbgTypeEngineAccessCounter {
//             insert: QndDbgTypesCounter {
//                 unknowns: 0,
//                 nevers: 0,
//                 unknown_generics: 0,
//                 placeholders: 0,
//                 type_params: 0,
//                 string_slices: 0,
//                 string_arrays: 0,
//                 unsigned_integers: 0,
//                 enums: 0,
//                 structs: 0,
//                 booleans: 0,
//                 units: 0,
//                 tuples: 0,
//                 contract_callers: 0,
//                 customs: 0,
//                 b256s: 0,
//                 numerics: 0,
//                 contracts: 0,
//                 error_recoveries: 0,
//                 arrays: 0,
//                 storages: 0,
//                 raw_ptrs: 0,
//                 raw_slices: 0,
//                 ptrs: 0,
//                 slices: 0,
//                 aliases: 0,
//                 trait_types: 0,
//                 refs: 0,
//                 total: 0,
//             },
//             insert_clone_type_info: 0,
//             insert_heap_alloc_type_info: 0,
//             insert_heap_alloc_type_source_info: 0,
//             insert_hashing: 0,
//             new_unknown: 0,
//             new_numeric: 0,
//             new_unknown_generic: 0,
//             new_placeholder: 0,
//             insert_enum: 0,
//             insert_struct: 0,
//             replace: 0,
//             replace_unknown: 0,
//             replace_numeric: 0,
//             replace_unknown_generic: 0,
//             replace_placeholder: 0,
//         },
//     },
// }
