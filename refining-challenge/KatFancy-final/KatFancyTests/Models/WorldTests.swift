// Created by Josh Adams, who holds the copyright and reserves all rights, on 1/6/23.

@testable import KatFancy
import XCTest

class WorldTests: XCTestCase {
  func testProductionWorld() {
    let world = World.production
    XCTAssert(world.settings.getterSetter is GetterSetterReal)
    XCTAssert(world.soundPlayer is SoundPlayerReal)
  }

  func testUnitTestWorld() {
    let world = World.unitTest
    XCTAssert(world.settings.getterSetter is GetterSetterFake)
    XCTAssert(world.soundPlayer is SoundPlayerDummy)
  }
}
