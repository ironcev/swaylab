library;

pub enum WhitelistError {
    TraderAlreadyWhitelisted: (),
    TraderNotWhitelisted: (),
}

pub struct AddWhitelistEvent {
    pub trader: Identity,
}

impl AddWhitelistEvent {
    pub fn new(trader: Identity) -> Self {
        Self { trader }
    }

    pub fn log(self) {
        log(self);
    }
}

pub struct RemoveWhitelistEvent {
    pub trader: Identity,
}

impl RemoveWhitelistEvent {
    pub fn new(trader: Identity) -> Self {
        Self { trader }
    }

    pub fn log(self) {
        log(self);
    }
}

abi Whitelist {
    #[storage(read)]
    fn whitelist(trader: Identity);
    #[storage(read)]
    fn remove_whitelist(trader: Identity);
    #[storage(read, write)]
    fn initialize();
    #[storage(read, write)]
    fn transfer_ownership(new_owner: Identity);
}
