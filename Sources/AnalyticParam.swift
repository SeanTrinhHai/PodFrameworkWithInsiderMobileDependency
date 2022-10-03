protocol EventMapper {
    var nameMap: [EventName: String] { get }
    var paramMap: [Param: String] { get }
}

extension EventMapper {
    func callAsFunction(_ params: [Param: Any]) -> [String: Any] {
        params.mapKeys { paramMap[$0] }
    }
}

public enum EventName: String {
    case SELECT_CONTENT
    case PRE_PURCHASE
    case PURCHASE
}

public enum Param: String {
    case AFFILIATION
    case CONTENT_TYPE
    case CONTENT_GROUP
    case COUPON
    case CURRENCY
    case DISCOUNT
    case EMAIL
    case EMAIL_HASHED
    case FLAG_SPLIT_ORDER
    case ITEM_ID
    case ITEM_NAME
    case ITEM_BRAND
    case ITEM_CATEGORY_URL_KEY
    case ITEM_CATEGORY_ID
    case ITEM_CATEGORY
    case ITEM_CATEGORY2
    case ITEM_CATEGORY3
    case ITEM_CATEGORY4
    case ITEM_CATEGORY5
    case ITEM_VARIANT
    case PRODUCT_IMAGE_URL
    case ORDER_COUNT
    case PACKAGES
    case PAGE_TYPE
    case PAYMENT_TYPE
    case SHIPPING
    case SHIPPING_TIER
    case DELIVERY_METHOD
    case OMNI_DELIVERY
    case T1_AMOUNT
    case T1_POINTS
    case T1_REDEEM
    case TAX
    case TOTAL
    case TRANSACTION_ID
    case EVENT_GROUP_ID
    case VALUE
    case BRANCH
    case URL
    case PRICE_ORIGINAL
    case PRICE
    case TAXONOMY
    case QUANTITY
    case INDEX
}

extension Dictionary {
	static func + (lhs: [Key: Value], rhs: [Key: Value]) -> [Key: Value] {
		lhs.merging(rhs) { $1 }
	}

	func mapKeys<Transformed>(
		_ transform: (Key) -> Transformed?,
		uniquingKeysWith combine: (Value, Value) -> Value = { $1 }
	) -> [Transformed: Value] {
		.init(
			compactMap { (key, value) in
				transform(key).map { ($0, value) }
			},
			uniquingKeysWith: combine
		)
	}
}
