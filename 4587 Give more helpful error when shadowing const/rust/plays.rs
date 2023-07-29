const X: u32 = 1;

fn main() {
    const X: u32 = 2;
    
    println!("{X}");
}

// -------------------------------------------------

const X: u32 = 1;
const X: u32 = 2; // error[E0428]: the name `X` is defined multiple times

fn main() {
    println!("{X}");
}

// -------------------------------------------------

static X: u32 = 1;
const X: u32 = 2; // error[E0428]: the name `X` is defined multiple times

fn main() {
    println!("{X}");
}

// -------------------------------------------------

static X: u32 = 1;
static X: u32 = 2; // error[E0428]: the name `X` is defined multiple times

fn main() {
    println!("{X}");
}

// -------------------------------------------------

static X: u32 = 1;

fn main() {
    static X: u32 = 2;
    
    println!("{X}");
}

// -------------------------------------------------

const X: u32 = 1;

fn main() {
    const X: u32 = 2;
    
    {
        const X: u32 = 3;
        
        println!("{X}");
    }
    
    println!("{X}");
}

// -------------------------------------------------

const X: u32 = 1; // warning: constant `X` is never used

fn main() {
    println!("{X}"); // !!: Prints 2.
        
    const X: u32 = 2;
    
    {
        const X: u32 = 3;
        
        println!("{X}");
    }
    
    println!("{X}");
}

// -------------------------------------------------

fn main() {
    println!("{X}");
        
    const X: u32 = 2;
    
    {
        const X: u32 = 3;
        
        println!("{X}");
    }
    
    println!("{X}");
}

// -------------------------------------------------

fn main() {
    println!("{X}");
    const X: u32 = 1;
    const X: u32 = 2; // error[E0428]: the name `X` is defined multiple times
    
    {
        const X: u32 = 3;
        
        println!("{X}");
    }
    
    println!("{X}");
}

// -------------------------------------------------

struct X {}

fn main() {
    println!("{X}");
    const X: u32 = 1;
}

// -------------------------------------------------

struct X {}
const X: u32 = 1;

fn main() {
    println!("{X}");
}

// -------------------------------------------------

struct X {}
static X: u32 = 1;

fn main() {
    println!("{X}");
}

// -------------------------------------------------

struct X {}
struct X {} // error[E0428]: the name `X` is defined multiple times

fn main() {
}

// -------------------------------------------------

struct X {}
enum X {} // error[E0428]: the name `X` is defined multiple times

fn main() {
}

// -------------------------------------------------

struct X {}

fn main() {
    let X = 1;
}

// -------------------------------------------------

struct X {}

fn main() {
    let X: X = X { };
}

// -------------------------------------------------

fn main() {
    struct X {}

    let X: X = X { };
}

// -------------------------------------------------

fn main() {
    struct X {}
    const X: u32 = 1;
}

// -------------------------------------------------

fn main() {
    const X: u32 = 1;
    let X: u32 = 2; // error[E0005]: refutable pattern in local binding
                    // ^ patterns `0_u32` and `2_u32..=u32::MAX` not covered
    
    println!("{X}");
}

// -------------------------------------------------

fn main() {
    let X: u32 = 2; // error[E0005]: refutable pattern in local binding
                    // ^ patterns `0_u32` and `2_u32..=u32::MAX` not covered
    const X: u32 = 1;
    
    println!("{X}");
}

// -------------------------------------------------

fn main() {
    const X: u32 = 1;
    let mut X: u32 = 2; // error[E0530]: let bindings cannot shadow constants
    
    println!("{X}");
}

// -------------------------------------------------

const X: u32 = 1;   
 
fn main() {
    println!("{}", crate::X);
    
    const X: u32 = 2;
    
    {
        println!("{X}");
        
        const X: u32 = 3;
        
        println!("{X}");
    }
    
    println!("{X}");
}

// -------------------------------------------------

use std::f64::consts::PI;

fn main() {
    const PI: f64 = 3.0;
    
    println!("{PI}");
}

// -------------------------------------------------

use std::f64::consts::PI;
const PI: f64 = 3.0; // error[E0255]: the name `PI` is defined multiple times

fn main() {
    println!("{PI}");
}

// -------------------------------------------------

use std::f64::consts::PI as PIX;
const PI: f64 = 3.0;

fn main() {
    println!("{PI}");
}

// -------------------------------------------------

use std::f64::consts::*;
const PI: f64 = 3.0;

fn main() {
    println!("{PI}");
}

// -------------------------------------------------

use std::f64::consts::*;

fn main() {
    println!("{PI}");
}

// -------------------------------------------------

use std::f64::consts::PI as PIX;
const PIX: f64 = 3.0; // error[E0255]: the name `PIX` is defined multiple times

fn main() {
    println!("{PI}"); // error[E0425]: cannot find value `PI` in this scope
}

// -------------------------------------------------

use std::f64::consts::*;
use std::f64::consts::PI as PIX;
const PIX: f64 = 3.0; // error[E0255]: the name `PIX` is defined multiple times

fn main() {
    println!("{PI}"); // !!: It will find PI.
}

// -------------------------------------------------

use std::f64::consts::*;
use std::f64::consts::PI as PIX;
use std::f64::consts::PI as PIY;

fn main() {
    println!("{PI}");
    println!("{PIX}");
    println!("{PIY}");
}

// -------------------------------------------------

use std::f64::consts::*;
use std::f64::consts::PI as PIX;
use PIX as PIY;

fn main() {
    println!("{PI}");
    println!("{PIX}");
    println!("{PIY}");
}

