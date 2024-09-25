library;

#[inline(never)]
pub fn play() {
    let _: (u64, u8) = (64u64, 8u8);
    let _: (u64, u8) = (64u64, 8u8);
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
//                             type_info: Tuple(
//                                 [
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             7,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             7,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 55,
//                                             end: 58,
//                                             as_str(): "u64",
//                                         },
//                                         call_path_tree: Some(
//                                             CallPathTree {
//                                                 qualified_call_path: QualifiedCallPath {
//                                                     call_path: CallPath {
//                                                         prefixes: [],
//                                                         suffix: u64,
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
//                                             4,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 60,
//                                             end: 62,
//                                             as_str(): "u8",
//                                         },
//                                         call_path_tree: Some(
//                                             CallPathTree {
//                                                 qualified_call_path: QualifiedCallPath {
//                                                     call_path: CallPath {
//                                                         prefixes: [],
//                                                         suffix: u8,
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
//                             type_info: Tuple(
//                                 [
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             7,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             7,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 92,
//                                             end: 95,
//                                             as_str(): "u64",
//                                         },
//                                         call_path_tree: Some(
//                                             CallPathTree {
//                                                 qualified_call_path: QualifiedCallPath {
//                                                     call_path: CallPath {
//                                                         prefixes: [],
//                                                         suffix: u64,
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
//                                             4,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 97,
//                                             end: 99,
//                                             as_str(): "u8",
//                                         },
//                                         call_path_tree: Some(
//                                             CallPathTree {
//                                                 qualified_call_path: QualifiedCallPath {
//                                                     call_path: CallPath {
//                                                         prefixes: [],
//                                                         suffix: u8,
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
//                             type_info: Tuple(
//                                 [
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             7,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             7,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 55,
//                                             end: 58,
//                                             as_str(): "u64",
//                                         },
//                                         call_path_tree: Some(
//                                             CallPathTree {
//                                                 qualified_call_path: QualifiedCallPath {
//                                                     call_path: CallPath {
//                                                         prefixes: [],
//                                                         suffix: u64,
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
//                                             4,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 60,
//                                             end: 62,
//                                             as_str(): "u8",
//                                         },
//                                         call_path_tree: Some(
//                                             CallPathTree {
//                                                 qualified_call_path: QualifiedCallPath {
//                                                     call_path: CallPath {
//                                                         prefixes: [],
//                                                         suffix: u8,
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
//                             type_info: Tuple(
//                                 [
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             7,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             7,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 67,
//                                             end: 72,
//                                             as_str(): "64u64",
//                                         },
//                                         call_path_tree: None,
//                                     },
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             4,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             4,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 74,
//                                             end: 77,
//                                             as_str(): "8u8",
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
//                                             7,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 67,
//                                             end: 72,
//                                             as_str(): "64u64",
//                                         },
//                                         call_path_tree: None,
//                                     },
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             4,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             4,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 74,
//                                             end: 77,
//                                             as_str(): "8u8",
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
//                                             7,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 92,
//                                             end: 95,
//                                             as_str(): "u64",
//                                         },
//                                         call_path_tree: Some(
//                                             CallPathTree {
//                                                 qualified_call_path: QualifiedCallPath {
//                                                     call_path: CallPath {
//                                                         prefixes: [],
//                                                         suffix: u64,
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
//                                             4,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 97,
//                                             end: 99,
//                                             as_str(): "u8",
//                                         },
//                                         call_path_tree: Some(
//                                             CallPathTree {
//                                                 qualified_call_path: QualifiedCallPath {
//                                                     call_path: CallPath {
//                                                         prefixes: [],
//                                                         suffix: u8,
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
//                             type_info: Tuple(
//                                 [
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             7,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             7,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 104,
//                                             end: 109,
//                                             as_str(): "64u64",
//                                         },
//                                         call_path_tree: None,
//                                     },
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             4,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             4,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 111,
//                                             end: 114,
//                                             as_str(): "8u8",
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
//                                             7,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 104,
//                                             end: 109,
//                                             as_str(): "64u64",
//                                         },
//                                         call_path_tree: None,
//                                     },
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             4,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             4,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 111,
//                                             end: 114,
//                                             as_str(): "8u8",
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
//                                             7,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 55,
//                                             end: 58,
//                                             as_str(): "u64",
//                                         },
//                                         call_path_tree: Some(
//                                             CallPathTree {
//                                                 qualified_call_path: QualifiedCallPath {
//                                                     call_path: CallPath {
//                                                         prefixes: [],
//                                                         suffix: u64,
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
//                                             4,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 60,
//                                             end: 62,
//                                             as_str(): "u8",
//                                         },
//                                         call_path_tree: Some(
//                                             CallPathTree {
//                                                 qualified_call_path: QualifiedCallPath {
//                                                     call_path: CallPath {
//                                                         prefixes: [],
//                                                         suffix: u8,
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
//                             type_info: Tuple(
//                                 [
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             7,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             7,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 67,
//                                             end: 72,
//                                             as_str(): "64u64",
//                                         },
//                                         call_path_tree: None,
//                                     },
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             4,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             4,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 74,
//                                             end: 77,
//                                             as_str(): "8u8",
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
//                                             7,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 67,
//                                             end: 72,
//                                             as_str(): "64u64",
//                                         },
//                                         call_path_tree: None,
//                                     },
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             4,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             4,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 74,
//                                             end: 77,
//                                             as_str(): "8u8",
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
//                                             7,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 92,
//                                             end: 95,
//                                             as_str(): "u64",
//                                         },
//                                         call_path_tree: Some(
//                                             CallPathTree {
//                                                 qualified_call_path: QualifiedCallPath {
//                                                     call_path: CallPath {
//                                                         prefixes: [],
//                                                         suffix: u64,
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
//                                             4,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 97,
//                                             end: 99,
//                                             as_str(): "u8",
//                                         },
//                                         call_path_tree: Some(
//                                             CallPathTree {
//                                                 qualified_call_path: QualifiedCallPath {
//                                                     call_path: CallPath {
//                                                         prefixes: [],
//                                                         suffix: u8,
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
//                             type_info: Tuple(
//                                 [
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             7,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             7,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 104,
//                                             end: 109,
//                                             as_str(): "64u64",
//                                         },
//                                         call_path_tree: None,
//                                     },
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             4,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             4,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 111,
//                                             end: 114,
//                                             as_str(): "8u8",
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
//                                             7,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 104,
//                                             end: 109,
//                                             as_str(): "64u64",
//                                         },
//                                         call_path_tree: None,
//                                     },
//                                     TypeArgument {
//                                         type_id: TypeId(
//                                             4,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             4,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 111,
//                                             end: 114,
//                                             as_str(): "8u8",
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
//                                 0,
//                             ),
//                             expected: TypeId(
//                                 34,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x00005f3a3a5bde60,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 359,
//                                 end: 372,
//                                 as_str(): "play05A::play",
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
//                                 34,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x00005f3a3a5bde60,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 359,
//                                 end: 374,
//                                 as_str(): "play05A::play()",
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
//                                 35,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x00005f3a3a5bde60,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 359,
//                                 end: 372,
//                                 as_str(): "play05A::play",
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
//                                 35,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x00005f3a3a5bde60,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 359,
//                                 end: 374,
//                                 as_str(): "play05A::play()",
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
//             tv_sec: 1399224,
//             tv_nsec: 299686037,
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
// DeclEngine {
//     function_slab: ConcurrentSlab {
//         inner: RwLock {
//             data: Inner {
//                 items: [
//                     Some(
//                         TyFunctionDecl {
//                             name: play,
//                             body: TyCodeBlock {
//                                 contents: [
//                                     TyAstNode {
//                                         content: Declaration(
//                                             VariableDecl(
//                                                 TyVariableDecl {
//                                                     name: _,
//                                                     body: TyExpression {
//                                                         expression: Tuple {
//                                                             fields: [
//                                                                 TyExpression {
//                                                                     expression: Literal(
//                                                                         U64(
//                                                                             64,
//                                                                         ),
//                                                                     ),
//                                                                     return_type: TypeId(
//                                                                         7,
//                                                                     ),
//                                                                     span: Span {
//                                                                         src (ptr): 0x00005f3a3a5a6060,
//                                                                         source_id: Some(
//                                                                             SourceId {
//                                                                                 id: 1048577,
//                                                                             },
//                                                                         ),
//                                                                         start: 67,
//                                                                         end: 72,
//                                                                         as_str(): "64u64",
//                                                                     },
//                                                                 },
//                                                                 TyExpression {
//                                                                     expression: Literal(
//                                                                         U8(
//                                                                             8,
//                                                                         ),
//                                                                     ),
//                                                                     return_type: TypeId(
//                                                                         4,
//                                                                     ),
//                                                                     span: Span {
//                                                                         src (ptr): 0x00005f3a3a5a6060,
//                                                                         source_id: Some(
//                                                                             SourceId {
//                                                                                 id: 1048577,
//                                                                             },
//                                                                         ),
//                                                                         start: 74,
//                                                                         end: 77,
//                                                                         as_str(): "8u8",
//                                                                     },
//                                                                 },
//                                                             ],
//                                                         },
//                                                         return_type: TypeId(
//                                                             29,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x00005f3a3a5a6060,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 66,
//                                                             end: 78,
//                                                             as_str(): "(64u64, 8u8)",
//                                                         },
//                                                     },
//                                                     mutability: Immutable,
//                                                     return_type: TypeId(
//                                                         29,
//                                                     ),
//                                                     type_ascription: TypeArgument {
//                                                         type_id: TypeId(
//                                                             27,
//                                                         ),
//                                                         initial_type_id: TypeId(
//                                                             14,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x00005f3a3a5a6060,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 54,
//                                                             end: 63,
//                                                             as_str(): "(u64, u8)",
//                                                         },
//                                                         call_path_tree: None,
//                                                     },
//                                                 },
//                                             ),
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 47,
//                                             end: 79,
//                                             as_str(): "let _: (u64, u8) = (64u64, 8u8);",
//                                         },
//                                     },
//                                     TyAstNode {
//                                         content: Declaration(
//                                             VariableDecl(
//                                                 TyVariableDecl {
//                                                     name: _,
//                                                     body: TyExpression {
//                                                         expression: Tuple {
//                                                             fields: [
//                                                                 TyExpression {
//                                                                     expression: Literal(
//                                                                         U64(
//                                                                             64,
//                                                                         ),
//                                                                     ),
//                                                                     return_type: TypeId(
//                                                                         7,
//                                                                     ),
//                                                                     span: Span {
//                                                                         src (ptr): 0x00005f3a3a5a6060,
//                                                                         source_id: Some(
//                                                                             SourceId {
//                                                                                 id: 1048577,
//                                                                             },
//                                                                         ),
//                                                                         start: 104,
//                                                                         end: 109,
//                                                                         as_str(): "64u64",
//                                                                     },
//                                                                 },
//                                                                 TyExpression {
//                                                                     expression: Literal(
//                                                                         U8(
//                                                                             8,
//                                                                         ),
//                                                                     ),
//                                                                     return_type: TypeId(
//                                                                         4,
//                                                                     ),
//                                                                     span: Span {
//                                                                         src (ptr): 0x00005f3a3a5a6060,
//                                                                         source_id: Some(
//                                                                             SourceId {
//                                                                                 id: 1048577,
//                                                                             },
//                                                                         ),
//                                                                         start: 111,
//                                                                         end: 114,
//                                                                         as_str(): "8u8",
//                                                                     },
//                                                                 },
//                                                             ],
//                                                         },
//                                                         return_type: TypeId(
//                                                             32,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x00005f3a3a5a6060,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 103,
//                                                             end: 115,
//                                                             as_str(): "(64u64, 8u8)",
//                                                         },
//                                                     },
//                                                     mutability: Immutable,
//                                                     return_type: TypeId(
//                                                         32,
//                                                     ),
//                                                     type_ascription: TypeArgument {
//                                                         type_id: TypeId(
//                                                             30,
//                                                         ),
//                                                         initial_type_id: TypeId(
//                                                             15,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x00005f3a3a5a6060,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 91,
//                                                             end: 100,
//                                                             as_str(): "(u64, u8)",
//                                                         },
//                                                         call_path_tree: None,
//                                                     },
//                                                 },
//                                             ),
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 84,
//                                             end: 116,
//                                             as_str(): "let _: (u64, u8) = (64u64, 8u8);",
//                                         },
//                                     },
//                                 ],
//                                 whole_block_span: Span {
//                                     src (ptr): 0x00005f3a3a5a6060,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048577,
//                                         },
//                                     ),
//                                     start: 41,
//                                     end: 118,
//                                     as_str(): "{\n    let _: (u64, u8) = (64u64, 8u8);\n    let _: (u64, u8) = (64u64, 8u8);\n}",
//                                 },
//                             },
//                             parameters: [],
//                             implementing_type: None,
//                             implementing_for_typeid: None,
//                             span: Span {
//                                 src (ptr): 0x00005f3a3a5a6060,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048577,
//                                     },
//                                 ),
//                                 start: 27,
//                                 end: 118,
//                                 as_str(): "pub fn play() {\n    let _: (u64, u8) = (64u64, 8u8);\n    let _: (u64, u8) = (64u64, 8u8);\n}",
//                             },
//                             call_path: CallPath {
//                                 prefixes: [
//                                     plays,
//                                     play05A,
//                                 ],
//                                 suffix: play,
//                                 is_absolute: true,
//                             },
//                             attributes: AttributesMap(
//                                 {
//                                     Inline: [
//                                         Attribute {
//                                             name: inline,
//                                             args: [
//                                                 AttributeArg {
//                                                     name: never,
//                                                     value: None,
//                                                     span: Span {
//                                                         src (ptr): 0x00005f3a3a5a6060,
//                                                         source_id: Some(
//                                                             SourceId {
//                                                                 id: 1048577,
//                                                             },
//                                                         ),
//                                                         start: 19,
//                                                         end: 24,
//                                                         as_str(): "never",
//                                                     },
//                                                 },
//                                             ],
//                                             span: Span {
//                                                 src (ptr): 0x00005f3a3a5a6060,
//                                                 source_id: Some(
//                                                     SourceId {
//                                                         id: 1048577,
//                                                     },
//                                                 ),
//                                                 start: 10,
//                                                 end: 26,
//                                                 as_str(): "#[inline(never)]",
//                                             },
//                                         },
//                                     ],
//                                 },
//                             ),
//                             type_parameters: [],
//                             return_type: TypeArgument {
//                                 type_id: TypeId(
//                                     0,
//                                 ),
//                                 initial_type_id: TypeId(
//                                     0,
//                                 ),
//                                 span: Span {
//                                     src (ptr): 0x00005f3a3a5a6060,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048577,
//                                         },
//                                     ),
//                                     start: 27,
//                                     end: 40,
//                                     as_str(): "pub fn play()",
//                                 },
//                                 call_path_tree: None,
//                             },
//                             visibility: Public,
//                             is_contract_call: false,
//                             purity: Pure,
//                             where_clause: [],
//                             is_trait_method_dummy: false,
//                             is_type_check_finalized: true,
//                             kind: Default,
//                         },
//                     ),
//                     Some(
//                         TyFunctionDecl {
//                             name: play,
//                             body: TyCodeBlock {
//                                 contents: [
//                                     TyAstNode {
//                                         content: Declaration(
//                                             VariableDecl(
//                                                 TyVariableDecl {
//                                                     name: _,
//                                                     body: TyExpression {
//                                                         expression: Tuple {
//                                                             fields: [
//                                                                 TyExpression {
//                                                                     expression: Literal(
//                                                                         U64(
//                                                                             64,
//                                                                         ),
//                                                                     ),
//                                                                     return_type: TypeId(
//                                                                         7,
//                                                                     ),
//                                                                     span: Span {
//                                                                         src (ptr): 0x00005f3a3a5a6060,
//                                                                         source_id: Some(
//                                                                             SourceId {
//                                                                                 id: 1048577,
//                                                                             },
//                                                                         ),
//                                                                         start: 67,
//                                                                         end: 72,
//                                                                         as_str(): "64u64",
//                                                                     },
//                                                                 },
//                                                                 TyExpression {
//                                                                     expression: Literal(
//                                                                         U8(
//                                                                             8,
//                                                                         ),
//                                                                     ),
//                                                                     return_type: TypeId(
//                                                                         4,
//                                                                     ),
//                                                                     span: Span {
//                                                                         src (ptr): 0x00005f3a3a5a6060,
//                                                                         source_id: Some(
//                                                                             SourceId {
//                                                                                 id: 1048577,
//                                                                             },
//                                                                         ),
//                                                                         start: 74,
//                                                                         end: 77,
//                                                                         as_str(): "8u8",
//                                                                     },
//                                                                 },
//                                                             ],
//                                                         },
//                                                         return_type: TypeId(
//                                                             29,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x00005f3a3a5a6060,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 66,
//                                                             end: 78,
//                                                             as_str(): "(64u64, 8u8)",
//                                                         },
//                                                     },
//                                                     mutability: Immutable,
//                                                     return_type: TypeId(
//                                                         29,
//                                                     ),
//                                                     type_ascription: TypeArgument {
//                                                         type_id: TypeId(
//                                                             27,
//                                                         ),
//                                                         initial_type_id: TypeId(
//                                                             14,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x00005f3a3a5a6060,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 54,
//                                                             end: 63,
//                                                             as_str(): "(u64, u8)",
//                                                         },
//                                                         call_path_tree: None,
//                                                     },
//                                                 },
//                                             ),
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 47,
//                                             end: 79,
//                                             as_str(): "let _: (u64, u8) = (64u64, 8u8);",
//                                         },
//                                     },
//                                     TyAstNode {
//                                         content: Declaration(
//                                             VariableDecl(
//                                                 TyVariableDecl {
//                                                     name: _,
//                                                     body: TyExpression {
//                                                         expression: Tuple {
//                                                             fields: [
//                                                                 TyExpression {
//                                                                     expression: Literal(
//                                                                         U64(
//                                                                             64,
//                                                                         ),
//                                                                     ),
//                                                                     return_type: TypeId(
//                                                                         7,
//                                                                     ),
//                                                                     span: Span {
//                                                                         src (ptr): 0x00005f3a3a5a6060,
//                                                                         source_id: Some(
//                                                                             SourceId {
//                                                                                 id: 1048577,
//                                                                             },
//                                                                         ),
//                                                                         start: 104,
//                                                                         end: 109,
//                                                                         as_str(): "64u64",
//                                                                     },
//                                                                 },
//                                                                 TyExpression {
//                                                                     expression: Literal(
//                                                                         U8(
//                                                                             8,
//                                                                         ),
//                                                                     ),
//                                                                     return_type: TypeId(
//                                                                         4,
//                                                                     ),
//                                                                     span: Span {
//                                                                         src (ptr): 0x00005f3a3a5a6060,
//                                                                         source_id: Some(
//                                                                             SourceId {
//                                                                                 id: 1048577,
//                                                                             },
//                                                                         ),
//                                                                         start: 111,
//                                                                         end: 114,
//                                                                         as_str(): "8u8",
//                                                                     },
//                                                                 },
//                                                             ],
//                                                         },
//                                                         return_type: TypeId(
//                                                             32,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x00005f3a3a5a6060,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 103,
//                                                             end: 115,
//                                                             as_str(): "(64u64, 8u8)",
//                                                         },
//                                                     },
//                                                     mutability: Immutable,
//                                                     return_type: TypeId(
//                                                         32,
//                                                     ),
//                                                     type_ascription: TypeArgument {
//                                                         type_id: TypeId(
//                                                             30,
//                                                         ),
//                                                         initial_type_id: TypeId(
//                                                             15,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x00005f3a3a5a6060,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 91,
//                                                             end: 100,
//                                                             as_str(): "(u64, u8)",
//                                                         },
//                                                         call_path_tree: None,
//                                                     },
//                                                 },
//                                             ),
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 84,
//                                             end: 116,
//                                             as_str(): "let _: (u64, u8) = (64u64, 8u8);",
//                                         },
//                                     },
//                                 ],
//                                 whole_block_span: Span {
//                                     src (ptr): 0x00005f3a3a5a6060,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048577,
//                                         },
//                                     ),
//                                     start: 41,
//                                     end: 118,
//                                     as_str(): "{\n    let _: (u64, u8) = (64u64, 8u8);\n    let _: (u64, u8) = (64u64, 8u8);\n}",
//                                 },
//                             },
//                             parameters: [],
//                             implementing_type: None,
//                             implementing_for_typeid: None,
//                             span: Span {
//                                 src (ptr): 0x00005f3a3a5a6060,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048577,
//                                     },
//                                 ),
//                                 start: 27,
//                                 end: 118,
//                                 as_str(): "pub fn play() {\n    let _: (u64, u8) = (64u64, 8u8);\n    let _: (u64, u8) = (64u64, 8u8);\n}",
//                             },
//                             call_path: CallPath {
//                                 prefixes: [
//                                     plays,
//                                     play05A,
//                                 ],
//                                 suffix: play,
//                                 is_absolute: true,
//                             },
//                             attributes: AttributesMap(
//                                 {
//                                     Inline: [
//                                         Attribute {
//                                             name: inline,
//                                             args: [
//                                                 AttributeArg {
//                                                     name: never,
//                                                     value: None,
//                                                     span: Span {
//                                                         src (ptr): 0x00005f3a3a5a6060,
//                                                         source_id: Some(
//                                                             SourceId {
//                                                                 id: 1048577,
//                                                             },
//                                                         ),
//                                                         start: 19,
//                                                         end: 24,
//                                                         as_str(): "never",
//                                                     },
//                                                 },
//                                             ],
//                                             span: Span {
//                                                 src (ptr): 0x00005f3a3a5a6060,
//                                                 source_id: Some(
//                                                     SourceId {
//                                                         id: 1048577,
//                                                     },
//                                                 ),
//                                                 start: 10,
//                                                 end: 26,
//                                                 as_str(): "#[inline(never)]",
//                                             },
//                                         },
//                                     ],
//                                 },
//                             ),
//                             type_parameters: [],
//                             return_type: TypeArgument {
//                                 type_id: TypeId(
//                                     0,
//                                 ),
//                                 initial_type_id: TypeId(
//                                     0,
//                                 ),
//                                 span: Span {
//                                     src (ptr): 0x00005f3a3a5a6060,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048577,
//                                         },
//                                     ),
//                                     start: 27,
//                                     end: 40,
//                                     as_str(): "pub fn play()",
//                                 },
//                                 call_path_tree: None,
//                             },
//                             visibility: Public,
//                             is_contract_call: false,
//                             purity: Pure,
//                             where_clause: [],
//                             is_trait_method_dummy: false,
//                             is_type_check_finalized: true,
//                             kind: Default,
//                         },
//                     ),
//                     Some(
//                         TyFunctionDecl {
//                             name: play,
//                             body: TyCodeBlock {
//                                 contents: [
//                                     TyAstNode {
//                                         content: Declaration(
//                                             VariableDecl(
//                                                 TyVariableDecl {
//                                                     name: _,
//                                                     body: TyExpression {
//                                                         expression: Tuple {
//                                                             fields: [
//                                                                 TyExpression {
//                                                                     expression: Literal(
//                                                                         U64(
//                                                                             64,
//                                                                         ),
//                                                                     ),
//                                                                     return_type: TypeId(
//                                                                         7,
//                                                                     ),
//                                                                     span: Span {
//                                                                         src (ptr): 0x00005f3a3a5a6060,
//                                                                         source_id: Some(
//                                                                             SourceId {
//                                                                                 id: 1048577,
//                                                                             },
//                                                                         ),
//                                                                         start: 67,
//                                                                         end: 72,
//                                                                         as_str(): "64u64",
//                                                                     },
//                                                                 },
//                                                                 TyExpression {
//                                                                     expression: Literal(
//                                                                         U8(
//                                                                             8,
//                                                                         ),
//                                                                     ),
//                                                                     return_type: TypeId(
//                                                                         4,
//                                                                     ),
//                                                                     span: Span {
//                                                                         src (ptr): 0x00005f3a3a5a6060,
//                                                                         source_id: Some(
//                                                                             SourceId {
//                                                                                 id: 1048577,
//                                                                             },
//                                                                         ),
//                                                                         start: 74,
//                                                                         end: 77,
//                                                                         as_str(): "8u8",
//                                                                     },
//                                                                 },
//                                                             ],
//                                                         },
//                                                         return_type: TypeId(
//                                                             29,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x00005f3a3a5a6060,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 66,
//                                                             end: 78,
//                                                             as_str(): "(64u64, 8u8)",
//                                                         },
//                                                     },
//                                                     mutability: Immutable,
//                                                     return_type: TypeId(
//                                                         29,
//                                                     ),
//                                                     type_ascription: TypeArgument {
//                                                         type_id: TypeId(
//                                                             27,
//                                                         ),
//                                                         initial_type_id: TypeId(
//                                                             14,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x00005f3a3a5a6060,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 54,
//                                                             end: 63,
//                                                             as_str(): "(u64, u8)",
//                                                         },
//                                                         call_path_tree: None,
//                                                     },
//                                                 },
//                                             ),
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 47,
//                                             end: 79,
//                                             as_str(): "let _: (u64, u8) = (64u64, 8u8);",
//                                         },
//                                     },
//                                     TyAstNode {
//                                         content: Declaration(
//                                             VariableDecl(
//                                                 TyVariableDecl {
//                                                     name: _,
//                                                     body: TyExpression {
//                                                         expression: Tuple {
//                                                             fields: [
//                                                                 TyExpression {
//                                                                     expression: Literal(
//                                                                         U64(
//                                                                             64,
//                                                                         ),
//                                                                     ),
//                                                                     return_type: TypeId(
//                                                                         7,
//                                                                     ),
//                                                                     span: Span {
//                                                                         src (ptr): 0x00005f3a3a5a6060,
//                                                                         source_id: Some(
//                                                                             SourceId {
//                                                                                 id: 1048577,
//                                                                             },
//                                                                         ),
//                                                                         start: 104,
//                                                                         end: 109,
//                                                                         as_str(): "64u64",
//                                                                     },
//                                                                 },
//                                                                 TyExpression {
//                                                                     expression: Literal(
//                                                                         U8(
//                                                                             8,
//                                                                         ),
//                                                                     ),
//                                                                     return_type: TypeId(
//                                                                         4,
//                                                                     ),
//                                                                     span: Span {
//                                                                         src (ptr): 0x00005f3a3a5a6060,
//                                                                         source_id: Some(
//                                                                             SourceId {
//                                                                                 id: 1048577,
//                                                                             },
//                                                                         ),
//                                                                         start: 111,
//                                                                         end: 114,
//                                                                         as_str(): "8u8",
//                                                                     },
//                                                                 },
//                                                             ],
//                                                         },
//                                                         return_type: TypeId(
//                                                             32,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x00005f3a3a5a6060,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 103,
//                                                             end: 115,
//                                                             as_str(): "(64u64, 8u8)",
//                                                         },
//                                                     },
//                                                     mutability: Immutable,
//                                                     return_type: TypeId(
//                                                         32,
//                                                     ),
//                                                     type_ascription: TypeArgument {
//                                                         type_id: TypeId(
//                                                             30,
//                                                         ),
//                                                         initial_type_id: TypeId(
//                                                             15,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x00005f3a3a5a6060,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 91,
//                                                             end: 100,
//                                                             as_str(): "(u64, u8)",
//                                                         },
//                                                         call_path_tree: None,
//                                                     },
//                                                 },
//                                             ),
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 84,
//                                             end: 116,
//                                             as_str(): "let _: (u64, u8) = (64u64, 8u8);",
//                                         },
//                                     },
//                                 ],
//                                 whole_block_span: Span {
//                                     src (ptr): 0x00005f3a3a5a6060,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048577,
//                                         },
//                                     ),
//                                     start: 41,
//                                     end: 118,
//                                     as_str(): "{\n    let _: (u64, u8) = (64u64, 8u8);\n    let _: (u64, u8) = (64u64, 8u8);\n}",
//                                 },
//                             },
//                             parameters: [],
//                             implementing_type: None,
//                             implementing_for_typeid: None,
//                             span: Span {
//                                 src (ptr): 0x00005f3a3a5a6060,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048577,
//                                     },
//                                 ),
//                                 start: 27,
//                                 end: 118,
//                                 as_str(): "pub fn play() {\n    let _: (u64, u8) = (64u64, 8u8);\n    let _: (u64, u8) = (64u64, 8u8);\n}",
//                             },
//                             call_path: CallPath {
//                                 prefixes: [
//                                     plays,
//                                     play05A,
//                                 ],
//                                 suffix: play,
//                                 is_absolute: true,
//                             },
//                             attributes: AttributesMap(
//                                 {
//                                     Inline: [
//                                         Attribute {
//                                             name: inline,
//                                             args: [
//                                                 AttributeArg {
//                                                     name: never,
//                                                     value: None,
//                                                     span: Span {
//                                                         src (ptr): 0x00005f3a3a5a6060,
//                                                         source_id: Some(
//                                                             SourceId {
//                                                                 id: 1048577,
//                                                             },
//                                                         ),
//                                                         start: 19,
//                                                         end: 24,
//                                                         as_str(): "never",
//                                                     },
//                                                 },
//                                             ],
//                                             span: Span {
//                                                 src (ptr): 0x00005f3a3a5a6060,
//                                                 source_id: Some(
//                                                     SourceId {
//                                                         id: 1048577,
//                                                     },
//                                                 ),
//                                                 start: 10,
//                                                 end: 26,
//                                                 as_str(): "#[inline(never)]",
//                                             },
//                                         },
//                                     ],
//                                 },
//                             ),
//                             type_parameters: [],
//                             return_type: TypeArgument {
//                                 type_id: TypeId(
//                                     0,
//                                 ),
//                                 initial_type_id: TypeId(
//                                     0,
//                                 ),
//                                 span: Span {
//                                     src (ptr): 0x00005f3a3a5a6060,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048577,
//                                         },
//                                     ),
//                                     start: 27,
//                                     end: 40,
//                                     as_str(): "pub fn play()",
//                                 },
//                                 call_path_tree: None,
//                             },
//                             visibility: Public,
//                             is_contract_call: false,
//                             purity: Pure,
//                             where_clause: [],
//                             is_trait_method_dummy: false,
//                             is_type_check_finalized: true,
//                             kind: Default,
//                         },
//                     ),
//                     Some(
//                         TyFunctionDecl {
//                             name: play,
//                             body: TyCodeBlock {
//                                 contents: [
//                                     TyAstNode {
//                                         content: Declaration(
//                                             VariableDecl(
//                                                 TyVariableDecl {
//                                                     name: _,
//                                                     body: TyExpression {
//                                                         expression: Tuple {
//                                                             fields: [
//                                                                 TyExpression {
//                                                                     expression: Literal(
//                                                                         U64(
//                                                                             64,
//                                                                         ),
//                                                                     ),
//                                                                     return_type: TypeId(
//                                                                         7,
//                                                                     ),
//                                                                     span: Span {
//                                                                         src (ptr): 0x00005f3a3a5a6060,
//                                                                         source_id: Some(
//                                                                             SourceId {
//                                                                                 id: 1048577,
//                                                                             },
//                                                                         ),
//                                                                         start: 67,
//                                                                         end: 72,
//                                                                         as_str(): "64u64",
//                                                                     },
//                                                                 },
//                                                                 TyExpression {
//                                                                     expression: Literal(
//                                                                         U8(
//                                                                             8,
//                                                                         ),
//                                                                     ),
//                                                                     return_type: TypeId(
//                                                                         4,
//                                                                     ),
//                                                                     span: Span {
//                                                                         src (ptr): 0x00005f3a3a5a6060,
//                                                                         source_id: Some(
//                                                                             SourceId {
//                                                                                 id: 1048577,
//                                                                             },
//                                                                         ),
//                                                                         start: 74,
//                                                                         end: 77,
//                                                                         as_str(): "8u8",
//                                                                     },
//                                                                 },
//                                                             ],
//                                                         },
//                                                         return_type: TypeId(
//                                                             29,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x00005f3a3a5a6060,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 66,
//                                                             end: 78,
//                                                             as_str(): "(64u64, 8u8)",
//                                                         },
//                                                     },
//                                                     mutability: Immutable,
//                                                     return_type: TypeId(
//                                                         29,
//                                                     ),
//                                                     type_ascription: TypeArgument {
//                                                         type_id: TypeId(
//                                                             27,
//                                                         ),
//                                                         initial_type_id: TypeId(
//                                                             14,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x00005f3a3a5a6060,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 54,
//                                                             end: 63,
//                                                             as_str(): "(u64, u8)",
//                                                         },
//                                                         call_path_tree: None,
//                                                     },
//                                                 },
//                                             ),
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 47,
//                                             end: 79,
//                                             as_str(): "let _: (u64, u8) = (64u64, 8u8);",
//                                         },
//                                     },
//                                     TyAstNode {
//                                         content: Declaration(
//                                             VariableDecl(
//                                                 TyVariableDecl {
//                                                     name: _,
//                                                     body: TyExpression {
//                                                         expression: Tuple {
//                                                             fields: [
//                                                                 TyExpression {
//                                                                     expression: Literal(
//                                                                         U64(
//                                                                             64,
//                                                                         ),
//                                                                     ),
//                                                                     return_type: TypeId(
//                                                                         7,
//                                                                     ),
//                                                                     span: Span {
//                                                                         src (ptr): 0x00005f3a3a5a6060,
//                                                                         source_id: Some(
//                                                                             SourceId {
//                                                                                 id: 1048577,
//                                                                             },
//                                                                         ),
//                                                                         start: 104,
//                                                                         end: 109,
//                                                                         as_str(): "64u64",
//                                                                     },
//                                                                 },
//                                                                 TyExpression {
//                                                                     expression: Literal(
//                                                                         U8(
//                                                                             8,
//                                                                         ),
//                                                                     ),
//                                                                     return_type: TypeId(
//                                                                         4,
//                                                                     ),
//                                                                     span: Span {
//                                                                         src (ptr): 0x00005f3a3a5a6060,
//                                                                         source_id: Some(
//                                                                             SourceId {
//                                                                                 id: 1048577,
//                                                                             },
//                                                                         ),
//                                                                         start: 111,
//                                                                         end: 114,
//                                                                         as_str(): "8u8",
//                                                                     },
//                                                                 },
//                                                             ],
//                                                         },
//                                                         return_type: TypeId(
//                                                             32,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x00005f3a3a5a6060,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 103,
//                                                             end: 115,
//                                                             as_str(): "(64u64, 8u8)",
//                                                         },
//                                                     },
//                                                     mutability: Immutable,
//                                                     return_type: TypeId(
//                                                         32,
//                                                     ),
//                                                     type_ascription: TypeArgument {
//                                                         type_id: TypeId(
//                                                             30,
//                                                         ),
//                                                         initial_type_id: TypeId(
//                                                             15,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x00005f3a3a5a6060,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 91,
//                                                             end: 100,
//                                                             as_str(): "(u64, u8)",
//                                                         },
//                                                         call_path_tree: None,
//                                                     },
//                                                 },
//                                             ),
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 84,
//                                             end: 116,
//                                             as_str(): "let _: (u64, u8) = (64u64, 8u8);",
//                                         },
//                                     },
//                                 ],
//                                 whole_block_span: Span {
//                                     src (ptr): 0x00005f3a3a5a6060,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048577,
//                                         },
//                                     ),
//                                     start: 41,
//                                     end: 118,
//                                     as_str(): "{\n    let _: (u64, u8) = (64u64, 8u8);\n    let _: (u64, u8) = (64u64, 8u8);\n}",
//                                 },
//                             },
//                             parameters: [],
//                             implementing_type: None,
//                             implementing_for_typeid: None,
//                             span: Span {
//                                 src (ptr): 0x00005f3a3a5a6060,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048577,
//                                     },
//                                 ),
//                                 start: 27,
//                                 end: 118,
//                                 as_str(): "pub fn play() {\n    let _: (u64, u8) = (64u64, 8u8);\n    let _: (u64, u8) = (64u64, 8u8);\n}",
//                             },
//                             call_path: CallPath {
//                                 prefixes: [
//                                     plays,
//                                     play05A,
//                                 ],
//                                 suffix: play,
//                                 is_absolute: true,
//                             },
//                             attributes: AttributesMap(
//                                 {
//                                     Inline: [
//                                         Attribute {
//                                             name: inline,
//                                             args: [
//                                                 AttributeArg {
//                                                     name: never,
//                                                     value: None,
//                                                     span: Span {
//                                                         src (ptr): 0x00005f3a3a5a6060,
//                                                         source_id: Some(
//                                                             SourceId {
//                                                                 id: 1048577,
//                                                             },
//                                                         ),
//                                                         start: 19,
//                                                         end: 24,
//                                                         as_str(): "never",
//                                                     },
//                                                 },
//                                             ],
//                                             span: Span {
//                                                 src (ptr): 0x00005f3a3a5a6060,
//                                                 source_id: Some(
//                                                     SourceId {
//                                                         id: 1048577,
//                                                     },
//                                                 ),
//                                                 start: 10,
//                                                 end: 26,
//                                                 as_str(): "#[inline(never)]",
//                                             },
//                                         },
//                                     ],
//                                 },
//                             ),
//                             type_parameters: [],
//                             return_type: TypeArgument {
//                                 type_id: TypeId(
//                                     0,
//                                 ),
//                                 initial_type_id: TypeId(
//                                     0,
//                                 ),
//                                 span: Span {
//                                     src (ptr): 0x00005f3a3a5a6060,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048577,
//                                         },
//                                     ),
//                                     start: 27,
//                                     end: 40,
//                                     as_str(): "pub fn play()",
//                                 },
//                                 call_path_tree: None,
//                             },
//                             visibility: Public,
//                             is_contract_call: false,
//                             purity: Pure,
//                             where_clause: [],
//                             is_trait_method_dummy: false,
//                             is_type_check_finalized: true,
//                             kind: Default,
//                         },
//                     ),
//                     Some(
//                         TyFunctionDecl {
//                             name: play,
//                             body: TyCodeBlock {
//                                 contents: [
//                                     TyAstNode {
//                                         content: Declaration(
//                                             VariableDecl(
//                                                 TyVariableDecl {
//                                                     name: _,
//                                                     body: TyExpression {
//                                                         expression: Tuple {
//                                                             fields: [
//                                                                 TyExpression {
//                                                                     expression: Literal(
//                                                                         U64(
//                                                                             64,
//                                                                         ),
//                                                                     ),
//                                                                     return_type: TypeId(
//                                                                         7,
//                                                                     ),
//                                                                     span: Span {
//                                                                         src (ptr): 0x00005f3a3a5a6060,
//                                                                         source_id: Some(
//                                                                             SourceId {
//                                                                                 id: 1048577,
//                                                                             },
//                                                                         ),
//                                                                         start: 67,
//                                                                         end: 72,
//                                                                         as_str(): "64u64",
//                                                                     },
//                                                                 },
//                                                                 TyExpression {
//                                                                     expression: Literal(
//                                                                         U8(
//                                                                             8,
//                                                                         ),
//                                                                     ),
//                                                                     return_type: TypeId(
//                                                                         4,
//                                                                     ),
//                                                                     span: Span {
//                                                                         src (ptr): 0x00005f3a3a5a6060,
//                                                                         source_id: Some(
//                                                                             SourceId {
//                                                                                 id: 1048577,
//                                                                             },
//                                                                         ),
//                                                                         start: 74,
//                                                                         end: 77,
//                                                                         as_str(): "8u8",
//                                                                     },
//                                                                 },
//                                                             ],
//                                                         },
//                                                         return_type: TypeId(
//                                                             29,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x00005f3a3a5a6060,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 66,
//                                                             end: 78,
//                                                             as_str(): "(64u64, 8u8)",
//                                                         },
//                                                     },
//                                                     mutability: Immutable,
//                                                     return_type: TypeId(
//                                                         29,
//                                                     ),
//                                                     type_ascription: TypeArgument {
//                                                         type_id: TypeId(
//                                                             27,
//                                                         ),
//                                                         initial_type_id: TypeId(
//                                                             14,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x00005f3a3a5a6060,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 54,
//                                                             end: 63,
//                                                             as_str(): "(u64, u8)",
//                                                         },
//                                                         call_path_tree: None,
//                                                     },
//                                                 },
//                                             ),
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 47,
//                                             end: 79,
//                                             as_str(): "let _: (u64, u8) = (64u64, 8u8);",
//                                         },
//                                     },
//                                     TyAstNode {
//                                         content: Declaration(
//                                             VariableDecl(
//                                                 TyVariableDecl {
//                                                     name: _,
//                                                     body: TyExpression {
//                                                         expression: Tuple {
//                                                             fields: [
//                                                                 TyExpression {
//                                                                     expression: Literal(
//                                                                         U64(
//                                                                             64,
//                                                                         ),
//                                                                     ),
//                                                                     return_type: TypeId(
//                                                                         7,
//                                                                     ),
//                                                                     span: Span {
//                                                                         src (ptr): 0x00005f3a3a5a6060,
//                                                                         source_id: Some(
//                                                                             SourceId {
//                                                                                 id: 1048577,
//                                                                             },
//                                                                         ),
//                                                                         start: 104,
//                                                                         end: 109,
//                                                                         as_str(): "64u64",
//                                                                     },
//                                                                 },
//                                                                 TyExpression {
//                                                                     expression: Literal(
//                                                                         U8(
//                                                                             8,
//                                                                         ),
//                                                                     ),
//                                                                     return_type: TypeId(
//                                                                         4,
//                                                                     ),
//                                                                     span: Span {
//                                                                         src (ptr): 0x00005f3a3a5a6060,
//                                                                         source_id: Some(
//                                                                             SourceId {
//                                                                                 id: 1048577,
//                                                                             },
//                                                                         ),
//                                                                         start: 111,
//                                                                         end: 114,
//                                                                         as_str(): "8u8",
//                                                                     },
//                                                                 },
//                                                             ],
//                                                         },
//                                                         return_type: TypeId(
//                                                             32,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x00005f3a3a5a6060,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 103,
//                                                             end: 115,
//                                                             as_str(): "(64u64, 8u8)",
//                                                         },
//                                                     },
//                                                     mutability: Immutable,
//                                                     return_type: TypeId(
//                                                         32,
//                                                     ),
//                                                     type_ascription: TypeArgument {
//                                                         type_id: TypeId(
//                                                             30,
//                                                         ),
//                                                         initial_type_id: TypeId(
//                                                             15,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x00005f3a3a5a6060,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 91,
//                                                             end: 100,
//                                                             as_str(): "(u64, u8)",
//                                                         },
//                                                         call_path_tree: None,
//                                                     },
//                                                 },
//                                             ),
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5a6060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 84,
//                                             end: 116,
//                                             as_str(): "let _: (u64, u8) = (64u64, 8u8);",
//                                         },
//                                     },
//                                 ],
//                                 whole_block_span: Span {
//                                     src (ptr): 0x00005f3a3a5a6060,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048577,
//                                         },
//                                     ),
//                                     start: 41,
//                                     end: 118,
//                                     as_str(): "{\n    let _: (u64, u8) = (64u64, 8u8);\n    let _: (u64, u8) = (64u64, 8u8);\n}",
//                                 },
//                             },
//                             parameters: [],
//                             implementing_type: None,
//                             implementing_for_typeid: None,
//                             span: Span {
//                                 src (ptr): 0x00005f3a3a5a6060,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048577,
//                                     },
//                                 ),
//                                 start: 27,
//                                 end: 118,
//                                 as_str(): "pub fn play() {\n    let _: (u64, u8) = (64u64, 8u8);\n    let _: (u64, u8) = (64u64, 8u8);\n}",
//                             },
//                             call_path: CallPath {
//                                 prefixes: [
//                                     plays,
//                                     play05A,
//                                 ],
//                                 suffix: play,
//                                 is_absolute: true,
//                             },
//                             attributes: AttributesMap(
//                                 {
//                                     Inline: [
//                                         Attribute {
//                                             name: inline,
//                                             args: [
//                                                 AttributeArg {
//                                                     name: never,
//                                                     value: None,
//                                                     span: Span {
//                                                         src (ptr): 0x00005f3a3a5a6060,
//                                                         source_id: Some(
//                                                             SourceId {
//                                                                 id: 1048577,
//                                                             },
//                                                         ),
//                                                         start: 19,
//                                                         end: 24,
//                                                         as_str(): "never",
//                                                     },
//                                                 },
//                                             ],
//                                             span: Span {
//                                                 src (ptr): 0x00005f3a3a5a6060,
//                                                 source_id: Some(
//                                                     SourceId {
//                                                         id: 1048577,
//                                                     },
//                                                 ),
//                                                 start: 10,
//                                                 end: 26,
//                                                 as_str(): "#[inline(never)]",
//                                             },
//                                         },
//                                     ],
//                                 },
//                             ),
//                             type_parameters: [],
//                             return_type: TypeArgument {
//                                 type_id: TypeId(
//                                     0,
//                                 ),
//                                 initial_type_id: TypeId(
//                                     0,
//                                 ),
//                                 span: Span {
//                                     src (ptr): 0x00005f3a3a5a6060,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048577,
//                                         },
//                                     ),
//                                     start: 27,
//                                     end: 40,
//                                     as_str(): "pub fn play()",
//                                 },
//                                 call_path_tree: None,
//                             },
//                             visibility: Public,
//                             is_contract_call: false,
//                             purity: Pure,
//                             where_clause: [],
//                             is_trait_method_dummy: false,
//                             is_type_check_finalized: true,
//                             kind: Default,
//                         },
//                     ),
//                     Some(
//                         TyFunctionDecl {
//                             name: main,
//                             body: TyCodeBlock {
//                                 contents: [
//                                     TyAstNode {
//                                         content: Expression(
//                                             TyExpression {
//                                                 expression: FunctionApplication {
//                                                     call_path: CallPath {
//                                                         prefixes: [
//                                                             play05A,
//                                                         ],
//                                                         suffix: play,
//                                                         is_absolute: false,
//                                                     },
//                                                     arguments: [],
//                                                     fn_ref: DeclRef {
//                                                         name: play,
//                                                         id: DeclId(
//                                                             4,
//                                                         ),
//                                                         decl_span: Span {
//                                                             src (ptr): 0x00005f3a3a5a6060,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 27,
//                                                             end: 118,
//                                                             as_str(): "pub fn play() {\n    let _: (u64, u8) = (64u64, 8u8);\n    let _: (u64, u8) = (64u64, 8u8);\n}",
//                                                         },
//                                                     },
//                                                     selector: None,
//                                                     type_binding: Some(
//                                                         TypeBinding {
//                                                             inner: (),
//                                                             type_arguments: Regular(
//                                                                 [],
//                                                             ),
//                                                             span: Span {
//                                                                 src (ptr): 0x00005f3a3a5bde60,
//                                                                 source_id: Some(
//                                                                     SourceId {
//                                                                         id: 1048576,
//                                                                     },
//                                                                 ),
//                                                                 start: 359,
//                                                                 end: 372,
//                                                                 as_str(): "play05A::play",
//                                                             },
//                                                         },
//                                                     ),
//                                                     call_path_typeid: None,
//                                                     contract_call_params: {},
//                                                     contract_caller: None,
//                                                 },
//                                                 return_type: TypeId(
//                                                     0,
//                                                 ),
//                                                 span: Span {
//                                                     src (ptr): 0x00005f3a3a5bde60,
//                                                     source_id: Some(
//                                                         SourceId {
//                                                             id: 1048576,
//                                                         },
//                                                     ),
//                                                     start: 359,
//                                                     end: 374,
//                                                     as_str(): "play05A::play()",
//                                                 },
//                                             },
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x00005f3a3a5bde60,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048576,
//                                                 },
//                                             ),
//                                             start: 359,
//                                             end: 374,
//                                             as_str(): "play05A::play()",
//                                         },
//                                     },
//                                 ],
//                                 whole_block_span: Span {
//                                     src (ptr): 0x00005f3a3a5bde60,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048576,
//                                         },
//                                     ),
//                                     start: 161,
//                                     end: 377,
//                                     as_str(): "{\n    // play01A::play();\n    // play01B::play();\n    // play01C::play();\n    // play02A::play();\n    // play03A::play();\n    // play04A::play();\n    // play04B::play();\n    // play04C::play();\n    play05A::play();\n}",
//                                 },
//                             },
//                             parameters: [],
//                             implementing_type: None,
//                             implementing_for_typeid: None,
//                             span: Span {
//                                 src (ptr): 0x00005f3a3a5bde60,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 151,
//                                 end: 377,
//                                 as_str(): "fn main() {\n    // play01A::play();\n    // play01B::play();\n    // play01C::play();\n    // play02A::play();\n    // play03A::play();\n    // play04A::play();\n    // play04B::play();\n    // play04C::play();\n    play05A::play();\n}",
//                             },
//                             call_path: CallPath {
//                                 prefixes: [
//                                     plays,
//                                 ],
//                                 suffix: main,
//                                 is_absolute: true,
//                             },
//                             attributes: AttributesMap(
//                                 {},
//                             ),
//                             type_parameters: [],
//                             return_type: TypeArgument {
//                                 type_id: TypeId(
//                                     0,
//                                 ),
//                                 initial_type_id: TypeId(
//                                     0,
//                                 ),
//                                 span: Span {
//                                     src (ptr): 0x00005f3a3a5bde60,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048576,
//                                         },
//                                     ),
//                                     start: 151,
//                                     end: 160,
//                                     as_str(): "fn main()",
//                                 },
//                                 call_path_tree: None,
//                             },
//                             visibility: Private,
//                             is_contract_call: false,
//                             purity: Pure,
//                             where_clause: [],
//                             is_trait_method_dummy: false,
//                             is_type_check_finalized: true,
//                             kind: Main,
//                         },
//                     ),
//                 ],
//                 free_list: [],
//             },
//         },
//     },
//     trait_slab: ConcurrentSlab {
//         inner: RwLock {
//             data: Inner {
//                 items: [],
//                 free_list: [],
//             },
//         },
//     },
//     trait_fn_slab: ConcurrentSlab {
//         inner: RwLock {
//             data: Inner {
//                 items: [],
//                 free_list: [],
//             },
//         },
//     },
//     trait_type_slab: ConcurrentSlab {
//         inner: RwLock {
//             data: Inner {
//                 items: [],
//                 free_list: [],
//             },
//         },
//     },
//     impl_self_or_trait_slab: ConcurrentSlab {
//         inner: RwLock {
//             data: Inner {
//                 items: [],
//                 free_list: [],
//             },
//         },
//     },
//     struct_slab: ConcurrentSlab {
//         inner: RwLock {
//             data: Inner {
//                 items: [],
//                 free_list: [],
//             },
//         },
//     },
//     storage_slab: ConcurrentSlab {
//         inner: RwLock {
//             data: Inner {
//                 items: [],
//                 free_list: [],
//             },
//         },
//     },
//     abi_slab: ConcurrentSlab {
//         inner: RwLock {
//             data: Inner {
//                 items: [],
//                 free_list: [],
//             },
//         },
//     },
//     constant_slab: ConcurrentSlab {
//         inner: RwLock {
//             data: Inner {
//                 items: [],
//                 free_list: [],
//             },
//         },
//     },
//     configurable_slab: ConcurrentSlab {
//         inner: RwLock {
//             data: Inner {
//                 items: [],
//                 free_list: [],
//             },
//         },
//     },
//     enum_slab: ConcurrentSlab {
//         inner: RwLock {
//             data: Inner {
//                 items: [],
//                 free_list: [],
//             },
//         },
//     },
//     type_alias_slab: ConcurrentSlab {
//         inner: RwLock {
//             data: Inner {
//                 items: [],
//                 free_list: [],
//             },
//         },
//     },
//     function_parsed_decl_id_map: RwLock {
//         data: {
//             DeclId(
//                 4,
//             ): ParsedDeclId(
//                 0,
//             ),
//             DeclId(
//                 2,
//             ): ParsedDeclId(
//                 0,
//             ),
//             DeclId(
//                 1,
//             ): ParsedDeclId(
//                 0,
//             ),
//             DeclId(
//                 5,
//             ): ParsedDeclId(
//                 1,
//             ),
//             DeclId(
//                 0,
//             ): ParsedDeclId(
//                 0,
//             ),
//             DeclId(
//                 3,
//             ): ParsedDeclId(
//                 0,
//             ),
//         },
//     },
//     trait_parsed_decl_id_map: RwLock {
//         data: {},
//     },
//     trait_fn_parsed_decl_id_map: RwLock {
//         data: {},
//     },
//     trait_type_parsed_decl_id_map: RwLock {
//         data: {},
//     },
//     impl_self_or_trait_parsed_decl_id_map: RwLock {
//         data: {},
//     },
//     struct_parsed_decl_id_map: RwLock {
//         data: {},
//     },
//     storage_parsed_decl_id_map: RwLock {
//         data: {},
//     },
//     abi_parsed_decl_id_map: RwLock {
//         data: {},
//     },
//     constant_parsed_decl_id_map: RwLock {
//         data: {},
//     },
//     configurable_parsed_decl_id_map: RwLock {
//         data: {},
//     },
//     enum_parsed_decl_id_map: RwLock {
//         data: {},
//     },
//     type_alias_parsed_decl_id_map: RwLock {
//         data: {},
//     },
//     parents: RwLock {
//         data: {
//             Function(
//                 DeclId(
//                     1,
//                 ),
//             ): [
//                 Function(
//                     DeclId(
//                         0,
//                     ),
//                 ),
//             ],
//             Function(
//                 DeclId(
//                     2,
//                 ),
//             ): [
//                 Function(
//                     DeclId(
//                         1,
//                     ),
//                 ),
//             ],
//             Function(
//                 DeclId(
//                     4,
//                 ),
//             ): [
//                 Function(
//                     DeclId(
//                         3,
//                     ),
//                 ),
//             ],
//             Function(
//                 DeclId(
//                     3,
//                 ),
//             ): [
//                 Function(
//                     DeclId(
//                         0,
//                     ),
//                 ),
//             ],
//         },
//     },
// }
