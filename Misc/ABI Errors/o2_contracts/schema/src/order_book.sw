library;

use std::{identity::Identity, option::Option, string::String, time::Time};

// Type Aliases

/// Unique identifier for a trader.
pub type TraderId = Identity;

/// Unique identifier for an order, using 64-bit unsigned integer
pub type OrderId = b256;

/// Price representation using 16-bit unsigned integer
/// Prices are typically denominated in the quote asset per unit of base asset
pub type Price = u64;

/// Quantity representation using 64-bit unsigned integer
/// Represents the amount of base asset being traded
pub type Quantity = u64;

// Enums

/// Represents the side of an order in the order book.
/// Determines whether the trader wants to buy or sell the base asset.
pub enum Side {
    /// Buy order - trader wants to purchase the base asset using quote asset
    Buy: (),
    /// Sell order - trader wants to sell the base asset for quote asset
    Sell: (),
}

impl PartialEq for Side {
    fn eq(self, other: Self) -> bool {
        match (self, other) {
            (Self::Buy, Self::Buy) => true,
            (Self::Sell, Self::Sell) => true,
            _ => false,
        }
    }
}

impl Eq for Side {}

impl Not for Side {
    fn not(self) -> Self {
        match self {
            Self::Buy => Self::Sell,
            Self::Sell => Self::Buy,
        }
    }
}

/// Defines the execution type for an order.
/// Determines how the order should be matched in the order book.
pub enum OrderType {
    /// Limit order - executes only at the specified price or better
    /// Buy limit orders execute at the limit price or lower
    /// Sell limit orders execute at the limit price or higher
    Limit: (Price, Time),
    /// Spot order - executes immediately at the best available price
    /// Takes liquidity from the order book until filled or exhausted, then adds to the book.
    Spot: (),
    /// Spot order - executes immediately at the best available price
    /// If the order is not completely filled, the order reverts.
    FillOrKill: (),
    /// Spot order - executes only on the maker side.
    /// If any quantity of the order is filled, the order reverts.
    PostOnly: (),
    /// Spot order - executes immediately at the best price available.
    /// Takes liquidity from the order book until filled or exhausted
    Market: (),
}

impl PartialEq for OrderType {
    fn eq(self, other: Self) -> bool {
        match (self, other) {
            (Self::Market, Self::Market) => true,
            (Self::FillOrKill, Self::FillOrKill) => true,
            (Self::PostOnly, Self::PostOnly) => true,
            (Self::Limit((p_1, t_1)), Self::Limit((p_2, t_2))) => p_1 == p_2 && t_1 == t_2,
            (Self::Spot, Self::Spot) => true,
            _ => false,
        }
    }
}

impl Eq for OrderType {}

/// States whether an order was filled or needs to be added to the queue
pub enum OrderStatus {
    /// An order has been completely filled and we only need it's order id.
    Filled: (b256, raw_slice),
    /// An order has been modified and needs to be added to storage.
    /// The storage order has been updated to reflect any matches and the list of matches to log is provided.
    Unfilled: (StorageOrder, raw_slice),
    /// An order was placed and we ran out of gas before completing the order.
    OutOfGas: (b256, raw_slice),
}

pub enum CancelType {
    // The user is canceling their own order under normal conditions.
    Default: (),
    // The owner is force canceling orders under the paused state.
    ForceCancel: (),
    // The owner is force canceling orders as the trader has been blacklisted.
    Blacklist: (),
}

impl PartialEq for CancelType {
    fn eq(self, other: Self) -> bool {
        match (self, other) {
            (Self::Default, Self::Default) => true,
            (Self::ForceCancel, Self::ForceCancel) => true,
            (Self::Blacklist, Self::Blacklist) => true,
            _ => false,
        }
    }
}

impl Eq for CancelType {}

// Structs

/// Represents a unique match between two orders.
/// Used to track and emit events when orders are matched.
pub struct MatchId {
    /// The order ID of the maker (passive order that was already in the book)
    pub maker_id: OrderId,
    /// The order ID of the taker (aggressive order that triggered the match)
    pub taker_id: OrderId,
}

