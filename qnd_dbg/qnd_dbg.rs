use crate::decl_engine::DeclEngine;
use crate::decl_engine::DeclRefEnum;
use crate::decl_engine::DeclRefStruct;
use crate::language::ty::VariableMutability;
use crate::language::LazyOp;
use crate::semantic_analysis::TypeCheckContext;
use crate::ty::TyAstNodeContent;
use crate::ty::TyCodeBlock;
use crate::ty::TyExpression;
use crate::ty::TyExpressionVariant;
use crate::Engines;
use crate::TraitConstraint;
use crate::TypeId;
use crate::TypeInfo;
use crate::TypeParameter;

// To use this function, first add the `pretty_print_declared_traits` method to `impl DeclEngine`.
pub fn qnd_dbg_declared_traits(de: &DeclEngine) {
    println!("\n>> Declared traits");
    //println!("\n{}", de.pretty_print_declared_traits());
}

    // Add this method to `impl DeclEngine`.
    // pub fn pretty_print_declared_traits(&self) -> String {
    //     let mut builder = String::new();
    //     self.trait_slab.with_slice(|elems| {
    //         let list = elems
    //             .iter()
    //             .map(|trait_decl| format!("{}", trait_decl.call_path));
    //         let list = ListDisplay { list };
    //         write!(builder, "\n{list}\n").unwrap();
    //     });
    //     builder
    // }

pub fn qnd_dbg_implemented_traits_for_type(ctx: &TypeCheckContext, type_id: TypeId) {
    let trait_call_paths = ctx
        .namespace
        .module()
        .current_items()
        .implemented_traits
        .get_trait_names_and_type_arguments_for_type(ctx.engines, type_id)
        .into_iter()
        .map(|(trait_call_path, _)| trait_call_path);
    println!(
        "\n>> Implemented traits for type {} [{:?}]: {} trait(s)",
        ctx.engines.help_out(type_id),
        type_id,
        trait_call_paths.len()
    );
    for trait_call_path in trait_call_paths {
        println!("\t{}", trait_call_path);
    }
}

pub fn qnd_dbg_symbols(ctx: &TypeCheckContext) {
    let mut symbols = ctx
        .namespace
        .module()
        .current_items()
        .symbols
        .iter()
        .collect::<Vec<(_, _)>>();
    symbols.sort_by(|a, b| a.0.cmp(b.0));

    println!("\n>> Symbols: {} symbol(s)", symbols.len());
    for symbol in symbols {
        println!("\t{}", symbol.0.as_str());
    }
}

pub fn qnd_dbg_use_synonyms(ctx: &TypeCheckContext) {
    let mut use_synonyms = ctx
        .namespace
        .module()
        .current_items()
        .use_synonyms
        .iter()
        .collect::<Vec<(_, _)>>();
    use_synonyms.sort_by(|a, b| a.0.cmp(b.0));

    println!("\n>> Synonyms: {} synonym(s)", use_synonyms.len());
    for synonym in use_synonyms {
        println!("\t{}", synonym.0.as_str());
    }
}

pub fn qnd_dbg_expression_tree(expr: &TyExpression) {
    println!("\n{:?}\n", expr);
}