// -------------------------------------------------

use std::f64::consts::PI;
use std::f64::consts::PI as PIX;
use PIX as PIY;

fn main() {
    println!("{PI}");
    println!("{PIX}");
    println!("{PIY}");
}

// -------------------------------------------------

const X: u32 = 1;
use crate::X as Y;

fn main() {
    println!("{X}");
    println!("{Y}");
}

// -------------------------------------------------

const X: u32 = 1;
use crate::X as Y;
const Y: u32 = 2; // error[E0255]: the name `Y` is defined multiple times

fn main() {
    println!("{X}");
    println!("{Y}");
}

// -------------------------------------------------

use std::f64::consts::PI;
use std::f64::consts::E as PI; // error[E0252]: the name `PI` is defined multiple times

fn main() {
    println!("{PI}");
}

// -------------------------------------------------

use std::f64::consts::PI as X;
use std::f64::consts::E as X; // error[E0252]: the name `X` is defined multiple times

fn main() {
    println!("{PI}");
    println!("{E}");
    println!("{X}");
}

// -------------------------------------------------

struct Struct { }

impl Struct {
    const X: u32 = 1;
}

fn main() {
    println!("{}", Struct::X);
}

// -------------------------------------------------

struct Struct { }

impl Struct {
    const X: u32 = 1;
    const X: u32 = 2; // error[E0592]: duplicate definitions with name `X`
}

fn main() {
    println!("{}", Struct::X);
}

// -------------------------------------------------

struct Struct { 
    const X: u32 = 1; // error: expected identifier, found keyword `const`
}

impl Struct {
}

fn main() {
    println!("{}", Struct::X);
}

// -------------------------------------------------

struct Struct { }

trait Trait { 
    const X: u32 = 1;
}

impl Trait for Struct {
}

fn main() {
    println!("{}", Struct::X);
}

// -------------------------------------------------

struct Struct { }

trait Trait { 
    const X: u32;
}

impl Trait for Struct { // error[E0046]: not all trait items implemented, missing: `X`
}

fn main() {
    println!("{}", Struct::X);
}

// -------------------------------------------------

struct Struct { }

trait Trait { 
    const X: u32;
    const X: u32; // error[E0428]: the name `X` is defined multiple times
}

impl Trait for Struct {
    const X: u32 = 1;
}

fn main() {
    println!("{}", Struct::X);
}

// -------------------------------------------------

struct Struct { }

trait Trait { 
    const X: u32 = 1;
    const X: u32 = 2; // error[E0428]: the name `X` is defined multiple times
}
 
impl Trait for Struct {
}

fn main() {
    println!("{}", Struct::X);
}

// -------------------------------------------------

struct Struct { }

trait Trait { 
    const X: u32 = 1;
    const Y: u32 = X + X; // error[E0425]: cannot find value `X` in this scope
                          // help: you might have meant to use the associated `const`
                          // const Y: u32 = Self::X + X;
}

impl Trait for Struct {
}

fn main() {
    println!("{}", Struct::X);
    println!("{}", Struct::Y);
}

// -------------------------------------------------

struct Struct { }

trait Trait { 
    const X: u32 = 1;
    const Y: u32 = Self::X + Self::X;
}

impl Trait for Struct {
}

fn main() {
    println!("{}", Struct::X);
    println!("{}", Struct::Y);
}

// ----------------------------------------

fn func01() {
    println!("{}", X);
    println!("{}", Y);
}

const X: u32 = 1;

fn main() {
    println!("{}", X);
    println!("{}", Y);
    func01();
    func02();
}

fn func02() {
    println!("{}", X);
    println!("{}", Y);
}

const Y: u32 = 2;

// ----------------------------------------

fn func01() {
    println!("{}", X);
}

const X: u32 = 1;

fn main() {
    println!("{}", X);
    func01();
    func02();
}

fn func02() {
    println!("{}", X);
}

const X: u32 = 2; // error[E0428]: the name `X` is defined multiple times

// ----------------------------------------

fn before_pi() {
    println!("Before Pi: {PI}");
}

use std::f64::consts::PI;

fn after_pi() {
    println!("After Pi: {PI}");
    println!("After E: {E}");
    
    use std::f64::consts::E;
}

fn main() {
    println!("Main: {PI}");
    after_pi();
    before_pi();
}

// ----------------------------------------

fn func() {
    const X: u32 = 54321;
    println!("{}", X);

    let s = Struct { };
    println!("{:?}", s);

    let e = Enum::A;
    println!("{:?}", e);

    let e = Enum::B;
    println!("{:?}", e);

    #[derive(Debug)]
    struct Struct {}

    trait Trait {
        fn g(&self);
    }

    impl Trait for Struct {
        fn g(&self) {}
    }

    #[derive(Debug)]
    enum Enum {
        A,
        B
    }
    
    {
        #[derive(Debug)]
        enum Enum {
            C,
            D
        }

        let e = Enum::C;
        println!("{:?}", e);
    
        let e = Enum::D;
        println!("{:?}", e);

        #[derive(Debug)]
        struct Struct { a: u32 }
        
        let s = Struct { a: 123 };
        println!("{:?}", s);
        
        const X: u32 = 98765;
        println!("{}", X);
    }

    //let e = InnerEnum::A; // error[E0433]: failed to resolve: use of undeclared type `InnerEnum`
}

fn main() {
    func();
}

// ----------------------------------------

fn func() {

    inner();

    fn inner() { }
    
    inner();
}
    
fn main() {
    func();
}

// ----------------------------------------


// ----------------------------------------


// ----------------------------------------
