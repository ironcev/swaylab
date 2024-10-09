script;

mod lib_01;
mod lib_02;

pub type ArrayU64 = [u64;3];

fn main() {
    let _: ArrayU64 = [0, 0, 0];
    let _: lib_01::ArrayU64 = [0, 0, 0];
    let _: lib_02::ArrayU64 = [0, 0, 0];
}

// If we have only declarations and no usages, as expected, the alias itself is not inserted into the type engine.

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
//                             type_info: Array(
//                                 TypeArgument {
//                                     type_id: TypeId(
//                                         7,
//                                     ),
//                                     initial_type_id: TypeId(
//                                         7,
//                                     ),
//                                     span: Span {
//                                         src (ptr): 0x00005885b9303770,
//                                         source_id: Some(
//                                             SourceId {
//                                                 id: 1048577,
//                                             },
//                                         ),
//                                         start: 31,
//                                         end: 34,
//                                         as_str(): "u64",
//                                     },
//                                     call_path_tree: Some(
//                                         CallPathTree {
//                                             qualified_call_path: QualifiedCallPath {
//                                                 call_path: CallPath {
//                                                     prefixes: [],
//                                                     suffix: u64,
//                                                     is_absolute: false,
//                                                 },
//                                                 qualified_path_root: None,
//                                             },
//                                             children: [],
//                                         },
//                                     ),
//                                 },
//                                 Length {
//                                     val: 3,
//                                     span: Span {
//                                         src (ptr): 0x00005885b9303770,
//                                         source_id: Some(
//                                             SourceId {
//                                                 id: 1048577,
//                                             },
//                                         ),
//                                         start: 35,
//                                         end: 36,
//                                         as_str(): "3",
//                                     },
//                                 },
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
//                             type_info: Array(
//                                 TypeArgument {
//                                     type_id: TypeId(
//                                         7,
//                                     ),
//                                     initial_type_id: TypeId(
//                                         7,
//                                     ),
//                                     span: Span {
//                                         src (ptr): 0x00005885b930fa00,
//                                         source_id: Some(
//                                             SourceId {
//                                                 id: 1048578,
//                                             },
//                                         ),
//                                         start: 31,
//                                         end: 34,
//                                         as_str(): "u64",
//                                     },
//                                     call_path_tree: Some(
//                                         CallPathTree {
//                                             qualified_call_path: QualifiedCallPath {
//                                                 call_path: CallPath {
//                                                     prefixes: [],
//                                                     suffix: u64,
//                                                     is_absolute: false,
//                                                 },
//                                                 qualified_path_root: None,
//                                             },
//                                             children: [],
//                                         },
//                                     ),
//                                 },
//                                 Length {
//                                     val: 3,
//                                     span: Span {
//                                         src (ptr): 0x00005885b930fa00,
//                                         source_id: Some(
//                                             SourceId {
//                                                 id: 1048578,
//                                             },
//                                         ),
//                                         start: 35,
//                                         end: 36,
//                                         as_str(): "3",
//                                     },
//                                 },
//                             ),
//                             source_id: Some(
//                                 SourceId {
//                                     id: 1048578,
//                                 },
//                             ),
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Array(
//                                 TypeArgument {
//                                     type_id: TypeId(
//                                         7,
//                                     ),
//                                     initial_type_id: TypeId(
//                                         7,
//                                     ),
//                                     span: Span {
//                                         src (ptr): 0x00005885b9385510,
//                                         source_id: Some(
//                                             SourceId {
//                                                 id: 1048576,
//                                             },
//                                         ),
//                                         start: 55,
//                                         end: 58,
//                                         as_str(): "u64",
//                                     },
//                                     call_path_tree: Some(
//                                         CallPathTree {
//                                             qualified_call_path: QualifiedCallPath {
//                                                 call_path: CallPath {
//                                                     prefixes: [],
//                                                     suffix: u64,
//                                                     is_absolute: false,
//                                                 },
//                                                 qualified_path_root: None,
//                                             },
//                                             children: [],
//                                         },
//                                     ),
//                                 },
//                                 Length {
//                                     val: 3,
//                                     span: Span {
//                                         src (ptr): 0x00005885b9385510,
//                                         source_id: Some(
//                                             SourceId {
//                                                 id: 1048576,
//                                             },
//                                         ),
//                                         start: 59,
//                                         end: 60,
//                                         as_str(): "3",
//                                     },
//                                 },
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
//                             type_info: Custom {
//                                 qualified_call_path: QualifiedCallPath {
//                                     call_path: CallPath {
//                                         prefixes: [],
//                                         suffix: ArrayU64,
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
//                                     id: 1048576,
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
//                             type_info: Array(
//                                 TypeArgument {
//                                     type_id: TypeId(
//                                         7,
//                                     ),
//                                     initial_type_id: TypeId(
//                                         7,
//                                     ),
//                                     span: Span {
//                                         src (ptr): 0x00005885b9303770,
//                                         source_id: Some(
//                                             SourceId {
//                                                 id: 1048577,
//                                             },
//                                         ),
//                                         start: 31,
//                                         end: 34,
//                                         as_str(): "u64",
//                                     },
//                                     call_path_tree: Some(
//                                         CallPathTree {
//                                             qualified_call_path: QualifiedCallPath {
//                                                 call_path: CallPath {
//                                                     prefixes: [],
//                                                     suffix: u64,
//                                                     is_absolute: false,
//                                                 },
//                                                 qualified_path_root: None,
//                                             },
//                                             children: [],
//                                         },
//                                     ),
//                                 },
//                                 Length {
//                                     val: 3,
//                                     span: Span {
//                                         src (ptr): 0x00005885b9303770,
//                                         source_id: Some(
//                                             SourceId {
//                                                 id: 1048577,
//                                             },
//                                         ),
//                                         start: 35,
//                                         end: 36,
//                                         as_str(): "3",
//                                     },
//                                 },
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
//                             type_info: Array(
//                                 TypeArgument {
//                                     type_id: TypeId(
//                                         7,
//                                     ),
//                                     initial_type_id: TypeId(
//                                         7,
//                                     ),
//                                     span: Span {
//                                         src (ptr): 0x00005885b930fa00,
//                                         source_id: Some(
//                                             SourceId {
//                                                 id: 1048578,
//                                             },
//                                         ),
//                                         start: 31,
//                                         end: 34,
//                                         as_str(): "u64",
//                                     },
//                                     call_path_tree: Some(
//                                         CallPathTree {
//                                             qualified_call_path: QualifiedCallPath {
//                                                 call_path: CallPath {
//                                                     prefixes: [],
//                                                     suffix: u64,
//                                                     is_absolute: false,
//                                                 },
//                                                 qualified_path_root: None,
//                                             },
//                                             children: [],
//                                         },
//                                     ),
//                                 },
//                                 Length {
//                                     val: 3,
//                                     span: Span {
//                                         src (ptr): 0x00005885b930fa00,
//                                         source_id: Some(
//                                             SourceId {
//                                                 id: 1048578,
//                                             },
//                                         ),
//                                         start: 35,
//                                         end: 36,
//                                         as_str(): "3",
//                                     },
//                                 },
//                             ),
//                             source_id: Some(
//                                 SourceId {
//                                     id: 1048578,
//                                 },
//                             ),
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Array(
//                                 TypeArgument {
//                                     type_id: TypeId(
//                                         7,
//                                     ),
//                                     initial_type_id: TypeId(
//                                         7,
//                                     ),
//                                     span: Span {
//                                         src (ptr): 0x00005885b9385510,
//                                         source_id: Some(
//                                             SourceId {
//                                                 id: 1048576,
//                                             },
//                                         ),
//                                         start: 55,
//                                         end: 58,
//                                         as_str(): "u64",
//                                     },
//                                     call_path_tree: Some(
//                                         CallPathTree {
//                                             qualified_call_path: QualifiedCallPath {
//                                                 call_path: CallPath {
//                                                     prefixes: [],
//                                                     suffix: u64,
//                                                     is_absolute: false,
//                                                 },
//                                                 qualified_path_root: None,
//                                             },
//                                             children: [],
//                                         },
//                                     ),
//                                 },
//                                 Length {
//                                     val: 3,
//                                     span: Span {
//                                         src (ptr): 0x00005885b9385510,
//                                         source_id: Some(
//                                             SourceId {
//                                                 id: 1048576,
//                                             },
//                                         ),
//                                         start: 59,
//                                         end: 60,
//                                         as_str(): "3",
//                                     },
//                                 },
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
//                             type_info: Unknown,
//                             source_id: None,
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Alias {
//                                 name: ArrayU64,
//                                 ty: TypeArgument {
//                                     type_id: TypeId(
//                                         26,
//                                     ),
//                                     initial_type_id: TypeId(
//                                         16,
//                                     ),
//                                     span: Span {
//                                         src (ptr): 0x00005885b9385510,
//                                         source_id: Some(
//                                             SourceId {
//                                                 id: 1048576,
//                                             },
//                                         ),
//                                         start: 54,
//                                         end: 61,
//                                         as_str(): "[u64;3]",
//                                     },
//                                     call_path_tree: None,
//                                 },
//                             },
//                             source_id: Some(
//                                 SourceId {
//                                     id: 1048576,
//                                 },
//                             ),
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Numeric,
//                             source_id: Some(
//                                 SourceId {
//                                     id: 1048576,
//                                 },
//                             ),
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Numeric,
//                             source_id: None,
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: UnsignedInteger(
//                                 SixtyFour,
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
//                             type_info: Numeric,
//                             source_id: Some(
//                                 SourceId {
//                                     id: 1048576,
//                                 },
//                             ),
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Numeric,
//                             source_id: None,
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Numeric,
//                             source_id: None,
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Numeric,
//                             source_id: Some(
//                                 SourceId {
//                                     id: 1048576,
//                                 },
//                             ),
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Numeric,
//                             source_id: None,
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Numeric,
//                             source_id: None,
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Array(
//                                 TypeArgument {
//                                     type_id: TypeId(
//                                         31,
//                                     ),
//                                     initial_type_id: TypeId(
//                                         31,
//                                     ),
//                                     span: Span {
//                                         src (ptr): 0x00005885b9308fd0,
//                                         source_id: None,
//                                         start: 0,
//                                         end: 0,
//                                         as_str(): "",
//                                     },
//                                     call_path_tree: None,
//                                 },
//                                 Length {
//                                     val: 3,
//                                     span: Span {
//                                         src (ptr): 0x00005885b9308fd0,
//                                         source_id: None,
//                                         start: 0,
//                                         end: 0,
//                                         as_str(): "",
//                                     },
//                                 },
//                             ),
//                             source_id: Some(
//                                 SourceId {
//                                     id: 0,
//                                 },
//                             ),
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Array(
//                                 TypeArgument {
//                                     type_id: TypeId(
//                                         31,
//                                     ),
//                                     initial_type_id: TypeId(
//                                         31,
//                                     ),
//                                     span: Span {
//                                         src (ptr): 0x00005885b9308fd0,
//                                         source_id: None,
//                                         start: 0,
//                                         end: 0,
//                                         as_str(): "",
//                                     },
//                                     call_path_tree: None,
//                                 },
//                                 Length {
//                                     val: 3,
//                                     span: Span {
//                                         src (ptr): 0x00005885b9308fd0,
//                                         source_id: None,
//                                         start: 0,
//                                         end: 0,
//                                         as_str(): "",
//                                     },
//                                 },
//                             ),
//                             source_id: Some(
//                                 SourceId {
//                                     id: 0,
//                                 },
//                             ),
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Alias {
//                                 name: ArrayU64,
//                                 ty: TypeArgument {
//                                     type_id: TypeId(
//                                         26,
//                                     ),
//                                     initial_type_id: TypeId(
//                                         16,
//                                     ),
//                                     span: Span {
//                                         src (ptr): 0x00005885b9385510,
//                                         source_id: Some(
//                                             SourceId {
//                                                 id: 1048576,
//                                             },
//                                         ),
//                                         start: 54,
//                                         end: 61,
//                                         as_str(): "[u64;3]",
//                                     },
//                                     call_path_tree: None,
//                                 },
//                             },
//                             source_id: Some(
//                                 SourceId {
//                                     id: 1048576,
//                                 },
//                             ),
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Numeric,
//                             source_id: Some(
//                                 SourceId {
//                                     id: 1048576,
//                                 },
//                             ),
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Numeric,
//                             source_id: None,
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: UnsignedInteger(
//                                 SixtyFour,
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
//                             type_info: Numeric,
//                             source_id: Some(
//                                 SourceId {
//                                     id: 1048576,
//                                 },
//                             ),
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Numeric,
//                             source_id: None,
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: UnsignedInteger(
//                                 SixtyFour,
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
//                             type_info: Numeric,
//                             source_id: Some(
//                                 SourceId {
//                                     id: 1048576,
//                                 },
//                             ),
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Numeric,
//                             source_id: None,
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: UnsignedInteger(
//                                 SixtyFour,
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
//                             type_info: Array(
//                                 TypeArgument {
//                                     type_id: TypeId(
//                                         43,
//                                     ),
//                                     initial_type_id: TypeId(
//                                         43,
//                                     ),
//                                     span: Span {
//                                         src (ptr): 0x00005885b9308fd0,
//                                         source_id: None,
//                                         start: 0,
//                                         end: 0,
//                                         as_str(): "",
//                                     },
//                                     call_path_tree: None,
//                                 },
//                                 Length {
//                                     val: 3,
//                                     span: Span {
//                                         src (ptr): 0x00005885b9308fd0,
//                                         source_id: None,
//                                         start: 0,
//                                         end: 0,
//                                         as_str(): "",
//                                     },
//                                 },
//                             ),
//                             source_id: Some(
//                                 SourceId {
//                                     id: 0,
//                                 },
//                             ),
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Array(
//                                 TypeArgument {
//                                     type_id: TypeId(
//                                         43,
//                                     ),
//                                     initial_type_id: TypeId(
//                                         43,
//                                     ),
//                                     span: Span {
//                                         src (ptr): 0x00005885b9308fd0,
//                                         source_id: None,
//                                         start: 0,
//                                         end: 0,
//                                         as_str(): "",
//                                     },
//                                     call_path_tree: None,
//                                 },
//                                 Length {
//                                     val: 3,
//                                     span: Span {
//                                         src (ptr): 0x00005885b9308fd0,
//                                         source_id: None,
//                                         start: 0,
//                                         end: 0,
//                                         as_str(): "",
//                                     },
//                                 },
//                             ),
//                             source_id: Some(
//                                 SourceId {
//                                     id: 0,
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
//         data: {},
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
//                                 30,
//                             ),
//                             expected: TypeId(
//                                 29,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x00005885b9385510,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 99,
//                                 end: 100,
//                                 as_str(): "0",
//                             },
//                             help_text: "",
//                             unify_kind: Default,
//                         },
//                     ),
//                     Some(
//                         Unification {
//                             received: TypeId(
//                                 33,
//                             ),
//                             expected: TypeId(
//                                 32,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x00005885b9385510,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 102,
//                                 end: 103,
//                                 as_str(): "0",
//                             },
//                             help_text: "",
//                             unify_kind: Default,
//                         },
//                     ),
//                     Some(
//                         Unification {
//                             received: TypeId(
//                                 36,
//                             ),
//                             expected: TypeId(
//                                 35,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x00005885b9385510,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 105,
//                                 end: 106,
//                                 as_str(): "0",
//                             },
//                             help_text: "",
//                             unify_kind: Default,
//                         },
//                     ),
//                     Some(
//                         Unification {
//                             received: TypeId(
//                                 38,
//                             ),
//                             expected: TypeId(
//                                 28,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x00005885b9385510,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 98,
//                                 end: 107,
//                                 as_str(): "[0, 0, 0]",
//                             },
//                             help_text: "Variable declaration's type annotation does not match up with the assigned expression's type.",
//                             unify_kind: Default,
//                         },
//                     ),
//                     Some(
//                         Unification {
//                             received: TypeId(
//                                 42,
//                             ),
//                             expected: TypeId(
//                                 41,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x00005885b9385510,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 99,
//                                 end: 100,
//                                 as_str(): "0",
//                             },
//                             help_text: "",
//                             unify_kind: Default,
//                         },
//                     ),
//                     Some(
//                         Unification {
//                             received: TypeId(
//                                 45,
//                             ),
//                             expected: TypeId(
//                                 44,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x00005885b9385510,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 102,
//                                 end: 103,
//                                 as_str(): "0",
//                             },
//                             help_text: "",
//                             unify_kind: Default,
//                         },
//                     ),
//                     Some(
//                         Unification {
//                             received: TypeId(
//                                 48,
//                             ),
//                             expected: TypeId(
//                                 47,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x00005885b9385510,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 105,
//                                 end: 106,
//                                 as_str(): "0",
//                             },
//                             help_text: "",
//                             unify_kind: Default,
//                         },
//                     ),
//                     Some(
//                         Unification {
//                             received: TypeId(
//                                 50,
//                             ),
//                             expected: TypeId(
//                                 40,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x00005885b9385510,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 98,
//                                 end: 107,
//                                 as_str(): "[0, 0, 0]",
//                             },
//                             help_text: "Variable declaration's type annotation does not match up with the assigned expression's type.",
//                             unify_kind: Default,
//                         },
//                     ),
//                     Some(
//                         Unification {
//                             received: TypeId(
//                                 51,
//                             ),
//                             expected: TypeId(
//                                 39,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x00005885b9385510,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 84,
//                                 end: 85,
//                                 as_str(): "_",
//                             },
//                             help_text: "",
//                             unify_kind: Default,
//                         },
//                     ),
//                     Some(
//                         Unification {
//                             received: TypeId(
//                                 43,
//                             ),
//                             expected: TypeId(
//                                 43,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x00005885b9385510,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 99,
//                                 end: 100,
//                                 as_str(): "0",
//                             },
//                             help_text: "",
//                             unify_kind: Default,
//                         },
//                     ),
//                     Some(
//                         Unification {
//                             received: TypeId(
//                                 46,
//                             ),
//                             expected: TypeId(
//                                 43,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x00005885b9385510,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 102,
//                                 end: 103,
//                                 as_str(): "0",
//                             },
//                             help_text: "",
//                             unify_kind: Default,
//                         },
//                     ),
//                     Some(
//                         Unification {
//                             received: TypeId(
//                                 49,
//                             ),
//                             expected: TypeId(
//                                 43,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x00005885b9385510,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 105,
//                                 end: 106,
//                                 as_str(): "0",
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
//             tv_sec: 1475925,
//             tv_nsec: 32389969,
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