pub fn qnd_dbg_expression(engines: &Engines, expr: &TyExpression) {
    print!("\n{}\n", build_expression(engines, expr, Indent::default()));

    fn build_expression(engines: &Engines, expr: &TyExpression, indent: Indent) -> String {
        let mut result = String::new();

        match &expr.expression {
            TyExpressionVariant::IfExp {
                condition,
                then,
                r#else,
            } => {
                result.push_str(&format!(
                    "{indent}if {} ",
                    build_expression(engines, condition, Indent::default())
                ));
                result.push_str(&build_expression(engines, then, indent.inc()));
                if let Some(r#else) = r#else {
                    let else_body_indent = match r#else.expression {
                        TyExpressionVariant::CodeBlock { .. } => indent.inc(),
                        TyExpressionVariant::IfExp { .. } => Indent::default(),
                        _ => indent,
                    };
                    result.push_str(&format!(
                        "\n{indent}else {}",
                        build_expression(engines, r#else, else_body_indent)
                    ));
                }
            }
            TyExpressionVariant::FunctionApplication {
                call_path,
                arguments,
                ..
            } => {
                let arguments = arguments
                    .iter()
                    .map(|(_, exp)| build_expression(engines, exp, Indent::default()))
                    .collect::<Vec<String>>()
                    .join(", ");
                result.push_str(&format!("{indent}{call_path}({arguments})"));
            }
            TyExpressionVariant::EnumTag { exp } => result.push_str(&format!(
                "{indent}EnumTag({})",
                build_expression(engines, exp, Indent::default())
            )),
            TyExpressionVariant::EnumInstantiation {
                enum_ref,
                variant_name,
                contents,
                ..
            } => {
                let contents = contents
                    .iter()
                    .map(|exp| build_expression(engines, exp, Indent::default()))
                    .collect::<Vec<String>>()
                    .join(", ");
                let contents = if contents.is_empty() {
                    "".to_string()
                } else {
                    format!("({contents})")
                };
                let enum_decl = engines.de().get_enum(enum_ref);
                result.push_str(&format!(
                    "{indent}{}::{}{}",
                    enum_decl.call_path.suffix, variant_name, contents
                ));
            }
            TyExpressionVariant::VariableExpression { name, .. } => {
                result.push_str(&format!("{indent}{name}"))
            }
            TyExpressionVariant::ConstantExpression {
                const_decl,
                call_path,
                span,
            } => result.push_str(&format!(
                "{indent}CONST({}, {}, {})",
                span.as_str(),
                call_path
                    .as_ref()
                    .map_or("<None>".to_string(), |cp| format!("{}", cp.clone())),
                const_decl.call_path
            )),
            TyExpressionVariant::Literal(literal) => result.push_str(&format!("{literal}")),
            TyExpressionVariant::ImplicitReturn(exp) => {
                result.push_str(&format!(
                    "\n{indent}{}",
                    build_expression(engines, exp, Indent::default())
                ))
            }
            TyExpressionVariant::CodeBlock(TyCodeBlock { contents, .. }) => {
                result.push('{');
                for node in contents {
                    match &node.content {
                        TyAstNodeContent::Declaration(crate::ty::TyDecl::VariableDecl(
                            var_decl,
                        )) => {
                            let mutable = match var_decl.mutability {
                                VariableMutability::Immutable => "",
                                _ => "mut ",
                            };
                            result.push_str(&format!(
                                "\n{indent}let {mutable}{}: {} = {};",
                                var_decl.name,
                                engines.help_out(var_decl.return_type),
                                build_expression(engines, &var_decl.body, Indent::default())
                            ))
                        }
                        TyAstNodeContent::Expression(expression) => result.push_str(&format!(
                            "\n{}",
                            build_expression(engines, expression, indent)
                        )),
                        _ => result.push_str(&format!("\n{indent}[Unsupported TyAstNodeContent]")),
                    }
                }
                result.push_str(&format!("\n{}}}", indent.dec()));
            }
            TyExpressionVariant::LazyOperator { op, lhs, rhs } => {
                let operator = match op {
                    LazyOp::And => "&&",
                    LazyOp::Or => "||",
                };

                result.push_str(&format!(
                    "{indent}({}\n{operator} {})",
                    build_expression(engines, lhs, Indent::default()),
                    build_expression(engines, rhs, Indent::default())
                ));
            }
            TyExpressionVariant::UnsafeDowncast { exp, variant, .. } => result.push_str(&format!(
                "{indent}UnsafeDowncast({}, {})",
                build_expression(engines, exp, Indent::default()),
                variant.span.as_str()
            )),
            TyExpressionVariant::StructFieldAccess {
                prefix,
                field_to_access,
                ..
            } => {
                result.push_str(&format!(
                    "{indent}{}.{}",
                    build_expression(engines, prefix, Indent::default()),
                    field_to_access.name
                ));
            }
            TyExpressionVariant::Tuple { fields } => {
                let fields = fields
                    .iter()
                    .map(|exp| build_expression(engines, exp, Indent::default()))
                    .collect::<Vec<String>>()
                    .join(", ");
                result.push_str(&format!("{indent}({fields})"));
            }
            TyExpressionVariant::TupleElemAccess {
                prefix,
                elem_to_access_num,
                ..
            } => {
                result.push_str(&format!(
                    "{indent}{}.{elem_to_access_num}",
                    build_expression(engines, prefix, Indent::default())
                ));
            }
            TyExpressionVariant::MatchExp { desugared, .. } => {
                result.push_str(&format!("{indent}// [Desugared match expression]\n"));
                result.push_str(&build_expression(engines, desugared, indent));
            }
            TyExpressionVariant::IntrinsicFunction(intrinsic) => {
                let arguments = intrinsic
                    .arguments
                    .iter()
                    .map(|exp| build_expression(engines, exp, Indent::default()))
                    .collect::<Vec<String>>()
                    .join(", ");
                result.push_str(&format!("{indent}__{}({arguments})", intrinsic.kind));
            }
            _ => result.push_str(&format!("\n{indent}[Unsupported TyExpressionVariant]")),
        };

        result
    }
}

