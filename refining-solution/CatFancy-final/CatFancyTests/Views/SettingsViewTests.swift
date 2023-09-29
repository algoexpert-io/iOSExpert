// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/28/23.

@testable import CatFancy
import XCTest

class SettingsViewTests: XCTestCase {
  func testInitialization() {
    let sv = SettingsView()
    XCTAssertNotNil(sv)
  }
}
