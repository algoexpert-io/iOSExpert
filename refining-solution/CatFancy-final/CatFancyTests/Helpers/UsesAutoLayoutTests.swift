// Copyright © 2023 AlgoExpert LLC. All rights reserved.

@testable import CatFancy
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
