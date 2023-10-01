use crate::TypeId;
use crate::semantic_analysis::TypeCheckContext;

pub fn qnd_dbg_implemented_traits_for_type(ctx: &TypeCheckContext, type_id: TypeId) {
    let trait_call_paths = ctx.namespace.implemented_traits.get_trait_names_for_type(ctx.engines, type_id);
    println!("\n>> Implemented traits for type {} [{:?}]: {} trait(s)", ctx.engines.help_out(type_id).to_string(), type_id, trait_call_paths.len());
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

use crate::ty::TyExpression;
pub fn qnd_dbg_expression_tree(expr: &TyExpression) {
    println!("\n{:?}\n", expr);
}

pub fn qnd_dbg_expression(expr: &TyExpression) {
    print!("\n{}\n", build_expression(expr, Indent::default()));

    fn build_expression(expr: &TyExpression, indent: Indent) -> String {
        let mut result = String::new();

        match &expr.expression {
            TyExpressionVariant::IfExp{condition, then, r#else} => {
                result.push_str(&format!("{indent}if {} ", build_expression(condition, Indent::default())));
                result.push_str(&format!("{}", build_expression(then, indent.inc())));
                if let Some(r#else) = r#else {
                    let else_body_indent = match r#else.expression {
                        TyExpressionVariant::CodeBlock { .. } => indent.inc(),
                        TyExpressionVariant::IfExp { .. } => Indent::default(),
                        _ => indent,
                    };
                    result.push_str(&format!("\n{indent}else {}", build_expression(r#else, else_body_indent)));
                }
            },
            TyExpressionVariant::FunctionApplication { call_path, arguments, ..} => {
                let arguments = arguments
                    .iter()
                    .map(|(_, exp)| build_expression(exp, Indent::default()))
                    .collect::<Vec<String>>()
                    .join(", ");
                result.push_str(&format!("{indent}{call_path}({arguments})"));
            },
            TyExpressionVariant::EnumTag { exp } => result.push_str(&format!("{indent}EnumTag({})", build_expression(exp, Indent::default()))),
            TyExpressionVariant::VariableExpression { name, ..} => result.push_str(&format!("{indent}{name}")),
            TyExpressionVariant::Literal(literal) => result.push_str(&format!("{literal}")),
            TyExpressionVariant::CodeBlock(TyCodeBlock { contents }) => {
                result.push_str("{");
                for node in contents {
                    match &node.content {
                        TyAstNodeContent::ImplicitReturnExpression(exp) => {
                            result.push_str(&format!("\n{indent}{}", build_expression(exp, Indent::default())))
                        },
                        TyAstNodeContent::Declaration(crate::ty::TyDecl::VariableDecl(var_decl)) => {
                            let mutable = match var_decl.mutability {
                                ty::VariableMutability::Immutable => "",
                                _ => "mut ",
                            };
                            result.push_str(&format!("\n{indent}let {mutable}{} = {};", var_decl.name, build_expression(&var_decl.body, Indent::default())))
                        }
                        _ => result.push_str("NOT_SUPPORTED"),
                    }
                }
                result.push_str(&format!("\n{}}}", indent.dec()));
            },
            TyExpressionVariant::LazyOperator { op, lhs, rhs } => {
                let operator = match op {
                    LazyOp::And => "&&",
                    LazyOp::Or => "||",
                };

                result.push_str(&format!("{indent}({}\n{operator} {})", build_expression(lhs, Indent::default()), build_expression(rhs, Indent::default())));
            },
            TyExpressionVariant::UnsafeDowncast { exp, variant, .. } => {
                result.push_str(&format!("{indent}UnsafeDowncast({}, {})", build_expression(exp, Indent::default()), variant.span.as_str()))
            },
            TyExpressionVariant::TupleElemAccess { prefix, elem_to_access_num, .. } => {
                result.push_str(&format!("{indent}{}.{elem_to_access_num}", build_expression(prefix, Indent::default())));
            }
           _ => result.push_str("NOT_SUPPORTED"),
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

