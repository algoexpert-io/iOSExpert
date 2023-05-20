// Created by Josh Adams, who holds the copyright and reserves all rights, on 3/18/23.

protocol AnalyticsService {
  func sendAnalyticsEvent(_ analyticsEvent: AnalyticsEvent)
}
