public protocol ProviderAdapter {
    func logEvent(_ name: EventName, _ params: [Param: Any], _ items: [[Param: Any]]?)
}

public struct AnalyticsProvider {
    var adapter: ProviderAdapter

    public init(_ adapter: ProviderAdapter) {
        self.adapter = adapter
    }

    func log(event: AnalyticEvent) {
        adapter.logEvent(event.name, event.params, event.items)
    }
}
