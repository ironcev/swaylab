library;

use std::hash::sha256;
use std::storage::storage_api::{clear, read, write};
use std::tx::tx_id;
use contract_schema::order_book::StorageOrder;

/// A sparse double-ended queue implementation optimized for order storage.
/// Uses sparse storage to efficiently handle order insertion, removal, and traversal.
/// Maintains head/tail pointers and supports O(1) operations at both ends.
pub struct SparseDeque {}

impl StorageKey<SparseDeque> {
    /// Returns the internal storage key containing deque metadata.
    /// Stores (head, tail, len, remainder) as a tuple.
    pub fn internal(self) -> StorageKey<(u64, u64, u64, u64)> {
        StorageKey::new(self.slot(), self.offset(), self.field_id())
    }
    /// Returns the storage key for the head pointer.
    fn head(self) -> StorageKey<u64> {
        StorageKey::new(self.slot(), self.offset() + 0, self.field_id())
    }
    /// Returns the storage key for the tail pointer.
    fn tail(self) -> StorageKey<u64> {
        StorageKey::new(self.slot(), self.offset() + 1, self.field_id())
    }
    /// Returns the storage key for the deque length.
    pub fn len(self) -> StorageKey<u64> {
        StorageKey::new(self.slot(), self.offset() + 2, self.field_id())
    }
    /// Returns the storage key for the remainder of the head.
    pub fn remainder(self) -> StorageKey<u64> {
        StorageKey::new(self.slot(), self.offset() + 3, self.field_id())
    }
    /// Returns the storage key for the next order index counter.
    pub fn order_index(self) -> StorageKey<u64> {
        StorageKey::new(self.slot(), self.offset() + 4, self.field_id())
    }

    /// Generates a unique storage key for an order at the given index.
    /// Uses XOR operations to ensure key uniqueness.
    fn get_key(self, key: u64) -> StorageKey<StorageOrder> {
        let (r0, r1, r2, r3) = asm(slot: self.slot()) {
            slot: (u64, u64, u64, u64)
        };
        let result_1 = key ^ r1 ^ r2 ^ r3;
        let result_2 = r0 ^ key ^ r2 ^ r3;
        let result_3 = r0 ^ r1 ^ key ^ r3;
        let result_4 = r0 ^ r1 ^ r2 ^ key;

        StorageKey::new(
            asm(r0: (result_1, result_2, result_3, result_4)) {
                r0: b256
            },
            self
                .offset(),
            self
                .field_id(),
        )
    }

    /// Checks if the deque is empty.
    ///
    /// # Returns
    ///
    /// * `bool` - True if the deque has no elements, false otherwise
    #[storage(read)]
    pub fn is_empty(self) -> bool {
        self.len().try_read().unwrap_or(0) == 0
    }

    /// Returns the front element of the deque without removing it.
    ///
    /// # Returns
    ///
    /// * `Option<(StorageKey<StorageOrder>, u64)>` - The storage key and index of the front order, or None if empty
    #[storage(read)]
    pub fn front(self) -> Option<(StorageKey<StorageOrder>, u64)> {
        if self.is_empty() {
            None
        } else {
            let head = self.head().try_read().unwrap_or(0);
            Some((self.get_key(head), head))
        }
    }

    /// Returns the back element of the deque without removing it.
    ///
    /// # Returns
    ///
    /// * `Option<StorageKey<StorageOrder>>` - The storage key of the back order, or None if empty
    #[storage(read)]
    pub fn back(self) -> Option<StorageKey<StorageOrder>> {
        if self.is_empty() {
            None
        } else {
            let tail = self.tail().try_read().unwrap_or(0);
            let key = self.get_key(tail);

            match key.try_read() {
                Some(_) => Some(key),
                None => None,
            }
        }
    }

    /// Adds a new order to the back of the deque.
    ///
    /// # Arguments
    ///
    /// * `new_order` - The order to add
    ///
    /// # Returns
    ///
    /// * `u64` - The index assigned to the new order
    #[storage(read, write)]
    pub fn push_back(self, new_order: StorageOrder) -> u64 {
        let mut new_order = new_order;

        let (mut head, mut tail, mut len, remainder) = self.internal().try_read().unwrap_or((0, 0, 0, 0));
        let order_index = self.order_index().try_read().unwrap_or(0);

        // Update the last order
        if len == 0 {
            head = order_index;
        } else {
            // Update the last order to link to this order
            let tail_key = self.get_key(tail);
            let mut prev_order = tail_key.read();

            prev_order.next_order = order_index;
            new_order.prev_order = tail;

            tail_key.write(prev_order);
        }

        self.get_key(order_index).write(new_order);
        self.order_index().write(wrapping_add(order_index, 1));
        self
            .internal()
            .write((head, order_index, len + 1, remainder));

        order_index
    }

    /// Removes and returns the front element of the deque.
    ///
    /// # Returns
    ///
    /// * `Option<StorageOrder>` - The removed order, or None if empty
    #[storage(read, write)]
    pub fn pop_front(self) -> Option<StorageOrder> {
        let (mut head, mut tail, mut len, _) = self.internal().try_read().unwrap_or((0, 0, 0, 0));
        if len == 0 {
            None
        } else {
            let key = self.get_key(head);

            let popped_order = key.read();

            let _ = key.clear();
            self
                .internal()
                .write((popped_order.next_order, tail, len - 1, 0));
            Some(popped_order)
        }
    }

