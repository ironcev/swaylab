// Q: Clash of `new(&self_key) -> Self` and `new(self_key) -> StorageConfig<...>`.
//    Inconvenience. It can still be resolved via type system and inference.
//    Possibility is to have different, semantic names for config `new`. E.g., `empty` for `StorageVec`. Not ideal.  