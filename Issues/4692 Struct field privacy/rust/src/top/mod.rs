pub mod middle;

//use middle::PrivateMiddleStruct;
// ERROR:    struct `PrivateMiddleStruct` is private

struct PrivateTopStruct {
    x: u64,
    y: u64,
}

pub struct PublicTopStruct {
    pub x: u64,
    y: u64,
}