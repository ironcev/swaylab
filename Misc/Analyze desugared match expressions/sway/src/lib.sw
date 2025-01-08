library;

pub enum Option<T> {
    Some: T,
    None: (),
}

pub enum Output {
    Coin: (),
    Contract: (),
    Change: (),
    Variable: (),
    ContractCreated: (),
}