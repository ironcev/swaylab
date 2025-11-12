contract;

use contract_schema::order_book::*;
use contract_libs::{bitmap::*, deque::*, heap::*};
use std::{
    asset::transfer,
    auth::msg_sender,
    call_frames::msg_asset_id,
    context::{
        balance_of,
        msg_amount,
        this_balance,
    },
    registers::global_gas,
    string::String,
    time::Time,
};
use std::storage::storage_api::{clear, read};
use ownership::*;
use src5::*;
use pausable::*;

storage {
    orderbook {
        v1 {
            /// A map of buy prices. Used to keep track of active prices and find the maximum buy.
            buy_map: BuyBitMap = BuyBitMap {},
            /// A map of sell prices. Used to keep track of active prices and find the minimum sell.
            sell_map: SellBitMap = SellBitMap {},
            /// The active buy orders for each price in queue of FIFO.
            buys: StorageMap<u64, SparseDeque> = StorageMap {},
            /// The active sell orders for each price in queue of FIFO.
            sells: StorageMap<u64, SparseDeque> = StorageMap {},
            /// The settled balances for each traders.
            settled_balances: StorageMap<Identity, (u64, u64)> = StorageMap {},
            /// The last price at which a trade occurred and the time.
            last_traded_price: (u64, Time) = (0, Time::from(0)),
            /// A temporary unique order id for order that get completely filled.
            /// Gets incremented in the upper 48 bits. The lower 16 are set to 0xFF..FF to avoid collision with
            /// order ids for order stored in storage::orderbook::v1.
            temp_order_id: b256 = 0x000000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFF,
            /// The fees collected for the (BASE_ASSET, QUOTE_ASSET) that can be withdrawn by the owner.
            collected_fees: (u64, u64) = (0, 0),
        },
    },
}

