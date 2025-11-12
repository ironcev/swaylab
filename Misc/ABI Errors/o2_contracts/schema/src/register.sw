library;

use std::hash::{Hash, Hasher};

/// Represents a unique market identifier composed of base and quote assets.
/// Used to distinguish between different trading pairs in the system.
pub struct MarketId {
    /// The asset being traded (e.g., ETH in ETH/USDC pair)
    pub base_asset: AssetId,
    /// The asset used for pricing (e.g., USDC in ETH/USDC pair)
    pub quote_asset: AssetId,
}

impl Hash for MarketId {
    fn hash(self, ref mut state: Hasher) {
        self.base_asset.hash(state);
        self.quote_asset.hash(state);
    }
}

impl PartialEq for MarketId {
    fn eq(self, other: Self) -> bool {
        self.base_asset == other.base_asset && self.quote_asset == other.quote_asset
    }
}

impl Eq for MarketId {}

impl MarketId {
    /// Creates a new MarketId from base and quote assets.
    ///
    /// # Arguments
    ///
    /// * `base_asset` - The asset being traded
    /// * `quote_asset` - The asset used for pricing
    ///
    /// # Returns
    ///
    /// * `MarketId` - A new market identifier
    pub fn new(base_asset: AssetId, quote_asset: AssetId) -> Self {
        Self {
            base_asset,
            quote_asset,
        }
    }
}

/// Represents a registered Trade Account in the O2 protocol.
/// This struct serves dual purposes:
/// 1. As an event emitted when a new Trade Account is registered
/// 2. As a storage structure for maintaining the registry of Trade Accounts
///
/// Trade Accounts are user-specific contracts that manage trading operations
/// on behalf of their owners within the O2 protocol.
pub struct TradeAccountRegistered {
    /// The contract ID of the registered Trade Account
    pub contract_id: ContractId,
    /// The owner of the Trade Account
    pub owner: Identity,
}

/// Represents a referer for a Trade Account.
/// This struct serves dual purposes:
/// 1. As an event emitted when a Referer for a  Trade Account is register
pub struct TradeAccountReferer {
    pub trade_account: ContractId,
    pub referer: Identity,
}

impl TradeAccountReferer {
    /// Creates a new TradeAccountReferer instance.
    ///
    /// # Arguments
    ///
    /// * `referer` - The referer's identity
    ///
    /// # Returns
    ///
    /// * `TradeAccountReferer` - The instance for storage or event emission
    pub fn new(trade_account: ContractId, referer: Identity) -> Self {
        Self {
            trade_account,
            referer,
        }
    }

    /// Logs the event to the blockchain.
    /// This makes the event data available for off-chain indexing and monitoring.
    pub fn log(self) {
        log(self)
    }
}

/// Represents a registered Order Book in the O2 protocol.
/// This struct serves dual purposes:
/// 1. As an event emitted when a new Order Book is registered
/// 2. As a storage structure for maintaining the registry of Order Books
///
/// Order Books are market-specific contracts that facilitate trading
/// between base and quote assets in the O2 protocol.
pub struct OrderBookRegistered {
    /// The contract ID of the registered Order Book
    pub contract_id: ContractId,
    /// The market identifier for which this Order Book handles trades
    pub market_id: MarketId,
}

impl TradeAccountRegistered {
    /// Creates a new TradeAccountRegistered instance.
    ///
    /// # Arguments
    ///
    /// * `contract_id` - The contract ID of the Trade Account
    /// * `owner` - The owner's identity
    ///
    /// # Returns
    ///
    /// * `TradeAccountRegistered` - The instance for storage or event emission
    pub fn new(contract_id: ContractId, owner: Identity) -> Self {
        Self {
            contract_id,
            owner,
        }
    }

    /// Logs the event to the blockchain.
    /// This makes the event data available for off-chain indexing and monitoring.
    pub fn log(self) {
        log(self)
    }
}

