use crate::structure::*;

fn storage_fields<P>(storage: &Storage, predicate: P) -> impl Iterator<Item=&StorageField>
where P: Fn(&&StorageField) -> bool + Clone {
    storage
        .fields
        .iter()
        .filter(predicate.clone())
        .chain(
            storage
                .namespaces
                .iter()
                .flat_map(|ns| &ns.fields)
                .filter(predicate)
        )
}

pub fn play() {
    let storage = Storage::sample();
    let mut fields = storage_fields(&storage, |sf| sf.has_in_keyword);
    print_storage_fields("Has in keyword", &mut fields);
    let mut fields = storage_fields(&storage, with_in_keyword);
    print_storage_fields("With in keyword", &mut fields);
    let mut fields = storage_fields(&storage, with_in_keyword);
    print_storage_fields("With in keyword", &mut fields);
    let mut fields = storage_fields(&storage, any);
    print_storage_fields("Any", &mut fields);
    let mut fields = storage_fields(&storage, any);
    print_storage_fields("Any", &mut fields);
    let should_have_in_keyword = true;
    let mut fields = storage_fields(&storage, |sf| sf.has_in_keyword == should_have_in_keyword);
    print_storage_fields("Should have in keyword", &mut fields);
}

fn with_in_keyword(sf: &&StorageField) -> bool {
    sf.has_in_keyword
}

fn any<T>(_t: &&T) -> bool {
    true
}
