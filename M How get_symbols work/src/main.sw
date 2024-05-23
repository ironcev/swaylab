script;

struct S {
    x: u64,
}

#[inline(never)]
fn get_local_symbol() {
    let _s = S { x: 112233 };
}

#[inline(never)]
fn get_local_symbol_with_branching(i: u64) {
    let _s = match i {
        1 => S { x: 11 },
        _ => S { x: 112233 },
    };
}

#[inline(never)]
fn get_local_symbol_over_reference() {
    let mut x = 112233;
    let r_x = &mut x;
    *r_x = 332211;
}

#[inline(never)]
fn pass_ref_back(r: &mut u64) -> &mut u64 { r }

#[inline(never)]
fn get_local_symbol_incomplete() {
    let mut x = 112233;
    *pass_ref_back(&mut x) = 332211;
}

fn main() {
    get_local_symbol();
    get_local_symbol_with_branching(0);
    get_local_symbol_over_reference();
    get_local_symbol_incomplete();
}

/*

fn get_local_symbol_1() -> (), !11 {
    local { u64 } __anon_0
    local mut { u64 } _s

    entry():
    v0 = get_local ptr { u64 }, __anon_0, !12
    v1 = const u64 0
    v2 = get_elem_ptr v0, ptr u64, v1
    v3 = const u64 112233, !13
    store v3 to v2, !12
    v4 = load v0
    v5 = get_local ptr { u64 }, _s, !14
    store v4 to v5, !14
    v6 = const unit ()
    ret () v6
}

fn get_local_symbol_with_branching_2(i !17: u64) -> (), !19 {
    local { u64 } __anon_0
    local { u64 } __anon_1
    local u64 __matched_value_1
    local { u64 } _s

    entry(i: u64):
    v0 = get_local ptr u64, __matched_value_1, !20
    store i to v0, !20
    v1 = get_local ptr u64, __matched_value_1, !21
    v2 = load v1
    v3 = const u64 1, !22
    v4 = call eq_3(v2, v3), !23
    cbr v4, block0(), block1(), !23

    block0():
    v5 = get_local ptr { u64 }, __anon_0, !24
    v6 = const u64 0
    v7 = get_elem_ptr v5, ptr u64, v6
    v8 = const u64 11, !25
    store v8 to v7, !24
    v9 = load v5
    br block2(v9)

    block1():
    v10 = get_local ptr { u64 }, __anon_1, !26
    v11 = const u64 0
    v12 = get_elem_ptr v10, ptr u64, v11
    v13 = const u64 112233, !27
    store v13 to v12, !26
    v14 = load v10
    br block2(v14)

    block2(v15: { u64 }):
    v16 = get_local ptr { u64 }, _s, !28
    store v15 to v16, !28
    v17 = const unit ()
    ret () v17
}

fn get_local_symbol_over_reference_4() -> (), !35 {
    local u64 r_x
    local mut u64 x

    entry():
    v0 = get_local ptr u64, x, !36
    v1 = const u64 112233, !37
    store v1 to v0, !36
    v2 = get_local ptr u64, x, !38
    v3 = ptr_to_int v2 to u64, !39
    v4 = get_local ptr u64, r_x, !40
    store v3 to v4, !40
    v5 = get_local ptr u64, r_x, !41
    v6 = load v5
    v7 = int_to_ptr v6 to ptr u64, !42
    v8 = const u64 332211, !43
    store v8 to v7, !42
    v9 = const unit ()
    ret () v9
}

fn get_local_symbol_incomplete_5() -> (), !46 {
    local mut u64 x

    entry():
    v0 = get_local ptr u64, x, !47
    v1 = const u64 112233, !48
    store v1 to v0, !47
    v2 = get_local ptr u64, x, !49
    v3 = ptr_to_int v2 to u64, !50
    v4 = call pass_ref_back_6(v3), !51
    v5 = int_to_ptr v4 to ptr u64, !52
    v6 = const u64 332211, !53
    store v6 to v5, !52
    v7 = const unit ()
    ret () v7
}

*/

