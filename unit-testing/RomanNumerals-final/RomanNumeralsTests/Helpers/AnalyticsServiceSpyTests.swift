// Created by Josh Adams, who holds the copyright and reserves all rights, on 4/18/23.

@testable import RomanNumerals
import XCTest

final class AnalyticsServiceSpyTests: XCTestCase {
  func testSendAnalyticsEvent() async {
    guard Config.openWeatherKey != "" else {
      XCTFail("This unit test requires an Open Weather API key.")
      return
    }

    guard let spy = Current.analyticsService as? AnalyticsServiceSpy else {
      XCTFail("Current.analyticsService is not an AnalyticsServiceSpy.")
      return
    }
    spy.clearEvents()

    let converterVC = await ConverterVC()
    await converterVC.loadView()
    XCTAssertEqual(.converterViewLoaded, spy.processedEvents[0])

    let converter = Converter()

    _ = converter.convertFromDecimalToRoman("🥥")
    XCTAssertEqual(.conversionFailed, spy.processedEvents[1])
    _ = converter.convertFromDecimalToRoman("42")
    XCTAssertEqual(.conversionSucceeded, spy.processedEvents[2])

    _ = converter.convertFromRomanToDecimal("🍕")
    XCTAssertEqual(.conversionFailed, spy.processedEvents[3])
    _ = converter.convertFromRomanToDecimal("IIII")
    XCTAssertEqual(.conversionFailed, spy.processedEvents[4])
    _ = converter.convertFromRomanToDecimal("IV")
    XCTAssertEqual(.conversionSucceeded, spy.processedEvents[5])

    if await WeatherRequester.getCurrentConditionsInRome() != nil {
      XCTAssertEqual(.weatherRequestSucceeded, spy.processedEvents[6])
    } else {
      XCTAssertEqual(.weatherRequestFailed, spy.processedEvents[6])
    }
  }
}
