use std::vec;

#[derive(Default)]
pub struct Storage {
    pub fields: Vec<StorageField>,
    pub namespaces: Vec<StorageNamespace>,
}

#[derive(Default)]
pub struct StorageField {
    pub name: String,
    pub has_in_keyword: bool,
}

#[derive(Default)]
pub struct StorageNamespace {
    pub fields: Vec<StorageField>,
    pub namespaces: Vec<StorageNamespace>,
}

impl Storage {
    pub fn sample() -> Self {
        Storage {
            fields: vec![
                StorageField {
                    name: "Has in keyword 1".to_string(),
                    has_in_keyword: true,
                },
                StorageField {
                    name: "No in keyword 1".to_string(),
                    has_in_keyword: false,
                },
            ],
            namespaces: vec![
                StorageNamespace {
                    fields: vec![
                        StorageField {
                            name: "Has in keyword 2".to_string(),
                            has_in_keyword: true,
                        },
                        StorageField {
                            name: "No in keyword 2".to_string(),
                            has_in_keyword: false,
                        },
                    ],
                    namespaces: vec![],
                },
                StorageNamespace {
                    fields: vec![
                        StorageField {
                            name: "Has in keyword 3".to_string(),
                            has_in_keyword: true,
                        },
                        StorageField {
                            name: "No in keyword 3".to_string(),
                            has_in_keyword: false,
                        },
                    ],
                    namespaces: vec![],
                },
            ],
        }
    }
}

pub fn print_storage_fields<'a>(caption: &str, fields: &mut impl Iterator<Item=&'a StorageField>) {
    println!("{caption}:");
    for field in fields {
        println!("  {}", field.name)
    }
}