configurable {
    /// The initial owner.
    INITIAL_OWNER: State = State::Uninitialized,
    /// The base asset of the pair.
    BASE_ASSET: AssetId = AssetId::zero(),
    /// The quote asset of the pair.
    QUOTE_ASSET: AssetId = AssetId::zero(),
    /// The minimum amount of the quote asset needed to create an order.
    MIN_ORDER: u64 = 1,
    /// The fee taken as the maker
    /// So 100% is 1_000_000 and 0.002% is 200
    /// so for 0.002% the fee is 200
    MAKER_FEE: u64 = 0,
    /// The fee taken as the taker base for fee is 6 decimals
    /// So 100% is 1_000_000 and 0.002% is 200
    /// so for 0.002% the fee is 200
    TAKER_FEE: u64 = 0,
    /// The number of decimals the quote asset has
    /// The decimals of the BASE_ASSET
    BASE_DECIMALS: u64 = 1_000_000_000,
    /// The decimals of the QUOTE_ASSET
    QUOTE_DECIMALS: u64 = 1_000_000,
    /// Max price offset as a percentage.
    /// Ranges from 0 to 100.
    PRICE_WINDOW: u64 = 0,
    /// The number of decimals allowed in the price.
    /// 100 requires the last 2 decimals places to be zero.
    PRICE_PRECISION: u64 = 1,
    /// The number of decimals allowed in the quantity.
    /// 100 requires the last 2 decimals places to be zero.
    QUANTITY_PRECISION: u64 = 1,
    /// The minimum amount of the quote asset required for the contract to return dust.
    /// 100 is 0.0001 USDC, 10_000 is 0.01 USDC.
    DUST: u64 = 0,
    /// The fixed minimum gas required to store a new order into the book(9_200), finish storing any remaining orders(5_600),
    /// iterating over another loop(12_000), and a buffer(10_000)
    BASE_GAS: u64 = 9_200 + 5_600 + 12_000 + 10_000,
    /// The gas used to emit a single matched event log.
    MATCH_EVENT_GAS: u64 = 700,
    /// The gas needed at the end of execution for single level price matches
    MATCH_SINGLE_LEVEL_GAS: u64 = 2_500,
    /// The gas needed at the end of execution for a multi level price match
    MATCH_MULTI_LEVEL_GAS: u64 = 6_000,
    /// The gas required to start checking whether we should exit matching early due to gas.
    /// If we start below this value, no gas requirements are checked and order matching is assumed to succeed.
    MIN_GAS: u64 = 15_000_000,
    /// Sets whether prices which would truncate quote coins are allowed.
    ALLOW_FRACTIONAL_PRICE: bool = false,
    /// Base Asset Symbol max 10 characters
    BASE_SYMBOL: str[10] = __to_str_array("          "),
    /// Quote Asset Symbol max 10 characters
    QUOTE_SYMBOL: str[10] = __to_str_array("          "),
    /// The contract which manages the whitelist.
    WHITE_LIST_CONTRACT: Option<ContractId> = None,
    /// The contract which manages the blacklist.
    BLACK_LIST_CONTRACT: Option<ContractId> = None,
}

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
/// - Real-time best sell/buy queries
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
impl OrderBook for Contract {
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
    fn create_order(order_args: OrderArgs) -> OrderId {
        let tx_start_gas = global_gas();

        require_not_paused();

        // Ensure the order args are valid
        require(
            order_args
                .quantity != 0 && order_args
                .price != 0,
            OrderCreationError::InvalidOrderArgs,
        );
        let mut order_id = b256::zero();
        let msg_asset = msg_asset_id();
        let trader = msg_sender().unwrap();

        // Only check whitelist contract is one is set
        if WHITE_LIST_CONTRACT.is_some() {
            // Ensure the whitelist contract has the asset with this trader's id as the SubId
            require(
                balance_of(
                    WHITE_LIST_CONTRACT
                        .unwrap(),
                    AssetId::new(WHITE_LIST_CONTRACT.unwrap(), trader.bits()),
                ) > 0,
                OrderCreationError::TraderNotWhiteListed,
            );
        }

        if BLACK_LIST_CONTRACT.is_some() {
            require(
                balance_of(
                    BLACK_LIST_CONTRACT
                        .unwrap(),
                    AssetId::new(BLACK_LIST_CONTRACT.unwrap(), trader.bits()),
                ) == 0,
                OrderCreationError::TraderBlackListed,
            );
        }

        // Determine the trade side and validate the asset.
        let side = if msg_asset == QUOTE_ASSET {
            Side::Buy
        } else if msg_asset == BASE_ASSET {
            Side::Sell
        } else {
            // Configurables do not support match statements in Sway, so we need to have an if statement.
            revert_with_log(OrderCreationError::InvalidAsset);
            Side::Buy // This will never be reached.
        };

        // Check to ensure price is truncated
        // NOTE: If the price falls below the PRICE_PRECISION, the contract will no longer accept orders.
        // For example, if price precision is $0.01, any orders under $0.01 will fail.
        require(
            order_args
                .price % PRICE_PRECISION == 0,
            OrderCreationError::PricePrecision,
        );

        // Verify the price provided does not result in a fractional order
        if !ALLOW_FRACTIONAL_PRICE {
            require(
                !quote_would_truncate(order_args.quantity, order_args.price),
                OrderCreationError::FractionalPrice,
            );
        }

        // Validate the input amount against the order args.
        let msg_amount = msg_amount();
        match side {
            Side::Buy => require(
                msg_amount == quote_coins_from_quantity(order_args.quantity, order_args.price) && msg_amount >= MIN_ORDER,
                OrderCreationError::InvalidInputAmount,
            ),
            Side::Sell => require(
                msg_amount == order_args
                    .quantity && quote_coins_from_quantity(order_args.quantity, order_args.price) >= MIN_ORDER,
                OrderCreationError::InvalidInputAmount,
            ),
        }

        // Validate the price collar
        match storage::orderbook::v1.last_traded_price.try_read() {
            Some((last_traded_price, _)) => {
                if PRICE_WINDOW > 0 {
                    // Upscale to u256 to avoid overflows
                    let last_price = asm(r: (0u64, 0u64, 0u64, last_traded_price)) {
                        r: u256
                    };
                    let price = asm(r: (0u64, 0u64, 0u64, order_args.price)) {
                        r: u256
                    };
                    let price_window = asm(r: (0u64, 0u64, 0u64, PRICE_WINDOW)) {
                        r: u256
                    };

                    // 0x64u256 = 100u64 - Sway does not support 100u256 so hex must be used.
                    // Price must be +/- a percentage of the price window.
                    // Asserts that price is greater than (last_traded_price * (100 - price_window) / 100)
                    // Asserts that price is less than (last_traded_price * (100 + price_window) / 100)
                    require(
                        price >= (last_price * (0x64u256 - price_window)) / 0x64u256 && price <= (last_price * (0x64u256 + price_window)) / 0x64u256,
                        OrderCreationError::PriceExceedsRange,
                    );
                }
            },
            None => {},
        }

        // Determine the starting price
        let taker_price = match order_args.order_type {
            OrderType::Market => None,
            _ => Some(order_args.price),
        };

        // Execute the match engine
        let order_id = match execute_match_engine(
            taker_price,
            side,
            StorageOrder::new(trader, order_args.quantity, order_args.order_type),
            tx_start_gas,
        ) {
            OrderStatus::Unfilled((storage_order, matched_events)) => {
                // Ensure valid order types for unfilled orders
                // For FillOrKill orders, we cannot be unfilled.
                // For PostOnly orders, we want to ensure the storage_order quantity returned from the execute_match_engine() function 
                //     is the same as the order_args quantity, i.e. nothing has been matched after running through the match engine.
                match order_args.order_type {
                    OrderType::FillOrKill => revert_with_log(OrderCreationError::OrderNotFilled),
                    OrderType::PostOnly => require(
                        storage_order
                            .quantity == order_args
                            .quantity,
                        OrderCreationError::OrderPartiallyFilled,
                    ),
                    _ => {}
                }

                // To insert a new order into the book it can take ~9168 gas.
                // Add to list
                let order_number = match side {
                    Side::Buy => {
                        storage::orderbook::v1.buy_map.set(order_args.price);
                        storage::orderbook::v1.buys.get(order_args.price).push_back(storage_order)
                    },
                    Side::Sell => {
                        storage::orderbook::v1.sell_map.set(order_args.price);
                        storage::orderbook::v1.sells.get(order_args.price).push_back(storage_order)
                    },
                };

                // Construct the order id using the order number from the deque, the price, the order side, and the order type.
                order_id = asm(
                    r: (order_number, order_args.price, side, order_args.order_type),
                ) {
                    r: b256
                };
                OrderCreatedEvent::new(
                    order_id,
                    trader,
                    side,
                    order_args
                        .order_type,
                    order_args
                        .quantity,
                    order_args
                        .price,
                )
                    .log();
                // Uses ~600 gas per iteration
                emit_matched_events(matched_events, Some(order_id));

                order_id
            },
            OrderStatus::Filled((order_id, match_events)) => {
                // Post only orders may not end filled.
                if order_args.order_type == OrderType::PostOnly {
                    revert_with_log(OrderCreationError::OrderPartiallyFilled);
                }

                // Emit the order creation event now as nothing will be stored into storage with a different order ids
                OrderCreatedEvent::new(
                    order_id,
                    trader,
                    side,
                    order_args
                        .order_type,
                    order_args
                        .quantity,
                    order_args
                        .price,
                )
                    .log();
                // Emit match logs after creation
                // Uses ~600 gas per iteration
                emit_matched_events(match_events, None);

                order_id
            },
            OrderStatus::OutOfGas((order_id, match_events)) => {
                // Only valid order types may run out of gas
                match order_args.order_type {
                    OrderType::FillOrKill => revert_with_log(OrderCreationError::OrderNotFilled),
                    OrderType::PostOnly => revert_with_log(OrderCreationError::OrderPartiallyFilled),
                    _ => {}
                }

                OrderCreatedEvent::new(
                    order_id,
                    trader,
                    side,
                    order_args
                        .order_type,
                    order_args
                        .quantity,
                    order_args
                        .price,
                )
                    .log();
                // Uses ~600 gas per iteration
                emit_matched_events(match_events, Some(order_id));
                OrderOutOfGasEvent::new(order_id).log();

                order_id
            }
        };

        // Invariant check if this condition fail the book should stop receiving new actions
        assert_heap_prices();
        order_id
    }

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
    fn cancel_order(order_id: OrderId) -> bool {
        require_not_paused();

        if !cancel_order(order_id, CancelType::Default) {
            return false
        }

        // Invariant check if this condition fail the book should stop receiving new actions
        assert_heap_prices();
        true
    }

    /// Withdraws the settled trade balances of a list of traders.
    ///
    /// # Argument
    ///
    /// * `traders`: [Vec<Identity>] - The list of traders to settle their balances.
    #[storage(read, write)]
    fn settle_balances(traders: Vec<Identity>) {
        for trader in traders.iter() {
            settle_balance(trader);
        }
    }

    /// Withdraws the settled trade balances of a single trader.
    ///
    /// # Argument
    ///
    /// * `trader`: [Identity] - The trader to settle their balance.
    #[storage(read, write)]
    fn settle_balance(trader: Identity) {
        settle_balance(trader);
    }

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
    fn get_order(order_id: OrderId) -> Option<Order> {
        // Deconstruct the order id into it's parts
        let (order_num, price, side, order_type) = match decode_order_id(order_id) {
            Some((n, p, s, t)) => (n, p, s, t),
            None => return None,
        };

        let deque = match side {
            Side::Buy => storage::orderbook::v1.buys.get(price),
            Side::Sell => storage::orderbook::v1.sells.get(price),
        };

        // Convert from StorageOrder type to Order type
        match deque.get(order_num) {
            Some(storage_order) => Some(Order::new(
                order_id,
                storage_order
                    .trader_id,
                side,
                price,
                storage_order
                    .quantity,
                order_type,
            )),
            None => None,
        }
    }

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
    fn get_orders_at_price(side: Side, price: Price) -> Vec<Order> {
        let mut order_vec = Vec::new();
        let deque = match side {
            Side::Buy => storage::orderbook::v1.buys.get(price),
            Side::Sell => storage::orderbook::v1.sells.get(price),
        };

        let (mut deque_index, _, deque_len, _) = deque.get_internal().unwrap_or((0, 0, 0, 0));
        let mut deque_iter = 0;
        while deque_iter < deque_len {
            let storage_order = deque.get(deque_index).unwrap();
            order_vec.push(Order::new(
                asm(r: (deque_index, price, side, storage_order.order_type)) {
                    r: b256
                },
                storage_order
                    .trader_id,
                side,
                price,
                storage_order
                    .quantity,
                storage_order
                    .order_type,
            ));

            deque_index = storage_order.next_order;
            deque_iter += 1;
        }

        order_vec
    }

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
    fn get_heap_price(side: Side, price: Price) -> bool {
        match side {
            Side::Buy => storage::orderbook::v1.buy_map.has(price),
            Side::Sell => storage::orderbook::v1.sell_map.has(price),
        }
    }

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
    fn get_settled_balance_of(trader: Identity) -> (u64, u64) {
        storage::orderbook::v1.settled_balances.get(trader).try_read().unwrap_or((0, 0))
    }

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
    fn get_best_buy() -> Option<Price> {
        storage::orderbook::v1.buy_map.max()
    }

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
    fn get_best_sell() -> Option<Price> {
        storage::orderbook::v1.sell_map.min()
    }

