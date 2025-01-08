script;

trait Hash {}

fn main() {
    let _ = std::hash::sha256(123u8);
}

// warning
//  --> /home/igor/p/swaylab/I 5129 Provide temporary fix for the Cannot find trait Hash in this scope issue/sway/play04/src/main.sw:3:7
//   |
// 1 | 
// 2 | 
// 3 | trait Hash {}
//   |       ---- This trait is never implemented.
// 4 | 
// 5 | fn main() {
//   |
// ____

// error
//   --> /home/igor/.forc/git/checkouts/std-9be0d6062747ea7/34265301c6037d51444899a99df1cfc563df6016/sway-lsp/tests/fixtures/fixtures-std/src/hash.sw:67:8
//    |
// 65 | 
// 66 | pub trait Hash {
// 67 |     fn hash(self, ref mut state: Hasher);
//    |        ^^^^ Internal compiler error: Method hash_5 is a trait method dummy and was not properly replaced.
// Please file an issue on the repository and include the code that triggered this error.
// 68 | }
//    |
// ____

