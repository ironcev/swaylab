library;

use std::ops::Ord;
use std::storage::storage_vec::*;

pub struct MaxHeap<T> {}

impl<T> StorageKey<MaxHeap<T>>
where
    T: Ord + PartialEq,
{
    /// Converts the heap storage key to a vector storage key.
    fn as_vec(self) -> StorageKey<StorageVec<T>> {
        StorageKey::<StorageVec<T>>::new(self.slot(), self.offset(), self.field_id())
    }

    // Get the size of the heap
    #[storage(read)]
    pub fn len(self) -> u64 {
        let data = self.as_vec();
        data.len()
    }

    // Check if heap is empty
    #[storage(read)]
    pub fn is_empty(self) -> bool {
        let data = self.as_vec();
        data.is_empty()
    }

    // Get parent index
    fn parent(self, index: u64) -> u64 {
        (index - 1) / 2
    }

    // Get left child index
    fn left_child(self, index: u64) -> u64 {
        2 * index + 1
    }

    // Get right child index
    fn right_child(self, index: u64) -> u64 {
        2 * index + 2
    }

    // Push a new element into the heap
    #[storage(read, write)]
    pub fn push(self, value: T) {
        let data = self.as_vec();
        data.push(value);
        self.sift_up(data.len() - 1);
    }

    // Sift up to maintain heap property
    #[storage(read, write)]
    fn sift_up(self, index: u64) {
        let data = self.as_vec();
        let mut current = index;
        while current > 0 {
            let parent = self.parent(current);
            if data.get(current).unwrap().read() > data.get(parent).unwrap().read()
            {
                data.swap(current, parent);
                current = parent;
            } else {
                break;
            }
        }
    }

    // Pop the maximum element from the heap
    #[storage(read, write)]
    pub fn pop(self) -> Option<T> {
        if self.is_empty() {
            return None;
        }
        let data = self.as_vec();
        if self.len() == 1 {
            return data.pop();
        }

        let result = data.swap_remove(0);
        self.sift_down(0);
        Some(result)
    }

    #[storage(read, write)]
    pub fn remove(self, val: T) -> bool {
        let size = self.len();
        if size == 0 {
            return false;
        }
        let data = self.as_vec();

        // Find the element to remove
        let mut found_index: Option<u64> = None;
        let mut i = 0;
        while i < size {
            if data.get(i).unwrap().read() == val {
                found_index = Some(i);
                break;
            }
            i += 1;
        }

        let index = match found_index {
            Some(idx) => idx,
            None => return false, // Element not found
        };

        // If it's the last element, just pop it
        if index == size - 1 {
            let _ = data.pop();
            return true;
        }

        // Replace with last element and remove last
        let last_val = data.pop().unwrap();
        data.set(index, last_val);

        // Restore heap property
        // First try sift_up (in case replacement is larger than parent)
        let original_val = data.get(index).unwrap().read();
        self.sift_up(index);

        // If element didn't move up, it might need to move down
        if data.get(index).unwrap().read() == original_val {
            self.sift_down(index);
        }

        true
    }
    // Sift down to maintain heap property
    #[storage(read, write)]
    fn sift_down(self, index: u64) {
        let mut current = index;
        let size = self.len();
        let data = self.as_vec();

        while true {
            let left = self.left_child(current);
            let right = self.right_child(current);
            let mut largest = current;

            if left < size
                && data.get(left).unwrap().read() > data.get(largest).unwrap().read()
            {
                largest = left;
            }
            if right < size
                && data.get(right).unwrap().read() > data.get(largest).unwrap().read()
            {
                largest = right;
            }

            if largest != current {
                data.swap(current, largest);
                current = largest;
            } else {
                break;
            }
        }
    }

    // Peek at the maximum element without removing it
    #[storage(read)]
    pub fn peek(self) -> Option<T> {
        let data = self.as_vec();
        match data.get(0) {
            Some(key) => {
                log(1);
                Some(key.read())
            },
            None => None,
        }
    }
}