    /// Returns the base asset of this trading pair.
    /// This is set at contract deployment via configurables.
    ///
    /// # Returns
    ///
    /// * `AssetId` - The base asset identifier (e.g., BTC in BTC/USDC)
    fn get_base_asset() -> AssetId {
        BASE_ASSET
    }

    /// Returns the quote asset of this trading pair.
    /// This is set at contract deployment via configurables.
    ///
    /// # Returns
    ///
    /// * `AssetId` - The quote asset identifier (e.g., USDC in BTC/USDC)
    fn get_quote_asset() -> AssetId {
        QUOTE_ASSET
    }

    /// Returns the last traded price and timestamp.
    /// Useful for tracking market activity and price discovery.
    ///
    /// # Returns
    ///
    /// * `(Price, Time)` - Tuple containing:
    ///   - Price: The last execution price
    ///   - Time: Unix timestamp of the last trade
    ///   - Returns (0, 0) if no trades have occurred
    ///
    /// # Storage Access
    ///
    /// - Reads: Last traded price from storage
    #[storage(read)]
    fn get_last_traded_price() -> (Price, Time) {
        storage::orderbook::v1.last_traded_price.try_read().unwrap_or((0, Time::from(0)))
    }

    /// Returns the minimum volume amount to create an order.
    /// Prevents dust orders and ensures economic viability.
    ///
    /// # Returns
    ///
    /// * `u64` - Minimum trade amount (e.g., 20 USDC)
    ///
    /// # Note
    ///
    /// This is a configurable value set at contract deployment
    fn get_minimum_trade_amount() -> u64 {
        MIN_ORDER
    }

    /// Returns the maker fee percentage.
    /// Makers are orders that add liquidity to the order book.
    ///
    /// # Returns
    ///
    /// * `u64` - Fee percentage with 6 decimal precision
    ///   - 1_000_000 represents 100%
    ///   - 200 represents 0.02%
    ///   - 0 means no maker fee
    ///
    /// # Note
    ///
    /// This is a configurable value set at contract deployment
    fn get_maker_fee() -> u64 {
        MAKER_FEE
    }

    /// Returns the taker fee percentage.
    /// Takers are orders that remove liquidity from the order book.
    ///
    /// # Returns
    ///
    /// * `u64` - Fee percentage with 6 decimal precision
    ///   - 1_000_000 represents 100%
    ///   - 200 represents 0.02%
    ///   - 0 means no taker fee
    ///
    /// # Note
    ///
    /// This is a configurable value set at contract deployment
    fn get_taker_fee() -> u64 {
        TAKER_FEE
    }

    fn get_price_precision() -> u64 {
        PRICE_PRECISION
    }

    fn get_quantity_precision() -> u64 {
        QUANTITY_PRECISION
    }

    fn get_whitelist_id() -> Option<ContractId> {
        WHITE_LIST_CONTRACT
    }

    fn get_blacklist_id() -> Option<ContractId> {
        BLACK_LIST_CONTRACT
    }
}

impl OrderBookAdmin for Contract {
    /// Initializes the contract with an owner.
    ///
    /// # Reverts
    ///
    /// * When the contract has already been initialized.
    ///
    /// # Events
    ///
    /// * `FeeEvent`
    #[storage(read, write)]
    fn initialize() {
        match INITIAL_OWNER.owner() {
            Some(owner) => initialize_ownership(owner),
            None => revert_with_log(OrderBookInitializationError::OwnerNotSet),
        }

        OrderBookConfigEvent {
            base_asset: BASE_ASSET,
            quote_asset: QUOTE_ASSET,
            base_decimals: BASE_DECIMALS,
            quote_decimals: QUOTE_DECIMALS,
            min_order: MIN_ORDER,
            maker_fee: MAKER_FEE,
            taker_fee: TAKER_FEE,
            price_precision: PRICE_PRECISION,
            quantity_precision: QUANTITY_PRECISION,
            price_window: PRICE_WINDOW,
            dust: DUST,
            allow_fractional_price: ALLOW_FRACTIONAL_PRICE,
        }
            .log();

        OrderBookSymbolsEvent {
            base_symbol: String::from(from_str_array(BASE_SYMBOL)),
            quote_symbol: String::from(from_str_array(QUOTE_SYMBOL)),
        }
            .log();

        OrderBookWhitelistEvent {
            whitelist: WHITE_LIST_CONTRACT,
        }
            .log();
        OrderBookBlacklistEvent {
            blacklist: BLACK_LIST_CONTRACT,
        }
            .log();

        require(
            BASE_ASSET != AssetId::zero() && QUOTE_ASSET != AssetId::zero(),
            OrderBookInitializationError::InvalidAsset,
        );
        require(
            BASE_DECIMALS >= QUOTE_DECIMALS,
            OrderBookInitializationError::InvalidDecimals,
        );
        require(
            PRICE_WINDOW >= 0 && PRICE_WINDOW <= 100,
            OrderBookInitializationError::InvalidPriceWindow,
        );
        require(MIN_ORDER > 0, OrderBookInitializationError::InvalidMinOrder);

        match BASE_DECIMALS {
            0 => revert_with_log(OrderBookInitializationError::InvalidDecimals),
            _ => {
                // BASE_DECIMALS must be a power of 10.
                let mut dec = BASE_DECIMALS;
                while dec % 10 == 0 {
                    dec /= 10;
                }
                require(dec == 1, OrderBookInitializationError::InvalidDecimals);
            }
        }

        match QUOTE_DECIMALS {
            0 => revert_with_log(OrderBookInitializationError::InvalidDecimals),
            _ => {
                // QUOTE_DECIMALS must be a power of 10.
                let mut dec = QUOTE_DECIMALS;
                while dec % 10 == 0 {
                    dec /= 10;
                }
                require(dec == 1, OrderBookInitializationError::InvalidDecimals);
            }
        }

        match PRICE_PRECISION {
            0 => revert_with_log(OrderBookInitializationError::InvalidPricePrecision),
            _ => {
                // PRICE_PRECISION must be a power of 10.
                let mut dec = PRICE_PRECISION;
                while dec % 10 == 0 {
                    dec /= 10;
                }
                require(
                    dec == 1,
                    OrderBookInitializationError::InvalidPricePrecision,
                );
            }
        }
    }

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
    fn transfer_ownership(new_owner: Identity) {
        transfer_ownership(new_owner);
    }

