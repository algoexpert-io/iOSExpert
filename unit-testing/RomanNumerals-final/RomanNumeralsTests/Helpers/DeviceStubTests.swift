// Copyright © 2023 AlgoExpert LLC. All rights reserved.

@testable import RomanNumerals
import XCTest

final class DeviceStubTests: XCTestCase {
  func testUserFacingMessage() {
    let testDevice = "iPod Nano"
    let device = DeviceStub(name: testDevice)
    XCTAssertEqual("RomanNumerals is running on \(testDevice).", device.userFacingMessage)
  }
}
