library;

use ::heap::*;
use std::storage::storage_vec::*;
use std::hash::{Hash, Hasher, sha256};

/// Finds the position of the least significant set bit in a 256-bit value.
/// Returns the 0-based index from the right.
///
/// # Arguments
///
/// * `bits` - The 256-bit value to search
///
/// # Returns
///
/// * `u8` - Position of the least significant 1-bit (0-255)
fn least_significant_one(bits: b256) -> u8 {
    use std::flags::{disable_panic_on_overflow, set_flags};
    let val = u256::from(bits);

    let flags = disable_panic_on_overflow();
    let lsb = val & (u256::zero() - val);
    set_flags(flags);

    u8::try_from(lsb.log2()).unwrap()
}

/// Finds the position of the most significant set bit in a 256-bit value.
/// Returns the 0-based index from the right.
///
/// # Arguments
///
/// * `bits` - The 256-bit value to search
///
/// # Returns
///
/// * `u8` - Position of the most significant 1-bit (0-255)
fn most_significant_one(bits: b256) -> u8 {
    u8::try_from(u256::from(bits).log2()).unwrap()
}

/// A 56-bit unsigned integer type used for efficient price prefix storage.
/// Splits a 64-bit price into a 56-bit prefix and 8-bit suffix for bitmap optimization.
struct U56 {
    pub a: u32,
    pub b: u16,
    pub c: u8,
}

impl Ord for U56 {
    fn gt(self, other: Self) -> bool {
        self.a > other.a || (self.a == other.a && self.b > other.b) || (self.a == other.a && self.b == other.b && self.c > other.c)
    }

    fn lt(self, other: Self) -> bool {
        self.a < other.a || (self.a == other.a && self.b < other.b) || (self.a == other.a && self.b == other.b && self.c < other.c)
    }
}

impl Hash for U56 {
    fn hash(self, ref mut state: Hasher) {
        let temp = (u64::from(self.a) << 24) | (u64::from(self.b) << 8) | u64::from(self.c);
        let ptr = asm(ptr: &temp) {
            ptr: raw_ptr
        };
        state.write_raw_slice(raw_slice::from_parts::<u8>(ptr, 8));
    }
}

impl PartialEq for U56 {
    fn eq(self, other: Self) -> bool {
        self.a == other.a && self.b == other.b && self.c == other.c
    }
}
impl Eq for U56 {}

/// Splits a 64-bit price into tree components for bitmap storage.
/// The price is divided into a 56-bit prefix and 8-bit suffix.
///
/// # Arguments
///
/// * `price` - The full 64-bit price value
///
/// # Returns
///
/// * `(U56, u8)` - Tuple of (56-bit prefix, 8-bit suffix)
fn to_tree_parts(price: u64) -> (U56, u8) {
    let prefix = U56 {
        a: u32::try_from(price >> 32).unwrap(),
        b: u16::try_from((price >> 16) & 0xFFFF).unwrap(),
        c: u8::try_from((price >> 8) & 0xFF).unwrap(),
    };
    let suffix = u8::try_from(price & 0xFF).unwrap();
    (prefix, suffix)
}

/// Reconstructs a 64-bit price from its tree components.
/// Combines a 56-bit prefix and 8-bit suffix back into the original price.
///
/// # Arguments
///
/// * `prefix` - The 56-bit prefix portion
/// * `suffix` - The 8-bit suffix portion
///
/// # Returns
///
/// * `u64` - The reconstructed 64-bit price
fn from_tree_parts(prefix: U56, suffix: u8) -> u64 {
    (u64::from(prefix.a) << 32) | (u64::from(prefix.b) << 16) | (u64::from(prefix.c) << 8) | u64::from(suffix)
}

#[test]
fn test_u56() {
    let price = 0x11_11_11_11_22_22_33_44;
    let (prefix, suffix) = to_tree_parts(price);
    assert_eq(prefix.a, 0x11_11_11_11);
    assert_eq(prefix.b, 0x22_22);
    assert_eq(prefix.c, 0x33);
    assert_eq(suffix, 0x44);
    let output = from_tree_parts(prefix, suffix);
    assert_eq(output, price);

    let alt = U56 {
        a: 0x11_11_11_11,
        b: 0x22_22,
        c: 0x33,
    };
    assert_eq(prefix, alt);

    assert(
        U56 {
            a: 0x11_11_11_11,
            b: 0x22_22,
            c: 0x34,
        } > U56 {
            a: 0x11_11_11_11,
            b: 0x22_22,
            c: 0x33,
        },
    );
    assert(
        U56 {
            a: 0x11_11_11_11,
            b: 0x22_22,
            c: 0x33,
        } < U56 {
            a: 0x11_11_11_11,
            b: 0x22_22,
            c: 0x34,
        },
    );
    assert(
        U56 {
            a: 0x11_11_11_11,
            b: 0x22_23,
            c: 0x33,
        } > U56 {
            a: 0x11_11_11_11,
            b: 0x22_22,
            c: 0x33,
        },
    );
    assert(
        U56 {
            a: 0x11_11_11_11,
            b: 0x22_22,
            c: 0x33,
        } < U56 {
            a: 0x11_11_11_11,
            b: 0x22_23,
            c: 0x33,
        },
    );
    assert(
        U56 {
            a: 0x11_11_11_12,
            b: 0x22_22,
            c: 0x33,
        } > U56 {
            a: 0x11_11_11_11,
            b: 0x22_22,
            c: 0x33,
        },
    );
    assert(
        U56 {
            a: 0x11_11_11_11,
            b: 0x22_22,
            c: 0x33,
        } < U56 {
            a: 0x11_11_11_12,
            b: 0x22_22,
            c: 0x33,
        },
    );
}

