script;

fn main() {
}
/// 1. References have their own mutability and can point to mutable or immutable values.
///    Thus, we support mutable refs to mutable values and any combination of the two.
///    Target mutability must be specified explicitely. It is not automatically taken
///    over from the referenced value. E.g.:
///
///    let mut m_i = 0u64;
///    let r_m_i = &mut m_i; // Immutable reference to a mutable m_i.
///    let mut m_r_m_i = &mut m_i; // Mutable reference to a mutable m_i.
///    let r_m_i = &m_i; // Immutable reference to an immutable (via reference) m_i.
///    let mut r_m_i = &m_i; // Mutable reference to an immutable (via reference) m_i.
///
///    The need to specify `mut` in the second case is likely cumbersome because it will be
///    the default wanted behavior, but it gives us clear syntax later on when having references
///    in aggreagates and when sending and returning them from functions.
///
///    let i = 0u64;
///    let r_m_i = &mut i; // ERROR: i is not mutable.
///
/// 2. & operator defines the reference. * operator is dereferencing.
///
/// 3. . and [] operators also dereference if the reference is a reference to struct/tuple and array respectively.

fn built_in_types_and_enums() {
    let i = 0u64;
    let mut m_i = 0u64;
    let x = 0u64;

    // ---- Immutable references to mutable or immutable built-in types.
    let r_i = &i; // Ref to immutable u64. r_i: &u64
    let r_m_i = &mut m_i; // Ref to a mutable u64. r_m_i: &mut u64. The reference itself is not mutable.
    let r_n_m_i = &m_i; // Ref to a u64. r_n_m_i: &u64. It is not possible to change m_i via the reference although it is per se mutable.
    let err = &mut i; // ERROR: i is no muttable.

    *r_i = 1; // ERROR: target is not mutable.
    r_1 = &x; // ERROR: r_1 is not a mutable reference.

    *r_m_i = 1; // OK: Changes m_1.
    r_m_1 = &x; // ERROR: r_m_1 is not a mutable reference.
    // ----

    // ---- Mutable references to mutable or immutable built-in types.
    let mut r_i = &i; // Mutable ref to immutable a u64. r_i: &u64
    let mut r_m_i = &mut m_i; // Mutable ref to a mutable u64. r_i: &mut u64.

    *r_i = 1; // ERROR: target is not mutable.
    r_1 = &x; // OK: r_1 is mutable.

    *r_m_i = 1; // OK: Changes m_1.
    r_m_1 = &x; // OK: r_m_1 is mutable.
    // ----

    // Accessing built-in types and enums over reference via dereferencing op *
    let a = 2 * *i; 

    let e = Enum::A;
    let r_e = &e;

    match *e { // Actually need to write * here. See pattern matching below.
        _ => {}
    }
}

fn structs_and_tuples() {
    // Same as above with the addition that the . operator dereference the reference.
    let mut s = Struct { x: 0u64 };
    let r_s = &mut s; // r_s is immutable reference to a mutable struct.

    r_s.x = 1; // Same as (*r_s).x = 1;

    match *r_s {
        _ => {}
    }

    let mut t = (0u64, 0u64);
    let r_t = &mut t; // r_s is immutable reference to a mutable tuple.

    r_t.0 = 1; // Same as (*r_t).0 = 1;

    match *r_t { // Actually need to write * here. See pattern matching below.
        _ => {}
    }

    let x = r_t.0 + r_t.1;
}

fn arrays() {
    // Same as above with the addition that the [] operator dereference the reference.
    let mut a = [0, 0, 0];
    let r_a = &a;

    r_a[0] = 1; // Same as (*r_a)[0] = 1;

    let x = r_a[0] + r_a[1];
}

/// Embedding in aggregates.
/// Reference can be part of aggregates.
struct A {
    x: u64,
}

/// The mutability of references `a_i` and `a_m` is the mutability of
/// the aggregated object.
struct B {
    a_i: &A, // Reference to an immutable A.
    a_m: &mut A, // Reference to a mutable A.
}

/// References allow recursive structures.
struct Node<T> {
    parent: Option<&Node<T>>,
    data: T,
}

