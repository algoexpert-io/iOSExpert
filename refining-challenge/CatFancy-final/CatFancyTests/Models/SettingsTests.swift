// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

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
    Current.settings.breedsURL = Settings.breedsURLDefault
  }

  func testSortOrderSetting() {
    let settings = Settings(getterSetter: GetterSetterFake())
    XCTAssertEqual(Settings.sortOrderDefault, settings.sortOrder)
    XCTAssertEqual(SortOrder.name, settings.sortOrder)
    settings.sortOrder = .popularity
    XCTAssertNotEqual(Settings.sortOrderDefault, settings.sortOrder)
    XCTAssertEqual(SortOrder.popularity, settings.sortOrder)
    Current.settings.sortOrder = Settings.sortOrderDefault
  }
}
