// Copyright © 2023 AlgoExpert LLC. All rights reserved.

@testable import CatFancy
import XCTest

class GetterSetterRealTests: XCTestCase {
  func testGetAndSet() {
    let getterSetter = GetterSetterReal()
    let key = "key"
    let emptyValue = ""
    let actualValue = "🍕"
    getterSetter.set(key: key, value: emptyValue)
    XCTAssertEqual(emptyValue, getterSetter.get(key: key))
    getterSetter.set(key: key, value: actualValue)
    XCTAssertEqual(actualValue, getterSetter.get(key: key))
  }
}
