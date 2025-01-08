library;

enum GE1<T> {
    A: T,
    B: u64,
    C: (u8, u16),
}

#[inline(never)]
pub fn play() {
    let _ = GE1::<u64>::A(0u64);
}

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
//                                                         expression: EnumInstantiation {
//                                                             enum_ref: DeclRef {
//                                                                 name: GE1,
//                                                                 id: DeclId(
//                                                                     2,
//                                                                 ),
//                                                                 decl_span: Span {
//                                                                     src (ptr): 0x000061454d9f1240,
//                                                                     source_id: Some(
//                                                                         SourceId {
//                                                                             id: 1048577,
//                                                                         },
//                                                                     ),
//                                                                     start: 10,
//                                                                     end: 65,
//                                                                     as_str(): "enum GE1<T> {\n    A: T,\n    B: u64,\n    C: (u8, u16),\n}",
//                                                                 },
//                                                             },
//                                                             variant_name: A,
//                                                             tag: 0,
//                                                             contents: Some(
//                                                                 TyExpression {
//                                                                     expression: Literal(
//                                                                         U64(
//                                                                             0,
//                                                                         ),
//                                                                     ),
//                                                                     return_type: TypeId(
//                                                                         7,
//                                                                     ),
//                                                                     span: Span {
//                                                                         src (ptr): 0x000061454d9f1240,
//                                                                         source_id: Some(
//                                                                             SourceId {
//                                                                                 id: 1048577,
//                                                                             },
//                                                                         ),
//                                                                         start: 126,
//                                                                         end: 130,
//                                                                         as_str(): "0u64",
//                                                                     },
//                                                                 },
//                                                             ),
//                                                             variant_instantiation_span: Span {
//                                                                 src (ptr): 0x000061454d9f1240,
//                                                                 source_id: Some(
//                                                                     SourceId {
//                                                                         id: 1048577,
//                                                                     },
//                                                                 ),
//                                                                 start: 124,
//                                                                 end: 125,
//                                                                 as_str(): "A",
//                                                             },
//                                                             call_path_binding: TypeBinding {
//                                                                 inner: CallPath {
//                                                                     prefixes: [],
//                                                                     suffix: GE1,
//                                                                     is_absolute: false,
//                                                                 },
//                                                                 type_arguments: Prefix(
//                                                                     [
//                                                                         TypeArgument {
//                                                                             type_id: TypeId(
//                                                                                 7,
//                                                                             ),
//                                                                             initial_type_id: TypeId(
//                                                                                 7,
//                                                                             ),
//                                                                             span: Span {
//                                                                                 src (ptr): 0x000061454d9f1240,
//                                                                                 source_id: Some(
//                                                                                     SourceId {
//                                                                                         id: 1048577,
//                                                                                     },
//                                                                                 ),
//                                                                                 start: 118,
//                                                                                 end: 121,
//                                                                                 as_str(): "u64",
//                                                                             },
//                                                                             call_path_tree: Some(
//                                                                                 CallPathTree {
//                                                                                     qualified_call_path: QualifiedCallPath {
//                                                                                         call_path: CallPath {
//                                                                                             prefixes: [],
//                                                                                             suffix: u64,
//                                                                                             is_absolute: false,
//                                                                                         },
//                                                                                         qualified_path_root: None,
//                                                                                     },
//                                                                                     children: [],
//                                                                                 },
//                                                                             ),
//                                                                         },
//                                                                     ],
//                                                                 ),
//                                                                 span: Span {
//                                                                     src (ptr): 0x000061454d9f1240,
//                                                                     source_id: Some(
//                                                                         SourceId {
//                                                                             id: 1048577,
//                                                                         },
//                                                                     ),
//                                                                     start: 112,
//                                                                     end: 125,
//                                                                     as_str(): "GE1::<u64>::A",
//                                                                 },
//                                                             },
//                                                             call_path_decl: EnumDecl(
//                                                                 EnumDecl {
//                                                                     decl_id: DeclId(
//                                                                         0,
//                                                                     ),
//                                                                 },
//                                                             ),
//                                                         },
//                                                         return_type: TypeId(
//                                                             26,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x000061454d9f1240,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 124,
//                                                             end: 125,
//                                                             as_str(): "A",
//                                                         },
//                                                     },
//                                                     mutability: Immutable,
//                                                     return_type: TypeId(
//                                                         26,
//                                                     ),
//                                                     type_ascription: TypeArgument {
//                                                         type_id: TypeId(
//                                                             17,
//                                                         ),
//                                                         initial_type_id: TypeId(
//                                                             17,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x000061454d9f1240,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 108,
//                                                             end: 109,
//                                                             as_str(): "_",
//                                                         },
//                                                         call_path_tree: None,
//                                                     },
//                                                 },
//                                             ),
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x000061454d9f1240,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 104,
//                                             end: 132,
//                                             as_str(): "let _ = GE1::<u64>::A(0u64);",
//                                         },
//                                     },
//                                 ],
//                                 whole_block_span: Span {
//                                     src (ptr): 0x000061454d9f1240,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048577,
//                                         },
//                                     ),
//                                     start: 98,
//                                     end: 134,
//                                     as_str(): "{\n    let _ = GE1::<u64>::A(0u64);\n}",
//                                 },
//                             },
//                             parameters: [],
//                             implementing_type: None,
//                             implementing_for_typeid: None,
//                             span: Span {
//                                 src (ptr): 0x000061454d9f1240,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048577,
//                                     },
//                                 ),
//                                 start: 84,
//                                 end: 134,
//                                 as_str(): "pub fn play() {\n    let _ = GE1::<u64>::A(0u64);\n}",
//                             },
//                             call_path: CallPath {
//                                 prefixes: [
//                                     plays,
//                                     play04C,
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
//                                                         src (ptr): 0x000061454d9f1240,
//                                                         source_id: Some(
//                                                             SourceId {
//                                                                 id: 1048577,
//                                                             },
//                                                         ),
//                                                         start: 76,
//                                                         end: 81,
//                                                         as_str(): "never",
//                                                     },
//                                                 },
//                                             ],
//                                             span: Span {
//                                                 src (ptr): 0x000061454d9f1240,
//                                                 source_id: Some(
//                                                     SourceId {
//                                                         id: 1048577,
//                                                     },
//                                                 ),
//                                                 start: 67,
//                                                 end: 83,
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
//                                     src (ptr): 0x000061454d9f1240,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048577,
//                                         },
//                                     ),
//                                     start: 84,
//                                     end: 97,
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
//                                                         expression: EnumInstantiation {
//                                                             enum_ref: DeclRef {
//                                                                 name: GE1,
//                                                                 id: DeclId(
//                                                                     2,
//                                                                 ),
//                                                                 decl_span: Span {
//                                                                     src (ptr): 0x000061454d9f1240,
//                                                                     source_id: Some(
//                                                                         SourceId {
//                                                                             id: 1048577,
//                                                                         },
//                                                                     ),
//                                                                     start: 10,
//                                                                     end: 65,
//                                                                     as_str(): "enum GE1<T> {\n    A: T,\n    B: u64,\n    C: (u8, u16),\n}",
//                                                                 },
//                                                             },
//                                                             variant_name: A,
//                                                             tag: 0,
//                                                             contents: Some(
//                                                                 TyExpression {
//                                                                     expression: Literal(
//                                                                         U64(
//                                                                             0,
//                                                                         ),
//                                                                     ),
//                                                                     return_type: TypeId(
//                                                                         7,
//                                                                     ),
//                                                                     span: Span {
//                                                                         src (ptr): 0x000061454d9f1240,
//                                                                         source_id: Some(
//                                                                             SourceId {
//                                                                                 id: 1048577,
//                                                                             },
//                                                                         ),
//                                                                         start: 126,
//                                                                         end: 130,
//                                                                         as_str(): "0u64",
//                                                                     },
//                                                                 },
//                                                             ),
//                                                             variant_instantiation_span: Span {
//                                                                 src (ptr): 0x000061454d9f1240,
//                                                                 source_id: Some(
//                                                                     SourceId {
//                                                                         id: 1048577,
//                                                                     },
//                                                                 ),
//                                                                 start: 124,
//                                                                 end: 125,
//                                                                 as_str(): "A",
//                                                             },
//                                                             call_path_binding: TypeBinding {
//                                                                 inner: CallPath {
//                                                                     prefixes: [],
//                                                                     suffix: GE1,
//                                                                     is_absolute: false,
//                                                                 },
//                                                                 type_arguments: Prefix(
//                                                                     [
//                                                                         TypeArgument {
//                                                                             type_id: TypeId(
//                                                                                 7,
//                                                                             ),
//                                                                             initial_type_id: TypeId(
//                                                                                 7,
//                                                                             ),
//                                                                             span: Span {
//                                                                                 src (ptr): 0x000061454d9f1240,
//                                                                                 source_id: Some(
//                                                                                     SourceId {
//                                                                                         id: 1048577,
//                                                                                     },
//                                                                                 ),
//                                                                                 start: 118,
//                                                                                 end: 121,
//                                                                                 as_str(): "u64",
//                                                                             },
//                                                                             call_path_tree: Some(
//                                                                                 CallPathTree {
//                                                                                     qualified_call_path: QualifiedCallPath {
//                                                                                         call_path: CallPath {
//                                                                                             prefixes: [],
//                                                                                             suffix: u64,
//                                                                                             is_absolute: false,
//                                                                                         },
//                                                                                         qualified_path_root: None,
//                                                                                     },
//                                                                                     children: [],
//                                                                                 },
//                                                                             ),
//                                                                         },
//                                                                     ],
//                                                                 ),
//                                                                 span: Span {
//                                                                     src (ptr): 0x000061454d9f1240,
//                                                                     source_id: Some(
//                                                                         SourceId {
//                                                                             id: 1048577,
//                                                                         },
//                                                                     ),
//                                                                     start: 112,
//                                                                     end: 125,
//                                                                     as_str(): "GE1::<u64>::A",
//                                                                 },
//                                                             },
//                                                             call_path_decl: EnumDecl(
//                                                                 EnumDecl {
//                                                                     decl_id: DeclId(
//                                                                         0,
//                                                                     ),
//                                                                 },
//                                                             ),
//                                                         },
//                                                         return_type: TypeId(
//                                                             26,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x000061454d9f1240,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 124,
//                                                             end: 125,
//                                                             as_str(): "A",
//                                                         },
//                                                     },
//                                                     mutability: Immutable,
//                                                     return_type: TypeId(
//                                                         26,
//                                                     ),
//                                                     type_ascription: TypeArgument {
//                                                         type_id: TypeId(
//                                                             17,
//                                                         ),
//                                                         initial_type_id: TypeId(
//                                                             17,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x000061454d9f1240,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 108,
//                                                             end: 109,
//                                                             as_str(): "_",
//                                                         },
//                                                         call_path_tree: None,
//                                                     },
//                                                 },
//                                             ),
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x000061454d9f1240,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 104,
//                                             end: 132,
//                                             as_str(): "let _ = GE1::<u64>::A(0u64);",
//                                         },
//                                     },
//                                 ],
//                                 whole_block_span: Span {
//                                     src (ptr): 0x000061454d9f1240,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048577,
//                                         },
//                                     ),
//                                     start: 98,
//                                     end: 134,
//                                     as_str(): "{\n    let _ = GE1::<u64>::A(0u64);\n}",
//                                 },
//                             },
//                             parameters: [],
//                             implementing_type: None,
//                             implementing_for_typeid: None,
//                             span: Span {
//                                 src (ptr): 0x000061454d9f1240,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048577,
//                                     },
//                                 ),
//                                 start: 84,
//                                 end: 134,
//                                 as_str(): "pub fn play() {\n    let _ = GE1::<u64>::A(0u64);\n}",
//                             },
//                             call_path: CallPath {
//                                 prefixes: [
//                                     plays,
//                                     play04C,
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
//                                                         src (ptr): 0x000061454d9f1240,
//                                                         source_id: Some(
//                                                             SourceId {
//                                                                 id: 1048577,
//                                                             },
//                                                         ),
//                                                         start: 76,
//                                                         end: 81,
//                                                         as_str(): "never",
//                                                     },
//                                                 },
//                                             ],
//                                             span: Span {
//                                                 src (ptr): 0x000061454d9f1240,
//                                                 source_id: Some(
//                                                     SourceId {
//                                                         id: 1048577,
//                                                     },
//                                                 ),
//                                                 start: 67,
//                                                 end: 83,
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
//                                     src (ptr): 0x000061454d9f1240,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048577,
//                                         },
//                                     ),
//                                     start: 84,
//                                     end: 97,
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
//                                                         expression: EnumInstantiation {
//                                                             enum_ref: DeclRef {
//                                                                 name: GE1,
//                                                                 id: DeclId(
//                                                                     2,
//                                                                 ),
//                                                                 decl_span: Span {
//                                                                     src (ptr): 0x000061454d9f1240,
//                                                                     source_id: Some(
//                                                                         SourceId {
//                                                                             id: 1048577,
//                                                                         },
//                                                                     ),
//                                                                     start: 10,
//                                                                     end: 65,
//                                                                     as_str(): "enum GE1<T> {\n    A: T,\n    B: u64,\n    C: (u8, u16),\n}",
//                                                                 },
//                                                             },
//                                                             variant_name: A,
//                                                             tag: 0,
//                                                             contents: Some(
//                                                                 TyExpression {
//                                                                     expression: Literal(
//                                                                         U64(
//                                                                             0,
//                                                                         ),
//                                                                     ),
//                                                                     return_type: TypeId(
//                                                                         7,
//                                                                     ),
//                                                                     span: Span {
//                                                                         src (ptr): 0x000061454d9f1240,
//                                                                         source_id: Some(
//                                                                             SourceId {
//                                                                                 id: 1048577,
//                                                                             },
//                                                                         ),
//                                                                         start: 126,
//                                                                         end: 130,
//                                                                         as_str(): "0u64",
//                                                                     },
//                                                                 },
//                                                             ),
//                                                             variant_instantiation_span: Span {
//                                                                 src (ptr): 0x000061454d9f1240,
//                                                                 source_id: Some(
//                                                                     SourceId {
//                                                                         id: 1048577,
//                                                                     },
//                                                                 ),
//                                                                 start: 124,
//                                                                 end: 125,
//                                                                 as_str(): "A",
//                                                             },
//                                                             call_path_binding: TypeBinding {
//                                                                 inner: CallPath {
//                                                                     prefixes: [],
//                                                                     suffix: GE1,
//                                                                     is_absolute: false,
//                                                                 },
//                                                                 type_arguments: Prefix(
//                                                                     [
//                                                                         TypeArgument {
//                                                                             type_id: TypeId(
//                                                                                 7,
//                                                                             ),
//                                                                             initial_type_id: TypeId(
//                                                                                 7,
//                                                                             ),
//                                                                             span: Span {
//                                                                                 src (ptr): 0x000061454d9f1240,
//                                                                                 source_id: Some(
//                                                                                     SourceId {
//                                                                                         id: 1048577,
//                                                                                     },
//                                                                                 ),
//                                                                                 start: 118,
//                                                                                 end: 121,
//                                                                                 as_str(): "u64",
//                                                                             },
//                                                                             call_path_tree: Some(
//                                                                                 CallPathTree {
//                                                                                     qualified_call_path: QualifiedCallPath {
//                                                                                         call_path: CallPath {
//                                                                                             prefixes: [],
//                                                                                             suffix: u64,
//                                                                                             is_absolute: false,
//                                                                                         },
//                                                                                         qualified_path_root: None,
//                                                                                     },
//                                                                                     children: [],
//                                                                                 },
//                                                                             ),
//                                                                         },
//                                                                     ],
//                                                                 ),
//                                                                 span: Span {
//                                                                     src (ptr): 0x000061454d9f1240,
//                                                                     source_id: Some(
//                                                                         SourceId {
//                                                                             id: 1048577,
//                                                                         },
//                                                                     ),
//                                                                     start: 112,
//                                                                     end: 125,
//                                                                     as_str(): "GE1::<u64>::A",
//                                                                 },
//                                                             },
//                                                             call_path_decl: EnumDecl(
//                                                                 EnumDecl {
//                                                                     decl_id: DeclId(
//                                                                         0,
//                                                                     ),
//                                                                 },
//                                                             ),
//                                                         },
//                                                         return_type: TypeId(
//                                                             26,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x000061454d9f1240,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 124,
//                                                             end: 125,
//                                                             as_str(): "A",
//                                                         },
//                                                     },
//                                                     mutability: Immutable,
//                                                     return_type: TypeId(
//                                                         26,
//                                                     ),
//                                                     type_ascription: TypeArgument {
//                                                         type_id: TypeId(
//                                                             17,
//                                                         ),
//                                                         initial_type_id: TypeId(
//                                                             17,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x000061454d9f1240,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 108,
//                                                             end: 109,
//                                                             as_str(): "_",
//                                                         },
//                                                         call_path_tree: None,
//                                                     },
//                                                 },
//                                             ),
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x000061454d9f1240,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 104,
//                                             end: 132,
//                                             as_str(): "let _ = GE1::<u64>::A(0u64);",
//                                         },
//                                     },
//                                 ],
//                                 whole_block_span: Span {
//                                     src (ptr): 0x000061454d9f1240,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048577,
//                                         },
//                                     ),
//                                     start: 98,
//                                     end: 134,
//                                     as_str(): "{\n    let _ = GE1::<u64>::A(0u64);\n}",
//                                 },
//                             },
//                             parameters: [],
//                             implementing_type: None,
//                             implementing_for_typeid: None,
//                             span: Span {
//                                 src (ptr): 0x000061454d9f1240,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048577,
//                                     },
//                                 ),
//                                 start: 84,
//                                 end: 134,
//                                 as_str(): "pub fn play() {\n    let _ = GE1::<u64>::A(0u64);\n}",
//                             },
//                             call_path: CallPath {
//                                 prefixes: [
//                                     plays,
//                                     play04C,
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
//                                                         src (ptr): 0x000061454d9f1240,
//                                                         source_id: Some(
//                                                             SourceId {
//                                                                 id: 1048577,
//                                                             },
//                                                         ),
//                                                         start: 76,
//                                                         end: 81,
//                                                         as_str(): "never",
//                                                     },
//                                                 },
//                                             ],
//                                             span: Span {
//                                                 src (ptr): 0x000061454d9f1240,
//                                                 source_id: Some(
//                                                     SourceId {
//                                                         id: 1048577,
//                                                     },
//                                                 ),
//                                                 start: 67,
//                                                 end: 83,
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
//                                     src (ptr): 0x000061454d9f1240,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048577,
//                                         },
//                                     ),
//                                     start: 84,
//                                     end: 97,
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
//                                                         expression: EnumInstantiation {
//                                                             enum_ref: DeclRef {
//                                                                 name: GE1,
//                                                                 id: DeclId(
//                                                                     2,
//                                                                 ),
//                                                                 decl_span: Span {
//                                                                     src (ptr): 0x000061454d9f1240,
//                                                                     source_id: Some(
//                                                                         SourceId {
//                                                                             id: 1048577,
//                                                                         },
//                                                                     ),
//                                                                     start: 10,
//                                                                     end: 65,
//                                                                     as_str(): "enum GE1<T> {\n    A: T,\n    B: u64,\n    C: (u8, u16),\n}",
//                                                                 },
//                                                             },
//                                                             variant_name: A,
//                                                             tag: 0,
//                                                             contents: Some(
//                                                                 TyExpression {
//                                                                     expression: Literal(
//                                                                         U64(
//                                                                             0,
//                                                                         ),
//                                                                     ),
//                                                                     return_type: TypeId(
//                                                                         7,
//                                                                     ),
//                                                                     span: Span {
//                                                                         src (ptr): 0x000061454d9f1240,
//                                                                         source_id: Some(
//                                                                             SourceId {
//                                                                                 id: 1048577,
//                                                                             },
//                                                                         ),
//                                                                         start: 126,
//                                                                         end: 130,
//                                                                         as_str(): "0u64",
//                                                                     },
//                                                                 },
//                                                             ),
//                                                             variant_instantiation_span: Span {
//                                                                 src (ptr): 0x000061454d9f1240,
//                                                                 source_id: Some(
//                                                                     SourceId {
//                                                                         id: 1048577,
//                                                                     },
//                                                                 ),
//                                                                 start: 124,
//                                                                 end: 125,
//                                                                 as_str(): "A",
//                                                             },
//                                                             call_path_binding: TypeBinding {
//                                                                 inner: CallPath {
//                                                                     prefixes: [],
//                                                                     suffix: GE1,
//                                                                     is_absolute: false,
//                                                                 },
//                                                                 type_arguments: Prefix(
//                                                                     [
//                                                                         TypeArgument {
//                                                                             type_id: TypeId(
//                                                                                 7,
//                                                                             ),
//                                                                             initial_type_id: TypeId(
//                                                                                 7,
//                                                                             ),
//                                                                             span: Span {
//                                                                                 src (ptr): 0x000061454d9f1240,
//                                                                                 source_id: Some(
//                                                                                     SourceId {
//                                                                                         id: 1048577,
//                                                                                     },
//                                                                                 ),
//                                                                                 start: 118,
//                                                                                 end: 121,
//                                                                                 as_str(): "u64",
//                                                                             },
//                                                                             call_path_tree: Some(
//                                                                                 CallPathTree {
//                                                                                     qualified_call_path: QualifiedCallPath {
//                                                                                         call_path: CallPath {
//                                                                                             prefixes: [],
//                                                                                             suffix: u64,
//                                                                                             is_absolute: false,
//                                                                                         },
//                                                                                         qualified_path_root: None,
//                                                                                     },
//                                                                                     children: [],
//                                                                                 },
//                                                                             ),
//                                                                         },
//                                                                     ],
//                                                                 ),
//                                                                 span: Span {
//                                                                     src (ptr): 0x000061454d9f1240,
//                                                                     source_id: Some(
//                                                                         SourceId {
//                                                                             id: 1048577,
//                                                                         },
//                                                                     ),
//                                                                     start: 112,
//                                                                     end: 125,
//                                                                     as_str(): "GE1::<u64>::A",
//                                                                 },
//                                                             },
//                                                             call_path_decl: EnumDecl(
//                                                                 EnumDecl {
//                                                                     decl_id: DeclId(
//                                                                         0,
//                                                                     ),
//                                                                 },
//                                                             ),
//                                                         },
//                                                         return_type: TypeId(
//                                                             26,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x000061454d9f1240,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 124,
//                                                             end: 125,
//                                                             as_str(): "A",
//                                                         },
//                                                     },
//                                                     mutability: Immutable,
//                                                     return_type: TypeId(
//                                                         26,
//                                                     ),
//                                                     type_ascription: TypeArgument {
//                                                         type_id: TypeId(
//                                                             17,
//                                                         ),
//                                                         initial_type_id: TypeId(
//                                                             17,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x000061454d9f1240,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 108,
//                                                             end: 109,
//                                                             as_str(): "_",
//                                                         },
//                                                         call_path_tree: None,
//                                                     },
//                                                 },
//                                             ),
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x000061454d9f1240,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 104,
//                                             end: 132,
//                                             as_str(): "let _ = GE1::<u64>::A(0u64);",
//                                         },
//                                     },
//                                 ],
//                                 whole_block_span: Span {
//                                     src (ptr): 0x000061454d9f1240,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048577,
//                                         },
//                                     ),
//                                     start: 98,
//                                     end: 134,
//                                     as_str(): "{\n    let _ = GE1::<u64>::A(0u64);\n}",
//                                 },
//                             },
//                             parameters: [],
//                             implementing_type: None,
//                             implementing_for_typeid: None,
//                             span: Span {
//                                 src (ptr): 0x000061454d9f1240,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048577,
//                                     },
//                                 ),
//                                 start: 84,
//                                 end: 134,
//                                 as_str(): "pub fn play() {\n    let _ = GE1::<u64>::A(0u64);\n}",
//                             },
//                             call_path: CallPath {
//                                 prefixes: [
//                                     plays,
//                                     play04C,
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
//                                                         src (ptr): 0x000061454d9f1240,
//                                                         source_id: Some(
//                                                             SourceId {
//                                                                 id: 1048577,
//                                                             },
//                                                         ),
//                                                         start: 76,
//                                                         end: 81,
//                                                         as_str(): "never",
//                                                     },
//                                                 },
//                                             ],
//                                             span: Span {
//                                                 src (ptr): 0x000061454d9f1240,
//                                                 source_id: Some(
//                                                     SourceId {
//                                                         id: 1048577,
//                                                     },
//                                                 ),
//                                                 start: 67,
//                                                 end: 83,
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
//                                     src (ptr): 0x000061454d9f1240,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048577,
//                                         },
//                                     ),
//                                     start: 84,
//                                     end: 97,
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
//                                                         expression: EnumInstantiation {
//                                                             enum_ref: DeclRef {
//                                                                 name: GE1,
//                                                                 id: DeclId(
//                                                                     2,
//                                                                 ),
//                                                                 decl_span: Span {
//                                                                     src (ptr): 0x000061454d9f1240,
//                                                                     source_id: Some(
//                                                                         SourceId {
//                                                                             id: 1048577,
//                                                                         },
//                                                                     ),
//                                                                     start: 10,
//                                                                     end: 65,
//                                                                     as_str(): "enum GE1<T> {\n    A: T,\n    B: u64,\n    C: (u8, u16),\n}",
//                                                                 },
//                                                             },
//                                                             variant_name: A,
//                                                             tag: 0,
//                                                             contents: Some(
//                                                                 TyExpression {
//                                                                     expression: Literal(
//                                                                         U64(
//                                                                             0,
//                                                                         ),
//                                                                     ),
//                                                                     return_type: TypeId(
//                                                                         7,
//                                                                     ),
//                                                                     span: Span {
//                                                                         src (ptr): 0x000061454d9f1240,
//                                                                         source_id: Some(
//                                                                             SourceId {
//                                                                                 id: 1048577,
//                                                                             },
//                                                                         ),
//                                                                         start: 126,
//                                                                         end: 130,
//                                                                         as_str(): "0u64",
//                                                                     },
//                                                                 },
//                                                             ),
//                                                             variant_instantiation_span: Span {
//                                                                 src (ptr): 0x000061454d9f1240,
//                                                                 source_id: Some(
//                                                                     SourceId {
//                                                                         id: 1048577,
//                                                                     },
//                                                                 ),
//                                                                 start: 124,
//                                                                 end: 125,
//                                                                 as_str(): "A",
//                                                             },
//                                                             call_path_binding: TypeBinding {
//                                                                 inner: CallPath {
//                                                                     prefixes: [],
//                                                                     suffix: GE1,
//                                                                     is_absolute: false,
//                                                                 },
//                                                                 type_arguments: Prefix(
//                                                                     [
//                                                                         TypeArgument {
//                                                                             type_id: TypeId(
//                                                                                 7,
//                                                                             ),
//                                                                             initial_type_id: TypeId(
//                                                                                 7,
//                                                                             ),
//                                                                             span: Span {
//                                                                                 src (ptr): 0x000061454d9f1240,
//                                                                                 source_id: Some(
//                                                                                     SourceId {
//                                                                                         id: 1048577,
//                                                                                     },
//                                                                                 ),
//                                                                                 start: 118,
//                                                                                 end: 121,
//                                                                                 as_str(): "u64",
//                                                                             },
//                                                                             call_path_tree: Some(
//                                                                                 CallPathTree {
//                                                                                     qualified_call_path: QualifiedCallPath {
//                                                                                         call_path: CallPath {
//                                                                                             prefixes: [],
//                                                                                             suffix: u64,
//                                                                                             is_absolute: false,
//                                                                                         },
//                                                                                         qualified_path_root: None,
//                                                                                     },
//                                                                                     children: [],
//                                                                                 },
//                                                                             ),
//                                                                         },
//                                                                     ],
//                                                                 ),
//                                                                 span: Span {
//                                                                     src (ptr): 0x000061454d9f1240,
//                                                                     source_id: Some(
//                                                                         SourceId {
//                                                                             id: 1048577,
//                                                                         },
//                                                                     ),
//                                                                     start: 112,
//                                                                     end: 125,
//                                                                     as_str(): "GE1::<u64>::A",
//                                                                 },
//                                                             },
//                                                             call_path_decl: EnumDecl(
//                                                                 EnumDecl {
//                                                                     decl_id: DeclId(
//                                                                         0,
//                                                                     ),
//                                                                 },
//                                                             ),
//                                                         },
//                                                         return_type: TypeId(
//                                                             26,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x000061454d9f1240,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 124,
//                                                             end: 125,
//                                                             as_str(): "A",
//                                                         },
//                                                     },
//                                                     mutability: Immutable,
//                                                     return_type: TypeId(
//                                                         26,
//                                                     ),
//                                                     type_ascription: TypeArgument {
//                                                         type_id: TypeId(
//                                                             17,
//                                                         ),
//                                                         initial_type_id: TypeId(
//                                                             17,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x000061454d9f1240,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 108,
//                                                             end: 109,
//                                                             as_str(): "_",
//                                                         },
//                                                         call_path_tree: None,
//                                                     },
//                                                 },
//                                             ),
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x000061454d9f1240,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 104,
//                                             end: 132,
//                                             as_str(): "let _ = GE1::<u64>::A(0u64);",
//                                         },
//                                     },
//                                 ],
//                                 whole_block_span: Span {
//                                     src (ptr): 0x000061454d9f1240,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048577,
//                                         },
//                                     ),
//                                     start: 98,
//                                     end: 134,
//                                     as_str(): "{\n    let _ = GE1::<u64>::A(0u64);\n}",
//                                 },
//                             },
//                             parameters: [],
//                             implementing_type: None,
//                             implementing_for_typeid: None,
//                             span: Span {
//                                 src (ptr): 0x000061454d9f1240,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048577,
//                                     },
//                                 ),
//                                 start: 84,
//                                 end: 134,
//                                 as_str(): "pub fn play() {\n    let _ = GE1::<u64>::A(0u64);\n}",
//                             },
//                             call_path: CallPath {
//                                 prefixes: [
//                                     plays,
//                                     play04C,
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
//                                                         src (ptr): 0x000061454d9f1240,
//                                                         source_id: Some(
//                                                             SourceId {
//                                                                 id: 1048577,
//                                                             },
//                                                         ),
//                                                         start: 76,
//                                                         end: 81,
//                                                         as_str(): "never",
//                                                     },
//                                                 },
//                                             ],
//                                             span: Span {
//                                                 src (ptr): 0x000061454d9f1240,
//                                                 source_id: Some(
//                                                     SourceId {
//                                                         id: 1048577,
//                                                     },
//                                                 ),
//                                                 start: 67,
//                                                 end: 83,
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
//                                     src (ptr): 0x000061454d9f1240,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048577,
//                                         },
//                                     ),
//                                     start: 84,
//                                     end: 97,
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
//                                                             play04C,
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
//                                                             src (ptr): 0x000061454d9f1240,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 84,
//                                                             end: 134,
//                                                             as_str(): "pub fn play() {\n    let _ = GE1::<u64>::A(0u64);\n}",
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
//                                                                 src (ptr): 0x000061454d9ed760,
//                                                                 source_id: Some(
//                                                                     SourceId {
//                                                                         id: 1048576,
//                                                                     },
//                                                                 ),
//                                                                 start: 319,
//                                                                 end: 332,
//                                                                 as_str(): "play04C::play",
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
//                                                     src (ptr): 0x000061454d9ed760,
//                                                     source_id: Some(
//                                                         SourceId {
//                                                             id: 1048576,
//                                                         },
//                                                     ),
//                                                     start: 319,
//                                                     end: 334,
//                                                     as_str(): "play04C::play()",
//                                                 },
//                                             },
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x000061454d9ed760,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048576,
//                                                 },
//                                             ),
//                                             start: 319,
//                                             end: 334,
//                                             as_str(): "play04C::play()",
//                                         },
//                                     },
//                                 ],
//                                 whole_block_span: Span {
//                                     src (ptr): 0x000061454d9ed760,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048576,
//                                         },
//                                     ),
//                                     start: 145,
//                                     end: 337,
//                                     as_str(): "{\n    // play01A::play();\n    // play01B::play();\n    // play01C::play();\n    // play02A::play();\n    // play03A::play();\n    // play04A::play();\n    // play04B::play();\n    play04C::play();\n}",
//                                 },
//                             },
//                             parameters: [],
//                             implementing_type: None,
//                             implementing_for_typeid: None,
//                             span: Span {
//                                 src (ptr): 0x000061454d9ed760,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 135,
//                                 end: 337,
//                                 as_str(): "fn main() {\n    // play01A::play();\n    // play01B::play();\n    // play01C::play();\n    // play02A::play();\n    // play03A::play();\n    // play04A::play();\n    // play04B::play();\n    play04C::play();\n}",
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
//                                     src (ptr): 0x000061454d9ed760,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048576,
//                                         },
//                                     ),
//                                     start: 135,
//                                     end: 144,
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
//                 items: [
//                     Some(
//                         TyEnumDecl {
//                             call_path: CallPath {
//                                 prefixes: [
//                                     plays,
//                                     play04C,
//                                 ],
//                                 suffix: GE1,
//                                 is_absolute: true,
//                             },
//                             type_parameters: [
//                                 TypeParameter {
//                                     type_id: TypeId(
//                                         22,
//                                     ),
//                                     initial_type_id: TypeId(
//                                         16,
//                                     ),
//                                     name_ident: T,
//                                     trait_constraints: [],
//                                     trait_constraints_span: Span {
//                                         src (ptr): 0x000061454d9e5200,
//                                         source_id: None,
//                                         start: 0,
//                                         end: 0,
//                                         as_str(): "",
//                                     },
//                                     is_from_parent: false,
//                                 },
//                             ],
//                             attributes: AttributesMap(
//                                 {},
//                             ),
//                             variants: [
//                                 TyEnumVariant {
//                                     name: A,
//                                     type_argument: TypeArgument {
//                                         type_id: TypeId(
//                                             22,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             14,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x000061454d9f1240,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 31,
//                                             end: 32,
//                                             as_str(): "T",
//                                         },
//                                         call_path_tree: Some(
//                                             CallPathTree {
//                                                 qualified_call_path: QualifiedCallPath {
//                                                     call_path: CallPath {
//                                                         prefixes: [],
//                                                         suffix: T,
//                                                         is_absolute: false,
//                                                     },
//                                                     qualified_path_root: None,
//                                                 },
//                                                 children: [],
//                                             },
//                                         ),
//                                     },
//                                     tag: 0,
//                                     span: Span {
//                                         src (ptr): 0x000061454d9f1240,
//                                         source_id: Some(
//                                             SourceId {
//                                                 id: 1048577,
//                                             },
//                                         ),
//                                         start: 28,
//                                         end: 32,
//                                         as_str(): "A: T",
//                                     },
//                                     attributes: AttributesMap(
//                                         {},
//                                     ),
//                                 },
//                                 TyEnumVariant {
//                                     name: B,
//                                     type_argument: TypeArgument {
//                                         type_id: TypeId(
//                                             7,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             7,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x000061454d9f1240,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 41,
//                                             end: 44,
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
//                                     tag: 1,
//                                     span: Span {
//                                         src (ptr): 0x000061454d9f1240,
//                                         source_id: Some(
//                                             SourceId {
//                                                 id: 1048577,
//                                             },
//                                         ),
//                                         start: 38,
//                                         end: 44,
//                                         as_str(): "B: u64",
//                                     },
//                                     attributes: AttributesMap(
//                                         {},
//                                     ),
//                                 },
//                                 TyEnumVariant {
//                                     name: C,
//                                     type_argument: TypeArgument {
//                                         type_id: TypeId(
//                                             23,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             15,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x000061454d9f1240,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 53,
//                                             end: 62,
//                                             as_str(): "(u8, u16)",
//                                         },
//                                         call_path_tree: None,
//                                     },
//                                     tag: 2,
//                                     span: Span {
//                                         src (ptr): 0x000061454d9f1240,
//                                         source_id: Some(
//                                             SourceId {
//                                                 id: 1048577,
//                                             },
//                                         ),
//                                         start: 50,
//                                         end: 62,
//                                         as_str(): "C: (u8, u16)",
//                                     },
//                                     attributes: AttributesMap(
//                                         {},
//                                     ),
//                                 },
//                             ],
//                             span: Span {
//                                 src (ptr): 0x000061454d9f1240,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048577,
//                                     },
//                                 ),
//                                 start: 10,
//                                 end: 65,
//                                 as_str(): "enum GE1<T> {\n    A: T,\n    B: u64,\n    C: (u8, u16),\n}",
//                             },
//                             visibility: Private,
//                         },
//                     ),
//                     Some(
//                         TyEnumDecl {
//                             call_path: CallPath {
//                                 prefixes: [
//                                     plays,
//                                     play04C,
//                                 ],
//                                 suffix: GE1,
//                                 is_absolute: true,
//                             },
//                             type_parameters: [
//                                 TypeParameter {
//                                     type_id: TypeId(
//                                         7,
//                                     ),
//                                     initial_type_id: TypeId(
//                                         16,
//                                     ),
//                                     name_ident: T,
//                                     trait_constraints: [],
//                                     trait_constraints_span: Span {
//                                         src (ptr): 0x000061454d9e5200,
//                                         source_id: None,
//                                         start: 0,
//                                         end: 0,
//                                         as_str(): "",
//                                     },
//                                     is_from_parent: false,
//                                 },
//                             ],
//                             attributes: AttributesMap(
//                                 {},
//                             ),
//                             variants: [
//                                 TyEnumVariant {
//                                     name: A,
//                                     type_argument: TypeArgument {
//                                         type_id: TypeId(
//                                             7,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             14,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x000061454d9f1240,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 31,
//                                             end: 32,
//                                             as_str(): "T",
//                                         },
//                                         call_path_tree: Some(
//                                             CallPathTree {
//                                                 qualified_call_path: QualifiedCallPath {
//                                                     call_path: CallPath {
//                                                         prefixes: [],
//                                                         suffix: T,
//                                                         is_absolute: false,
//                                                     },
//                                                     qualified_path_root: None,
//                                                 },
//                                                 children: [],
//                                             },
//                                         ),
//                                     },
//                                     tag: 0,
//                                     span: Span {
//                                         src (ptr): 0x000061454d9f1240,
//                                         source_id: Some(
//                                             SourceId {
//                                                 id: 1048577,
//                                             },
//                                         ),
//                                         start: 28,
//                                         end: 32,
//                                         as_str(): "A: T",
//                                     },
//                                     attributes: AttributesMap(
//                                         {},
//                                     ),
//                                 },
//                                 TyEnumVariant {
//                                     name: B,
//                                     type_argument: TypeArgument {
//                                         type_id: TypeId(
//                                             7,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             7,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x000061454d9f1240,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 41,
//                                             end: 44,
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
//                                     tag: 1,
//                                     span: Span {
//                                         src (ptr): 0x000061454d9f1240,
//                                         source_id: Some(
//                                             SourceId {
//                                                 id: 1048577,
//                                             },
//                                         ),
//                                         start: 38,
//                                         end: 44,
//                                         as_str(): "B: u64",
//                                     },
//                                     attributes: AttributesMap(
//                                         {},
//                                     ),
//                                 },
//                                 TyEnumVariant {
//                                     name: C,
//                                     type_argument: TypeArgument {
//                                         type_id: TypeId(
//                                             23,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             15,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x000061454d9f1240,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 53,
//                                             end: 62,
//                                             as_str(): "(u8, u16)",
//                                         },
//                                         call_path_tree: None,
//                                     },
//                                     tag: 2,
//                                     span: Span {
//                                         src (ptr): 0x000061454d9f1240,
//                                         source_id: Some(
//                                             SourceId {
//                                                 id: 1048577,
//                                             },
//                                         ),
//                                         start: 50,
//                                         end: 62,
//                                         as_str(): "C: (u8, u16)",
//                                     },
//                                     attributes: AttributesMap(
//                                         {},
//                                     ),
//                                 },
//                             ],
//                             span: Span {
//                                 src (ptr): 0x000061454d9f1240,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048577,
//                                     },
//                                 ),
//                                 start: 10,
//                                 end: 65,
//                                 as_str(): "enum GE1<T> {\n    A: T,\n    B: u64,\n    C: (u8, u16),\n}",
//                             },
//                             visibility: Private,
//                         },
//                     ),
//                     Some(
//                         TyEnumDecl {
//                             call_path: CallPath {
//                                 prefixes: [
//                                     plays,
//                                     play04C,
//                                 ],
//                                 suffix: GE1,
//                                 is_absolute: true,
//                             },
//                             type_parameters: [
//                                 TypeParameter {
//                                     type_id: TypeId(
//                                         7,
//                                     ),
//                                     initial_type_id: TypeId(
//                                         16,
//                                     ),
//                                     name_ident: T,
//                                     trait_constraints: [],
//                                     trait_constraints_span: Span {
//                                         src (ptr): 0x000061454d9e5200,
//                                         source_id: None,
//                                         start: 0,
//                                         end: 0,
//                                         as_str(): "",
//                                     },
//                                     is_from_parent: false,
//                                 },
//                             ],
//                             attributes: AttributesMap(
//                                 {},
//                             ),
//                             variants: [
//                                 TyEnumVariant {
//                                     name: A,
//                                     type_argument: TypeArgument {
//                                         type_id: TypeId(
//                                             7,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             14,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x000061454d9f1240,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 31,
//                                             end: 32,
//                                             as_str(): "T",
//                                         },
//                                         call_path_tree: Some(
//                                             CallPathTree {
//                                                 qualified_call_path: QualifiedCallPath {
//                                                     call_path: CallPath {
//                                                         prefixes: [],
//                                                         suffix: T,
//                                                         is_absolute: false,
//                                                     },
//                                                     qualified_path_root: None,
//                                                 },
//                                                 children: [],
//                                             },
//                                         ),
//                                     },
//                                     tag: 0,
//                                     span: Span {
//                                         src (ptr): 0x000061454d9f1240,
//                                         source_id: Some(
//                                             SourceId {
//                                                 id: 1048577,
//                                             },
//                                         ),
//                                         start: 28,
//                                         end: 32,
//                                         as_str(): "A: T",
//                                     },
//                                     attributes: AttributesMap(
//                                         {},
//                                     ),
//                                 },
//                                 TyEnumVariant {
//                                     name: B,
//                                     type_argument: TypeArgument {
//                                         type_id: TypeId(
//                                             7,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             7,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x000061454d9f1240,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 41,
//                                             end: 44,
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
//                                     tag: 1,
//                                     span: Span {
//                                         src (ptr): 0x000061454d9f1240,
//                                         source_id: Some(
//                                             SourceId {
//                                                 id: 1048577,
//                                             },
//                                         ),
//                                         start: 38,
//                                         end: 44,
//                                         as_str(): "B: u64",
//                                     },
//                                     attributes: AttributesMap(
//                                         {},
//                                     ),
//                                 },
//                                 TyEnumVariant {
//                                     name: C,
//                                     type_argument: TypeArgument {
//                                         type_id: TypeId(
//                                             23,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             15,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x000061454d9f1240,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 53,
//                                             end: 62,
//                                             as_str(): "(u8, u16)",
//                                         },
//                                         call_path_tree: None,
//                                     },
//                                     tag: 2,
//                                     span: Span {
//                                         src (ptr): 0x000061454d9f1240,
//                                         source_id: Some(
//                                             SourceId {
//                                                 id: 1048577,
//                                             },
//                                         ),
//                                         start: 50,
//                                         end: 62,
//                                         as_str(): "C: (u8, u16)",
//                                     },
//                                     attributes: AttributesMap(
//                                         {},
//                                     ),
//                                 },
//                             ],
//                             span: Span {
//                                 src (ptr): 0x000061454d9f1240,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048577,
//                                     },
//                                 ),
//                                 start: 10,
//                                 end: 65,
//                                 as_str(): "enum GE1<T> {\n    A: T,\n    B: u64,\n    C: (u8, u16),\n}",
//                             },
//                             visibility: Private,
//                         },
//                     ),
//                 ],
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
//                 2,
//             ): ParsedDeclId(
//                 0,
//             ),
//             DeclId(
//                 0,
//             ): ParsedDeclId(
//                 0,
//             ),
//             DeclId(
//                 1,
//             ): ParsedDeclId(
//                 0,
//             ),
//             DeclId(
//                 3,
//             ): ParsedDeclId(
//                 0,
//             ),
//             DeclId(
//                 4,
//             ): ParsedDeclId(
//                 0,
//             ),
//             DeclId(
//                 5,
//             ): ParsedDeclId(
//                 1,
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
//         data: {
//             DeclId(
//                 0,
//             ): ParsedDeclId(
//                 0,
//             ),
//             DeclId(
//                 1,
//             ): ParsedDeclId(
//                 0,
//             ),
//             DeclId(
//                 2,
//             ): ParsedDeclId(
//                 0,
//             ),
//         },
//     },
//     type_alias_parsed_decl_id_map: RwLock {
//         data: {},
//     },
//     parents: RwLock {
//         data: {
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
//                     3,
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
//                     1,
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
