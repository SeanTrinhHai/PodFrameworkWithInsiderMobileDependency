public struct AnalyticProductItem {
    let params: [Param: Any]

    public init(sku: String? = nil,
                name: String? = nil,
                brand: String? = nil,
                affiliation: String? = "App Store",
                originalPrice: Double? = nil,
                finalPrice: Double? = nil,
                discount: Double? = nil,
                currency: String = "THB",
                categoryId: String? = nil,
                category: String? = nil,
                category2: String? = nil,
                category3: String? = nil,
                category4: String? = nil,
                category5: String? = nil,
                variant: String? = nil,
                imageUrl: String? = nil,
                taxonomy: String? = nil,
                quantity: Int? = 1) {
        var params: [Param: Any] = [:]
        params[.ITEM_ID] = sku
        params[.ITEM_NAME] = name
        params[.ITEM_BRAND] = brand
        params[.AFFILIATION] = affiliation
        params[.PRICE_ORIGINAL] = originalPrice
        params[.PRICE] = finalPrice
        params[.DISCOUNT] = discount
        params[.CURRENCY] = currency
        params[.ITEM_CATEGORY_ID] = categoryId
        params[.ITEM_CATEGORY] = category
        params[.ITEM_CATEGORY2] = category2
        params[.ITEM_CATEGORY3] = category3
        params[.ITEM_CATEGORY4] = category4
        params[.ITEM_CATEGORY5] = category5
        params[.ITEM_VARIANT] = variant
        params[.PRODUCT_IMAGE_URL] = imageUrl
        params[.TAXONOMY] = taxonomy
        params[.QUANTITY] = quantity
        self.params = params
    }
}

