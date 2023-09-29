// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/26/23.

@testable import RomanNumerals
import XCTest

class WeatherRequesterTests: XCTestCase {
  func testGetCurrentConditionsInRome() async {
    guard Config.openWeatherKey != "" else {
      XCTFail("This unit test requires an Open Weather API key.")
      return
    }

    let currentConditions = await WeatherRequester.getCurrentConditionsInRome()
    XCTAssertEqual("Currently in Rome: 53° F, cloudy with a chance of suppli", currentConditions)
  }
}