    /// Force cancels the given orders.
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
    fn force_cancel_orders(orders: Vec<OrderId>) {
        require_paused();
        only_owner();

        for order_id in orders.iter() {
            let _ = cancel_order(order_id, CancelType::ForceCancel);
        }
        // Invariant check if this condition fail the book should stop receiving new actions
        assert_heap_prices();
    }

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
    fn cancel_blacklist_orders(orders: Vec<OrderId>) {
        only_owner();
        require(BLACK_LIST_CONTRACT.is_some(), OrderCancelError::NoBlacklist);

        for order_id in orders.iter() {
            let _ = cancel_order(order_id, CancelType::Blacklist);
        }
        // Invariant check if this condition fail the book should stop receiving new actions
        assert_heap_prices();
    }

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
    fn collect_fees(fee_recipient: Identity) {
        only_owner();

        let fees = storage::orderbook::v1.collected_fees.try_read().unwrap_or((0, 0));
        require(fees != (0, 0), FeeError::NoFeesAvailable);

        transfer(fee_recipient, BASE_ASSET, fees.0);
        transfer(fee_recipient, QUOTE_ASSET, fees.1);

        storage::orderbook::v1.collected_fees.write((0, 0));
    }

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
    fn current_fees() -> (u64, u64) {
        storage::orderbook::v1.collected_fees.try_read().unwrap_or((0, 0))
    }

    /// Emits a log of the fees.
    ///
    /// # Additional Information
    ///
    /// Used when the contract is upgraded and the fee changes.
    ///
    /// # Events
    ///
    /// * `FeeEvent`
    fn emit_orderbook_config() {
        OrderBookConfigEvent {
            base_asset: BASE_ASSET,
            quote_asset: QUOTE_ASSET,
            base_decimals: BASE_DECIMALS,
            quote_decimals: QUOTE_DECIMALS,
            min_order: MIN_ORDER,
            maker_fee: MAKER_FEE,
            taker_fee: TAKER_FEE,
            price_precision: PRICE_PRECISION,
            quantity_precision: QUANTITY_PRECISION,
            price_window: PRICE_WINDOW,
            dust: DUST,
            allow_fractional_price: ALLOW_FRACTIONAL_PRICE,
        }
            .log();
        OrderBookSymbolsEvent {
            base_symbol: String::from(from_str_array(BASE_SYMBOL)),
            quote_symbol: String::from(from_str_array(QUOTE_SYMBOL)),
        }
            .log();
        OrderBookWhitelistEvent {
            whitelist: WHITE_LIST_CONTRACT,
        }
            .log();
        OrderBookBlacklistEvent {
            blacklist: BLACK_LIST_CONTRACT,
        }
            .log();
    }
}

impl SRC5 for Contract {
    #[storage(read)]
    fn owner() -> State {
        _owner()
    }
}

impl Pausable for Contract {
    #[storage(write)]
    fn pause() {
        only_owner();
        _pause();
    }

    #[storage(write)]
    fn unpause() {
        only_owner();
        _unpause();
    }

    #[storage(read)]
    fn is_paused() -> bool {
        _is_paused()
    }
}

