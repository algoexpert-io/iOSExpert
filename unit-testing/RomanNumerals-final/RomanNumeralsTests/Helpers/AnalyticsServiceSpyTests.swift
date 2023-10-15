// Copyright © 2023 AlgoExpert LLC. All rights reserved.

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

    // converterViewLoaded
    let converterVC = await ConverterVC()
    await converterVC.loadView()
    XCTAssertEqual(.converterViewLoaded, spy.processedEvents[0])

    // conversionFailed (decimal to Roman)
    let converter = Converter()
    _ = converter.convertFromDecimalToRoman("🥥")
    XCTAssertEqual(.conversionFailed, spy.processedEvents[1])

    // conversionSucceeded (decimal to Roman)
    _ = converter.convertFromDecimalToRoman("42")
    XCTAssertEqual(.conversionSucceeded, spy.processedEvents[2])

    // conversionFailed (Roman to decimal)
    _ = converter.convertFromRomanToDecimal("🍕")
    XCTAssertEqual(.conversionFailed, spy.processedEvents[3])

    // conversionFailed (Roman to decimal, non-canonical)
    _ = converter.convertFromRomanToDecimal("IIII")
    XCTAssertEqual(.conversionFailed, spy.processedEvents[4])

    // conversionSucceeded (Roman to decimal)
    _ = converter.convertFromRomanToDecimal("IV")
    XCTAssertEqual(.conversionSucceeded, spy.processedEvents[5])

    // weatherRequestSucceeded or weatherRequestFailed
    if await WeatherRequester.getCurrentConditionsInRome() != nil {
      XCTAssertEqual(.weatherRequestSucceeded, spy.processedEvents[6])
    } else {
      XCTAssertEqual(.weatherRequestFailed, spy.processedEvents[6])
    }
  }
}
