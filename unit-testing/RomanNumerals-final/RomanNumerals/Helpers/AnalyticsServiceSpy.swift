// Copyright © 2023 AlgoExpert LLC. All rights reserved.

class AnalyticsServiceSpy: AnalyticsService {
  private(set) var processedEvents: [AnalyticsEvent] = []

  func sendAnalyticsEvent(_ analyticsEvent: AnalyticsEvent) {
    processedEvents.append(analyticsEvent)
  }

  func clearEvents() {
    processedEvents = []
  }
}
