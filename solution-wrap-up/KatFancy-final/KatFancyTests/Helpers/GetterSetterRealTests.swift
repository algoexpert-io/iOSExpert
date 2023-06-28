// Created by Josh Adams, who holds the copyright and reserves all rights, on 1/6/23.

@testable import KatFancy
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