impl MatchId {
    pub fn new(maker_id: OrderId, taker_id: OrderId) -> Self {
        Self {
            maker_id,
            taker_id,
        }
    }
}

/// Represents a complete order in the order book.
/// Contains all necessary information to execute and track an order.
pub struct Order {
    /// Unique identifier for this order
    pub order_id: OrderId,
    /// The trader who placed this order
    pub trader_id: TraderId,
    /// Whether this is a buy or sell order
    pub side: Side,
    /// The limit price for this order
    pub price: Price,
    /// The amount of base asset to trade
    pub quantity: Quantity,
    /// The type of order (limit or market)
    pub order_type: OrderType,
}

impl Order {
    pub fn new(
        order_id: OrderId,
        trader_id: TraderId,
        side: Side,
        price: Price,
        quantity: Quantity,
        order_type: OrderType,
    ) -> Self {
        Self {
            order_id,
            trader_id,
            side,
            price,
            quantity,
            order_type,
        }
    }

    pub fn default() -> Self {
        Self {
            trader_id: Identity::Address(Address::zero()),
            quantity: 0,
            order_type: OrderType::Spot,
            price: 0,
            side: Side::Buy,
            order_id: b256::zero(),
        }
    }

    pub fn from_storage_order(
        storage_order: StorageOrder,
        price: Price,
        side: Side,
        order_id: OrderId,
    ) -> Self {
        Self {
            trader_id: storage_order.trader_id,
            quantity: storage_order.quantity,
            order_type: storage_order.order_type,
            price,
            side,
            order_id,
        }
    }
}

pub struct StorageOrder {
    /// The trader who placed this order
    pub trader_id: TraderId,
    /// The amount of base asset to trade
    pub quantity: Quantity,
    /// The type of order (limit or market)
    pub order_type: OrderType,
    /// The next order index in the dequeue
    pub next_order: u64,
    /// The previous order index in the dequeue
    pub prev_order: u64,
}

impl StorageOrder {
    pub fn new(
        trader_id: TraderId,
        quantity: Quantity,
        order_type: OrderType,
    ) -> Self {
        Self {
            trader_id,
            quantity,
            order_type,
            next_order: 0,
            prev_order: 0,
        }
    }
}

impl From<Order> for StorageOrder {
    fn from(storage_order: Order) -> Self {
        Self {
            trader_id: storage_order.trader_id,
            quantity: storage_order.quantity,
            order_type: storage_order.order_type,
            next_order: 0,
            prev_order: 0,
        }
    }
}

// Events

/// Event emitted when a new order is added to the order book.
/// This occurs when an order cannot be immediately matched.
pub struct OrderCreatedEvent {
    /// Unique identifier of the newly created order
    pub order_id: OrderId,
    /// Identity of the trader who placed the order
    pub trader_id: Identity,
    /// Side of the order (buy or sell)
    pub order_side: Side,
    /// The type of order (limit or market)
    pub order_type: OrderType,
    /// Amount of base asset to trade
    pub quantity: Quantity,
    /// Limit price for the order
    pub price: Price,
    /// Unix timestamp when the order was created
    pub timestamp: Time,
}

impl OrderCreatedEvent {
    pub fn new(
        order_id: OrderId,
        trader_id: Identity,
        order_side: Side,
        order_type: OrderType,
        quantity: Quantity,
        price: Price,
    ) -> Self {
        Self {
            order_id,
            trader_id,
            order_side,
            order_type,
            quantity,
            price,
            timestamp: Time::now(),
        }
    }

    pub fn log(self) {
        log(self)
    }
}

/// Event emitted when a new order isn't filled because we ran out of gas.
/// This occurs when an order cannot be immediately matched.
pub struct OrderOutOfGasEvent {
    /// Unique identifier of the newly created order
    pub order_id: OrderId,
    /// Unix timestamp when the order was cancelled
    pub timestamp: Time,
}

impl OrderOutOfGasEvent {
    pub fn new(order_id: OrderId) -> Self {
        Self {
            order_id,
            timestamp: Time::now(),
        }
    }

    pub fn log(self) {
        log(self)
    }
}

