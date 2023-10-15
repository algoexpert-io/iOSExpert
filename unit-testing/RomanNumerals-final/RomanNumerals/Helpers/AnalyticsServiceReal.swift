// Copyright © 2023 AlgoExpert LLC. All rights reserved.

class AnalyticsServiceReal: AnalyticsService {
  func sendAnalyticsEvent(_ analyticsEvent: AnalyticsEvent) {
    // Imagine that the next line sends the event to, for example, GoogleAnalytics instead
    // of printing. Something like this:
    // shared.sendAnalyticEventToBackend(analyticEvent)

    print("analytics event sent: \(analyticsEvent)")
  }
}
