struct InsiderEventMapper: EventMapper {
    let nameMap: [EventName: String] = [
        .SELECT_CONTENT: EventName.SELECT_CONTENT.rawValue,
        .PURCHASE: EventName.PURCHASE.rawValue,
    ]
    let paramMap: [Param: String] = [
        .COUPON: Param.COUPON.rawValue.lowercased(),
        .CURRENCY: Param.CURRENCY.rawValue.lowercased(),
        .DISCOUNT: Param.DISCOUNT.rawValue.lowercased(),
        .ITEM_BRAND: Param.ITEM_BRAND.rawValue.lowercased(),
        .ITEM_CATEGORY_URL_KEY: Param.ITEM_CATEGORY_URL_KEY.rawValue.lowercased(),
        .ITEM_ID: Param.ITEM_ID.rawValue.lowercased(),
        .ITEM_NAME: Param.ITEM_NAME.rawValue.lowercased(),
        .ITEM_VARIANT: Param.ITEM_VARIANT.rawValue.lowercased(),
        .PAYMENT_TYPE: Param.PAYMENT_TYPE.rawValue.lowercased(),
        .PRICE: Param.PRICE.rawValue.lowercased(),
        .PRICE_ORIGINAL: Param.PRICE_ORIGINAL.rawValue.lowercased(),
        .PRODUCT_IMAGE_URL: Param.PRODUCT_IMAGE_URL.rawValue.lowercased(),
        .URL: Param.URL.rawValue.lowercased(),
        .QUANTITY: Param.QUANTITY.rawValue.lowercased(),
        .SHIPPING: Param.SHIPPING.rawValue.lowercased(),
        .TAX: Param.TAX.rawValue.lowercased(),
        .TOTAL: Param.TOTAL.rawValue.lowercased(),
        .TRANSACTION_ID: "order_id",
        .EVENT_GROUP_ID: "event_group_id"
    ]
}
