library;

enum GE1<T> {
    A: T,
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
//                                                                     src (ptr): 0x000059112edc8060,
//                                                                     source_id: Some(
//                                                                         SourceId {
//                                                                             id: 1048577,
//                                                                         },
//                                                                     ),
//                                                                     start: 10,
//                                                                     end: 35,
//                                                                     as_str(): "enum GE1<T> {\n    A: T,\n}",
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
//                                                                         src (ptr): 0x000059112edc8060,
//                                                                         source_id: Some(
//                                                                             SourceId {
//                                                                                 id: 1048577,
//                                                                             },
//                                                                         ),
//                                                                         start: 96,
//                                                                         end: 100,
//                                                                         as_str(): "0u64",
//                                                                     },
//                                                                 },
//                                                             ),
//                                                             variant_instantiation_span: Span {
//                                                                 src (ptr): 0x000059112edc8060,
//                                                                 source_id: Some(
//                                                                     SourceId {
//                                                                         id: 1048577,
//                                                                     },
//                                                                 ),
//                                                                 start: 94,
//                                                                 end: 95,
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
//                                                                                 src (ptr): 0x000059112edc8060,
//                                                                                 source_id: Some(
//                                                                                     SourceId {
//                                                                                         id: 1048577,
//                                                                                     },
//                                                                                 ),
//                                                                                 start: 88,
//                                                                                 end: 91,
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
//                                                                     src (ptr): 0x000059112edc8060,
//                                                                     source_id: Some(
//                                                                         SourceId {
//                                                                             id: 1048577,
//                                                                         },
//                                                                     ),
//                                                                     start: 82,
//                                                                     end: 95,
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
//                                                             24,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x000059112edc8060,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 94,
//                                                             end: 95,
//                                                             as_str(): "A",
//                                                         },
//                                                     },
//                                                     mutability: Immutable,
//                                                     return_type: TypeId(
//                                                         24,
//                                                     ),
//                                                     type_ascription: TypeArgument {
//                                                         type_id: TypeId(
//                                                             16,
//                                                         ),
//                                                         initial_type_id: TypeId(
//                                                             16,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x000059112edc8060,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 78,
//                                                             end: 79,
//                                                             as_str(): "_",
//                                                         },
//                                                         call_path_tree: None,
//                                                     },
//                                                 },
//                                             ),
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x000059112edc8060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 74,
//                                             end: 102,
//                                             as_str(): "let _ = GE1::<u64>::A(0u64);",
//                                         },
//                                     },
//                                 ],
//                                 whole_block_span: Span {
//                                     src (ptr): 0x000059112edc8060,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048577,
//                                         },
//                                     ),
//                                     start: 68,
//                                     end: 104,
//                                     as_str(): "{\n    let _ = GE1::<u64>::A(0u64);\n}",
//                                 },
//                             },
//                             parameters: [],
//                             implementing_type: None,
//                             implementing_for_typeid: None,
//                             span: Span {
//                                 src (ptr): 0x000059112edc8060,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048577,
//                                     },
//                                 ),
//                                 start: 54,
//                                 end: 104,
//                                 as_str(): "pub fn play() {\n    let _ = GE1::<u64>::A(0u64);\n}",
//                             },
//                             call_path: CallPath {
//                                 prefixes: [
//                                     plays,
//                                     play04A,
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
//                                                         src (ptr): 0x000059112edc8060,
//                                                         source_id: Some(
//                                                             SourceId {
//                                                                 id: 1048577,
//                                                             },
//                                                         ),
//                                                         start: 46,
//                                                         end: 51,
//                                                         as_str(): "never",
//                                                     },
//                                                 },
//                                             ],
//                                             span: Span {
//                                                 src (ptr): 0x000059112edc8060,
//                                                 source_id: Some(
//                                                     SourceId {
//                                                         id: 1048577,
//                                                     },
//                                                 ),
//                                                 start: 37,
//                                                 end: 53,
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
//                                     src (ptr): 0x000059112edc8060,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048577,
//                                         },
//                                     ),
//                                     start: 54,
//                                     end: 67,
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
//                                                                     src (ptr): 0x000059112edc8060,
//                                                                     source_id: Some(
//                                                                         SourceId {
//                                                                             id: 1048577,
//                                                                         },
//                                                                     ),
//                                                                     start: 10,
//                                                                     end: 35,
//                                                                     as_str(): "enum GE1<T> {\n    A: T,\n}",
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
//                                                                         src (ptr): 0x000059112edc8060,
//                                                                         source_id: Some(
//                                                                             SourceId {
//                                                                                 id: 1048577,
//                                                                             },
//                                                                         ),
//                                                                         start: 96,
//                                                                         end: 100,
//                                                                         as_str(): "0u64",
//                                                                     },
//                                                                 },
//                                                             ),
//                                                             variant_instantiation_span: Span {
//                                                                 src (ptr): 0x000059112edc8060,
//                                                                 source_id: Some(
//                                                                     SourceId {
//                                                                         id: 1048577,
//                                                                     },
//                                                                 ),
//                                                                 start: 94,
//                                                                 end: 95,
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
//                                                                                 src (ptr): 0x000059112edc8060,
//                                                                                 source_id: Some(
//                                                                                     SourceId {
//                                                                                         id: 1048577,
//                                                                                     },
//                                                                                 ),
//                                                                                 start: 88,
//                                                                                 end: 91,
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
//                                                                     src (ptr): 0x000059112edc8060,
//                                                                     source_id: Some(
//                                                                         SourceId {
//                                                                             id: 1048577,
//                                                                         },
//                                                                     ),
//                                                                     start: 82,
//                                                                     end: 95,
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
//                                                             24,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x000059112edc8060,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 94,
//                                                             end: 95,
//                                                             as_str(): "A",
//                                                         },
//                                                     },
//                                                     mutability: Immutable,
//                                                     return_type: TypeId(
//                                                         24,
//                                                     ),
//                                                     type_ascription: TypeArgument {
//                                                         type_id: TypeId(
//                                                             16,
//                                                         ),
//                                                         initial_type_id: TypeId(
//                                                             16,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x000059112edc8060,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 78,
//                                                             end: 79,
//                                                             as_str(): "_",
//                                                         },
//                                                         call_path_tree: None,
//                                                     },
//                                                 },
//                                             ),
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x000059112edc8060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 74,
//                                             end: 102,
//                                             as_str(): "let _ = GE1::<u64>::A(0u64);",
//                                         },
//                                     },
//                                 ],
//                                 whole_block_span: Span {
//                                     src (ptr): 0x000059112edc8060,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048577,
//                                         },
//                                     ),
//                                     start: 68,
//                                     end: 104,
//                                     as_str(): "{\n    let _ = GE1::<u64>::A(0u64);\n}",
//                                 },
//                             },
//                             parameters: [],
//                             implementing_type: None,
//                             implementing_for_typeid: None,
//                             span: Span {
//                                 src (ptr): 0x000059112edc8060,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048577,
//                                     },
//                                 ),
//                                 start: 54,
//                                 end: 104,
//                                 as_str(): "pub fn play() {\n    let _ = GE1::<u64>::A(0u64);\n}",
//                             },
//                             call_path: CallPath {
//                                 prefixes: [
//                                     plays,
//                                     play04A,
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
//                                                         src (ptr): 0x000059112edc8060,
//                                                         source_id: Some(
//                                                             SourceId {
//                                                                 id: 1048577,
//                                                             },
//                                                         ),
//                                                         start: 46,
//                                                         end: 51,
//                                                         as_str(): "never",
//                                                     },
//                                                 },
//                                             ],
//                                             span: Span {
//                                                 src (ptr): 0x000059112edc8060,
//                                                 source_id: Some(
//                                                     SourceId {
//                                                         id: 1048577,
//                                                     },
//                                                 ),
//                                                 start: 37,
//                                                 end: 53,
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
//                                     src (ptr): 0x000059112edc8060,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048577,
//                                         },
//                                     ),
//                                     start: 54,
//                                     end: 67,
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
//                                                                     src (ptr): 0x000059112edc8060,
//                                                                     source_id: Some(
//                                                                         SourceId {
//                                                                             id: 1048577,
//                                                                         },
//                                                                     ),
//                                                                     start: 10,
//                                                                     end: 35,
//                                                                     as_str(): "enum GE1<T> {\n    A: T,\n}",
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
//                                                                         src (ptr): 0x000059112edc8060,
//                                                                         source_id: Some(
//                                                                             SourceId {
//                                                                                 id: 1048577,
//                                                                             },
//                                                                         ),
//                                                                         start: 96,
//                                                                         end: 100,
//                                                                         as_str(): "0u64",
//                                                                     },
//                                                                 },
//                                                             ),
//                                                             variant_instantiation_span: Span {
//                                                                 src (ptr): 0x000059112edc8060,
//                                                                 source_id: Some(
//                                                                     SourceId {
//                                                                         id: 1048577,
//                                                                     },
//                                                                 ),
//                                                                 start: 94,
//                                                                 end: 95,
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
//                                                                                 src (ptr): 0x000059112edc8060,
//                                                                                 source_id: Some(
//                                                                                     SourceId {
//                                                                                         id: 1048577,
//                                                                                     },
//                                                                                 ),
//                                                                                 start: 88,
//                                                                                 end: 91,
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
//                                                                     src (ptr): 0x000059112edc8060,
//                                                                     source_id: Some(
//                                                                         SourceId {
//                                                                             id: 1048577,
//                                                                         },
//                                                                     ),
//                                                                     start: 82,
//                                                                     end: 95,
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
//                                                             24,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x000059112edc8060,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 94,
//                                                             end: 95,
//                                                             as_str(): "A",
//                                                         },
//                                                     },
//                                                     mutability: Immutable,
//                                                     return_type: TypeId(
//                                                         24,
//                                                     ),
//                                                     type_ascription: TypeArgument {
//                                                         type_id: TypeId(
//                                                             16,
//                                                         ),
//                                                         initial_type_id: TypeId(
//                                                             16,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x000059112edc8060,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 78,
//                                                             end: 79,
//                                                             as_str(): "_",
//                                                         },
//                                                         call_path_tree: None,
//                                                     },
//                                                 },
//                                             ),
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x000059112edc8060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 74,
//                                             end: 102,
//                                             as_str(): "let _ = GE1::<u64>::A(0u64);",
//                                         },
//                                     },
//                                 ],
//                                 whole_block_span: Span {
//                                     src (ptr): 0x000059112edc8060,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048577,
//                                         },
//                                     ),
//                                     start: 68,
//                                     end: 104,
//                                     as_str(): "{\n    let _ = GE1::<u64>::A(0u64);\n}",
//                                 },
//                             },
//                             parameters: [],
//                             implementing_type: None,
//                             implementing_for_typeid: None,
//                             span: Span {
//                                 src (ptr): 0x000059112edc8060,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048577,
//                                     },
//                                 ),
//                                 start: 54,
//                                 end: 104,
//                                 as_str(): "pub fn play() {\n    let _ = GE1::<u64>::A(0u64);\n}",
//                             },
//                             call_path: CallPath {
//                                 prefixes: [
//                                     plays,
//                                     play04A,
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
//                                                         src (ptr): 0x000059112edc8060,
//                                                         source_id: Some(
//                                                             SourceId {
//                                                                 id: 1048577,
//                                                             },
//                                                         ),
//                                                         start: 46,
//                                                         end: 51,
//                                                         as_str(): "never",
//                                                     },
//                                                 },
//                                             ],
//                                             span: Span {
//                                                 src (ptr): 0x000059112edc8060,
//                                                 source_id: Some(
//                                                     SourceId {
//                                                         id: 1048577,
//                                                     },
//                                                 ),
//                                                 start: 37,
//                                                 end: 53,
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
//                                     src (ptr): 0x000059112edc8060,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048577,
//                                         },
//                                     ),
//                                     start: 54,
//                                     end: 67,
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
//                                                                     src (ptr): 0x000059112edc8060,
//                                                                     source_id: Some(
//                                                                         SourceId {
//                                                                             id: 1048577,
//                                                                         },
//                                                                     ),
//                                                                     start: 10,
//                                                                     end: 35,
//                                                                     as_str(): "enum GE1<T> {\n    A: T,\n}",
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
//                                                                         src (ptr): 0x000059112edc8060,
//                                                                         source_id: Some(
//                                                                             SourceId {
//                                                                                 id: 1048577,
//                                                                             },
//                                                                         ),
//                                                                         start: 96,
//                                                                         end: 100,
//                                                                         as_str(): "0u64",
//                                                                     },
//                                                                 },
//                                                             ),
//                                                             variant_instantiation_span: Span {
//                                                                 src (ptr): 0x000059112edc8060,
//                                                                 source_id: Some(
//                                                                     SourceId {
//                                                                         id: 1048577,
//                                                                     },
//                                                                 ),
//                                                                 start: 94,
//                                                                 end: 95,
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
//                                                                                 src (ptr): 0x000059112edc8060,
//                                                                                 source_id: Some(
//                                                                                     SourceId {
//                                                                                         id: 1048577,
//                                                                                     },
//                                                                                 ),
//                                                                                 start: 88,
//                                                                                 end: 91,
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
//                                                                     src (ptr): 0x000059112edc8060,
//                                                                     source_id: Some(
//                                                                         SourceId {
//                                                                             id: 1048577,
//                                                                         },
//                                                                     ),
//                                                                     start: 82,
//                                                                     end: 95,
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
//                                                             24,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x000059112edc8060,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 94,
//                                                             end: 95,
//                                                             as_str(): "A",
//                                                         },
//                                                     },
//                                                     mutability: Immutable,
//                                                     return_type: TypeId(
//                                                         24,
//                                                     ),
//                                                     type_ascription: TypeArgument {
//                                                         type_id: TypeId(
//                                                             16,
//                                                         ),
//                                                         initial_type_id: TypeId(
//                                                             16,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x000059112edc8060,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 78,
//                                                             end: 79,
//                                                             as_str(): "_",
//                                                         },
//                                                         call_path_tree: None,
//                                                     },
//                                                 },
//                                             ),
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x000059112edc8060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 74,
//                                             end: 102,
//                                             as_str(): "let _ = GE1::<u64>::A(0u64);",
//                                         },
//                                     },
//                                 ],
//                                 whole_block_span: Span {
//                                     src (ptr): 0x000059112edc8060,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048577,
//                                         },
//                                     ),
//                                     start: 68,
//                                     end: 104,
//                                     as_str(): "{\n    let _ = GE1::<u64>::A(0u64);\n}",
//                                 },
//                             },
//                             parameters: [],
//                             implementing_type: None,
//                             implementing_for_typeid: None,
//                             span: Span {
//                                 src (ptr): 0x000059112edc8060,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048577,
//                                     },
//                                 ),
//                                 start: 54,
//                                 end: 104,
//                                 as_str(): "pub fn play() {\n    let _ = GE1::<u64>::A(0u64);\n}",
//                             },
//                             call_path: CallPath {
//                                 prefixes: [
//                                     plays,
//                                     play04A,
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
//                                                         src (ptr): 0x000059112edc8060,
//                                                         source_id: Some(
//                                                             SourceId {
//                                                                 id: 1048577,
//                                                             },
//                                                         ),
//                                                         start: 46,
//                                                         end: 51,
//                                                         as_str(): "never",
//                                                     },
//                                                 },
//                                             ],
//                                             span: Span {
//                                                 src (ptr): 0x000059112edc8060,
//                                                 source_id: Some(
//                                                     SourceId {
//                                                         id: 1048577,
//                                                     },
//                                                 ),
//                                                 start: 37,
//                                                 end: 53,
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
//                                     src (ptr): 0x000059112edc8060,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048577,
//                                         },
//                                     ),
//                                     start: 54,
//                                     end: 67,
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
//                                                                     src (ptr): 0x000059112edc8060,
//                                                                     source_id: Some(
//                                                                         SourceId {
//                                                                             id: 1048577,
//                                                                         },
//                                                                     ),
//                                                                     start: 10,
//                                                                     end: 35,
//                                                                     as_str(): "enum GE1<T> {\n    A: T,\n}",
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
//                                                                         src (ptr): 0x000059112edc8060,
//                                                                         source_id: Some(
//                                                                             SourceId {
//                                                                                 id: 1048577,
//                                                                             },
//                                                                         ),
//                                                                         start: 96,
//                                                                         end: 100,
//                                                                         as_str(): "0u64",
//                                                                     },
//                                                                 },
//                                                             ),
//                                                             variant_instantiation_span: Span {
//                                                                 src (ptr): 0x000059112edc8060,
//                                                                 source_id: Some(
//                                                                     SourceId {
//                                                                         id: 1048577,
//                                                                     },
//                                                                 ),
//                                                                 start: 94,
//                                                                 end: 95,
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
//                                                                                 src (ptr): 0x000059112edc8060,
//                                                                                 source_id: Some(
//                                                                                     SourceId {
//                                                                                         id: 1048577,
//                                                                                     },
//                                                                                 ),
//                                                                                 start: 88,
//                                                                                 end: 91,
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
//                                                                     src (ptr): 0x000059112edc8060,
//                                                                     source_id: Some(
//                                                                         SourceId {
//                                                                             id: 1048577,
//                                                                         },
//                                                                     ),
//                                                                     start: 82,
//                                                                     end: 95,
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
//                                                             24,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x000059112edc8060,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 94,
//                                                             end: 95,
//                                                             as_str(): "A",
//                                                         },
//                                                     },
//                                                     mutability: Immutable,
//                                                     return_type: TypeId(
//                                                         24,
//                                                     ),
//                                                     type_ascription: TypeArgument {
//                                                         type_id: TypeId(
//                                                             16,
//                                                         ),
//                                                         initial_type_id: TypeId(
//                                                             16,
//                                                         ),
//                                                         span: Span {
//                                                             src (ptr): 0x000059112edc8060,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 78,
//                                                             end: 79,
//                                                             as_str(): "_",
//                                                         },
//                                                         call_path_tree: None,
//                                                     },
//                                                 },
//                                             ),
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x000059112edc8060,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048577,
//                                                 },
//                                             ),
//                                             start: 74,
//                                             end: 102,
//                                             as_str(): "let _ = GE1::<u64>::A(0u64);",
//                                         },
//                                     },
//                                 ],
//                                 whole_block_span: Span {
//                                     src (ptr): 0x000059112edc8060,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048577,
//                                         },
//                                     ),
//                                     start: 68,
//                                     end: 104,
//                                     as_str(): "{\n    let _ = GE1::<u64>::A(0u64);\n}",
//                                 },
//                             },
//                             parameters: [],
//                             implementing_type: None,
//                             implementing_for_typeid: None,
//                             span: Span {
//                                 src (ptr): 0x000059112edc8060,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048577,
//                                     },
//                                 ),
//                                 start: 54,
//                                 end: 104,
//                                 as_str(): "pub fn play() {\n    let _ = GE1::<u64>::A(0u64);\n}",
//                             },
//                             call_path: CallPath {
//                                 prefixes: [
//                                     plays,
//                                     play04A,
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
//                                                         src (ptr): 0x000059112edc8060,
//                                                         source_id: Some(
//                                                             SourceId {
//                                                                 id: 1048577,
//                                                             },
//                                                         ),
//                                                         start: 46,
//                                                         end: 51,
//                                                         as_str(): "never",
//                                                     },
//                                                 },
//                                             ],
//                                             span: Span {
//                                                 src (ptr): 0x000059112edc8060,
//                                                 source_id: Some(
//                                                     SourceId {
//                                                         id: 1048577,
//                                                     },
//                                                 ),
//                                                 start: 37,
//                                                 end: 53,
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
//                                     src (ptr): 0x000059112edc8060,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048577,
//                                         },
//                                     ),
//                                     start: 54,
//                                     end: 67,
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
//                                                             play04A,
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
//                                                             src (ptr): 0x000059112edc8060,
//                                                             source_id: Some(
//                                                                 SourceId {
//                                                                     id: 1048577,
//                                                                 },
//                                                             ),
//                                                             start: 54,
//                                                             end: 104,
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
//                                                                 src (ptr): 0x000059112ed37c20,
//                                                                 source_id: Some(
//                                                                     SourceId {
//                                                                         id: 1048576,
//                                                                     },
//                                                                 ),
//                                                                 start: 239,
//                                                                 end: 252,
//                                                                 as_str(): "play04A::play",
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
//                                                     src (ptr): 0x000059112ed37c20,
//                                                     source_id: Some(
//                                                         SourceId {
//                                                             id: 1048576,
//                                                         },
//                                                     ),
//                                                     start: 239,
//                                                     end: 254,
//                                                     as_str(): "play04A::play()",
//                                                 },
//                                             },
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x000059112ed37c20,
//                                             source_id: Some(
//                                                 SourceId {
//                                                     id: 1048576,
//                                                 },
//                                             ),
//                                             start: 239,
//                                             end: 254,
//                                             as_str(): "play04A::play()",
//                                         },
//                                     },
//                                 ],
//                                 whole_block_span: Span {
//                                     src (ptr): 0x000059112ed37c20,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048576,
//                                         },
//                                     ),
//                                     start: 113,
//                                     end: 257,
//                                     as_str(): "{\n    // play01A::play();\n    // play01B::play();\n    // play01C::play();\n    // play02A::play();\n    // play03A::play();\n    play04A::play();\n}",
//                                 },
//                             },
//                             parameters: [],
//                             implementing_type: None,
//                             implementing_for_typeid: None,
//                             span: Span {
//                                 src (ptr): 0x000059112ed37c20,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048576,
//                                     },
//                                 ),
//                                 start: 103,
//                                 end: 257,
//                                 as_str(): "fn main() {\n    // play01A::play();\n    // play01B::play();\n    // play01C::play();\n    // play02A::play();\n    // play03A::play();\n    play04A::play();\n}",
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
//                                     src (ptr): 0x000059112ed37c20,
//                                     source_id: Some(
//                                         SourceId {
//                                             id: 1048576,
//                                         },
//                                     ),
//                                     start: 103,
//                                     end: 112,
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
//                                     play04A,
//                                 ],
//                                 suffix: GE1,
//                                 is_absolute: true,
//                             },
//                             type_parameters: [
//                                 TypeParameter {
//                                     type_id: TypeId(
//                                         21,
//                                     ),
//                                     initial_type_id: TypeId(
//                                         15,
//                                     ),
//                                     name_ident: T,
//                                     trait_constraints: [],
//                                     trait_constraints_span: Span {
//                                         src (ptr): 0x000059112ed15370,
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
//                                             21,
//                                         ),
//                                         initial_type_id: TypeId(
//                                             14,
//                                         ),
//                                         span: Span {
//                                             src (ptr): 0x000059112edc8060,
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
//                                         src (ptr): 0x000059112edc8060,
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
//                             ],
//                             span: Span {
//                                 src (ptr): 0x000059112edc8060,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048577,
//                                     },
//                                 ),
//                                 start: 10,
//                                 end: 35,
//                                 as_str(): "enum GE1<T> {\n    A: T,\n}",
//                             },
//                             visibility: Private,
//                         },
//                     ),
//                     Some(
//                         TyEnumDecl {
//                             call_path: CallPath {
//                                 prefixes: [
//                                     plays,
//                                     play04A,
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
//                                         15,
//                                     ),
//                                     name_ident: T,
//                                     trait_constraints: [],
//                                     trait_constraints_span: Span {
//                                         src (ptr): 0x000059112ed15370,
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
//                                             src (ptr): 0x000059112edc8060,
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
//                                         src (ptr): 0x000059112edc8060,
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
//                             ],
//                             span: Span {
//                                 src (ptr): 0x000059112edc8060,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048577,
//                                     },
//                                 ),
//                                 start: 10,
//                                 end: 35,
//                                 as_str(): "enum GE1<T> {\n    A: T,\n}",
//                             },
//                             visibility: Private,
//                         },
//                     ),
//                     Some(
//                         TyEnumDecl {
//                             call_path: CallPath {
//                                 prefixes: [
//                                     plays,
//                                     play04A,
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
//                                         15,
//                                     ),
//                                     name_ident: T,
//                                     trait_constraints: [],
//                                     trait_constraints_span: Span {
//                                         src (ptr): 0x000059112ed15370,
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
//                                             src (ptr): 0x000059112edc8060,
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
//                                         src (ptr): 0x000059112edc8060,
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
//                             ],
//                             span: Span {
//                                 src (ptr): 0x000059112edc8060,
//                                 source_id: Some(
//                                     SourceId {
//                                         id: 1048577,
//                                     },
//                                 ),
//                                 start: 10,
//                                 end: 35,
//                                 as_str(): "enum GE1<T> {\n    A: T,\n}",
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
//                 5,
//             ): ParsedDeclId(
//                 1,
//             ),
//             DeclId(
//                 4,
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
//         data: {
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
//                 0,
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
//         },
//     },
// }