/// Event emitted when two orders are matched and executed.
/// Contains details about the trade execution.
pub struct OrderMatchedEvent {
    /// Unique identifier for this match, containing both maker and taker order IDs
    pub match_id: MatchId,
    /// Amount of base asset traded in this match
    pub quantity: Quantity,
    /// Execution price of the trade
    pub price: Price,
    /// Unix timestamp when the match occurred
    pub timestamp: Time,
}

impl OrderMatchedEvent {
    pub fn new(
        maker_id: OrderId,
        taker_id: OrderId,
        quantity: Quantity,
        price: Price,
    ) -> Self {
        Self {
            match_id: MatchId::new(maker_id, taker_id),
            quantity,
            price,
            timestamp: Time::now(),
        }
    }

    pub fn set_taker_id(ref mut self, taker_id: OrderId) {
        self.match_id.taker_id = taker_id;
    }

    pub fn log(self) {
        log(self);
    }
}

pub struct OrderCancelledInternalEvent {
    /// Unique identifier of the cancelled order
    pub order_id: OrderId,
    /// Unix timestamp when the order was cancelled
    pub timestamp: Time,
}

impl OrderCancelledInternalEvent {
    pub fn new(order_id: OrderId) -> Self {
        Self {
            order_id,
            timestamp: Time::now(),
        }
    }

    pub fn log(self) {
        log(self);
    }
}

/// Event emitted when an order is cancelled by its owner.
/// The order is removed from the book without execution.
pub struct OrderCancelledEvent {
    /// Unique identifier of the cancelled order
    pub order_id: OrderId,
    /// Unix timestamp when the order was cancelled
    pub timestamp: Time,
}

impl OrderCancelledEvent {
    pub fn new(order_id: OrderId) -> Self {
        Self {
            order_id,
            timestamp: Time::now(),
        }
    }

    pub fn log(self) {
        log(self);
    }
}

/// Event emitted when an order is too small to be filled.
pub struct OrderTooSmallEvent {
    /// Unique identifier of the order which is too small
    pub order_id: OrderId,
    /// Unix timestamp when the order was cancelled
    pub timestamp: Time,
}

impl OrderTooSmallEvent {
    pub fn new(order_id: OrderId) -> Self {
        Self {
            order_id,
            timestamp: Time::now(),
        }
    }

    pub fn log(self) {
        log(self);
    }
}

/// Event emitted when a trader receives their settled balance.
pub struct WithdrawSettledTradeEvent {
    /// Identity of the trader who received their traded funds.
    pub trader_id: Identity,
    /// The amount of base transferred.
    pub base_amount: u64,
    /// The amount of quote transferred.
    pub quote_amount: u64,
}

impl WithdrawSettledTradeEvent {
    pub fn new(trader_id: Identity, base_amount: u64, quote_amount: u64) -> Self {
        Self {
            trader_id,
            base_amount,
            quote_amount,
        }
    }

    pub fn log(self) {
        log(self);
    }
}

/// Event emitted at initialization that provides information about the order book.
pub struct OrderBookConfigEvent {
    /// The base asset.
    pub base_asset: AssetId,
    /// The quote asset.
    pub quote_asset: AssetId,
    /// The base asset's decimals.
    pub base_decimals: u64,
    /// The quote asset's decimals.
    pub quote_decimals: u64,
    /// The minimum amount of the quote asset needed to create an order.
    pub min_order: u64,
    /// The maker fee. 100% is 1_000_000 and 0.002% is 200.
    pub maker_fee: u64,
    /// The taker fee. 100% is 1_000_000 and 0.002% is 200.
    pub taker_fee: u64,
    /// The price precision allowed.
    pub price_precision: u64,
    /// The quantity precision allowed.
    pub quantity_precision: u64,
    /// The price window for the order book.
    pub price_window: u64,
    /// The dust amount for the order book.
    pub dust: u64,
    /// Whether fractional prices are allowed.
    pub allow_fractional_price: bool,
}

impl OrderBookConfigEvent {
    pub fn log(self) {
        log(self);
    }
}

/// Event emitted when the base and quote symbols are set.
pub struct OrderBookSymbolsEvent {
    /// The base asset symbol.
    pub base_symbol: String,
    /// The quote asset symbol.
    pub quote_symbol: String,
}

