contract;

abi Abi {
    fn assign_config();
    fn assign_config_call_pass_config();
}

configurable {
    CONFIG: u64 = 1234,
}

impl Abi for Contract {
    #[inline(never)]
    fn assign_config() {
        let x = CONFIG;
    }

    #[inline(never)]
    fn assign_config_call_pass_config() {
        let x = CONFIG;
	poke(CONFIG);
    }
}

#[inline(never)]
fn poke(_x: u64) { }

// Initial:
// pub fn assign_config_24() -> (), !204 {
//     local u64 x

//     entry():
//     v0 = get_config ptr u64, CONFIG, !205
//     v1 = load v0
//     v2 = get_local ptr u64, x, !206
//     store v1 to v2, !206
//     v3 = const unit ()
//     ret () v3
// }

// pub fn assign_config<9fecdcfd>() -> (), !204 {
//     local u64 x

//     entry():
//     v0 = get_config ptr u64, CONFIG, !205
//     v1 = load v0
//     v2 = get_local ptr u64, x, !206
//     store v1 to v2, !206
//     v3 = const unit ()
//     ret () v3
// }

// Final:
// pub fn assign_config<9fecdcfd>() -> (), !163 {
//     entry():
//     v0 = const unit ()
//     ret () v0
// }
