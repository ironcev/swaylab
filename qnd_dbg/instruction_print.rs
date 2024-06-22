// Add to `sway-ir/src/printer.rs`.
pub fn instruction_print(context: &Context, function: &Function, block: &Block, inst: &Value) {
    let mut md_namer = MetadataNamer::default();
    println!(
        "{}",
        instruction_to_doc(
            context,
            &mut md_namer,
            &mut Namer::new(function.clone()),
            block,
            inst
        )
        .build()
    );
}
