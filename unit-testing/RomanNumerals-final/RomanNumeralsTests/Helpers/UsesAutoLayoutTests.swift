// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/26/23.

@testable import RomanNumerals
import XCTest

class UsesAutoLayoutTests: XCTestCase {
  @UsesAutoLayout
  private var wrappedView = UIView()

  func testUsesAutoLayout() {
    let vanillaView = UIView()
    XCTAssert(vanillaView.translatesAutoresizingMaskIntoConstraints)

    XCTAssertFalse(wrappedView.translatesAutoresizingMaskIntoConstraints)

    var vanillaWrappedView = UsesAutoLayout<UIView>(wrappedValue: vanillaView)
    XCTAssertFalse(vanillaWrappedView.wrappedValue.translatesAutoresizingMaskIntoConstraints)

    vanillaWrappedView.wrappedValue = vanillaView
    XCTAssertFalse(vanillaWrappedView.wrappedValue.translatesAutoresizingMaskIntoConstraints)
  }
}
