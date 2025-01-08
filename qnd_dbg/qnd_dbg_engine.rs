// Add to `sway-core/src/engine_threading.rs`.

qnd_dbg_engine: QndDbgEngine,


use parking_lot::lock_api::RwLock;

#[derive(Debug)]
pub struct QndDbgEngine {
    traces: parking_lot::RwLock<Vec<String>>,
}

impl Default for QndDbgEngine {
    fn default() -> Self {
        Self { traces: RwLock::new(vec![]) }
    }
}

impl Clone for QndDbgEngine {
    fn clone(&self) -> Self {
        Self { traces: RwLock::new(self.traces.read().clone()) }
    }
}

impl QndDbgEngine {
    pub fn trace(&self, msg: String) {
        self.traces.write().push(msg);
    }

    pub fn trace_when(&self, condition: bool, msg: String) {
        if condition {
            self.trace(msg);
        }
    }

    pub fn print(&self) {
        let traces = self.traces.read();
        for trace in traces.iter() {
            println!("{trace}");
        }
    }
}


    pub fn qnd_dbg(&self) -> &QndDbgEngine {
        &self.qnd_dbg_engine
    }