impl OrderBookSymbolsEvent {
    pub fn log(self) {
        log(self);
    }
}

// Event emitted when the whitelist contract is set or updated
pub struct OrderBookWhitelistEvent {
    /// The whitelist contract.
    pub whitelist: Option<ContractId>,
}

impl OrderBookWhitelistEvent {
    pub fn log(self) {
        log(self);
    }
}

// Event emitted when the blacklist contract is set or updated
pub struct OrderBookBlacklistEvent {
    /// The whitelist contract.
    pub blacklist: Option<ContractId>,
}

impl OrderBookBlacklistEvent {
    pub fn log(self) {
        log(self);
    }
}

/// Enum containing all possible order book events.
/// Used for unified event handling and logging.
pub enum OrderBookEvent {
    /// A new order was created and added to the book
    OrderCreated: OrderCreatedEvent,
    /// Two orders were matched and partially or fully executed
    OrderMatched: OrderMatchedEvent,
    /// An order was cancelled by its owner
    OrderCancelled: OrderCancelledEvent,
}

impl OrderBookEvent {
    pub fn log(self) {
        log(self);
    }
}

// Arguments

/// Arguments required to create a new order.
/// Used as input to the create_order function.
pub struct OrderArgs {
    /// The limit price for the order
    /// For buy orders: maximum price willing to pay per unit of base asset
    /// For sell orders: minimum price willing to accept per unit of base asset
    pub price: Price,
    /// Amount of base asset to buy or sell
    pub quantity: Quantity,
    /// Type of order (Limit or Market)
    pub order_type: OrderType,
}

pub enum OrderCreationError {
    InvalidOrderArgs: (),
    InvalidInputAmount: (),
    InvalidAsset: (),
    PriceExceedsRange: (),
    PricePrecision: (),
    InvalidHeapPrices: (u64, u64),
    FractionalPrice: (),
    OrderNotFilled: (),
    OrderPartiallyFilled: (),
    TraderNotWhiteListed: (),
    TraderBlackListed: (),
}

impl PartialEq for OrderCreationError {
    fn eq(self, other: Self) -> bool {
        match (self, other) {
            (Self::OrderNotFilled, Self::OrderNotFilled) => true,
            (Self::OrderPartiallyFilled, Self::OrderPartiallyFilled) => true,
            (Self::InvalidOrderArgs, Self::InvalidOrderArgs) => true,
            (Self::InvalidInputAmount, Self::InvalidInputAmount) => true,
            (Self::InvalidAsset, Self::InvalidAsset) => true,
            (Self::PriceExceedsRange, Self::PriceExceedsRange) => true,
            (Self::PricePrecision, Self::PricePrecision) => true,
            (Self::InvalidHeapPrices(_), Self::InvalidHeapPrices(_)) => true,
            (Self::FractionalPrice, Self::FractionalPrice) => true,
            (Self::TraderNotWhiteListed, Self::TraderNotWhiteListed) => true,
            (Self::TraderBlackListed, Self::TraderBlackListed) => true,
            _ => false,
        }
    }
}
impl Eq for OrderCreationError {}

pub enum OrderCancelError {
    NotOrderOwner: (),
    TraderNotBlacklisted: (),
    NoBlacklist: (),
}

impl PartialEq for OrderCancelError {
    fn eq(self, other: Self) -> bool {
        match (self, other) {
            (Self::NotOrderOwner, Self::NotOrderOwner) => true,
            (Self::TraderNotBlacklisted, Self::TraderNotBlacklisted) => true,
            _ => false,
        }
    }
}
impl Eq for OrderCancelError {}

pub enum FeeError {
    NoFeesAvailable: (),
}

impl PartialEq for FeeError {
    fn eq(self, other: Self) -> bool {
        match (self, other) {
            (Self::NoFeesAvailable, Self::NoFeesAvailable) => true,
        }
    }
}
impl Eq for FeeError {}

pub enum OrderBookInitializationError {
    InvalidAsset: (),
    InvalidDecimals: (),
    InvalidPriceWindow: (),
    InvalidPricePrecision: (),
    OwnerNotSet: (),
    InvalidMinOrder: (),
}