/// Matches a new order against existing orders in the book.
/// Executes trades when price conditions are met.
///
/// # Arguments
///
/// * `taker_price` - Some(limit price) of the incoming order or None Market order.
/// * `side` - Whether this is a buy or sell order
/// * `taker_order` - The order details to match
///
/// # Returns
///
/// * `OrderStatus` - Either Filled (completely matched) or Unfilled (partially matched or no match)
///
/// # Matching Logic
///
/// - Buy orders match with sells at or below the buy price
/// - Sell orders match with buys at or above the sell price
/// - Orders are matched in price-time priority
/// - Fees are deducted during matching
#[storage(read, write)]
fn execute_match_engine(
    taker_price: Option<u64>,
    side: Side,
    taker_order: StorageOrder,
    tx_start_gas: u64,
) -> OrderStatus {
    let mut taker_order = taker_order;
    // A buffer of matches to be emitted later
    let mut matched_events_buffer: Vec<OrderMatchedEvent> = Vec::new();
    // A temporary order id for orders that have yet to be stored into storage
    let mut temp_order_id = storage::orderbook::v1.temp_order_id.try_read().unwrap_or(0x000000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFF);
    // The amount owed to the taker
    let mut taker_coins = 0;
    // The amount of base asset fees the owner will get
    let mut base_fees = 0;
    // The amount of quote asset fees the owner will get
    let mut quote_fees = 0;
    // The last price at which a price was performed
    let mut last_traded_price: Option<u64> = None;
    // The total number of orders completed
    let mut total_matches = 0;
    // The number of matches made at the same price
    let mut same_level_matches = 0;
    // The number of matches made at a different price level
    let mut multi_level_matches = 0;
    // A bool to keep track of whether we ran out of gas
    let mut out_of_gas = false;

    // The number of tokens remaining that the taker provided.
    let mut taker_remainder_coins = msg_amount();
    // The amount of quantity remaining that the taker provided.
    // - On a limit order, it is the quantity of the taker.
    // - On a market order, it is the coins of the taker.
    let mut taker_remainder_trade = match taker_price {
        // Limit order: quantity bounded
        Some(_) => taker_order.quantity,
        // Market buy: bound by coins
        None => taker_remainder_coins,
    };

    // Get the starting price based on the taker price and best price
    let mut best_price = match get_best_price(taker_price, side) {
        Some(price) => price,
        None => {
            // No price occurs when there is no liquidity/price to match at for a market order.
            update_temp_order_id(temp_order_id);

            // Return the assets sent        
            match side {
                Side::Buy => transfer(taker_order.trader_id, QUOTE_ASSET, taker_remainder_coins),
                Side::Sell => transfer(taker_order.trader_id, BASE_ASSET, taker_remainder_coins),
            }

            return OrderStatus::Filled((temp_order_id, matched_events_buffer.as_raw_slice()));
        }
    };

    // Get the list of trades which are at this price bracket
    let mut maker_list = match side {
        Side::Sell => {
            storage::orderbook::v1.buys.get(best_price)
        },
        Side::Buy => {
            storage::orderbook::v1.sells.get(best_price)
        },
    };

    let mut maker_list_len = maker_list.len().try_read().unwrap_or(0);
    if maker_list_len == 0 {
        // There are no trades to match with so return
        // Market order will never reach this because they would return earlier with no price to match at.
        return OrderStatus::Unfilled((taker_order, matched_events_buffer.as_raw_slice()));
    }

    // Get the head of the list
    let mut maker_list_head_index = maker_list.unsafe_get_head_index();
    // The remainder of the head order in the maker list.
    let mut maker_remainder = maker_list.unsafe_read_remainder();

    while taker_remainder_trade > 0 && maker_list_len != 0 {
        // This section takes at most ~11826 gas.
        // Get the storage key, opposite maker_trade, and it's order number
        let (maker_storage_key, mut maker_trade) = maker_list.unsafe_get(maker_list_head_index);
        let maker_order_id = asm(
            val: (maker_list_head_index, best_price, !side, maker_trade.order_type),
        ) {
            val: b256
        };

        // Compute how much the taker can actually afford at this price level
        let taker_possible_quantity = match (taker_price, side) {
            // Limit order: already quantity bounded
            (Some(_), _) => taker_remainder_trade,
            // Market buy: bound by remaining quote coins
            (None, Side::Buy) => quote_quantity_from_amount(taker_remainder_coins, best_price),
            // Market sell: bounded by base tokens directly
            (None, Side::Sell) => taker_remainder_trade,
        };

        // The amount to fill based on buy or sell. Always take the smaller quantity.
        let fill_quantity: u64 = taker_possible_quantity.min(maker_trade.quantity);
        let quote_coins = quote_coins_from_quantity(fill_quantity, best_price);

        // Nothing to fill, nothing can be matched
        if fill_quantity == 0 || quote_coins == 0{
            break;
        }

        // Subtract what has been matched from what is available for both sides
        // and update the taker's coins alloted to them
        maker_trade.quantity -= fill_quantity;
        match side {
            Side::Buy => {
                taker_remainder_coins -= quote_coins;
                taker_remainder_trade -= match taker_price {
                    // Limit order: quantity bound
                    Some(_) => fill_quantity,
                    // Market order: coin bound
                    None => quote_coins,
                };
                taker_coins += fill_quantity; // Base asset is 1:1
            },
            Side::Sell => {
                taker_remainder_coins -= fill_quantity; // Base asset is 1:1
                taker_remainder_trade -= fill_quantity;
                taker_coins += quote_coins;
            },
        }

        // Settle the maker trade
        settle_maker_trade(
            maker_trade,
            fill_quantity,
            quote_coins,
            !side,
            base_fees,
            quote_fees,
        );

        last_traded_price = Some(best_price);
        matched_events_buffer.push(OrderMatchedEvent::new(maker_order_id, temp_order_id, fill_quantity, best_price)); // Wrong
        total_matches += 1;

        // Update book of the maker for this trade
        // This section takes ~8796 gas.
        if maker_trade.quantity == 0 { // Order completely filled
            // If the maker is the buy side and has a remainder but the quantity is fully filled, handle the dust
            // TODO: Handle maker dust
            // if !side == Side::Buy && maker_remainder > 0 {
            //     // Handle remainder
            //     settle_maker_dust(maker_trade, maker_remainder, quote_coins, maker_list);
            // }

            // Remove the order from the book
            remove_order(
                maker_trade,
                maker_storage_key,
                side,
                best_price,
                taker_price,
                maker_list_len,
                maker_list_head_index,
                maker_remainder,
                maker_list,
                same_level_matches,
                multi_level_matches,
            );
        } else {
            // The maker quantity did not get filled, which means the taker is filled.
            // Finish the trade and stop matching.
            finalize_maker_side(
                maker_trade,
                maker_storage_key,
                maker_order_id,
                !side,
                best_price,
                taker_price,
                quote_coins,
                fill_quantity,
                maker_list_len,
                maker_list_head_index,
                maker_remainder,
                maker_list,
                same_level_matches,
                multi_level_matches,
            );
        }

        // If there is not enough gas to store the order, stop matching
        // Needs to account for the gas needed to insert into storage and the gas needed to emit all events
        if tx_start_gas > MIN_GAS
                && global_gas() <= BASE_GAS + (MATCH_EVENT_GAS * total_matches) + (MATCH_SINGLE_LEVEL_GAS * same_level_matches) + (MATCH_MULTI_LEVEL_GAS * multi_level_matches)
        {
            out_of_gas = true;
            break;
        }
    }

    // This section takes ~5545 gas
    // If the maker price level still has orders, update the list with the new length
    if maker_list_len > 0 {
        maker_list.unsafe_write_len(maker_list_len);
        maker_list.unsafe_set_head(maker_list_head_index);
    }

    // Assign the final order quantity based on what is remaining
    taker_order.quantity = match taker_price {
        // Limit order: quantity bound
        Some(_) => taker_remainder_trade,
        // Market order: coin bound
        None(_) => match side {
            Side::Buy => quote_quantity_from_amount(taker_remainder_trade, best_price),
            Side::Sell => taker_remainder_trade,
        },
    };

    // Settle the taker's coins
    settle_taker_trade(taker_order, taker_coins, side, base_fees, quote_fees);
    if base_fees != 0 || quote_fees != 0 {
        let current_fees = storage::orderbook::v1.collected_fees.try_read().unwrap_or((0, 0));
        storage::orderbook::v1
            .collected_fees
            .write((current_fees.0 + base_fees, current_fees.1 + quote_fees));
    }

    // Update the traded price
    if last_traded_price.is_some() {
        storage::orderbook::v1
            .last_traded_price
            .write((last_traded_price.unwrap(), Time::now()));
    }

    // Determine the final status of the order
    if out_of_gas {
        // The order ran out of gas
        update_temp_order_id(temp_order_id);

        // Return any funds that did not get matched before we ran out of gas
        match side {
            Side::Buy => transfer(taker_order.trader_id, QUOTE_ASSET, taker_remainder_coins),
            Side::Sell => transfer(taker_order.trader_id, BASE_ASSET, taker_remainder_coins),
        }

        return OrderStatus::OutOfGas((temp_order_id, matched_events_buffer.as_raw_slice()));
    } else if taker_order.quantity == 0 {
        // If the taker has been completely filled, the quantity is zero.
        update_temp_order_id(temp_order_id);

        match side {
            // Only the buy side can have dust
            Side::Buy => settle_taker_dust(taker_order, taker_remainder_coins, taker_price),
            _ => {},
        }

        return OrderStatus::Filled((temp_order_id, matched_events_buffer.as_raw_slice()));
    } else if taker_price.is_none() {
        // This was a market order with no specified price and has remaining funds
        update_temp_order_id(temp_order_id);

        // Return the funds that did not get matched before we ran out of liquidity
        // We can safely assume taker_remainder_coins > 0 here because we checked if taker_order.quantity == 0
        match side {
            Side::Buy => transfer(taker_order.trader_id, QUOTE_ASSET, taker_remainder_coins),
            Side::Sell => transfer(taker_order.trader_id, BASE_ASSET, taker_remainder_coins),
        }

        return OrderStatus::Filled((temp_order_id, matched_events_buffer.as_raw_slice()));
    } else {
        // The order was not completely filled, so now it gets stored
        // Only limit orders may be Unfilled.
        match side {
            // Only the buy side can have dust
            Side::Buy => settle_taker_dust(taker_order, taker_remainder_coins, taker_price),
            _ => {},
        }

        return OrderStatus::Unfilled((taker_order, matched_events_buffer.as_raw_slice()));
    }
}