pub fn qnd_dbg_type(engines: &Engines, type_id: TypeId) {
    print!("\n{}\n", build_type(engines, type_id, Indent::default()));
}

pub fn qnd_dbg_enum_decl_ref(engines: &Engines, enum_decl_ref: &DeclRefEnum) {
    print!("\n{}\n", build_enum_decl_ref(engines, enum_decl_ref, None, Indent::default()));
}

fn build_type(engines: &Engines, type_id: TypeId, indent: Indent) -> String {
    let type_engine = engines.te();

    let mut result = String::new();

    let type_info = &*type_engine.get(type_id);
    let type_id_as_str = engines.help_out(type_id).to_string();

    match type_info {
        TypeInfo::Unknown => result.push_str(&format!("{:?}: Unknown\n", type_id)),
        TypeInfo::UnknownGeneric { name, trait_constraints } => {
            result.push_str(&format!("{:?}: Generic {name} {{\n", type_id));

            result.push_str(&format!("{}", build_trait_constraints(engines, trait_constraints, indent.inc())));

            result.push_str(&format!("{}}}\n", indent));
        }
        TypeInfo::UnsignedInteger(_) => result.push_str(&format!("{:?}: {type_id_as_str}\n", type_id)),
        TypeInfo::Numeric => result.push_str(&format!("{:?}: Numeric\n", type_id)),
        TypeInfo::Boolean => result.push_str(&format!("{:?}: bool\n", type_id)),
        TypeInfo::Custom { qualified_call_path, .. } => {
            result.push_str(&format!("{:?}: Custom {}\n", type_id, qualified_call_path.call_path));
        }
        TypeInfo::Struct(struct_decl_ref) => {
            result.push_str(&build_struct_decl_ref(engines, struct_decl_ref, Some(type_id), indent));
        }
        TypeInfo::Enum(enum_decl_ref) => {
            result.push_str(&build_enum_decl_ref(engines, enum_decl_ref, Some(type_id), indent));
        }
        TypeInfo::Placeholder(type_parameter) => {
            result.push_str(&format!("{:?} Placeholder {type_id_as_str} {{\n", type_id));

            result.push_str(&build_type_parameter(engines, type_parameter, indent.inc()));

            result.push_str(&format!("\n{}}}\n", indent));
        }
        TypeInfo::TypeParam(_) => todo!("TypeParam"),
        TypeInfo::StringSlice => todo!("StringSlice"),
        TypeInfo::StringArray(_) => todo!("StringArray"),
        TypeInfo::Tuple(_) => todo!("Tuple"),
        TypeInfo::ContractCaller { .. } => todo!("ContractCaller"),
        TypeInfo::B256 => todo!("B256"),
        TypeInfo::Contract => todo!("Contract"),
        TypeInfo::ErrorRecovery(_) => result.push_str(&format!("{:?}: Error\n", type_id)),
        TypeInfo::Array(_, _) => todo!("Array"),
        TypeInfo::Storage { .. } => todo!("Storage"),
        TypeInfo::RawUntypedPtr => todo!("RawUntypedPtr"),
        TypeInfo::RawUntypedSlice => todo!("RawUntypedSlice"),
        TypeInfo::Ptr(_) => todo!("Ptr"),
        TypeInfo::Slice(_) => todo!("Slice"),
        TypeInfo::Alias { .. } => todo!("Alias"),
        TypeInfo::TraitType { .. } => todo!("TraitType"),
        TypeInfo::Ref(_) => todo!("Ref"),
        TypeInfo::Never => todo!("Never"),
    }

    result
}