    /// Removes an element without updating deque metadata.
    /// WARNING: Does not update head, tail, or len - use with caution.
    ///
    /// # Arguments
    ///
    /// * `key` - The storage key of the element to remove
    #[storage(write)]
    pub fn unsafe_remove(self, key: StorageKey<StorageOrder>) {
        // Warning: Does not update head, tail, or len
        let _ = key.clear();
    }

    /// Sets the head pointer without validation.
    /// WARNING: Does not update tail, len, or any elements - use with caution.
    ///
    /// # Arguments
    ///
    /// * `new_head` - The new head index
    #[storage(read, write)]
    pub fn unsafe_set_head(self, new_head: u64) {
        // Warning: Does not update tail, len, or any elements
        self.head().write(new_head);
    }

    /// Clears the deque metadata without removing elements.
    /// WARNING: Does not clear any elements - use with caution.
    #[storage(write)]
    pub fn unsafe_clear(self) {
        // Warning: Does not clear any elements
        let _ = self.internal().clear();
    }

    /// Removes a specific element from the deque by its key.
    /// Updates all pointers and maintains deque integrity.
    ///
    /// # Arguments
    ///
    /// * `key` - The index of the element to remove
    ///
    /// # Returns
    ///
    /// * `bool` - True if the element was found and removed, false otherwise
    #[storage(read, write)]
    pub fn remove(self, key: u64) -> bool {
        let slot = self.get_key(key);
        let remove_order = match slot.try_read() {
            None => return false,
            Some(order) => order,
        };

        let (mut head, mut tail, len, mut remainder) = self.internal().read();

        // There is only one element in the list
        if key == head && key == tail {
            let _ = slot.clear();
            let _ = self.internal().clear();
            return true;
        }

        if key == head {
            // Front
            head = remove_order.next_order;
            remainder = 0;
        } else if key == tail {
            // End
            tail = remove_order.prev_order;
        } else {
            // Middle
            let prev_slot = self.get_key(remove_order.prev_order);
            let next_slot = self.get_key(remove_order.next_order);
            let mut next_order = next_slot.read();
            let mut prev_order = prev_slot.read();

            next_order.prev_order = remove_order.prev_order;
            prev_order.next_order = remove_order.next_order;
            prev_slot.write(prev_order);
            next_slot.write(next_order);
        }

        self.internal().write((head, tail, len - 1, remainder));
        let _ = slot.clear();
        true
    }

    /// Gets an order by its key without removing it.
    ///
    /// # Arguments
    ///
    /// * `key` - The index of the order to retrieve
    ///
    /// # Returns
    ///
    /// * `Option<StorageOrder>` - The order if it exists, None otherwise
    #[storage(read)]
    pub fn get(self, key: u64) -> Option<StorageOrder> {
        self.get_key(key).try_read()
    }

    /// Returns the raw head index without validation.
    /// WARNING: May return invalid index if deque is empty.
    ///
    /// # Returns
    ///
    /// * `u64` - The current head index
    #[storage(read)]
    pub fn unsafe_get_head_index(self) -> u64 {
        self.head().read()
    }

    /// Gets both the storage key and order without validation.
    /// WARNING: Will panic if the key doesn't exist.
    ///
    /// # Arguments
    ///
    /// * `key` - The index of the order
    ///
    /// # Returns
    ///
    /// * `(StorageKey<StorageOrder>, StorageOrder)` - The storage key and order
    #[storage(read)]
    pub fn unsafe_get(self, key: u64) -> (StorageKey<StorageOrder>, StorageOrder) {
        let slot = self.get_key(key);
        (slot, slot.read())
    }

    /// Directly writes the length without validation.
    /// WARNING: Can corrupt deque state if used incorrectly.
    ///
    /// # Arguments
    ///
    /// * `len` - The new length value
    #[storage(write)]
    pub fn unsafe_write_len(self, len: u64) {
        self.len().write(len);
    }

    /// Directly writes the remainder without validation.
    /// Does not have any impact on the structure of the dequeue.
    #[storage(write)]
    pub fn unsafe_write_remainder(self, remainder: u64) {
        self.remainder().write(remainder)
    }

    /// Directly reads the remainder without validation.
    /// Does not have any impact on the structure of the dequeue.
    #[storage(read)]
    pub fn unsafe_read_remainder(self) -> u64 {
        self.remainder().read()
    }

    /// Returns the raw internal metadata tuple.
    /// WARNING: Exposes internal implementation details.
    ///
    /// # Returns
    ///
    /// * `(u64, u64, u64, u64)` - (head, tail, len, remainder)
    #[storage(read)]
    pub fn unsafe_get_internal(self) -> (u64, u64, u64, u64) {
        self.internal().read()
    }

    #[storage(read)]
    pub fn get_internal(self) -> Option<(u64, u64, u64, u64)> {
        self.internal().try_read()
    }
}

/// Performs wrapping addition of two u64 values.
/// Temporarily disables overflow checking to allow wrapping behavior.
///
/// # Arguments
///
/// * `a` - First operand
/// * `b` - Second operand
///
/// # Returns
///
/// * `u64` - The wrapped sum
fn wrapping_add(a: u64, b: u64) -> u64 {
    use std::flags::F_WRAPPING_DISABLE_MASK;
    let flags = asm() {
        flag
    };

    // Get the current value of the flags register and mask it, setting the
    // masked bit. Flags are inverted, so set = off.
    asm(flag_val: __or(flags, F_WRAPPING_DISABLE_MASK)) {
        flag flag_val;
    }

    let res = a + b;

    asm(new_flags: flags) {
        flag new_flags;
    }
    res
}
