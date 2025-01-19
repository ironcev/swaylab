use crate::structure::*;

fn storage_fields<'a, P>(storage: &'a Storage, predicate: P) -> impl Iterator<Item=&'a StorageField>
where P: Fn(&StorageField) -> bool + Clone + 'a {
    storage.fields.iter().filter(move |x| predicate(x))
    // Hmmmm. How to reuse the `predicate`...
}

pub fn play() {
    let storage = Storage::default();
    let _= storage_fields(&storage, |sf| sf.has_in_keyword);
    let _= storage_fields(&storage, with_in_keyword);
    let _= storage_fields(&storage, any);
}

fn with_in_keyword(sf: &StorageField) -> bool {
    sf.has_in_keyword
}

fn any<T>(_t: &T) -> bool {
    true
}