#[storage(read)]
fn get_best_price(taker_price: Option<u64>, side: Side) -> Option<u64> {
    match side {
        Side::Buy => {
            // Get the minimum sell price
            match (storage::orderbook::v1.sell_map.min(), taker_price) {
                (Some(maker_price), Some(taker_price)) => {
                    // If the minium sell price is less than the taker price, match with it
                    if maker_price < taker_price {
                        Some(maker_price)
                    } else {
                        Some(taker_price)
                    }
                },
                (Some(maker_price), None) => Some(maker_price),
                (None, Some(taker_price)) => Some(taker_price),
                (None, None) => None,
            }
        },
        Side::Sell => {
            // Get the maximum buy price
            match (storage::orderbook::v1.buy_map.max(), taker_price) {
                (Some(maker_price), Some(taker_price)) => {
                    // If the maximum buy price is greater than the taker price, match with it
                    if maker_price > taker_price {
                        Some(maker_price)
                    } else {
                        Some(taker_price)
                    }
                },
                (Some(maker_price), None) => Some(maker_price),
                (None, Some(taker_price)) => Some(taker_price),
                (None, None) => None,
            }
        },
    }
}

#[storage(read, write)]
fn update_temp_order_id(temp_order_id: b256) {
    // Update the new temp order id so this one isn't used again.
    let upper_temp_order_id = (temp_order_id >> 64).as_u256() + 1; // shift right 64 bits: upper 192 bits
    let result = (upper_temp_order_id.as_b256() << 64) | 0x000000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFF; // Shift back to upper 192 bits
    storage::orderbook::v1.temp_order_id.write(result);
}

#[storage(read, write)]
fn next_price_level(
    side: Side,
    ref mut best_price: u64,
    taker_price: Option<u64>,
    ref mut maker_list_len: u64,
    ref mut maker_list_head_index: u64,
    ref mut maker_remainder: u64,
    ref mut maker_list: StorageKey<SparseDeque>,
) {
    match side {
        Side::Buy => {
            // Remove from the sells
            storage::orderbook::v1.sell_map.unset(best_price);

            // Get the next price level
            match (storage::orderbook::v1.sell_map.min(), taker_price) {
                (Some(maker_price), Some(taker_price)) => {
                    if maker_price <= taker_price {
                        update_matching_internals(
                            maker_price,
                            side,
                            best_price,
                            maker_list_len,
                            maker_list_head_index,
                            maker_remainder,
                            maker_list,
                        );
                    }
                },
                (Some(maker_price), None) => update_matching_internals(
                    maker_price,
                    side,
                    best_price,
                    maker_list_len,
                    maker_list_head_index,
                    maker_remainder,
                    maker_list,
                ),
                _ => {},
            }
        }
        Side::Sell => {
            // Remove from the buys
            storage::orderbook::v1.buy_map.unset(best_price);

            // Get the next price level
            match (storage::orderbook::v1.buy_map.max(), taker_price) {
                (Some(maker_price), Some(taker_price)) => {
                    if maker_price >= taker_price {
                        update_matching_internals(
                            maker_price,
                            side,
                            best_price,
                            maker_list_len,
                            maker_list_head_index,
                            maker_remainder,
                            maker_list,
                        );
                    }
                },
                (Some(maker_price), None) => update_matching_internals(
                    maker_price,
                    side,
                    best_price,
                    maker_list_len,
                    maker_list_head_index,
                    maker_remainder,
                    maker_list,
                ),
                _ => {},
            }
        },
    }
}

#[storage(read)]
fn update_matching_internals(
    maker_price: u64,
    side: Side,
    ref mut best_price: u64,
    ref mut maker_list_len: u64,
    ref mut maker_list_head_index: u64,
    ref mut maker_remainder: u64,
    ref mut maker_list: StorageKey<SparseDeque>,
) {
    best_price = maker_price;
    maker_list = match side {
        Side::Buy => storage::orderbook::v1.sells.get(best_price),
        Side::Sell => storage::orderbook::v1.buys.get(best_price),
    };
    let (read_head, _, read_len, read_remainder) = maker_list.unsafe_get_internal();
    maker_list_len = read_len;
    maker_list_head_index = read_head;
    maker_remainder = read_remainder;
}

/// Handles cases for when the taker's order has fully filled and there is a
///remaining number of maker coins left
#[storage(read, write)]
fn finalize_maker_side(
    ref mut maker_trade: StorageOrder,
    maker_storage_key: StorageKey<StorageOrder>,
    maker_order_id: b256,
    side: Side,
    ref mut best_price: u64,
    taker_price: Option<u64>,
    quote_coins: u64,
    fill_quantity: u64,
    ref mut maker_list_len: u64,
    ref mut maker_list_head_index: u64,
    ref mut maker_remainder: u64,
    ref mut maker_list: StorageKey<SparseDeque>,
    ref mut same_level_matches: u64,
    ref mut multi_level_matches: u64,
) {
    match side {
        Side::Sell => {
            // The maker is providing base
            if quote_zero(maker_trade.quantity, best_price) {
                // If the quantity and price results in zero quote, remove the trade and return any remaining base
                remove_order(
                    maker_trade,
                    maker_storage_key,
                    !side,
                    best_price,
                    taker_price,
                    maker_list_len,
                    maker_list_head_index,
                    maker_remainder,
                    maker_list,
                    same_level_matches,
                    multi_level_matches,
                );

                // Add the remainder to maker's settled balances
                let maker_balance = storage::orderbook::v1.settled_balances.get(maker_trade.trader_id).try_read().unwrap_or((0, 0));
                storage::orderbook::v1
                    .settled_balances
                    .insert(
                        maker_trade
                            .trader_id,
                        (maker_balance.0 + maker_trade.quantity, maker_balance.1),
                    );
                OrderTooSmallEvent::new(maker_order_id).log();
            } else {
                // Order filled partially, just update to the new quantity
                maker_storage_key.write(maker_trade);
            }
        },
        Side::Buy => {
            // Keep track of the number of quote coins in the order so we can calculate the remainder on the next match.
            // TODO: Handle maker dust
            // if maker_remainder == 0 {
            //     // If the remainder is zero, store a new remainder based on the original quantity and the number of quote coins matched
            //     let remaining_coins = quote_coins_from_quantity(maker_trade.quantity + fill_quantity, best_price) - quote_coins;
            //     if remaining_coins > 0 {
            //         maker_list.unsafe_write_remainder(remaining_coins);
            //     }
            // } else {
            //     // Subtract the quote coins in this trade
            //     maker_list.unsafe_write_remainder(maker_remainder - quote_coins);
            // }

            maker_storage_key.write(maker_trade);
        }
    }
}

/// Removes the order from the book
#[storage(read, write)]
pub fn remove_order(
    ref mut maker_trade: StorageOrder,
    maker_storage_key: StorageKey<StorageOrder>,
    side: Side,
    ref mut best_price: u64,
    taker_price: Option<u64>,
    ref mut maker_list_len: u64,
    ref mut maker_list_head_index: u64,
    ref mut maker_remainder: u64,
    ref mut maker_list: StorageKey<SparseDeque>,
    ref mut same_level_matches: u64,
    ref mut multi_level_matches: u64,
) {
    maker_list.unsafe_remove(maker_storage_key);
    maker_list_len -= 1;
    maker_list_head_index = maker_trade.next_order;

    // If we've exhausted all trades at this price level, update the price heap
    // and move on to the next price level if there is one
    if maker_list_len == 0 {
        // Delete the list
        maker_list.unsafe_clear();
        multi_level_matches += 1;
        next_price_level(
            side,
            best_price,
            taker_price,
            maker_list_len,
            maker_list_head_index,
            maker_remainder,
            maker_list,
        );
    } else {
        same_level_matches += 1;
    }
}

