// Created by Josh Adams, who holds the copyright and reserves all rights, on 1/6/23.

@testable import KatFancy
import XCTest

class URLExtensionTests: XCTestCase {
  func testCouldNotInit() {
    let 🙀 = "🙀"
    XCTAssertEqual("Could not initialize URL from \(🙀).", URL.couldNotInit(urlString: 🙀))
  }
}
