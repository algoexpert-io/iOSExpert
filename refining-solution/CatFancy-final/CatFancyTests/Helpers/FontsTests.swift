// Created by Josh Adams, who holds the copyright and reserves all rights, on 5/26/23.

@testable import CatFancy
import XCTest

final class FontsTests: XCTestCase {
  func testFonts() {
    let avenirNextDemibold = "AvenirNext-DemiBold"
    let avenirNextBold = "AvenirNext-Bold"

    [
      (Fonts.label, avenirNextDemibold, 18.0),
      (Fonts.labelBold, avenirNextBold, 18.0),
      (Fonts.heading, avenirNextBold, 24.0),
      (Fonts.smallBody, avenirNextDemibold, 12.0),
      (Fonts.buttonSmall, avenirNextDemibold, 18.0),
      (Fonts.buttonLarge, avenirNextDemibold, 24.0)
    ].forEach {
      XCTAssertEqual($0.0.fontName, $0.1)
      XCTAssertEqual($0.0.pointSize, $0.2)
    }
  }
}