/// Settles a trade from the taker's perspective.
/// Handles asset transfers and fee deductions for the aggressive order.
///
/// # Arguments
///
/// * `taker` - The identity of the taker
/// * `side` - The side of the taker's order
/// * `price` - The execution price
/// * `quantity` - The amount of base asset traded
/// * `remainder` - Any remaining unfilled quantity
///
/// # Storage Access
///
/// - Writes: Updates settled balances and collected fees
#[storage(read, write)]
fn settle_taker_trade(
    taker_order: StorageOrder,
    taker_coins: u64,
    side: Side,
    ref mut base_fees: u64,
    ref mut quote_fees: u64,
) {
    if taker_coins > 0 {
        // Compute fee and send quote or base
        let (taker_coins, taker_fee) = subtract_taker_fee(taker_coins);
        let taker_balance = storage::orderbook::v1.settled_balances.get(taker_order.trader_id).try_read().unwrap_or((0, 0));

        match side {
            Side::Buy => {
                base_fees += taker_fee;

                storage::orderbook::v1
                    .settled_balances
                    .insert(
                        taker_order
                            .trader_id,
                        (taker_balance.0 + taker_coins, taker_balance.1),
                    );
            },
            Side::Sell => {
                quote_fees += taker_fee;

                storage::orderbook::v1
                    .settled_balances
                    .insert(
                        taker_order
                            .trader_id,
                        (taker_balance.0, taker_balance.1 + taker_coins),
                    );
            },
        }
    }
}

/// Settles a trade from the maker's perspective.
/// Handles asset transfers and fee deductions for the passive order.
///
/// # Arguments
///
/// * `maker` - The identity of the maker
/// * `side` - The side of the maker's order
/// * `price` - The execution price
/// * `quantity` - The amount of base asset traded
///
/// # Storage Access
///
/// - Writes: Updates settled balances and collected fees
#[storage(read, write)]
fn settle_maker_trade(
    maker_order: StorageOrder,
    fill_quantity: u64,
    quote_coins: u64,
    side: Side,
    ref mut base_fees: u64,
    ref mut quote_fees: u64,
) {
    let maker_balance = storage::orderbook::v1.settled_balances.get(maker_order.trader_id).try_read().unwrap_or((0, 0));

    match side {
        Side::Buy => {
            // Use the fill quantity(base coins) here because the maker is buying
            let (maker_amount, maker_fee) = subtract_maker_fee(fill_quantity);
            base_fees += maker_fee;

            storage::orderbook::v1
                .settled_balances
                .insert(
                    maker_order
                        .trader_id,
                    (maker_balance.0 + maker_amount, maker_balance.1),
                );
        },
        Side::Sell => {
            // Use the quote coins here because the maker is selling
            let (maker_amount, maker_fee) = subtract_maker_fee(quote_coins);
            quote_fees += maker_fee;

            storage::orderbook::v1
                .settled_balances
                .insert(
                    maker_order
                        .trader_id,
                    (maker_balance.0, maker_balance.1 + maker_amount),
                );
        },
    }
}

#[storage(read, write)]
fn settle_balance(trader: Identity) {
    match storage::orderbook::v1.settled_balances.get(trader).try_read() {
        Some(balances) => {
            let _ = storage::orderbook::v1.settled_balances.get(trader).clear();

            if balances.0 > 0 {
                transfer(trader, BASE_ASSET, balances.0);
            }
            if balances.1 > 0 {
                transfer(trader, QUOTE_ASSET, balances.1);
            }

            WithdrawSettledTradeEvent::new(trader, balances.0, balances.1)
                .log();
        },
        None => {},
    }
}

fn settle_taker_dust(
    taker_order: StorageOrder,
    taker_remainder_coins: u64,
    taker_price: Option<u64>,
) {
    if taker_remainder_coins > 0 {
        match taker_price {
            // Limit order: Compute dust based on order quantity
            Some(taker_price) => {
                // If there are tokens remaining(dust), determine the return amount to fit the new quantity
                let return_amount = taker_remainder_coins - quote_coins_from_quantity(taker_order.quantity, taker_price);
                if return_amount > DUST {
                    transfer(taker_order.trader_id, QUOTE_ASSET, return_amount);
                }
            },
            // Market order: Return any dust.
            None => transfer(taker_order.trader_id, QUOTE_ASSET, taker_remainder_coins),
        }
    }
}

#[storage(read, write)]
fn settle_maker_dust(
    maker_trade: StorageOrder,
    ref mut maker_remainder: u64,
    quote_coins: u64,
    ref mut maker_list: StorageKey<SparseDeque>,
) {
    // The maker is buying and providing quote
    let total_remainder = maker_remainder - quote_coins;
    if total_remainder > 0 {
        // Add the remainder to maker's settled balances
        let maker_balance = storage::orderbook::v1.settled_balances.get(maker_trade.trader_id).try_read().unwrap_or((0, 0));
        storage::orderbook::v1
            .settled_balances
            .insert(
                maker_trade
                    .trader_id,
                (maker_balance.0, maker_balance.1 + total_remainder),
            );
        // Reset the remainder
        maker_list.unsafe_write_remainder(0);
    }
    maker_remainder = 0;
}

/// Cancels an order.
#[storage(read, write)]
fn cancel_order(order_id: OrderId, cancel_type: CancelType) -> bool {
    let (order_num, price, side, _order_type) = match decode_order_id(order_id) {
        Some((n, p, s, t)) => (n, p, s, t),
        None => return false,
    };

    let sender = msg_sender().unwrap();
    let deque = match side {
        Side::Buy => storage::orderbook::v1.buys.get(price),
        Side::Sell => storage::orderbook::v1.sells.get(price),
    };

    let order = deque.get(order_num);
    if order.is_none() {
        // Avoid failing when canceling orders that do not exist just return false
        // This is done to avoid issues when orders have been executed before the
        // cancel action was executed
        return false;
    }
    let order = order.unwrap();

    match cancel_type {
        CancelType::Default => require(order.trader_id == sender, OrderCancelError::NotOrderOwner),
        CancelType::Blacklist => require(
            balance_of(
                BLACK_LIST_CONTRACT
                    .unwrap(),
                AssetId::new(BLACK_LIST_CONTRACT.unwrap(), order.trader_id.bits()),
            ) > 0,
            OrderCancelError::TraderNotBlacklisted,
        ),
        CancelType::ForceCancel => {},
    }

    // Get the coins which are owed.
    let coins_to_return = match side {
        Side::Buy => {
            // TODO: Handle dust
            // if deque.unsafe_get_head_index() == order_num {
            //     // If the canceled order is the head, it might have been partially matched and have a remainder
            //     let remaining = deque.unsafe_read_remainder();
            //     if remaining > 0 {
            //         remaining
            //     } else {
            //         quote_coins_from_quantity(order.quantity, price)
            //     }
            // } else {
                quote_coins_from_quantity(order.quantity, price)
            // }
        },
        Side::Sell => order.quantity,
    };

    let _ = deque.remove(order_num);
    // Update the minimum and maximum prices
    if deque.len().try_read().unwrap_or(0) == 0 {
        match side {
            Side::Buy => {
                storage::orderbook::v1.buy_map.unset(price);
            },
            Side::Sell => {
                storage::orderbook::v1.sell_map.unset(price);
            },
        }
    }

    match cancel_type {
        CancelType::Default => {
            match side {
                Side::Buy => transfer(order.trader_id, QUOTE_ASSET, coins_to_return),
                Side::Sell => transfer(order.trader_id, BASE_ASSET, coins_to_return),
            };
            OrderCancelledEvent::new(order_id).log();
        },
        _ => {
            let trader_balance = storage::orderbook::v1.settled_balances.get(order.trader_id).try_read().unwrap_or((0, 0));
            match side {
                Side::Buy => storage::orderbook::v1.settled_balances.insert(
                    order.trader_id,
                    (trader_balance.0, trader_balance.1 + coins_to_return),
                ),
                Side::Sell => storage::orderbook::v1.settled_balances.insert(
                    order.trader_id,
                    (trader_balance.0 + coins_to_return, trader_balance.1),
                ),
            };
            OrderCancelledInternalEvent::new(order_id).log();
        }
    }

    true
}

