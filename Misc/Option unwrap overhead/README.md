# Description

This issue describes how to eliminate `mem_copy_val` calls that are a result of returning aggregates, `u256`, and `b256` from functions. For simplicity, in the remaining test, we just use the term "aggregate" for all mentioned types.

The below analysis is valid for any aggregate and for any chains of method calls where each method in the chain returns an aggregate. `Option<T>` and in particular code constructs like `get_something().unwrap()` are a prominent example of performance issues we have right now in this area. It is used in the examples below only because of that reason. The analysis is otherwise independent of the `Option` type.

The solution for optimizing returning of aggregates can be seen as a part of the current initiative of attributing function arguments. Next to the `mut` attribute currently in development, we can have a `ret` attribute that indicates that the function argument serves exclusively to return a value from a function. A function can have only one `ret` attribute. The fact that such arguments currently always have the same name, `__ret_value`, means we can distinguish them already even without the `ret` attribute. Still, for completeness, having `ret` and basing optimizations on the attribute and not on the special name should be a way to go.

# Current Situation

## When `unwrap` is inlined

The following code snippet:

```sway
library;

use std::address::Address;

fn main() {
    let _ = wrapper();
}

#[inline(never)]
fn return_option() -> Option<Address> {
    None                           <<<<---- Point #1.
}

#[inline(never)]
fn wrapper() -> Address {
    return_option().unwrap()       <<<<---- Point #2.
}
```
will compile in `release` mode to the following IR:

```
fn return_option_5(__ret_value: ptr { u64, ( () | { b256 } ) }) -> ptr { u64, ( () | { b256 } ) }, !31 {
    local { u64, ( () | { b256 } ) } __anon_0

    entry(__ret_value: ptr { u64, ( () | { b256 } ) }):
    v0 = get_local ptr { u64, ( () | { b256 } ) }, __anon_0, !32
    v1 = const u64 0
    v2 = get_elem_ptr v0, ptr u64, v1, !32
    v3 = const u64 0, !32
    store v3 to v2, !32

    // >>>>>>> Point #1 issue ----------------------
    mem_copy_val __ret_value, v0
    // >>>>>>> Point #1 issue ----------------------

    ret ptr { u64, ( () | { b256 } ) } __ret_value
}

fn wrapper_1(__ret_value: ptr { b256 }) -> ptr { b256 }, !8 {
    local mut { u64, ( () | { b256 } ) } __aggr_memcpy_0
    local { u64, ( () | { b256 } ) } __matched_value_4
    local { u64, ( () | { b256 } ) } __ret_val
    local { b256 } inner_value

    entry(__ret_value: ptr { b256 }):
    v0 = get_local ptr { u64, ( () | { b256 } ) }, __ret_val
    v1 = call return_option_5(v0)

    // >>>>>>> Point #2.a issue ----------------------
    v2 = get_local ptr { u64, ( () | { b256 } ) }, __aggr_memcpy_0
    mem_copy_val v2, v1
    v3 = get_local ptr { u64, ( () | { b256 } ) }, __matched_value_4, !13
    mem_copy_val v3, v2
    v4 = get_local ptr { u64, ( () | { b256 } ) }, __aggr_memcpy_0
    // >>>>>>> Point #2.a issue ----------------------

    v5 = const u64 0
    v6 = get_elem_ptr v4, ptr u64, v5
    v7 = load v6, !14
    v8 = const u64 1, !15
    v9 = cmp eq v7 v8, !18
    cbr v9, unwrap_2_block0(), unwrap_2_block1(), !19

    unwrap_2_block0():
    v10 = get_local ptr { u64, ( () | { b256 } ) }, __matched_value_4, !20
    v11 = const u64 1
    v12 = const u64 1
    v13 = get_elem_ptr v10, ptr { b256 }, v11, v12, !14

    // >>>>>>> Point #2.b issue ----------------------
    v14 = get_local ptr { b256 }, inner_value, !22
    mem_copy_val v14, v13
    mem_copy_val __ret_value, v13
    // >>>>>>> Point #2.b issue ----------------------

    ret ptr { b256 } __ret_value

    unwrap_2_block1():
    v15 = const u64 0, !23
    revert v15, !28
}
```

**Point #1 issue** is that the local `__anon_0` is used only to create the returning value and is in the end `mem_cpy_val`ed into `__ret_value`. As such, `__anon_0` is redundant, but is not optimized away.

Optimization would be to calculate the return value by directly using `__ret_value` and, thus, eliminating the `mem_cpy_val` in the end.

In general, if a local is only written to and finally copied to `__ret_value` all the access and writes should be replaced by writing directly to `__ret_value`.

**Point #2.a issue** is that the `__ret_value`, since it is consider to be just a regular pointer that escapes, get's `mem_copy_val`ed into a temporary local `__aggr_memcpy...` which serves as the target/self for the next call. In this case, `unwrap` is inlined, but it's still clear how the return of the `return_option` call gets copied into `__aggr_memcpy_0`:

```
v1 = call return_option_5(v0)
v2 = get_local ptr { u64, ( () | { b256 } ) }, __aggr_memcpy_0
mem_copy_val v2, v1
```

Optimization would be to remove copying the return from the call, `v1`, into `__aggr_memcpy_0` and instead of the `__aggr_memcpy_0` use the original `__ret_value` argument, the `v0` in this case.

**Point #2.b issue** is the same as the _point #1 issue_. The value extracted from the `__matched_value_4` gets `mem_copy_val`ed into `inner_value` just to be copied over again into `__ret_value`. It can immediately be extracted into the `__ret_value`.

## When `unwrap` is not inlined

If we change the `wrapper` in the above example to be, e.g.:

```sway
fn wrapper() -> (Address, Address, Address) {
    (return_option().unwrap(), return_option().unwrap(), return_option().unwrap())
}
```
`unwrap` will not be inlined anymore and the _point 2.a issue_ can be clearly seen in the IR.

```
v0 = get_local ptr { u64, ( () | { b256 } ) }, __ret_val2
v1 = call return_option_5(v0)
v2 = get_local ptr { u64, ( () | { b256 } ) }, __aggr_memcpy_0
mem_copy_val v2, v1
v3 = get_local ptr { u64, ( () | { b256 } ) }, __tmp_arg
mem_copy_val v3, v2
v4 = get_local ptr { b256 }, __ret_val
v5 = call unwrap_2(v3, v4)
```

Result of `return_option` call, `__ret_val2`, gets copied into `__aggr_memcpy_0` then to `__tmp_arg` before being passed to `unwrap` as `self`. Note that we are already optimizing away the last `mem_copy_val` by utilizing the `mut` function argument attribute.

# Improvements

Two improvements are already described above and are based on the analysis respecting the `ret` function argument attribute:
- if a local is only written to and in the end copied into the `ret` argument, replace all the writes into local with writes into `ret` argument and eliminate the copying.
- do not copy return of a function call to a temporary to be used, but use the original `ret` argument directly instead.
