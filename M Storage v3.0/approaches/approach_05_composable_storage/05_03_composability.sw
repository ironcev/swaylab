// Out of the box composability supported by `std` is achieved by implementing
// the `ComposableStorage` trait.

// NOTE: To get the whole mechanism work, we need the following additional functionality:
//
//   1.) We need to extend our trait function/method
//       resolution to automatically disambiguate no-overlapping trait implementations.
//       This means not giving the existing error:
//          Multiple applicable items in scope. 
//            Disambiguate the associated function for candidate #0
//            ...
//       in cases when trait constraints guarantee unique candidate.
//       Such mechanism is similar to the way C++ searches for the unique candidate ;-)
//
//   2.) We need the no-op implementation of the `cast` method.
//
//   3.) We need support for `&mut T` in const context, in particular as arguments of `const fn`s.
//       We could think here about different interface that does not replace `StorageKey`s in place
//       but creates a copy but this means terrible performance in case of using config functions
//       at run-time. It also gives a less intuitive and more cumbersome to implement interface.

// PROS: - Flexible composability.
//       - Easy to use for `Storage` users.
// CONS: - `StorageKey::FROM_PARENT` looks odd.
//       - Complex to grasp for `Storage` implementators.
//         Might be ok, assuming only advanced users write their own `Storage`s and other just combine them.
//       - Two almost identical implementations of `replace_storage_keys` needed, one for arbitrary
//         `TValue` and one for `ComposableStorage<TEmbeddedStorageElements>`.

pub trait ComposableStorage<TStorageElements>: Storage {
    /// Replaces storage keys in the `elements` based on the `new_self_key` of the `Storage` configured
    /// by `elements`.
    fn replace_storage_keys(new_self_key: StorageKey, elements: &mut TStorageElements);
}

// `std` `Storage` implementations will implement this trait.

// E.g. `StorageBox` that contains anything that is not `ComposableStorage`.
// To configure a `StorageBox` we need just one `StorageElementConfig<StorageBox<TValue>, TValue>`.
impl<TValue> ComposableStorage<StorageElementConfig<Self, TValue>> for StorageBox<TValue> {
    fn replace_storage_keys(new_self_key: StorageKey, elements: &mut StorageElementConfig<Self, TValue>) {
        // `elements` is actually just a single element. 
        elements.storage_key = new_self_key;
    }
}

// A specialized implementation for `TValue` being `ComposableStorage` ensures composability of
// `Storage`s and replacement of keys in the whole graph.

// E.g. `StorageBox` that contains other `ComposableStorage`s.
impl<TValue, TEmbeddedStorageElements> ComposableStorage<StorageElementConfig<Self, TValue>> for StorageBox<TValue>
    where TValue: ComposableStorage<TEmbeddedStorageElements>
{
    fn replace_storage_keys(new_self_key: StorageKey, elements: &mut StorageElementConfig<Self, TValue>) {
        // `elements` is actually just a single element. 
        elements.storage_key = new_self_key;
        // Replace the keys in the embedded `Storage` based on the `new_self_key`.
        ComposableStorage::<TEmbeddedStorageElements>::replace_storage_keys(new_self_key, &mut elements.value);
    }
}

// E.g. `StorageVec` that contains anything that is not `ComposableStorage`.
// To configure a `StorageVec` we need a slice of `StorageElementConfig<StorageVec<TValue>, TValue>`s.
impl<TValue> ComposableStorage<[StorageElementConfig<Self, TValue>]> for StorageVec<TValue> {
    fn replace_storage_keys(new_self_key: StorageKey, elements: &mut [StorageElementConfig<Self, TValue>]) {
        let mut i = 0;
        while i < elements.len() {
            let new_element_key = new_self_key.
                .offset_by(1)
                .offset_by_type::<TValue>(i);

            elements[i].storage_key = new_element_key;

            i += 1;
        }
    }
}

// E.g. `StorageVec` that contains other `ComposableStorage`s.
impl<TValue, TEmbeddedStorageElements> ComposableStorage<[StorageElementConfig<Self, TValue>]> for StorageVec<TValue>
    where TValue: ComposableStorage<TEmbeddedStorageElements>
{
    fn replace_storage_keys(new_self_key: StorageKey, elements: &mut [StorageElementConfig<Self, TValue>]) {
        let mut i = 0;
        while i < elements.len() {
            let new_element_key = new_self_key.
                .offset_by(1)
                .offset_by_type::<TValue>(i);

            elements[i].storage_key = new_element_key;

            ComposableStorage::<TEmbeddedStorageElements>::replace_self_key(new_element_key, &mut storage_config[i].value);

            i += 1;
        }
    }
}

/* Similar for the `StorageMap`. */

// Implementing composability for custom types.

struct MyTwoVecStorage<A, B> {
    a: StorageVec<A>,
    b: StorageVec<B>,
}

// To configure a `MyTwoVecStorage` we need a tuple of two slices of `StorageElementConfig<MyTwoVecStorage<TValue>, TValue>`s.
// Note that we need just one implementation of `ComposableStorage` for `MyTwoVecStorage` without specialization for
// `A` and `B` being `ComposableStorage` because internally we call `StorageVes::replace_storage_keys` which will
// call the appropriate implementation.
impl<A, B> ComposableStorage<([StorageElementConfig<Self, A>], [StorageElementConfig<Self, B>])> for MyTwoVecStorage<A, B> {
    fn replace_storage_keys(new_self_key: StorageKey, elements: &mut ([StorageElementConfig<Self, A>], [StorageElementConfig<Self, B>])) {
        let new_a_key = StorageKey::new(sha256((new_self_key, "a")), 0);
        let new_b_key = StorageKey::new(sha256((new_self_key, "b")), 0);
    
        // Since each tuple element is exactly what `StorageVec` expects as its
        // storage configuration, a slice of `StorageElementConfig` we can just
        // pass the tuple elements to the `StorageVec::replace_storage_keys`.
        // But we need to cast the `Storage` type from `Self` to `StorageVec<A/B>`.
        // In order for mutability in place to work, the `cast` MUST be no-op.
        StorageVec::<A>::replace_storage_keys(new_a_key, &mut elements.0.cast::<StorageVec<A>>());
        StorageVec::<B>::replace_storage_keys(new_b_key, &mut elements.1.cast::<StorageVec<B>>());
    }
}
