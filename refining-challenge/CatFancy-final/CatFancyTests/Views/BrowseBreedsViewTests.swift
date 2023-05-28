// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

@testable import CatFancy
import XCTest

class BrowseBreedsViewTests: XCTestCase {
  func testInitialization() {
    let bbv = BrowseBreedsView()
    XCTAssertNotNil(bbv)
  }
}
