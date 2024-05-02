# Q&D DBG

Collection of functions useful for quick and dirty debugging.

Some additional code useful for debugging is given below.

# Tips & Tricks

1. Printing all IR optimisation passes

Add the following lines to the _sway-core/src/lib.rs_ `compile_ast_to_ir_to_asm` function:

    // Before the first pass is appended.
    if build_config.print_ir {
        pass_group.append_pass(MODULEPRINTER_NAME);
    }

    // After the whole pass group is defined.
    let pass_group = if build_config.print_ir {
        sway_ir::pass_manager::insert_after_each(pass_group, MODULEPRINTER_NAME)
    } else {
        pass_group
    };

To get the pass names printed, add the following lines to the _sway-ir/src/pass_manager.rs_ `run` funtion:

    // modified |= self.actually_run(ir, pass)?;
    let pass_modified = self.actually_run(ir, pass)?;
    if pass_modified {
        println!(">>>> {pass}");
    }
    modified |= pass_modified;

