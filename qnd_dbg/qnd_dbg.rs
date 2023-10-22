use crate::language::ty::VariableMutability;
use crate::language::LazyOp;
use crate::semantic_analysis::TypeCheckContext;
use crate::ty::TyAstNodeContent;
use crate::ty::TyCodeBlock;
use crate::ty::TyExpression;
use crate::ty::TyExpressionVariant;
use crate::Engines;
use crate::TypeId;

pub fn qnd_dbg_implemented_traits_for_type(ctx: &TypeCheckContext, type_id: TypeId) {
    let trait_call_paths = ctx
        .namespace
        .implemented_traits
        .get_trait_names_for_type(ctx.engines, type_id);
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
    let mut symbols = ctx.namespace.symbols.iter().collect::<Vec<(_, _)>>();
    symbols.sort_by(|a, b| a.0.cmp(b.0));

    println!("\n>> Symbols: {} symbol(s)", symbols.len());
    for symbol in symbols {
        println!("\t{}", symbol.0.as_str());
    }
}

pub fn qnd_dbg_use_synonyms(ctx: &TypeCheckContext) {
    let mut use_synonyms = ctx.namespace.use_synonyms.iter().collect::<Vec<(_, _)>>();
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
            TyExpressionVariant::CodeBlock(TyCodeBlock { contents }) => {
                result.push('{');
                for node in contents {
                    match &node.content {
                        TyAstNodeContent::ImplicitReturnExpression(exp) => {
                            result.push_str(&format!(
                                "\n{indent}{}",
                                build_expression(engines, exp, Indent::default())
                            ))
                        }
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

    #[derive(Default, Clone, Copy)]
    struct Indent {
        indent: usize,
    }

    impl Indent {
        fn inc(&self) -> Self {
            Self {
                indent: self.indent + 4,
            }
        }
        fn dec(&self) -> Self {
            Self {
                indent: self.indent.saturating_sub(4),
            }
        }
    }

    use std::fmt::Display;
    impl Display for Indent {
        fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
            write!(f, "{0:1$}", "", self.indent)
        }
    }
}
