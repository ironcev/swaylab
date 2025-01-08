library;

struct S {}

#[inline(never)]
pub fn play() {
    let x = S {};
    take_s(x);
}

fn take_s(s: S) -> S {
    s
}

// On master:
// Slab length:     23
// Slab capacity:   32
// Slab free slots: 0
// Type engine contents: 23 types
//     Unknowns: 7
//     Structs: 4
//     Units: 8
//     Customs: 4
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
//                                         suffix: S,
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
//                             type_info: Unknown,
//                             source_id: Some(
//                                 SourceId {
//                                     id: 0,
//                                 },
//                             ),
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Unknown,
//                             source_id: Some(
//                                 SourceId {
//                                     id: 0,
//                                 },
//                             ),
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Unknown,
//                             source_id: Some(
//                                 SourceId {
//                                     id: 0,
//                                 },
//                             ),
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Unknown,
//                             source_id: Some(
//                                 SourceId {
//                                     id: 0,
//                                 },
//                             ),
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: Unknown,
//                             source_id: Some(
//                                 SourceId {
//                                     id: 0,
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
//                             source_id: Some(
//                                 SourceId {
//                                     id: 0,
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
//                             source_id: Some(
//                                 SourceId {
//                                     id: 0,
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
//     id_map: RwLock {
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
//                 10,
//             ),
//         },
//     },
//     unifications: ConcurrentSlab {
//         inner: RwLock {
//             data: Inner {
//                 items: [
//                     Some(
//                         Unification {
//                             received: TypeId(
//                                 12,
//                             ),
//                             expected: TypeId(
//                                 19,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x000063448dc6f8d0,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 79,
//                                 end: 92,
//                                 as_str(): "play01B::play",
//                             },
//                             help_text: "Function return type does not match up with local type annotation.",
//                             unify_kind: WithGeneric,
//                         },
//                     ),
//                     Some(
//                         Unification {
//                             received: TypeId(
//                                 12,
//                             ),
//                             expected: TypeId(
//                                 19,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x000063448dc6f8d0,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 79,
//                                 end: 94,
//                                 as_str(): "play01B::play()",
//                             },
//                             help_text: "",
//                             unify_kind: Default,
//                         },
//                     ),
//                     Some(
//                         Unification {
//                             received: TypeId(
//                                 12,
//                             ),
//                             expected: TypeId(
//                                 21,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x000063448dc6f8d0,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 79,
//                                 end: 92,
//                                 as_str(): "play01B::play",
//                             },
//                             help_text: "Function return type does not match up with local type annotation.",
//                             unify_kind: WithGeneric,
//                         },
//                     ),
//                     Some(
//                         Unification {
//                             received: TypeId(
//                                 12,
//                             ),
//                             expected: TypeId(
//                                 21,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x000063448dc6f8d0,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 79,
//                                 end: 94,
//                                 as_str(): "play01B::play()",
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
//             tv_sec: 999963,
//             tv_nsec: 298261411,
//         },
//     },
// }