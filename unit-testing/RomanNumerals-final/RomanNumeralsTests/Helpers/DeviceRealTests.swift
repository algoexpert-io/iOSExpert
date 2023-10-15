// Copyright © 2023 AlgoExpert LLC. All rights reserved.

@testable import RomanNumerals
import XCTest

final class DeviceRealTests: XCTestCase {
  func testUserFacingMessage() {
    let device = DeviceReal()
    let expectedPrefix = "RomanNumerals is running on"
    let actualPrefix = String(device.userFacingMessage.prefix(expectedPrefix.count))
    XCTAssertEqual(expectedPrefix, actualPrefix)
  }
}