fn embedding_in_aggregates() {
    let mut a_1 = A { x: 0 };
    let mut a_2 = A { x: 0 };
    let mut b = B { a_i: &a, a_m: &mut a };

    b.a_i = &a_2;
    b.a_m = &a_2;

    b.a_m.x = 1;

    let b_i = B { a_i: &a, a_m: &mut a };

    b_i.a_i = &a_2; // ERROR: b_i is immutable, thus a_i is immutable.
    b_i.a_m = &a_2; // ERROR: b_i is immutable, thus a_m is immutable.

    b.a_m.x = 1; // OK: a_m references a mutable value.

    // Same with arrays, tuples, and enums.
}

// Referencing references.
fn referencing_references() {
    let mut a = A { x: 0 };
    let mut m_r_a = &mut a;
    let mut m_r_m_r_a = &mut m_r_a;
    let r_m_r_m_r_a = &mut m_r_a;

    let x = r_m_r_m_r_a.x; // ERROR: . dereferences reference to struct and tuples but not to other references.
    let x = ***r_m_r_m_r_a.x; // OK.
    let x = **r_m_r_m_r_a.x; // OK: Also ok, because the last reference is a reference to struct.
}

/// Pattern matching.
/// When pattern matching a reference, in case of a requirement we actually match the value behind the reference.
/// In case of a variable declaration, we declare a reference which takes over the muttability.
enum E {
    A: (&mut A),
    B: (&B),
    T: (&mut u64, &u64)
}

fn pattern_matching() {
    let mut a = A { x: 0 };
    let e = E::A(&mut a);

    match e {
        E::A( A { x: 111 }) => {},
        E::A(a) => {
            a.x = 222; // a is a reference to mutable A.
        },
        T(x, 555) => { // match the second value (dereferenced) with 555.
            *x = 222; // x is a reference to u64.
        }
    };

    // Same with the matched value itself. If it is a reference, it get's dereferenced before the match.

    let r_e = &e;

    match r_e { // No need to write *r_e.
        E::A( A { x: 111 }) => {},
        E::A(a) => {
            a.x = 222; // a is a reference to mutable A.
        },
        T(x, 555) => { // match the second value (dereferenced) with 555.
            *x = 222; // x is a reference to u64.
        }
    };

    // Also for references of references.
    let r_r_r_e = &&r_e;

    match r_r_r_e { // Matches the actual value behind the last reference.
        _ => {}
    }
}

/// Referencing parts of aggregates.
/// Important when e.g. passing an array element to a function by reference. This cannot be done at the moment.
/// Or returning a `Vec` element by reference to avoid copies.
/// But in the latter case I am very reluctant and not sure if it is a good idea because we can end up with dangling references in that case.
/// E.g., `Vec::get_ref(...)` returns a reference kept by caller and then `Vec;:clear()` call happens.
/// In general, I would go for sematics and syntax of references that forbids dangling references which can always
/// be ensured with non-dynamic aggregates like arrays. For `Vec` and other dynamic types we should see how to
/// detect and avoid dangling references. But that's out of scope of this first sketch of the reference syntax and semantics. 
struct C {
    a: A,
    t: (u64, u64)
}

fn referencing_parts_of_aggregates() {
    let mut c = C { a: A { x: 0 }, t: (0, 0) };
    let r_c_a = &mut c.a;
    let r_c_a_x = &mut c.a.x;
    let r_c_t_0 = &mut c.t.0;
    let r_c_t_1 = &mut c.t.1;

    r_c_a.x = 1;
    *r_c_a_x = 2;

    // We can reuse existing reference to obtain a reference to a part.
    let r_c_t = &c.t;
    let r_c_t_0 = &r_c_t.0;

    let array = [c, c, c];
    let r_first_elem = &array[0];
    let r_second_elem = &array[1];

    let x = r_first_elem.a.x + r_second_elem.a.x;

    // We can use pattern matching/destructing to obtain a reference to a part.
    let C { a: A { x }, t: (_, y) } = &c; // x and y are references to u64.

    let x = *x * *y;
}

fn passing_to_functions() {
    let a = A { x: 0 };
    let mut m_a = A { x: 0 };

    fn_takes_references(a, a, &a, &mut m_a, &mut m_a); // OK.
    fn_takes_references(m_a, m_a, &m_a, &mut m_a, &mut m_a); // OK.
    fn_takes_references(a, a, &a, &mut a /* ERROR */, &mut a /* ERROR */); // ERROR.
}

