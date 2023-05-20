// Created by Josh Adams, who holds the copyright and reserves all rights, on 4/17/23.

@testable import RomanNumerals
import XCTest

final class DeviceStubTests: XCTestCase {
  func testUserFacingMessage() {
    let testDevice = "iPod Nano"
    let device = DeviceStub(name: testDevice)
    XCTAssertEqual("RomanNumerals is running on \(testDevice).", device.userFacingMessage)
  }
}
