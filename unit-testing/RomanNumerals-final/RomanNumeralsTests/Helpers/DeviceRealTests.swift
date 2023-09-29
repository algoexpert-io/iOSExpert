// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/25/23.

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
