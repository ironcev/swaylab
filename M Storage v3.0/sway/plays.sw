script;

trait A { }

trait B { }

struct S { }

trait TraitX<T> {
    fn fun_x(t: T);
    fn method_x(self, t: T);
}

impl<T> TraitX<T> for S
    where T: A
{
    fn fun_x(t: T) {
        log("fun_x for T:A");
    }
    
    fn method_x(self, t: T) {
        log("method_x for T:A");
    }
}

impl<T> TraitX<T> for S
    where T: B
{
    fn fun_x(t: T) {
        log("fun_x for T:B");
    }
    
    fn method_x(self, t: T) {
        log("method_x for T:B");
    }
}

struct SA { }
struct SB { }
struct SAB { }

impl A for SA { }
impl B for SB { }

impl A for SAB { }
impl B for SAB { }


fn main() {
    S::fun_x(A { });
    S::fun_x(B { });
}


error

  
// -->
//  main.sw:51:8
//    |
// 49 |
// 50 | S::fun_x(A { });
// 51 | S::fun_x(B { });
//    |    ^^^^^
// Multiple applicable items in scope. 
//   Disambiguate the associated function for candidate #0
//     <S as TraitX<T>>::fun_x
//   Disambiguate the associated function for candidate #1
//     <S as TraitX<T>>::fun_x
// 
// 52 | }
//    |