pub struct SellBitMap {}

impl StorageKey<SellBitMap> {
    /// Returns the storage key for the underlying bitmap mapping.
    fn map(self) -> StorageKey<StorageMap<U56, b256>> {
        StorageKey::new(self.slot(), self.offset(), sha256((self.field_id(), 0)))
    }
    /// Returns the storage key for the min-heap of price prefixes.
    fn heap(self) -> StorageKey<MinHeap<U56>> {
        StorageKey::new(self.slot(), self.offset(), sha256((self.field_id(), 1)))
    }

    /// Checks if a specific price level has active sell orders.
    ///
    /// # Arguments
    ///
    /// * `price` - The price level to check
    ///
    /// # Returns
    ///
    /// * `bool` - True if there are sell orders at this price, false otherwise
    #[storage(read)]
    pub fn has(self, price: u64) -> bool {
        let (prefix, suffix) = to_tree_parts(price);

        match self.map().get(prefix).try_read() {
            None => false,
            Some(bitmap) => ((bitmap >> u64::from(suffix)) & b256::from(1)) != b256::from(0),
        }
    }

    #[storage(read, write)]
    pub fn set(self, price: u64) {
        let (prefix, suffix) = to_tree_parts(price);

        match self.map().get(prefix).try_read() {
            None => {
                self.heap().push(prefix);
                self
                    .map()
                    .insert(prefix, b256::from(1) << u64::from(suffix));
            }
            Some(bitmap) => {
                let res = bitmap | (b256::from(1) << u64::from(suffix));
                self.map().insert(prefix, res);
            }
        }
    }

    #[storage(read, write)]
    pub fn unset(self, price: u64) {
        let (prefix, suffix) = to_tree_parts(price);

        match self.map().get(prefix).try_read() {
            None => {}

            Some(bitmap) => {
                let res = bitmap & !(b256::from(1) << u64::from(suffix));

                if res == b256::from(0) {
                    let _ = self.map().remove(prefix);
                    let _ = self.heap().remove(prefix);
                } else {
                    self.map().insert(prefix, res);
                }
            }
        }
    }

    #[storage(read)]
    pub fn min(self) -> Option<u64> {
        let prefix = match self.heap().peek() {
            None => return None,
            Some(p) => p,
        };

        if let Some(bitmap) = self.map().get(prefix).try_read() {
            if bitmap == b256::zero() {
                return None;
            }
            let suffix = least_significant_one(bitmap);
            let res = from_tree_parts(prefix, suffix);
            return Some(res);
        }

        None
    }
}

pub struct BuyBitMap {}

impl StorageKey<BuyBitMap> {
    fn map(self) -> StorageKey<StorageMap<U56, b256>> {
        StorageKey::new(self.slot(), self.offset(), sha256((self.field_id(), 0)))
    }
    fn heap(self) -> StorageKey<MaxHeap<U56>> {
        StorageKey::new(self.slot(), self.offset(), sha256((self.field_id(), 1)))
    }

    #[storage(read)]
    pub fn has(self, price: u64) -> bool {
        let (prefix, suffix) = to_tree_parts(price);

        match self.map().get(prefix).try_read() {
            None => false,
            Some(bitmap) => ((bitmap >> u64::from(suffix)) & b256::from(1)) != b256::from(0),
        }
    }

    #[storage(read, write)]
    pub fn set(self, price: u64) {
        let (prefix, suffix) = to_tree_parts(price);

        match self.map().get(prefix).try_read() {
            None => {
                self.heap().push(prefix);
                self
                    .map()
                    .insert(prefix, b256::from(1) << u64::from(suffix));
            }
            Some(bitmap) => {
                let res = bitmap | (b256::from(1) << u64::from(suffix));
                self.map().insert(prefix, res);
            }
        }
    }
    #[storage(read, write)]
    pub fn unset(self, price: u64) {
        let (prefix, suffix) = to_tree_parts(price);

        match self.map().get(prefix).try_read() {
            None => {}

            Some(bitmap) => {
                let res = bitmap & !(b256::from(1) << u64::from(suffix));

                if res == b256::from(0) {
                    let _ = self.map().remove(prefix);
                    let _ = self.heap().remove(prefix);
                } else {
                    self.map().insert(prefix, res);
                }
            }
        }
    }

    #[storage(read)]
    pub fn max(self) -> Option<u64> {
        let prefix = match self.heap().peek() {
            None => return None,
            Some(p) => p,
        };

        if let Some(bitmap) = self.map().get(prefix).try_read() {
            if bitmap == b256::zero() {
                return None;
            }
            let suffix = most_significant_one(bitmap);
            let res = from_tree_parts(prefix, suffix);
            return Some(res);
        }

        None
    }
}
