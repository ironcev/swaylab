script;

trait MyTrait1 {
    fn foo();
}

fn bar<T>() -> Option<T> where T: MyTrait1 {
    None
}

fn main(){
    let x: Option<u32> = bar();
    let x = bar::<Option<u32>>();
}
