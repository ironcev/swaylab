struct Context<'e> {
    engines: &'e Engines,
}

struct Engines {
    te: TypeEngine,
}

struct TypeEngine {
}

struct TypeId(usize);

impl TypeId {
    pub const fn new(index: usize) -> Self {
        Self(index)
    }
}

impl TypeEngine {
    pub const fn id_of_unit(&self) -> TypeId {
        TypeId::new(112233)
    }
}

fn main() {
    let engines = Engines { te: TypeEngine {} };
    let ctx = Context { engines: &engines };
    let x = ctx.engines.te.id_of_unit();
    poke(x);
}

#[inline(never)]
fn poke(t: TypeId) {
    println!("{}", t.0);
}