impl OrderBookRegistered {
    /// Creates a new OrderBookRegistered instance.
    ///
    /// # Arguments
    ///
    /// * `contract_id` - The contract ID of the Order Book
    /// * `market_id` - The market identifier
    ///
    /// # Returns
    ///
    /// * `OrderBookRegistered` - The instance for storage or event emission
    pub fn new(contract_id: ContractId, market_id: MarketId) -> Self {
        Self {
            contract_id,
            market_id,
        }
    }

    /// Logs the event to the blockchain.
    /// This makes the event data available for off-chain indexing and monitoring.
    pub fn log(self) {
        log(self)
    }
}

/// Generic pagination wrapper for returning large result sets.
/// Used to efficiently query registered contracts in chunks.
pub struct Page<T> {
    /// The items in the current page
    pub items: Vec<T>,
    /// The current page number (0-indexed)
    pub page: u64,
    /// The total number of items across all pages
    pub total: u64,
}

pub enum TradeAccountRegistryError {
    /// Error indicating the owner already has a Trade Account registered
    pub OwnerAlreadyHasTradeAccount: (),
    /// Error indicating the referer is not a contract
    pub TradeAccountNotRegistered: (),
    /// Error indicating the trade account already has a referer
    pub TradeAccountAlreadyHasReferer: (),
}

pub enum OrderBookRegistryError {
    /// Error indicating the market already has an Order Book registered
    pub MarketAlreadyHasOrderBook: (),
}

/// Central registry for O2 protocol trading-account contracts.
/// Manages the registration and lookup of Trade Accounts.
///
/// # Key Features
///
/// - One-to-one mapping between users and Trade Accounts
/// - Paginated queries for large datasets
///
/// # Security Model
///
/// - Registration is permissioned and only allowed by the owner
/// - Each user can only have one Trade Account
///
/// # Design Principles
///
/// - Simplicity: Direct mappings for fast lookups
/// - Scalability: Pagination support for growing numbers of contracts
/// - Transparency: All registrations emit events
abi TradeAccountRegistry {
    /// Registers a referer for a Trade Account.
    ///
    /// # Arguments
    ///
    /// * `referer` - The Identity of the referer
    ///
    /// # Storage Access
    ///
    /// - Reads: Checks if the trade account is registered
    /// - Writes: Stores the mapping between trade account and referer
    ///
    /// # Events
    ///
    /// - Emits `TradeAccountReferer` event on successful registration
    ///
    /// # Security
    ///
    /// - Only the trade account owner can call this function
    /// - Prevents duplicate referers for the same trade account
    /// - Require statement ensures no existing referer for the trade account
    #[storage(read, write)]
    fn register_referer(referer: Identity);

    /// Retrieves the referer for Trade Account
    ///
    /// # Arguments
    ///
    /// * `contract_id` - The Trade Account Address
    ///
    /// - Returns empty or the identity of the referer
    #[storage(read)]
    fn get_trade_account_referer(contract_id: ContractId) -> Option<Identity>;

    /// Retrieves the Trade Account contract ID for a given owner.
    ///
    /// # Arguments
    ///
    /// * `owner` - The Identity to look up
    ///
    /// # Returns
    ///
    /// * `Option<ContractId>` - The Trade Account contract ID if registered, None otherwise
    ///
    /// # Storage Access
    ///
    /// - Reads: Looks up the Trade Account mapping
    ///
    /// # Usage
    ///
    /// Used by dApps and other contracts to find a user's Trade Account
    #[storage(read)]
    fn get_trade_account(owner: Identity) -> Option<ContractId>;

    /// Retrieves a paginated list of all registered Trade Accounts.
    /// Used for administrative and analytics purposes.
    ///
    /// # Arguments
    ///
    /// * `page` - The page number to retrieve (0-indexed)
    ///
    /// # Returns
    ///
    /// * `Page<TradeAccountRegistered>` - A page containing:
    ///   - `items`: Vector of TradeAccountRegistered events for this page
    ///   - `page`: The current page number
    ///   - `total`: Total number of Trade Accounts across all pages
    ///
    /// # Storage Access
    ///
    /// - Reads: Iterates through stored Trade Accounts for the requested page
    ///
    /// # Pagination
    ///
    /// - Default page size is determined by implementation
    /// - Returns empty items vector if page exceeds available data
    #[storage(read)]
    fn get_trade_accounts(page: u64) -> Page<TradeAccountRegistered>;

    /// Retrieves the Oracle contract ID
    ///
    /// # Returns
    ///
    /// * `ContractId` - The Oracle contract ID
    fn default_bytecode() -> Option<ContractId>;

    /// Retrieves the Oracle contract ID
    ///
    /// # Returns
    ///
    /// * `ContractId` - The Oracle contract ID
    fn get_oracle_id() -> ContractId;
}

