// Copyright © 2023 AlgoExpert LLC. All rights reserved.

@testable import KatFancy
import XCTest

class GetterSetterFakeTests: XCTestCase {
  func testGetAndSet() {
    let settings = Settings(getterSetter: GetterSetterFake())
    let initialOrder = settings.sortOrder
    XCTAssertEqual(SortOrder.name, initialOrder)
    settings.sortOrder = .popularity
    XCTAssertEqual(settings.sortOrder, .popularity)
  }

  func testInitialization() {
    let 🦖 = "🦖"
    let 🪐 = "🪐"
    let getterSetter = GetterSetterFake(dictionary: [🦖: 🪐])
    XCTAssertEqual(getterSetter.get(key: 🦖), 🪐)
  }
}
