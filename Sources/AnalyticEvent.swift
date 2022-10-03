public struct AnalyticEvent {
    let name: EventName
    let params: [Param: Any]
    let items: [[Param: Any]]?

    public init(name: EventName,
                transactionId: String? = nil,
                value: Double? = nil,
                tax: Double? = nil,
                shipping: Double? = nil,
                shippingTier: String? = nil,
                deliveryMethod: String? = nil,
                omniDelivery: String? = nil,
                coupon: String? = nil,
                discount: Double? = nil,
                currency: String? = nil,
                paymentType: String? = nil,
                flagSplitOrder: String? = nil,
                packages: String? = nil,
                t1Amount: Double? = nil,
                t1Points: Int? = nil,
                t1Redeem: String? = nil,
                email: String? = nil,
                affiliation: String? = "App Store",
                items: [AnalyticProductItem]? = nil) {
        self.name = name
        var params: [Param: Any] = [:]
        params[.TRANSACTION_ID] = transactionId
        params[.VALUE] = value
        params[.TAX] = tax
        params[.SHIPPING] = shipping
        params[.SHIPPING_TIER] = shippingTier
        params[.DELIVERY_METHOD] = deliveryMethod
        params[.OMNI_DELIVERY] = omniDelivery
        params[.COUPON] = coupon
        params[.DISCOUNT] = discount
        params[.CURRENCY] = currency
        params[.PAYMENT_TYPE] = paymentType
        params[.FLAG_SPLIT_ORDER] = flagSplitOrder
        params[.PACKAGES] = packages
        params[.T1_AMOUNT] = t1Amount
        params[.T1_POINTS] = t1Points
        params[.T1_REDEEM] = t1Redeem
        params[.EMAIL] = email
        params[.AFFILIATION] = affiliation
        self.params = params
        self.items = items.map { $0.map(\.params) }
    }
}
