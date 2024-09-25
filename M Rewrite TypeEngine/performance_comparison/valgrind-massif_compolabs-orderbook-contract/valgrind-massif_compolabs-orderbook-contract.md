# Valgrind Massif Measurements for `compolabs-orderbook-contract`

```
valgrind --tool=massif ~/p/sway/target/release/forc check -p ~/p/compolabs-orderbook-contract/

ms_print massif.out.XX > massif.out.print.txt

massif-visualizer massif.out.XX
```

## Heap Consumption Peak

Optimization steps:
- Step #1: Add `id_of_<build-in type>` and `new_<replacable type>[_<options>]` methods.
- Step #2: Add singleton instances for `TypeInfo::Unknown` and `TypeInfo::Numeric`.
- Step #3: Implement `is_changeable_type` for `TypeInfo::Enum` and `TypeInfo::Struct` and remove `TypeInfo` cloning.
- Step #4: Implement zero-heap-allocations hashing and store `Arc<TypeSourceInfo>` in the `unchangeable_type_ids` map.

---------------------------------------------------------
                total(B)   useful-heap(B)   extra-heap(B)
---------------------------------------------------------
Baseline   3,316,786,808    3,237,317,383      79,469,425
Step #1                -                -               -
Step #2    1,868,308,912    1,821,693,359      46,615,553
Step #3    1,807,369,288    1,765,375,111      41,994,177
Step #4    1,803,850,664    1,761,965,505      41,885,159