/*
For the sake of illustration of the `get_symbols` algorithm, in below examples, we discuss the initial, unoptimized IR code.
Also, only the relevant part of the IR is shown.

This function:
```
fn get_local_symbol() {
    let s = S { x: 12233 };
}
```
will produce the following IR:
```
local { u64 } __anon_0
local mut { u64 } s

entry():
v0 = get_local ptr { u64 }, __anon_0, !12
v1 = const u64 0
v2 = get_elem_ptr v0, ptr u64, v1
v3 = const u64 12233, !13
store v3 to v2, !12
...
```

Let's say we want to know if the `v2` in the final `store` is coming from some symbol, where a symbol is either a local variable or a function argument.

To answer that question, we need to follow `v2` up the instruction chain to see where it comes from. Following it up will lead to:
```
v2 -> v0 -> __anon_0
```

So we say that `v2` _referrs_ to `__anon_0`.

Note that in this case, the instruction chain contained only the GEP (Get Element Pointer) instructions:
```
v2 -> [get_elem_ptr] -> v0 -> [get_local] -> __anon_0
```

In case of a branching, a certain value can refer to several symbols. E.g.,:

```
fn get_local_symbol_with_branching(i: u64) {
    let s = match i {
        1 => S { x: 11 },
        _ => S { x: 112233 },
    };
}
```
will produce:
```
local { u64 } __anon_0
local { u64 } __anon_1
...

entry(i: u64):
...
cbr v4, block0(), block1(), !23

block0():
v5 = get_local ptr { u64 }, __anon_0, !24
v6 = const u64 0
v7 = get_elem_ptr v5, ptr u64, v6
v8 = const u64 11, !25
store v8 to v7, !24
v9 = load v5
br block2(v9)

block1():
v10 = get_local ptr { u64 }, __anon_1, !26
v11 = const u64 0
v12 = get_elem_ptr v10, ptr u64, v11
v13 = const u64 112233, !27
store v13 to v12, !26
v14 = load v10
br block2(v14)

block2(v15: { u64 }):
v16 = get_local ptr { u64 }, s, !28
store v15 to v16, !28
...
```

This time, let's follow `v15` in the final `store`. We see that `v15` is the `block2` argument, which means we need to follow all the paths that lead to `block2`:
```
       -> v14 -> v10 -> __anon_1
      /
v15 --
      \
       -> v9 -> v5 -> __anon_0
```

Similar examples can be done when the target symbols are function arguments.

What happens if we have raw pointers and references? In the following example, we use references, but the approach applies for pointers as well.

```
fn get_local_symbol_over_reference() {
    let mut x = 112233;
    let r_x = &mut x;
    *r_x = 332211;
}
```

Obviously, we store `332211` into `x`, but the path between the `store` and `x` in IR will be more complicated now and contain not only the GEP instructions.
Partially, this is to the nature of the indirection, and partially because we currently store references and raw pointers as `u64` in IR, thus, the additional need for conversions between the `ptr` and `u64`.

```
local u64 r_x
local mut u64 x

entry():
...
v3 = ptr_to_int v2 to u64, !39
v4 = get_local ptr u64, r_x, !40
store v3 to v4, !40
v5 = get_local ptr u64, r_x, !41
v6 = load v5
v7 = int_to_ptr v6 to ptr u64, !42
v8 = const u64 332211, !43
store v8 to v7, !42
...
```

If we follow the `v7` in the final `store` we come to the following chain:
```
v7 -> v6 -> v5 -> r_x
```

The instructions are in this case not only the GEP instructions:
```
v7 -> [int_to_ptr] -> v6 -> [load] -> v5 -> [get_local_ptr] -> r_x
```

This is the bug that Vaivas has found. Currently we collect `r_x` although it is just a level of indirection. We actually want to see where `r_x`'s value is coming from.

Still, the fact that we've found a referred symbol will stop existing optimizations from, e.g., removing that `store`.

To conclude the presented so far, `get_symbols` follow the specific instruction chains to find referred symbols. Why are there two separate paths, GEP only and GEP plus oter instructions?
We have optimizations like, e.g., SROA that are interested only in symbols that can be reached over GEPs.

One more important aspect to consider is the completeness of the result.

In all of the examples above, the final result will consider to be `Complete` denoting that all the symbols are surely found and collected.

There are cases where we cannot guarantee that certain local symbols are _not_ referred because we cannot follow the complete chain back to the source of the value.
This can be in case of, e.g., function calls or using raw pointers arithmetics, etc.

Consider the following example:

```
fn pass_ref_back(r: &mut u64) -> &mut u64 { r }

fn get_local_symbol_incomplete() {
    let mut x = 112233;
    *pass_ref_back(&mut x) = 332211;
}
```

```
...
v4 = call pass_ref_back_6(v3), !51
v5 = int_to_ptr v4 to ptr u64, !52
v6 = const u64 332211, !53
store v6 to v5, !52
```

If we follow `v5` in the final `store`:
```
v5 -> v4 -> [call pass_ref_back]
```

Essentially, at this point we don't know anything about the source of `v4`. It could be some local symbol like in this example, or anything else.

So when returning all the collected symbols (non in this example, but we can construct an example with branching in which some of the branches will return symbols) we pass the initial information that the collection is `Incomplete` signaling that there _might_ be additional symbols reffered by `v5`.
*/