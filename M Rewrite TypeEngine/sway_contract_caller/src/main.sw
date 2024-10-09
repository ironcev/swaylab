script;

mod lib_a;
mod lib_b;

mod play01A;

use ::lib_a::*;
use ::lib_b::*;

use ::lib_a::Abi as Abi;

fn main() {
    // let _ = abi(::lib_a::Abi, 0x1111111111111111111111111111111111111111111111111111111111111111);
    // let _ = abi(::lib_b::Abi, 0x2222222222222222222222222222222222222222222222222222222222222222);
    // let _ = abi(Abi, 0x3333333333333333333333333333333333333333333333333333333333333333);
    play01A::play();
}

// Main:
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
//                             type_info: ContractCaller {
//                                 abi_name: Known(
//                                     CallPath {
//                                         prefixes: [
//                                             lib_a,
//                                         ],
//                                         suffix: Abi,
//                                         is_absolute: true,
//                                     },
//                                 ),
//                                 address: Some(
//                                     TyExpression {
//                                         expression: Literal(
//                                             B256(
//                                                 [
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                 ],
//                                             ),
//                                         ),
//                                         return_type: TypeId(
//                                             10,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x000061af25fc6da0,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048576,
//                                                 },
//                                             ),
//                                             start: 150,
//                                             end: 216,
//                                             as_str(): "0x1111111111111111111111111111111111111111111111111111111111111111",
//                                         },
//                                     },
//                                 ),
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
//                             type_info: ContractCaller {
//                                 abi_name: Known(
//                                     CallPath {
//                                         prefixes: [
//                                             lib_b,
//                                         ],
//                                         suffix: Abi,
//                                         is_absolute: true,
//                                     },
//                                 ),
//                                 address: Some(
//                                     TyExpression {
//                                         expression: Literal(
//                                             B256(
//                                                 [
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                 ],
//                                             ),
//                                         ),
//                                         return_type: TypeId(
//                                             10,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x000061af25fc6da0,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048576,
//                                                 },
//                                             ),
//                                             start: 249,
//                                             end: 315,
//                                             as_str(): "0x2222222222222222222222222222222222222222222222222222222222222222",
//                                         },
//                                     },
//                                 ),
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
//                             type_info: ContractCaller {
//                                 abi_name: Known(
//                                     CallPath {
//                                         prefixes: [],
//                                         suffix: Abi,
//                                         is_absolute: false,
//                                     },
//                                 ),
//                                 address: Some(
//                                     TyExpression {
//                                         expression: Literal(
//                                             B256(
//                                                 [
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                 ],
//                                             ),
//                                         ),
//                                         return_type: TypeId(
//                                             10,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x000061af25fc6da0,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048576,
//                                                 },
//                                             ),
//                                             start: 339,
//                                             end: 405,
//                                             as_str(): "0x3333333333333333333333333333333333333333333333333333333333333333",
//                                         },
//                                     },
//                                 ),
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
//                             type_info: UnknownGeneric {
//                                 name: Self,
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
//                             type_info: Unknown,
//                             source_id: None,
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: UnknownGeneric {
//                                 name: Self,
//                                 trait_constraints: [],
//                                 parent: None,
//                                 is_from_type_parameter: true,
//                             },
//                             source_id: Some(
//                                 SourceId {
//                                     id: 1048578,
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
//                             source_id: None,
//                         },
//                     ),
//                     Some(
//                         TypeSourceInfo {
//                             type_info: ContractCaller {
//                                 abi_name: Known(
//                                     CallPath {
//                                         prefixes: [
//                                             lib_a,
//                                         ],
//                                         suffix: Abi,
//                                         is_absolute: true,
//                                     },
//                                 ),
//                                 address: Some(
//                                     TyExpression {
//                                         expression: Literal(
//                                             B256(
//                                                 [
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                 ],
//                                             ),
//                                         ),
//                                         return_type: TypeId(
//                                             10,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x000061af25fc6da0,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048576,
//                                                 },
//                                             ),
//                                             start: 150,
//                                             end: 216,
//                                             as_str(): "0x1111111111111111111111111111111111111111111111111111111111111111",
//                                         },
//                                     },
//                                 ),
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
//                             type_info: ContractCaller {
//                                 abi_name: Known(
//                                     CallPath {
//                                         prefixes: [
//                                             lib_b,
//                                         ],
//                                         suffix: Abi,
//                                         is_absolute: true,
//                                     },
//                                 ),
//                                 address: Some(
//                                     TyExpression {
//                                         expression: Literal(
//                                             B256(
//                                                 [
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                 ],
//                                             ),
//                                         ),
//                                         return_type: TypeId(
//                                             10,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x000061af25fc6da0,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048576,
//                                                 },
//                                             ),
//                                             start: 249,
//                                             end: 315,
//                                             as_str(): "0x2222222222222222222222222222222222222222222222222222222222222222",
//                                         },
//                                     },
//                                 ),
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
//                             type_info: ContractCaller {
//                                 abi_name: Known(
//                                     CallPath {
//                                         prefixes: [],
//                                         suffix: Abi,
//                                         is_absolute: false,
//                                     },
//                                 ),
//                                 address: Some(
//                                     TyExpression {
//                                         expression: Literal(
//                                             B256(
//                                                 [
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                 ],
//                                             ),
//                                         ),
//                                         return_type: TypeId(
//                                             10,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x000061af25fc6da0,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048576,
//                                                 },
//                                             ),
//                                             start: 339,
//                                             end: 405,
//                                             as_str(): "0x3333333333333333333333333333333333333333333333333333333333333333",
//                                         },
//                                     },
//                                 ),
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
//                             type_info: ContractCaller {
//                                 abi_name: Known(
//                                     CallPath {
//                                         prefixes: [
//                                             lib_a,
//                                         ],
//                                         suffix: Abi,
//                                         is_absolute: true,
//                                     },
//                                 ),
//                                 address: Some(
//                                     TyExpression {
//                                         expression: Literal(
//                                             B256(
//                                                 [
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                     17,
//                                                 ],
//                                             ),
//                                         ),
//                                         return_type: TypeId(
//                                             10,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x000061af25fc6da0,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048576,
//                                                 },
//                                             ),
//                                             start: 150,
//                                             end: 216,
//                                             as_str(): "0x1111111111111111111111111111111111111111111111111111111111111111",
//                                         },
//                                     },
//                                 ),
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
//                             type_info: ContractCaller {
//                                 abi_name: Known(
//                                     CallPath {
//                                         prefixes: [
//                                             lib_b,
//                                         ],
//                                         suffix: Abi,
//                                         is_absolute: true,
//                                     },
//                                 ),
//                                 address: Some(
//                                     TyExpression {
//                                         expression: Literal(
//                                             B256(
//                                                 [
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                     34,
//                                                 ],
//                                             ),
//                                         ),
//                                         return_type: TypeId(
//                                             10,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x000061af25fc6da0,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048576,
//                                                 },
//                                             ),
//                                             start: 249,
//                                             end: 315,
//                                             as_str(): "0x2222222222222222222222222222222222222222222222222222222222222222",
//                                         },
//                                     },
//                                 ),
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
//                             type_info: ContractCaller {
//                                 abi_name: Known(
//                                     CallPath {
//                                         prefixes: [],
//                                         suffix: Abi,
//                                         is_absolute: false,
//                                     },
//                                 ),
//                                 address: Some(
//                                     TyExpression {
//                                         expression: Literal(
//                                             B256(
//                                                 [
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                     51,
//                                                 ],
//                                             ),
//                                         ),
//                                         return_type: TypeId(
//                                             10,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x000061af25fc6da0,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048576,
//                                                 },
//                                             ),
//                                             start: 339,
//                                             end: 405,
//                                             as_str(): "0x3333333333333333333333333333333333333333333333333333333333333333",
//                                         },
//                                     },
//                                 ),
//                             },
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
//     shareable_types: RwLock {
//         data: {
//             TypeSourceInfo {
//                 type_info: Tuple(
//                     [],
//                 ),
//                 source_id: None,
//             }: TypeId(
//                 26,
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
//                                 10,
//                             ),
//                             expected: TypeId(
//                                 10,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x000061af25fc6da0,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 150,
//                                 end: 216,
//                                 as_str(): "0x1111111111111111111111111111111111111111111111111111111111111111",
//                             },
//                             help_text: "An address that is being ABI cast must be of type b256",
//                             unify_kind: Default,
//                         },
//                     ),
//                     Some(
//                         Unification {
//                             received: TypeId(
//                                 27,
//                             ),
//                             expected: TypeId(
//                                 14,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x000061af25fc6da0,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 132,
//                                 end: 217,
//                                 as_str(): "abi(::lib_a::Abi, 0x1111111111111111111111111111111111111111111111111111111111111111)",
//                             },
//                             help_text: "Variable declaration's type annotation does not match up with the assigned expression's type.",
//                             unify_kind: Default,
//                         },
//                     ),
//                     Some(
//                         Unification {
//                             received: TypeId(
//                                 10,
//                             ),
//                             expected: TypeId(
//                                 10,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x000061af25fc6da0,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 249,
//                                 end: 315,
//                                 as_str(): "0x2222222222222222222222222222222222222222222222222222222222222222",
//                             },
//                             help_text: "An address that is being ABI cast must be of type b256",
//                             unify_kind: Default,
//                         },
//                     ),
//                     Some(
//                         Unification {
//                             received: TypeId(
//                                 28,
//                             ),
//                             expected: TypeId(
//                                 15,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x000061af25fc6da0,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 231,
//                                 end: 316,
//                                 as_str(): "abi(::lib_b::Abi, 0x2222222222222222222222222222222222222222222222222222222222222222)",
//                             },
//                             help_text: "Variable declaration's type annotation does not match up with the assigned expression's type.",
//                             unify_kind: Default,
//                         },
//                     ),
//                     Some(
//                         Unification {
//                             received: TypeId(
//                                 10,
//                             ),
//                             expected: TypeId(
//                                 10,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x000061af25fc6da0,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 339,
//                                 end: 405,
//                                 as_str(): "0x3333333333333333333333333333333333333333333333333333333333333333",
//                             },
//                             help_text: "An address that is being ABI cast must be of type b256",
//                             unify_kind: Default,
//                         },
//                     ),
//                     Some(
//                         Unification {
//                             received: TypeId(
//                                 29,
//                             ),
//                             expected: TypeId(
//                                 16,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x000061af25fc6da0,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 330,
//                                 end: 406,
//                                 as_str(): "abi(Abi, 0x3333333333333333333333333333333333333333333333333333333333333333)",
//                             },
//                             help_text: "Variable declaration's type annotation does not match up with the assigned expression's type.",
//                             unify_kind: Default,
//                         },
//                     ),
//                     Some(
//                         Unification {
//                             received: TypeId(
//                                 10,
//                             ),
//                             expected: TypeId(
//                                 10,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x000061af25fc6da0,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 150,
//                                 end: 216,
//                                 as_str(): "0x1111111111111111111111111111111111111111111111111111111111111111",
//                             },
//                             help_text: "An address that is being ABI cast must be of type b256",
//                             unify_kind: Default,
//                         },
//                     ),
//                     Some(
//                         Unification {
//                             received: TypeId(
//                                 30,
//                             ),
//                             expected: TypeId(
//                                 14,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x000061af25fc6da0,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 132,
//                                 end: 217,
//                                 as_str(): "abi(::lib_a::Abi, 0x1111111111111111111111111111111111111111111111111111111111111111)",
//                             },
//                             help_text: "Variable declaration's type annotation does not match up with the assigned expression's type.",
//                             unify_kind: Default,
//                         },
//                     ),
//                     Some(
//                         Unification {
//                             received: TypeId(
//                                 30,
//                             ),
//                             expected: TypeId(
//                                 27,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x000061af25fc6da0,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 128,
//                                 end: 129,
//                                 as_str(): "_",
//                             },
//                             help_text: "",
//                             unify_kind: Default,
//                         },
//                     ),
//                     Some(
//                         Unification {
//                             received: TypeId(
//                                 10,
//                             ),
//                             expected: TypeId(
//                                 10,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x000061af25fc6da0,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 249,
//                                 end: 315,
//                                 as_str(): "0x2222222222222222222222222222222222222222222222222222222222222222",
//                             },
//                             help_text: "An address that is being ABI cast must be of type b256",
//                             unify_kind: Default,
//                         },
//                     ),
//                     Some(
//                         Unification {
//                             received: TypeId(
//                                 31,
//                             ),
//                             expected: TypeId(
//                                 15,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x000061af25fc6da0,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 231,
//                                 end: 316,
//                                 as_str(): "abi(::lib_b::Abi, 0x2222222222222222222222222222222222222222222222222222222222222222)",
//                             },
//                             help_text: "Variable declaration's type annotation does not match up with the assigned expression's type.",
//                             unify_kind: Default,
//                         },
//                     ),
//                     Some(
//                         Unification {
//                             received: TypeId(
//                                 31,
//                             ),
//                             expected: TypeId(
//                                 28,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x000061af25fc6da0,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 227,
//                                 end: 228,
//                                 as_str(): "_",
//                             },
//                             help_text: "",
//                             unify_kind: Default,
//                         },
//                     ),
//                     Some(
//                         Unification {
//                             received: TypeId(
//                                 10,
//                             ),
//                             expected: TypeId(
//                                 10,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x000061af25fc6da0,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 339,
//                                 end: 405,
//                                 as_str(): "0x3333333333333333333333333333333333333333333333333333333333333333",
//                             },
//                             help_text: "An address that is being ABI cast must be of type b256",
//                             unify_kind: Default,
//                         },
//                     ),
//                     Some(
//                         Unification {
//                             received: TypeId(
//                                 32,
//                             ),
//                             expected: TypeId(
//                                 16,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x000061af25fc6da0,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 330,
//                                 end: 406,
//                                 as_str(): "abi(Abi, 0x3333333333333333333333333333333333333333333333333333333333333333)",
//                             },
//                             help_text: "Variable declaration's type annotation does not match up with the assigned expression's type.",
//                             unify_kind: Default,
//                         },
//                     ),
//                     Some(
//                         Unification {
//                             received: TypeId(
//                                 32,
//                             ),
//                             expected: TypeId(
//                                 29,
//                             ),
//                             span: Span {
//                                 src (ptr): 0x000061af25fc6da0,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 326,
//                                 end: 327,
//                                 as_str(): "_",
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
//             tv_sec: 1700957,
//             tv_nsec: 624532374,
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
//             insert_tuple: 0,
//             insert_array: 0,
//             insert_string_array: 0,
//             insert_contract_caller: 0,
//             replace: 0,
//             replace_unknown: 0,
//             replace_numeric: 0,
//             replace_unknown_generic: 0,
//             replace_placeholder: 0,
//         },
//     },
// }