/// Calculates the maker fee deduction from a trade amount.
///
/// # Arguments
///
/// * `amount` - The gross trade amount
///
/// # Returns
///
/// * `(u64, u64)` - Tuple of (net amount after fee, fee amount)
fn subtract_maker_fee(amount: u64) -> (u64, u64) {
    // If the fee is 0, return the amount as is
    let fee = if MAKER_FEE > 0 {
        // 0xF4240u256 = 1_000_000u64
        ((amount.as_u256() * MAKER_FEE.as_u256()) / 0xF4240u256).try_into().unwrap()
    } else {
        0
    };
    (amount - fee, fee)
}

/// Calculates the taker fee deduction from a trade amount.
///
/// # Arguments
///
/// * `amount` - The gross trade amount
///
/// # Returns
///
/// * `(u64, u64)` - Tuple of (net amount after fee, fee amount)
fn subtract_taker_fee(amount: u64) -> (u64, u64) {
    // If the fee is 0, return the amount as is
    let fee = if TAKER_FEE > 0 {
        // 0xF4240u256 = 1_000_000u64
        ((amount.as_u256() * TAKER_FEE.as_u256()) / 0xF4240u256).try_into().unwrap()
    } else {
        0
    };
    (amount - fee, fee)
}

/// Converts a base asset quantity to quote asset amount at a given price.
/// Used for calculating the quote amount needed for buy orders.
///
/// # Arguments
///
/// * `quantity` - The base asset amount
/// * `price` - The price per unit of base asset
///
/// # Returns
///
/// * `u64` - The equivalent quote asset amount
///
/// # Formula
///
/// quote_amount = (quantity * price) / BASE_DECIMALS
fn quote_coins_from_quantity(quantity: u64, price: u64) -> u64 {
    let total = quantity.as_u256() * price.as_u256();
    (total / BASE_DECIMALS.as_u256()).try_into().unwrap()
}

/// Converts quote amount to base quantity
pub fn quote_quantity_from_amount(amount: u64, price: u64) -> u64 {
    ((amount.as_u256() * BASE_DECIMALS.as_u256()) / price.as_u256()).try_into().unwrap()
}

#[storage(read)]
fn assert_heap_prices() {
    let highest_buy_price = storage::orderbook::v1.buy_map.max();
    let lowest_sell_price = storage::orderbook::v1.sell_map.min();
    if lowest_sell_price.is_some()
        && highest_buy_price.is_some()
    {
        require(
            lowest_sell_price
                .unwrap() > highest_buy_price
                .unwrap(),
            OrderCreationError::InvalidHeapPrices((lowest_sell_price.unwrap(), highest_buy_price.unwrap())),
        );
    }
}

/// Returns `true` if the quantity and price calculation would be truncated under fractional orders.
///
/// # Additional Information
///
/// Example: For a quantity of 10 and decimals of 100, the price would need to either be 100 or 110
/// to ensure we do not have a fractional amount of quote tokens i.e. price of 109 would be 10.9 quote coins.
///
/// # Arguments
///
/// * `quantity` - The base asset amount
/// * `price` - The price per unit of base asset
///
/// # Returns
///
/// * `bool` - `true` if the price and quantity combination would be truncated when dividing by BASE_DECIMALS
fn quote_would_truncate(quantity: u64, price: u64) -> bool {
    let total = quantity.as_u256() * price.as_u256();
    total % BASE_DECIMALS.as_u256() != 0
}

/// Returns `true` if total is less than the base decimals resulting in zero.
///
/// # Additional Information
///
/// This is to ensure the quote amount of a trade will never be zero.
///
/// # Arguments
///
/// * `quantity` - The base asset amount
/// * `price` - The price per unit of base asset
///
/// # Returns
///
/// * `bool` - `true` if the price and quantity combination would be truncated when dividing by BASE_DECIMALS
fn quote_zero(quantity: u64, price: u64) -> bool {
    quantity.as_u256() * price.as_u256() < BASE_DECIMALS.as_u256()
}

fn emit_matched_events(slice: raw_slice, fill_id: Option<b256>) {
    let ptr = slice.ptr();
    let len = slice.len::<OrderMatchedEvent>();
    let mut iter = 0;
    while iter < len {
        match fill_id {
            Some(id) => {
                log(
                    asm(
                        ptr: ptr,
                        offset: iter * 88,
                        order_offset: iter * 88 + 32,
                        order_id: id,
                        order_id_len: 32,
                        new,
                        order_ptr,
                    ) {
                        add order_ptr ptr order_offset;
                        mcp order_ptr order_id order_id_len;
                        add new ptr offset;
                        new: OrderMatchedEvent
                    },
                );
            },
            None => {
                log(
                    asm(ptr: ptr, offset: iter * 88, new) {
                        add new ptr offset;
                        new: OrderMatchedEvent
                    },
                );
            }
        }
        iter += 1;
    }
}

fn decode_order_id(order_id: OrderId) -> Option<(u64, u64, Side, OrderType)> {
    let (order_num, price, side, order_type) = asm(id: order_id) {
        id: (u64, u64, u64, u64)
    };

    // Assert the order_id input is valid
    if (order_type != 1 && order_type != 3) || side > 1 {
        return None;
    }

    // Convert from u64 to Side
    let side = asm(src: __addr_of(side), len: 8, dst) {
        aloc len;
        move dst hp;
        mcp dst src len;
        dst: Side
    };

    // Convert from u64 to OrderType
    let order_type = asm(src: __addr_of(order_type), len: 8, dst) {
        aloc len;
        move dst hp;
        mcp dst src len;
        dst: OrderType
    };

    Some((order_num, price, side, order_type))
}
