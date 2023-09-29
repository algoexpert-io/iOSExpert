// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/26/23.

protocol AnalyticsService {
  func sendAnalyticsEvent(_ analyticsEvent: AnalyticsEvent)
}
