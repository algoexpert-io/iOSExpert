// Copyright © 2023 AlgoExpert LLC. All rights reserved.

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