fn returning_from_functions() {
    let r_a = fn_returns_ref(); // OK.
    let mut m_r_a = fn_returns_ref(); // OK.

    r_a.x = 1; // ERROR.
    m_r_a.x = 1; // ERROR.
    m_r_a = &A { x: 0 }; // OK.

    let r_m_a = fn_returns_ref_to_mut(); // OK.
    let mut m_r_m_a = fn_returns_ref_to_mut(); // OK.

    r_m_a.x = 1; // OK.
    m_r_m_a.x = 1; // OK.
    m_r_m_a = &mut A { x: 0 }; // OK.
}

// Below function generates warning for the first argument along these lines:
// Copying immutable compound types is usually expensive and not necessarry. Use `a: &A` instead. 
fn fn_takes_references(a: A, mut m_a: A, r_a: &A, r_m_a: &mut A, mut m_r_m_a: &mut A) {
    let x = a.x + m_a.x + r_a.x + m_r_a.x + m_m_r_a.x;

    a.x = 1; // ERROR: a is not muttable.
    m_a.x = 1; // OK. Does not affect original.
    
    r_a.x = 1; // ERROR: r_a is a reference to a non muttable.
    r_m_a.x = 1; // OK. Changes original.
    m_r_m_a.x = 1; // OK. Changes original.

    let new_a = A { x: 0 };
    let new_m_a = A { x: 0 };

    a = new_a; // ERROR.
    m_a = new_a; // OK.
    r_a = &new_a; // ERROR. r_a is not mutable.
    r_m_a = &new_a; // ERROR. r_m_a is not mutable.
    m_r_m_a = &mut new_a; // ERROR: new_a is not mutable.
    m_r_m_a = &mut new_m_a; // OK.
    m_r_m_a = &new_m_a; // ERROR: Must be reference to mutable.
}

fn fn_returns_ref() &A { // Ref to immutable A.
    &A { x: 0 }
}

fn fn_returns_ref_to_mut() &mut A { // Ref to mutable A.
    &mut A { x: 0 }
}

/// References and iterators.
/// Once we get iterators and the `for` loop we should have semantic equivalents to
/// Rust `iter()`, `iter_mut()`, and `into_iter()`. By semantic equivalents I mean
/// returning references in Sway where borrowed value were returned in Rust, and
/// values where consuming the collection was done in Rust.

fn iterators() {
    let a_i = [1, 2, 3];

    let mut sum = 0;
    for i in a_i { // Be default, for array of built-in types the value is returned. No need to dereference. To avoid having * everywhere.
        sum = sum + i; // i: u64.
    }

    let a_s = [A { x: 1 }, A { x: 2 }];

    let mut sum = 0;
    for s in a_s { // Be default, for array of aggregates the reference is returned to avoid copying.
        sum = sum + s.x; // s: &A.
    }
    
    // ? Not sure if the above approach is the best idea. We should perhaps always iterate over either references or
    //   values by default and let the programmer use  different `iter()` methods to get specific desired bahavior.
    //   From the performance perspecitve, if we semantically seen return "copies" of A in practice copying will be
    //   optimized away.

    for i in a_1.iter() {
        // i: &u64.
    }

    for i in a_1.into_iter() {
        // i: u64.
    }

    for i in a_1.iter_mut() {
        // i: &mut u64.
    }
}

/// References and generic types.
struct GenStruct<&T> {} // ERROR: Not allowed.

struct GenStruct<T> {
    x: &T, // OK.
}

/// References and constants and literals.
fn references_and_constants_and_literals() {
    const X = 0u64;
    let r_x = &X; // OK. r_x: &u64.
    let r_m_x = &mut X; // ERROR.
    let mut m_r_x = &X; // OK.

    let r_x = &0u64; // OK. r_x: &u64.
    let r_m_x = &mut 0u64; // ERROR.
    let mut m_r_x = &0u64; // OK.

    // Immutable references to constants should be considered in the const evaluation.
    let x = *r_x; // Const evaluation detects x to be a constant.
    let x = *m_r_x; // x is not a constant.
}


/// References and type aliases.
/// We can have references as type aliases.
type RefToU64 = &u64;
type RefToTupleOfRefs = &(&u64, &u64);

fn references_and_type_aliases() {
    let r: RefToU64 = &0u64;
}

fn ret_ref_to_u64() -> RefToU64 {
    &0u64
}