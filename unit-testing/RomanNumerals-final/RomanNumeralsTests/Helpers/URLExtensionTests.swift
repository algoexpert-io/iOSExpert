// Created by Josh Adams, who holds the copyright and reserves all rights, on 4/19/23.

@testable import RomanNumerals
import XCTest

class URLExtensionTests: XCTestCase {
  func testCouldNotInit() {
    let 🙀 = "🙀"
    XCTAssertEqual("Could not initialize URL from \(🙀).", URL.couldNotInit(urlString: 🙀))
  }
}
