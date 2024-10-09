# Performance Comparison

Project: [compolabs-orderbook-contract](/home/kebradalaonda/p/compolabs-orderbook-contract)
Commit:  Succeed test & failed deployment (SHA: 03e491f055d314f1facdb42d14f0064959775b14)

~/p/sway$ cargo run --release --bin forc -- build --release -p ~/p/compolabs-orderbook-contract/

## Optimization Steps

Step #1: Add `id_of_<build-in type>` and `new_<replacable type>[_<options>]` methods.

Step #2: Add singleton instances for `TypeInfo::Unknown` and `TypeInfo::Numeric`.

Step #3: Implement `is_changeable_type` for `TypeInfo::Enum` and `TypeInfo::Struct` and remove `TypeInfo` cloning.

Step #4: Implement zero-heap-allocations hashing and store `Arc<TypeSourceInfo>` in the `unchangeable_type_ids` map.

Step #5: Implement `insert_<type>` for all types except `TypeInfo::Custom` and `TypeInfo::TraitType`.

Step #6: Reuse shareable types when `replace()`ing replaceable types.

