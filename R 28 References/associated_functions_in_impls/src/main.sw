script;

impl [u64;3] {
    pub fn method(self) -> u64 {
        self[0]
    }
    
    pub fn function() -> u64 {
        0
    }
}

type Array3 = [u64;3];

fn main() -> u64 {
    let array = [0u64, 0u64, 0u64];
    
    let _ = array.method();
    
    //let _ = [u64;3]::function();
    // ERROR:        ^ Expected `;`.
    
    let _ = Array3::function();
    
    0
}