pub struct MinHeap<T> {}

impl<T> StorageKey<MinHeap<T>>
where
    T: Ord + PartialEq,
{
    fn as_vec(self) -> StorageKey<StorageVec<T>> {
        StorageKey::<StorageVec<T>>::new(self.slot(), self.offset(), self.field_id())
    }

    // Get the size of the heap
    #[storage(read)]
    pub fn len(self) -> u64 {
        let data = self.as_vec();
        data.len()
    }

    // Check if heap is empty
    #[storage(read)]
    pub fn is_empty(self) -> bool {
        let data = self.as_vec();
        data.is_empty()
    }

    // Get parent index
    fn parent(self, index: u64) -> u64 {
        (index - 1) / 2
    }

    // Get left child index
    fn left_child(self, index: u64) -> u64 {
        2 * index + 1
    }

    // Get right child index
    fn right_child(self, index: u64) -> u64 {
        2 * index + 2
    }

    // Push a new element into the heap
    #[storage(read, write)]
    pub fn push(self, value: T) {
        let data = self.as_vec();
        data.push(value);
        self.sift_up(data.len() - 1);
    }

    // Sift up to maintain heap property
    #[storage(read, write)]
    fn sift_up(self, index: u64) {
        let mut current = index;
        let data = self.as_vec();
        while current > 0 {
            let parent = self.parent(current);
            if data.get(current).unwrap().read() < data.get(parent).unwrap().read()
            {
                data.swap(current, parent);
                current = parent;
            } else {
                break;
            }
        }
    }

    // Pop the minimum element from the heap
    #[storage(read, write)]
    pub fn pop(self) -> Option<T> {
        if self.is_empty() {
            return None;
        }
        let data = self.as_vec();
        if self.len() == 1 {
            return data.pop();
        }
        let result = data.swap_remove(0);
        self.sift_down(0);
        Some(result)
    }

    #[storage(read, write)]
    pub fn remove(self, val: T) -> bool {
        let size = self.len();
        if size == 0 {
            return false;
        }
        let data = self.as_vec();

        // Find the element to remove
        let mut found_index: Option<u64> = None;
        let mut i = 0;
        while i < size {
            if data.get(i).unwrap().read() == val {
                found_index = Some(i);
                break;
            }
            i += 1;
        }

        let index = match found_index {
            Some(idx) => idx,
            None => return false, // Element not found
        };

        // If it's the last element, just pop it
        if index == size - 1 {
            let _ = data.pop();
            return true;
        }

        // Replace with last element and remove last
        let last_val = data.pop().unwrap();
        data.set(index, last_val);

        // Restore heap property
        // First try sift_up (in case replacement is smaller than parent)
        let original_val = data.get(index).unwrap().read();
        self.sift_up(index);

        // If element didn't move up, it might need to move down
        if data.get(index).unwrap().read() == original_val {
            self.sift_down(index);
        }

        true
    }
    // Sift down to maintain heap property
    #[storage(read, write)]
    fn sift_down(self, index: u64) {
        let mut current = index;
        let size = self.len();
        let data = self.as_vec();
        while true {
            let left = self.left_child(current);
            let right = self.right_child(current);
            let mut smallest = current;

            if left < size
                && data.get(left).unwrap().read() < data.get(smallest).unwrap().read()
            {
                smallest = left;
            }
            if right < size
                && data.get(right).unwrap().read() < data.get(smallest).unwrap().read()
            {
                smallest = right;
            }

            if smallest != current {
                data.swap(current, smallest);
                current = smallest;
            } else {
                break;
            }
        }
    }

    // Peek at the minimum element without removing it
    #[storage(read)]
    pub fn peek(self) -> Option<T> {
        let data = self.as_vec();
        match data.get(0) {
            Some(key) => Some(key.read()),
            None => None,
        }
    }
}
