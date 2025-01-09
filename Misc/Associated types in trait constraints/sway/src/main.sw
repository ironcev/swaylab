library;

use std::iterator::Iterator;

fn iterate<I, T>(collection: I) where I: Iterator<Item=T> { }
//                                                    ^ Expected `,`.

trait T {
    type AT;
}

struct S { }

impl T for S {
    type AT = u8;
}

fn consume_t_1<A>(t: A) where A: T {}

fn consume_t_2<A>(t: A) where A: T<AT=u64> {}
//                                   ^ Expected `,`.