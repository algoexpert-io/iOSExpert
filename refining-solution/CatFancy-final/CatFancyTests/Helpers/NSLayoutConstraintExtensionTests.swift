// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

@testable import CatFancy
import XCTest

class NSLayoutConstraintExtensionTests: XCTestCase {
  func testActivate() {
    let parentView = UIView()
    let view1 = UIView()
    let view2 = UIView()

    [view1, view2].forEach {
      parentView.addSubview($0)
    }

    let constraint = NSLayoutConstraint(
      item: view1,
      attribute: .bottom,
      relatedBy: .equal,
      toItem: view2,
      attribute: .bottom,
      multiplier: 1.0,
      constant: 0.0
    )

    XCTAssertFalse(constraint.isActive)
    constraint.activate()
    XCTAssert(constraint.isActive)
  }
}
