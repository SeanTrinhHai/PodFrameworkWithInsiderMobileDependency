import InsiderMobile

public struct InsiderProviderAdapter: ProviderAdapter {
    private var mapper = InsiderEventMapper()

    public init() {}

    public func logEvent(_ name: EventName, _ params: [Param: Any], _ items: [[Param: Any]]?) {
        guard let mappedName = mapper.nameMap[name] else { return }
        let event = Insider.tagEvent(mappedName)
        event?.addParameters()(mapper(params))
        event?.build()
        guard name == .PURCHASE, let items = items,
              let id = params[.TRANSACTION_ID] as? String else { return }
		items.forEach { _ in Insider.itemPurchased(withSaleID: id, product: .init(params , mapper)) }
    }
}

fileprivate extension InsiderProduct {
    convenience init(_ params: [Param: Any], _ mapper: InsiderEventMapper) {
		self.init(.init(), InsiderEventMapper())
        var params = params
        _ = (params.removeValue(forKey: .CURRENCY) as? String).map(setCurrency())
        _ = (params.removeValue(forKey: .COUPON) as? String).map(setVoucherName())
        _ = (params.removeValue(forKey: .SHIPPING) as? Double).map(setShippingCost())
        _ = (params.removeValue(forKey: .DISCOUNT) as? Double).map(setPromotionDiscount())
        _ = (params.removeValue(forKey: .ITEM_ID) as? String).map(setProductID())
        _ = (params.removeValue(forKey: .ITEM_NAME) as? String).map(setName())
        _ = (params.removeValue(forKey: .QUANTITY) as? Int32).map(setQuantity())
        _ = (params.removeValue(forKey: .PRICE_ORIGINAL) as? Double).map(setUnitPrice())
        _ = (params.removeValue(forKey: .PRICE) as? Double).map(setSalePrice())
        _ = (params.removeValue(forKey: .PRODUCT_IMAGE_URL) as? String).map(setProductImageURL())
        _ = (params.removeValue(forKey: .ITEM_CATEGORY_URL_KEY) as? String).map {
            setTaxonomy()($0.split(separator: "/"))
        }
        mapper(params).forEach { (key, value) in
            switch value {
                case let value as String: setCustomAttributeWithString()(key, value)
                case let value as Double: setCustomAttributeWithDouble()(key, value)
                default: break
            }
        }
    }
}
