library;

trait TraitWithConst {
    const TRAIT_C1: u64 = 0;
    const TRAIT_C2: u64 = 0;
}

trait Default {
    fn default() -> Self;
}

impl Default for u64 {
    fn default() -> Self {
        0
    }
}

impl Default for u32 {
    fn default() -> Self {
        0
    }
}

trait Other {
    fn other() -> Self;
}

impl Other for u64 {
    fn other() -> Self {
        112233
    }
}

impl Other for u32 {
    fn other() -> Self {
        332211
    }
}

trait GenericTraitWithConst<T> where T: Default {
    const G_TRAIT_C1: T = T::default();
    const G_TRAIT_C2: T = T::default();
}

struct S { }

impl S {
    const S_CONST_A1: [u64;3] = [333333; 3];
    const S_CONST_A2: [u64;3] = [333333; 3];
}

impl S {
    const S_CONST_B1: [u64;3] = [333333; 3];
    const S_CONST_B2: [u64;3] = [333333; 3];
}

impl TraitWithConst for S {
    const TRAIT_C1: u64 = 1111;
    const TRAIT_C2: u64 = 2222;
}

impl GenericTraitWithConst<u64> for S {
    const G_TRAIT_C1: u64 = 3333;
    const G_TRAIT_C2: u64 = 4444;
}

struct GS<A, B> where A: Other, B: Other { }

impl<A, B> GS<A, B> where A: Other, B: Other {
    // const GS_CONST_A: A = A::other();
    // const GS_CONST_B: B = B::other();
}

// impl GenericTraitWithConst<u32> for S {
//     const G_TRAIT_C1: u32 = 5555;
//     const G_TRAIT_C2: u32 = 6666;
// }

// impl<O> GenericTraitWithConst<O> for S where O: Default + Other {
//     const G_TRAIT_C1: O = O::other();
//     const G_TRAIT_C2: O = O::other();
// }

// type GTWC32 = GenericTraitWithConst<u32>;

#[inline(never)]
pub fn play() -> u64 {
    poke(S::S_CONST_A1);
    poke(S::S_CONST_A1);

    poke(S::S_CONST_A2);
    poke(S::S_CONST_A2);

    poke(S::S_CONST_B1);
    poke(S::S_CONST_B1);

    poke(S::S_CONST_B2);
    poke(S::S_CONST_B2);

    poke(S::TRAIT_C1);
    poke(S::TRAIT_C2);

    poke(S::G_TRAIT_C1);
    poke(S::G_TRAIT_C2);

    // poke(<S as GTWC32>::G_TRAIT_C1);
    // poke(<S as GTWC32>::G_TRAIT_C2);

    // poke(GS::<u64, u32>::GS_CONST_A);
    // poke(GS::<u64, u32>::GS_CONST_B);

    0
}

#[inline(never)]
fn poke<T>(_x: T) {}
