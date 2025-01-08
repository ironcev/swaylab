library;

struct S<A, B> {
    x: (A, B)
}

#[inline(never)]
pub fn play() {
    let _: S::<u64, u8> = S { x: (0, 0) };
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
//                                         suffix: A,
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
//                                         suffix: B,
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
//                             type_info: Tuple(
//                                 [
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             14,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             14,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005643b943c0a0,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 35,
//                                             end: 36,
//                                             as_str(): "A",
//                                         },
//                                         call_path_tree: Some(
//                                             CallPathTree {
//                                                 qualified_call_path: QualifiedCallPath {
//                                                     call_path: CallPath {
//                                                         prefixes: [],
//                                                         suffix: A,
//                                                         is_absolute: false,
//                                                     },
//                                                     qualified_path_root: None,
//                                                 },
//                                                 children: [],
//                                             },
//                                         ),
//                                     },
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             15,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             15,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005643b943c0a0,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 38,
//                                             end: 39,
//                                             as_str(): "B",
//                                         },
//                                         call_path_tree: Some(
//                                             CallPathTree {
//                                                 qualified_call_path: QualifiedCallPath {
//                                                     call_path: CallPath {
//                                                         prefixes: [],
//                                                         suffix: B,
//                                                         is_absolute: false,
//                                                     },
//                                                     qualified_path_root: None,
//                                                 },
//                                                 children: [],
//                                             },
//                                         ),
//                                     },
//                                 ],
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
//                                         suffix: A,
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
//                             type_info: Custom {
//                                 qualified_call_path: QualifiedCallPath {
//                                     call_path: CallPath {
//                                         prefixes: [],
//                                         suffix: B,
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
//                                                 src (ptr): 0x00005643b943c0a0,
//                                                 source_id: Some(
//                                                     SourceId {
//                                                         id: 1048577,
//                                                     },
//                                                 ),
//                                                 start: 92,
//                                                 end: 95,
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
//                                         TypeArgument {
//                                             type_id: TypeId(
//                                                 4,
//                                             ),
//                                             initial_type_id: TypeId(
//                                                 4,
//                                             ),
//                                             span: Span {
//                                                 src (ptr): 0x00005643b943c0a0,
//                                                 source_id: Some(
//                                                     SourceId {
//                                                         id: 1048577,
//                                                     },
//                                                 ),
//                                                 start: 97,
//                                                 end: 99,
//                                                 as_str(): "u8",
//                                             },
//                                             call_path_tree: Some(
//                                                 CallPathTree {
//                                                     qualified_call_path: QualifiedCallPath {
//                                                         call_path: CallPath {
//                                                             prefixes: [],
//                                                             suffix: u8,
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
//                                 name: A,
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
//                             type_info: UnknownGeneric {
//                                 name: B,
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
//                             type_info: Tuple(
//                                 [
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             24,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             14,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005643b943c0a0,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 35,
//                                             end: 36,
//                                             as_str(): "A",
//                                         },
//                                         call_path_tree: Some(
//                                             CallPathTree {
//                                                 qualified_call_path: QualifiedCallPath {
//                                                     call_path: CallPath {
//                                                         prefixes: [],
//                                                         suffix: A,
//                                                         is_absolute: false,
//                                                     },
//                                                     qualified_path_root: None,
//                                                 },
//                                                 children: [],
//                                             },
//                                         ),
//                                     },
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             25,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             15,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005643b943c0a0,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 38,
//                                             end: 39,
//                                             as_str(): "B",
//                                         },
//                                         call_path_tree: Some(
//                                             CallPathTree {
//                                                 qualified_call_path: QualifiedCallPath {
//                                                     call_path: CallPath {
//                                                         prefixes: [],
//                                                         suffix: B,
//                                                         is_absolute: false,
//                                                     },
//                                                     qualified_path_root: None,
//                                                 },
//                                                 children: [],
//                                             },
//                                         ),
//                                     },
//                                 ],
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
//                             type_info: Tuple(
//                                 [
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             7,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             14,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005643b943c0a0,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 35,
//                                             end: 36,
//                                             as_str(): "A",
//                                         },
//                                         call_path_tree: Some(
//                                             CallPathTree {
//                                                 qualified_call_path: QualifiedCallPath {
//                                                     call_path: CallPath {
//                                                         prefixes: [],
//                                                         suffix: A,
//                                                         is_absolute: false,
//                                                     },
//                                                     qualified_path_root: None,
//                                                 },
//                                                 children: [],
//                                             },
//                                         ),
//                                     },
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             4,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             15,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005643b943c0a0,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 38,
//                                             end: 39,
//                                             as_str(): "B",
//                                         },
//                                         call_path_tree: Some(
//                                             CallPathTree {
//                                                 qualified_call_path: QualifiedCallPath {
//                                                     call_path: CallPath {
//                                                         prefixes: [],
//                                                         suffix: B,
//                                                         is_absolute: false,
//                                                     },
//                                                     qualified_path_root: None,
//                                                 },
//                                                 children: [],
//                                             },
//                                         ),
//                                     },
//                                 ],
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
//                             type_info: Placeholder(
//                                 TypeParameter {
//                                     type_id: TypeId(
//                                         24,
//                                     ),
//                                     initial_type_id: TypeId(
//                                         17,
//                                     ),
//                                     name_ident: A,
//                                     trait_constraints: [],
//                                     trait_constraints_span: Span {
//                                         src (ptr): 0x00005643b93b0ca0,
//                                         source_id: None,
//                                         start: 0,
//                                         end: 0,
//                                         as_str(): "",
//                                     },
//                                     is_from_parent: false,
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
//                             type_info: Placeholder(
//                                 TypeParameter {
//                                     type_id: TypeId(
//                                         25,
//                                     ),
//                                     initial_type_id: TypeId(
//                                         18,
//                                     ),
//                                     name_ident: B,
//                                     trait_constraints: [],
//                                     trait_constraints_span: Span {
//                                         src (ptr): 0x00005643b93b0ca0,
//                                         source_id: None,
//                                         start: 0,
//                                         end: 0,
//                                         as_str(): "",
//                                     },
//                                     is_from_parent: false,
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
//                             type_info: Tuple(
//                                 [
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             30,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             14,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005643b943c0a0,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 35,
//                                             end: 36,
//                                             as_str(): "A",
//                                         },
//                                         call_path_tree: Some(
//                                             CallPathTree {
//                                                 qualified_call_path: QualifiedCallPath {
//                                                     call_path: CallPath {
//                                                         prefixes: [],
//                                                         suffix: A,
//                                                         is_absolute: false,
//                                                     },
//                                                     qualified_path_root: None,
//                                                 },
//                                                 children: [],
//                                             },
//                                         ),
//                                     },
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             31,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             15,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005643b943c0a0,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 38,
//                                             end: 39,
//                                             as_str(): "B",
//                                         },
//                                         call_path_tree: Some(
//                                             CallPathTree {
//                                                 qualified_call_path: QualifiedCallPath {
//                                                     call_path: CallPath {
//                                                         prefixes: [],
//                                                         suffix: B,
//                                                         is_absolute: false,
//                                                     },
//                                                     qualified_path_root: None,
//                                                 },
//                                                 children: [],
//                                             },
//                                         ),
//                                     },
//                                 ],
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
//                             type_info: Struct(
//                                 DeclId(
//                                     2,
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
//                             type_info: UnsignedInteger(
//                                 SixtyFour,
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
//                             type_info: UnsignedInteger(
//                                 Eight,
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
//                             type_info: Tuple(
//                                 [
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             35,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             14,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005643b943c0a0,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 35,
//                                             end: 36,
//                                             as_str(): "A",
//                                         },
//                                         call_path_tree: Some(
//                                             CallPathTree {
//                                                 qualified_call_path: QualifiedCallPath {
//                                                     call_path: CallPath {
//                                                         prefixes: [],
//                                                         suffix: A,
//                                                         is_absolute: false,
//                                                     },
//                                                     qualified_path_root: None,
//                                                 },
//                                                 children: [],
//                                             },
//                                         ),
//                                     },
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             36,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             15,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005643b943c0a0,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 38,
//                                             end: 39,
//                                             as_str(): "B",
//                                         },
//                                         call_path_tree: Some(
//                                             CallPathTree {
//                                                 qualified_call_path: QualifiedCallPath {
//                                                     call_path: CallPath {
//                                                         prefixes: [],
//                                                         suffix: B,
//                                                         is_absolute: false,
//                                                     },
//                                                     qualified_path_root: None,
//                                                 },
//                                                 children: [],
//                                             },
//                                         ),
//                                     },
//                                 ],
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
//                             type_info: Struct(
//                                 DeclId(
//                                     3,
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
//                             type_info: UnsignedInteger(
//                                 SixtyFour,
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
//                             type_info: UnsignedInteger(
//                                 Eight,
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
//                             type_info: Tuple(
//                                 [
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             39,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             7,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005643b943c0a0,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 111,
//                                             end: 112,
//                                             as_str(): "0",
//                                         },
//                                         call_path_tree: None,
//                                     },
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             40,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             4,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005643b943c0a0,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 114,
//                                             end: 115,
//                                             as_str(): "0",
//                                         },
//                                         call_path_tree: None,
//                                     },
//                                 ],
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
//                             type_info: Tuple(
//                                 [
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             39,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             7,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005643b943c0a0,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 111,
//                                             end: 112,
//                                             as_str(): "0",
//                                         },
//                                         call_path_tree: None,
//                                     },
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             40,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             4,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005643b943c0a0,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 114,
//                                             end: 115,
//                                             as_str(): "0",
//                                         },
//                                         call_path_tree: None,
//                                     },
//                                 ],
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
//                             type_info: Tuple(
//                                 [
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             7,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             14,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005643b943c0a0,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 35,
//                                             end: 36,
//                                             as_str(): "A",
//                                         },
//                                         call_path_tree: Some(
//                                             CallPathTree {
//                                                 qualified_call_path: QualifiedCallPath {
//                                                     call_path: CallPath {
//                                                         prefixes: [],
//                                                         suffix: A,
//                                                         is_absolute: false,
//                                                     },
//                                                     qualified_path_root: None,
//                                                 },
//                                                 children: [],
//                                             },
//                                         ),
//                                     },
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             4,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             15,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005643b943c0a0,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 38,
//                                             end: 39,
//                                             as_str(): "B",
//                                         },
//                                         call_path_tree: Some(
//                                             CallPathTree {
//                                                 qualified_call_path: QualifiedCallPath {
//                                                     call_path: CallPath {
//                                                         prefixes: [],
//                                                         suffix: B,
//                                                         is_absolute: false,
//                                                     },
//                                                     qualified_path_root: None,
//                                                 },
//                                                 children: [],
//                                             },
//                                         ),
//                                     },
//                                 ],
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
//                             type_info: Placeholder(
//                                 TypeParameter {
//                                     type_id: TypeId(
//                                         24,
//                                     ),
//                                     initial_type_id: TypeId(
//                                         17,
//                                     ),
//                                     name_ident: A,
//                                     trait_constraints: [],
//                                     trait_constraints_span: Span {
//                                         src (ptr): 0x00005643b93b0ca0,
//                                         source_id: None,
//                                         start: 0,
//                                         end: 0,
//                                         as_str(): "",
//                                     },
//                                     is_from_parent: false,
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
//                             type_info: Placeholder(
//                                 TypeParameter {
//                                     type_id: TypeId(
//                                         25,
//                                     ),
//                                     initial_type_id: TypeId(
//                                         18,
//                                     ),
//                                     name_ident: B,
//                                     trait_constraints: [],
//                                     trait_constraints_span: Span {
//                                         src (ptr): 0x00005643b93b0ca0,
//                                         source_id: None,
//                                         start: 0,
//                                         end: 0,
//                                         as_str(): "",
//                                     },
//                                     is_from_parent: false,
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
//                             type_info: Tuple(
//                                 [
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             44,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             14,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005643b943c0a0,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 35,
//                                             end: 36,
//                                             as_str(): "A",
//                                         },
//                                         call_path_tree: Some(
//                                             CallPathTree {
//                                                 qualified_call_path: QualifiedCallPath {
//                                                     call_path: CallPath {
//                                                         prefixes: [],
//                                                         suffix: A,
//                                                         is_absolute: false,
//                                                     },
//                                                     qualified_path_root: None,
//                                                 },
//                                                 children: [],
//                                             },
//                                         ),
//                                     },
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             45,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             15,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005643b943c0a0,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 38,
//                                             end: 39,
//                                             as_str(): "B",
//                                         },
//                                         call_path_tree: Some(
//                                             CallPathTree {
//                                                 qualified_call_path: QualifiedCallPath {
//                                                     call_path: CallPath {
//                                                         prefixes: [],
//                                                         suffix: B,
//                                                         is_absolute: false,
//                                                     },
//                                                     qualified_path_root: None,
//                                                 },
//                                                 children: [],
//                                             },
//                                         ),
//                                     },
//                                 ],
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
//                             type_info: Struct(
//                                 DeclId(
//                                     5,
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
//                             type_info: UnsignedInteger(
//                                 SixtyFour,
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
//                             type_info: UnsignedInteger(
//                                 Eight,
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
//                             type_info: Tuple(
//                                 [
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             49,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             14,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005643b943c0a0,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 35,
//                                             end: 36,
//                                             as_str(): "A",
//                                         },
//                                         call_path_tree: Some(
//                                             CallPathTree {
//                                                 qualified_call_path: QualifiedCallPath {
//                                                     call_path: CallPath {
//                                                         prefixes: [],
//                                                         suffix: A,
//                                                         is_absolute: false,
//                                                     },
//                                                     qualified_path_root: None,
//                                                 },
//                                                 children: [],
//                                             },
//                                         ),
//                                     },
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             50,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             15,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005643b943c0a0,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 38,
//                                             end: 39,
//                                             as_str(): "B",
//                                         },
//                                         call_path_tree: Some(
//                                             CallPathTree {
//                                                 qualified_call_path: QualifiedCallPath {
//                                                     call_path: CallPath {
//                                                         prefixes: [],
//                                                         suffix: B,
//                                                         is_absolute: false,
//                                                     },
//                                                     qualified_path_root: None,
//                                                 },
//                                                 children: [],
//                                             },
//                                         ),
//                                     },
//                                 ],
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
//                             type_info: Struct(
//                                 DeclId(
//                                     6,
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
//                             type_info: UnsignedInteger(
//                                 SixtyFour,
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
//                             type_info: UnsignedInteger(
//                                 Eight,
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
//                             type_info: Tuple(
//                                 [
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             53,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             7,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005643b943c0a0,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 111,
//                                             end: 112,
//                                             as_str(): "0",
//                                         },
//                                         call_path_tree: None,
//                                     },
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             54,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             4,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005643b943c0a0,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 114,
//                                             end: 115,
//                                             as_str(): "0",
//                                         },
//                                         call_path_tree: None,
//                                     },
//                                 ],
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
//                             type_info: Tuple(
//                                 [
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             53,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             7,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005643b943c0a0,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 111,
//                                             end: 112,
//                                             as_str(): "0",
//                                         },
//                                         call_path_tree: None,
//                                     },
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             54,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             4,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005643b943c0a0,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 114,
//                                             end: 115,
//                                             as_str(): "0",
//                                         },
//                                         call_path_tree: None,
//                                     },
//                                 ],
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
//                 29,
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
//                                 58,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x00005643b939af60,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 399,
//                                 end: 412,
//                                 as_str(): "play06A::play",
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
//                                 58,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x00005643b939af60,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 399,
//                                 end: 414,
//                                 as_str(): "play06A::play()",
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
//                                 59,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x00005643b939af60,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 399,
//                                 end: 412,
//                                 as_str(): "play06A::play",
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
//                                 59,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x00005643b939af60,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 399,
//                                 end: 414,
//                                 as_str(): "play06A::play()",
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
//             tv_sec: 1403073,
//             tv_nsec: 351948324,
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
