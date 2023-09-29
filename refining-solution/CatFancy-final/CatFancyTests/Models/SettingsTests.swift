// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/28/23.

@testable import CatFancy
import XCTest

class SettingsTests: XCTestCase {
  func testBreedsURLSetting() {
    let settings = Settings(getterSetter: GetterSetterFake())
    XCTAssertEqual(Settings.breedsURLDefault, settings.breedsURL)
    XCTAssertEqual(BreedsURL.withMore, settings.breedsURL)
    settings.breedsURL = .standard
    XCTAssertNotEqual(Settings.breedsURLDefault, settings.breedsURL)
    XCTAssertEqual(BreedsURL.standard, settings.breedsURL)
  }

  func testSessionTypeSetting() {
    let settings = Settings(getterSetter: GetterSetterFake())
    XCTAssertEqual(Settings.sessionTypeDefault, settings.sessionType)
    XCTAssertEqual(SessionType.shared, settings.sessionType)
    settings.sessionType = .stub
    XCTAssertNotEqual(Settings.sessionTypeDefault, settings.sessionType)
    XCTAssertEqual(SessionType.stub, settings.sessionType)
  }

  func testSortOrderSetting() {
    let settings = Settings(getterSetter: GetterSetterFake())
    XCTAssertEqual(Settings.sortOrderDefault, settings.sortOrder)
    XCTAssertEqual(SortOrder.name, settings.sortOrder)
    settings.sortOrder = .popularity
    XCTAssertNotEqual(Settings.sortOrderDefault, settings.sortOrder)
    XCTAssertEqual(SortOrder.popularity, settings.sortOrder)
  }
}