fn build_type_parameters(engines: &Engines, type_parameters: &[TypeParameter], indent: Indent) -> String {
    let mut result = String::new();

    if type_parameters.is_empty() {
        result.push_str(&format!("{}Type parameters: <none>\n", indent));
    } else {
        result.push_str(&format!("{}Type parameters:\n", indent));

        let type_parameter_indent = indent.inc();
        for type_parameter in type_parameters.iter() {
            result.push_str(&build_type_parameter(engines, type_parameter, type_parameter_indent));
        }
    }

    result
}

fn build_type_parameter(engines: &Engines, type_parameter: &TypeParameter, indent: Indent) -> String {
    let mut result = String::new();

    result.push_str(&format!("{}{}: {}", indent, type_parameter.name_ident, build_type(engines, type_parameter.type_id, indent.inc())));

    result.push_str(&build_trait_constraints(engines, &type_parameter.trait_constraints, indent.inc()));

    result
}

fn build_trait_constraints(engines: &Engines, trait_constraints: &[TraitConstraint], indent: Indent) -> String {
    let mut result = String::new();

    if trait_constraints.is_empty() {
        result.push_str(&format!("{}Trait constraints: <none>\n", indent));
    } else {
        result.push_str(&format!("{}Trait constraints:\n", indent));
        for trait_constraint in trait_constraints.iter() {
            result.push_str(&format!("{}{}: {}\n", indent.inc(), trait_constraint.trait_name, engines.help_out(trait_constraint)))
        }
    }

    result
}

fn build_enum_decl_ref(engines: &Engines, enum_decl_ref: &DeclRefEnum, type_id: Option<TypeId>, indent: Indent) -> String {
    let mut result = String::new();

    let enum_decl = &*engines.de().get_enum(enum_decl_ref.id());

    let type_id_as_str = type_id.map_or("<no type id>".to_string(), |type_id| engines.help_out(type_id).to_string());

    result.push_str(&format!("{}: Enum {type_id_as_str} {{\n", type_id.map_or("<no type id>".to_string(), |type_id| format!("{:?}", type_id))));

    result.push_str(&format!("{}{:?}\n", indent.inc(), enum_decl_ref.id()));
    result.push_str(&format!("{}{}\n", indent.inc(), enum_decl.call_path));

    result.push_str(&build_type_parameters(engines, &enum_decl.type_parameters, indent.inc()));

    result.push_str(&format!("\n{}}}\n", indent));

    result
}

fn build_struct_decl_ref(engines: &Engines, struct_decl_ref: &DeclRefStruct, type_id: Option<TypeId>, indent: Indent) -> String {
    let mut result = String::new();

    let struct_decl = &*engines.de().get_struct(struct_decl_ref.id());

    let type_id_as_str = type_id.map_or("<no type id>".to_string(), |type_id| engines.help_out(type_id).to_string());

    result.push_str(&format!("{}: Struct {type_id_as_str} {{\n", type_id.map_or("<no type id>".to_string(), |type_id| format!("{:?}", type_id))));

    result.push_str(&format!("{}{:?}\n", indent.inc(), struct_decl_ref.id()));
    result.push_str(&format!("{}{}\n", indent.inc(), struct_decl.call_path));

    result.push_str(&build_type_parameters(engines, &struct_decl.type_parameters, indent.inc()));

    if struct_decl.fields.is_empty() {
        result.push_str(&format!("{}Fields: <none>\n", indent.inc()));
    } else {
        result.push_str(&format!("{}Fields:\n", indent.inc()));

        let field_indent = indent.inc().inc();
        for field in struct_decl.fields.iter() {
            result.push_str(&format!("{}{}: {}", field_indent, field.name, build_type(engines, field.type_argument.type_id, field_indent.inc())));
        }
    }

    result.push_str(&format!("\n{}}}\n", indent));

    result
}

#[derive(Default, Clone, Copy)]
struct Indent {
    indent: usize,
}

impl Indent {
    const SINGLE_INDENT: usize = 4;

    fn inc(&self) -> Self {
        Self {
            indent: self.indent + Self::SINGLE_INDENT,
        }
    }

    fn dec(&self) -> Self {
        Self {
            indent: self.indent.saturating_sub(Self::SINGLE_INDENT),
        }
    }
}

use std::fmt::Display;
impl Display for Indent {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{0:1$}", "", self.indent)
    }
}