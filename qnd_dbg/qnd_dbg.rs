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
