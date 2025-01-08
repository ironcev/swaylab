use std::sync::Arc;

struct SourceId(u32);

struct TypeSourceInfo {
    type_info: Arc<[u8;232]>,
    source_id: Option<SourceId>,
}

struct TypeSourceInfoNoOption {
    type_info: Arc<[u8;232]>,
    source_id: SourceId,
}

fn main() {
    println!("SourceId:                {}", std::mem::size_of::<SourceId>());
    println!("Option<SourceId>:        {}", std::mem::size_of::<Option<SourceId>>());
    println!("Option<&SourceId>:       {}", std::mem::size_of::<Option<&SourceId>>());
    println!("TypeSourceInfo:          {}", std::mem::size_of::<TypeSourceInfo>());
    println!("TypeSourceInfoNoOption:  {}", std::mem::size_of::<TypeSourceInfoNoOption>());
}

// SourceId:                4
// Option<SourceId>:        8
// Option<&SourceId>:       8
// TypeSourceInfo:          16
// TypeSourceInfoNoOption:  16
