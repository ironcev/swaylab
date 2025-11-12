library;

pub enum BlacklistError {
    TraderAlreadyBlacklisted: (),
    TraderNotBlacklisted: (),
}

pub struct AddBlacklistEvent {
    pub trader: Identity,
}

impl AddBlacklistEvent {
    pub fn new(trader: Identity) -> Self {
        Self { trader }
    }

    pub fn log(self) {
        log(self);
    }
}

pub struct RemoveBlacklistEvent {
    pub trader: Identity,
}

impl RemoveBlacklistEvent {
    pub fn new(trader: Identity) -> Self {
        Self { trader }
    }

    pub fn log(self) {
        log(self);
    }
}

abi Blacklist {
    #[storage(read)]
    fn blacklist(trader: Identity);
    #[storage(read)]
    fn remove_blacklist(trader: Identity);
    #[storage(read, write)]
    fn initialize();
    #[storage(read, write)]
    fn transfer_ownership(new_owner: Identity);
}
