// Created by Josh Adams, who holds the copyright and reserves all rights, on 4/18/23.

class AnalyticsServiceSpy: AnalyticsService {
  private(set) var processedEvents: [AnalyticsEvent] = []

  func sendAnalyticsEvent(_ analyticsEvent: AnalyticsEvent) {
    processedEvents.append(analyticsEvent)
  }

  func clearEvents() {
    processedEvents = []
  }
}
