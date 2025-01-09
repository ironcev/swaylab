script;

fn foo<T>() {
    let o: Option<u64> = None;
    let _ = o.is_none();
    
    let o: Option<Option<u64>> = None;
    let _ = o.is_none();

    let o: Option<T> = None;
    let _ = o.is_none();
    
    let o: Option<Option<T>> = None;
    // let _ = o.is_none();
    //           ^^^^^^^ No method "is_none(Option<Option<T>>)" found for type "Option<Option<T>>".
    
    let _ = Option::is_none(o);
}

struct S<T> { }

impl<T> S<T> {
    fn foo() {
        let o: Option<u64> = None;
        let _ = o.is_none();
        
        let o: Option<Option<u64>> = None;
        let _ = o.is_none();
    
        let o: Option<T> = None;
        let _ = o.is_none();
        
        let o: Option<Option<T>> = None;
        // let _ = o.is_none();
        //           ^^^^^^^ No method "is_none(Option<Option<T>>)" found for type "Option<Option<T>>".
        
        let _ = Option::is_none(o);
    }
}

fn main() {
    foo::<(())>();
    S::<()>::foo();
}