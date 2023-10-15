// Copyright © 2023 AlgoExpert LLC. All rights reserved.

@testable import CatFancy
import XCTest

class SettingsCoordinatorTests: XCTestCase {
  func testStart() {
    let nc = UINavigationController()
    let coordinator = SettingsCoordinator(navigationController: nc)
    XCTAssertNil(coordinator.navigationController.topViewController)
    coordinator.start()
    XCTAssert(coordinator.navigationController.topViewController is SettingsVC)
  }
}
