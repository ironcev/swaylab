fn main() {
    let t = (1, 2, 3);
 
    let r = &&&&&t;
    
    let x = r.1;
    
    print!("{x}");
}