impl PartialEq for OrderBookInitializationError {
    fn eq(self, other: Self) -> bool {
        match (self, other) {
            (Self::InvalidAsset, Self::InvalidAsset) => true,
            (Self::InvalidDecimals, Self::InvalidDecimals) => true,
            (Self::InvalidPriceWindow, Self::InvalidPriceWindow) => true,
            (Self::InvalidPricePrecision, Self::InvalidPricePrecision) => true,
            (Self::OwnerNotSet, Self::OwnerNotSet) => true,
            (Self::InvalidMinOrder, Self::InvalidMinOrder) => true,
            _ => false,
        }
    }
}
impl Eq for OrderBookInitializationError {}

// Configurables - moved to contract implementation

/// Order Book contract ABI for decentralized trading pair management.
/// Manages limit and market orders for a specific trading pair (BASE_ASSET/QUOTE_ASSET).
///
/// # Overview
///
/// The OrderBook contract provides a decentralized exchange mechanism for a single trading pair.
/// It supports limit and market orders with automatic matching and execution.
/// The order side (buy/sell) is automatically determined by the asset being sent.
///
/// # Key Features
///
/// - Automatic order matching on creation
/// - Price-time priority for order execution
/// - Owner-only order cancellation
/// - Real-time best buy/sell queries
/// - Comprehensive event logging for all activities
///
/// # Security Model
///
/// - Orders can only be cancelled by their creators
/// - Asset amounts are validated against msg context
/// - All trades are atomic and immediate
///
/// # Design Principles
///
/// - One contract per trading pair
/// - Configurable base/quote assets at deployment
/// - Efficient order matching to minimize gas costs
/// - No intermediary custody - direct peer-to-peer trades
abi OrderBook {
    /// Creates a new order in the order book.
    /// The order type (buy/sell) is automatically determined from the asset being sent.
    /// If the order can be immediately matched with existing orders, it will be executed.
    /// Otherwise, it will be added to the order book as an active order.
    ///
    /// # Arguments
    ///
    /// * `order` - OrderArgs pub struct containing:
    ///   - `price`: The limit price for the order
    ///   - `quantity`: The amount to buy or sell
    ///
    /// # Context Requirements
    ///
    /// * `msg_sender` - The trader's identity (automatically captured from transaction context)
    /// * `msg_asset_id` - Determines the order type:
    ///   - If QUOTE_ASSET is sent → Buy order (buying base with quote)
    ///   - If BASE_ASSET is sent → Sell order (selling base for quote)
    /// * `msg_amount` - The amount of asset being sent:
    ///   - For buy orders: quote amount (should equal quantity * price)
    ///   - For sell orders: base amount (should equal quantity)
    ///
    /// # Returns
    ///
    /// * `OrderId` - Unique identifier for the created order
    ///
    /// # Storage Access
    ///
    /// - Reads: Current order book state to check for matches
    /// - Writes: Updates order book with new order or executes trades
    ///
    /// # Events
    ///
    /// - Emits `OrderCreatedEvent` if order is added to book
    /// - Emits `OrderMatchedEvent` for each match executed
    /// - Emits `OrderOutOfGasEvent` for when matches ends early.
    ///
    /// # Reverts
    ///
    /// - If quantity is zero
    /// - If price is zero
    /// - If msg_asset_id is neither BASE_ASSET nor QUOTE_ASSET
    /// - If msg_amount doesn't match expected amount:
    ///   - Buy orders: msg_amount != quantity * price
    ///   - Sell orders: msg_amount != quantity
    #[storage(read, write), payable]
    fn create_order(order: OrderArgs) -> OrderId;

    /// Cancels an active order.
    /// Only the original trader who created the order can cancel it.
    ///
    /// # Arguments
    ///
    /// * `order_id` - The unique identifier of the order to cancel
    ///
    /// # Context Requirements
    ///
    /// * `msg_sender` - Must match the trader_id of the order being cancelled
    ///
    /// # Returns
    ///
    /// * `bool` - True if cancellation was successful, false otherwise
    ///
    /// # Storage Access
    ///
    /// - Reads: Order details to verify ownership (trader_id) and status
    /// - Writes: Updates order status and removes from active order book
    ///
    /// # Security
    ///
    /// - Verifies that msg_sender == order.trader_id before allowing cancellation
    ///
    /// # Events
    ///
    /// - Emits `OrderCancelledEvent` on successful cancellation
    ///
    /// # Reverts
    ///
    /// - If order does not exist
    /// - If msg_sender != order.trader_id (unauthorized cancellation attempt)
    /// - If order is already executed or cancelled
    #[storage(read, write)]
    fn cancel_order(order_id: OrderId) -> bool;

    /// Withdraws the settled trade balances of a list of traders.
    ///
    /// # Argument
    ///
    /// * `traders`: [Vec<Identity>] - The list of traders to settle their balances.
    #[storage(read, write)]
    fn settle_balances(traders: Vec<Identity>);

    /// Withdraws the settled trade balances of a single trader.
    ///
    /// # Argument
    ///
    /// * `trader`: [Identity] - The trader to settle their balance.
    #[storage(read, write)]
    fn settle_balance(trader: Identity);

    /// Retrieves the details of a specific order.
    ///
    /// # Arguments
    ///
    /// * `order_id` - The unique identifier of the order
    ///
    /// # Returns
    ///
    /// * `Option<Order>` - Order details if found, None if order doesn't exist
    ///
    /// # Storage Access
    ///
    /// - Reads: Order information from storage
    #[storage(read)]
    fn get_order(order_id: OrderId) -> Option<Order>;

    /// Retrieves the orders at a specific price level and side
    ///
    /// # Arguments
    ///
    /// * `side`: [Side] - Either the buy or sell orders.
    /// * `price`: [u64] - The price level to fetch.
    ///
    /// # Returns
    ///
    /// * `Vec<Order>` - The orders at the specific price level.
    #[storage(read)]
    fn get_orders_at_price(side: Side, price: Price) -> Vec<Order>;

    /// Returns true if orders exist at a specific price and side in the price heap.
    ///
    /// # Arguments
    ///
    /// * `side`: [Side] - Either the buy or sell orders.
    /// * `price`: [u64] - The price level to fetch.
    ///
    /// # Returns
    ///
    /// * `bool` - `true` if orders exist at the price level, otherwise `false`.
    #[storage(read)]
    fn get_heap_price(side: Side, price: Price) -> bool;

    /// Returns the settled balance of a trader.
    ///
    /// # Arguments
    ///
    /// * `trader`: [Identity] - Which trader to check the settled balance of.
    ///
    /// # Returns
    ///
    /// * `(u64, u64)` - The (BASE_ASSET, QUOTE_ASSET) tuple balance.
    #[storage(read)]
    fn get_settled_balance_of(trader: Identity) -> (u64, u64);

    /// Returns the best (highest) buy price in the order book.
    /// The best buy represents the highest price a buyer is willing to pay.
    ///
    /// # Returns
    ///
    /// * `Option<Price>` - The best buy price, or None if no buy orders exist
    ///
    /// # Storage Access
    ///
    /// - Reads: Buy side order book
    #[storage(read)]
    fn get_best_buy() -> Option<Price>;

    /// Returns the best (lowest) sell price in the order book.
    /// The best sell represents the lowest price a seller is willing to accept.
    ///
    /// # Returns
    ///
    /// * `Option<Price>` - The best sell price, or None if no sell orders exist
    ///
    /// # Storage Access
    ///
    /// - Reads: Sell side order book
    #[storage(read)]
    fn get_best_sell() -> Option<Price>;

    /// Returns the base asset of this trading pair.
    /// This is set at contract deployment via configurables.
    ///
    /// # Returns
    ///
    /// * `AssetId` - The base asset identifier (e.g., BTC in BTC/USDC)
    fn get_base_asset() -> AssetId;

    /// Returns the quote asset of this trading pair.
    /// This is set at contract deployment via configurables.
    ///
    /// # Returns
    ///
    /// * `AssetId` - The quote asset identifier (e.g., USDC in BTC/USDC)
    fn get_quote_asset() -> AssetId;

    /// Returns the last traded price and the UNIX timestamp.
    ///
    /// # Returns
    ///
    /// * `Price` - The price at which the last trade occurred.
    /// * `Time` - The time at which the last trade occurred.
    #[storage(read)]
    fn get_last_traded_price() -> (Price, Time);

    /// Returns the minimum amount of quote exchanged in a trade needed.
    ///
    /// # Returns
    ///
    /// * `u64` - The minimum amount of quote coins.
    fn get_minimum_trade_amount() -> u64;

    /// Returns the maker fee.
    ///
    /// # Returns
    ///
    /// * `u64` - The maker fee in basis points.
    fn get_maker_fee() -> u64;

    /// Returns the taker fee.
    ///
    /// # Returns
    ///
    /// * `u64` - The taker fee in basis points.
    fn get_taker_fee() -> u64;

    /// Returns the allowed number of price decimals.
    ///
    /// # Returns
    ///
    /// * `u64` - The number of decimal precision allowed in the price.
    fn get_price_precision() -> u64;

    /// Returns the allowed number of quantity decimals.
    ///
    /// # Returns
    ///
    /// * `u64` - The number of decimal precision allowed in the quantity.
    fn get_quantity_precision() -> u64;

    /// Returns the whitelist contract id.
    ///
    /// # Returns
    ///
    /// * `Option<ContractId>` - The whitelist contract id.
    fn get_whitelist_id() -> Option<ContractId>;

    /// Returns the blacklist contract id.
    ///
    /// # Returns
    ///
    /// * `Option<ContractId>` - The blacklist contract id.
    fn get_blacklist_id() -> Option<ContractId>;
}