/// Central registry for O2 protocol Orderbook contracts.
/// Manages the registration and lookup of Order Books.
///
/// # Key Features
///
/// - One Order Book per market (base/quote asset pair)
/// - Paginated queries for large datasets
///
/// # Security Model
///
/// - Registration is permissioned and only allowed by the owner
/// - Each market can only have one Order Book
///
/// # Design Principles
///
/// - Simplicity: Direct mappings for fast lookups
/// - Scalability: Pagination support for growing numbers of contracts
/// - Transparency: All registrations emit events
abi OrderBookRegistry {
    /// Each user can only have one Trade Account registered.
    ///
    /// * `contract_id` - The contract ID of the Order Book to register
    /// * `market_id` - The market identifier containing base and quote assets
    ///
    /// # Storage Access
    ///
    /// - Reads: Checks if market already has an Order Book
    /// - Writes: Stores the mapping between market_id and contract_id
    ///
    /// # Events
    ///
    /// - Emits `OrderBookRegistered` event on successful registration
    ///
    /// # Security
    ///
    /// - Only the contract owner can call this function
    /// - Prevents duplicate Order Books for the same market
    /// - Require statement ensures no existing Order Book for the market
    #[storage(read, write)]
    fn register_order_book(
        contract_id: ContractId,
        market_id: MarketId,
    ) -> Result<(), OrderBookRegistryError>;

    /// Retrieves the Order Book contract ID for a given market.
    ///
    /// # Arguments
    ///
    /// * `market_id` - The market identifier to look up
    ///
    /// # Returns
    ///
    /// * `Option<ContractId>` - The Order Book contract ID if registered, None otherwise
    ///
    /// # Storage Access
    ///
    /// - Reads: Looks up the Order Book mapping
    #[storage(read)]
    fn get_order_book(market_id: MarketId) -> Option<ContractId>;

    /// Retrieves the Order Book contract ID for a given market.
    ///
    /// # Arguments
    ///
    /// * `market_id` - The market identifier to look up
    ///
    /// # Returns
    ///
    /// * `Option<ContractId>` - The Order Book contract ID if registered, None otherwise
    ///
    ///
    ///
    /// - Reads: Iterates through stored Order Books for the requested page
    ///
    /// # Pagination
    ///
    /// - Default page size is determined by implementation
    /// - Returns empty items vector if page exceeds available data
    #[storage(read)]
    fn get_order_books(page: u64) -> Page<OrderBookRegistered>;
}

/// Administrative interface for the O2Register contract.
/// Provides owner-only functions for contract management.
abi O2RegistryAdmin {
    /// Initializes the contract with an owner.
    /// This function should only be called once during contract deployment.
    ///
    /// # Arguments
    ///
    /// * `owner` - The Identity that will own this contract
    ///
    /// # Security
    ///
    /// - Can only be called once
    /// - Sets up the ownership structure
    #[storage(read, write)]
    fn initialize();

    /// Transfers ownership of the contract to a new owner.
    ///
    /// # Arguments
    ///
    /// * `new_owner` - The Identity that will become the new owner
    ///
    /// # Security
    ///
    /// - Only the current owner can call this function
    #[storage(read, write)]
    fn transfer_ownership(new_owner: Identity);
}
