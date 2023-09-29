// Created by Josh Adams, who holds the copyright and reserves all rights, on 3/18/23.

class AnalyticsServiceReal: AnalyticsService {
  func sendAnalyticsEvent(_ analyticsEvent: AnalyticsEvent) {
    // Imagine that the next line sends the event to, for example, GoogleAnalytics instead
    // of printing. Something like this:
    // shared.sendAnalyticEventToBackend(analyticEvent)

    print("analytics event sent: \(analyticsEvent)")
  }
}