abi OrderBookAdmin {
    /// Initializes the contract with an owner.
    ///
    /// # Arguments
    ///
    /// * [owner]: `Identity` - The new owner to be set.
    ///
    /// # Reverts
    ///
    /// * When the contract has already been initialized.
    ///
    /// # Events
    ///
    /// * `FeeEvent`
    #[storage(read, write)]
    fn initialize();

    /// Transfers ownership to a new owner.
    ///
    /// # Arguments
    ///
    /// * [new_owner]: `Identity` - The new owner to be set.
    ///
    /// # Reverts
    ///
    /// * When not called by the owner.
    #[storage(read, write)]
    fn transfer_ownership(new_owner: Identity);

    /// Force cancels the given orders only if the contract is paused.
    ///
    /// # Arguments
    ///
    /// * [orders]: `Vec<OrderID>` - A vec of orders to cancel.
    ///
    /// # Reverts
    ///
    /// * When not called by the owner.
    /// * When the contract is not paused.
    #[storage(read, write)]
    fn force_cancel_orders(orders: Vec<OrderId>);

    /// Force cancels the given orders only if the trader is blacklisted.
    ///
    /// # Arguments
    ///
    /// * [orders]: `Vec<OrderID>` - A vec of orders to cancel.
    ///
    /// # Reverts
    ///
    /// * When not called by the owner.
    /// * When the trader is not blacklisted.
    #[storage(read, write)]
    fn cancel_blacklist_orders(orders: Vec<OrderId>);

    /// Withdraws the collected fees to a recipient.
    ///
    /// # Arguments
    ///
    /// * [fee_recipient]: `Identity` - The entity which shall receive the fees collected.
    ///
    /// # Reverts
    ///
    /// * When no fees are available.
    /// * When not called by the owner.
    #[storage(read, write)]
    fn collect_fees(fee_recipient: Identity);

    /// Returns the amount of fees available to withdraw.
    ///
    /// # Additional Information
    ///
    /// The first `u64` is the amount of `BASE_ASSET` and the second `u64` is the amount of `QUOTE_ASSET`.
    ///
    /// # Returns
    ///
    /// * `(u64, u64)` - The amount of (BASE_ASSET, QUOTE_ASSET) available to withdraw.
    #[storage(read)]
    fn current_fees() -> (u64, u64);

    /// Emits a log of configurables in the Orderbook.
    ///
    /// # Additional Information
    ///
    /// Used when the contract is upgraded and the fee changes.
    ///
    /// # Events
    ///
    /// * `OrderBookConfigEvent`
    fn emit_orderbook_config();
}
