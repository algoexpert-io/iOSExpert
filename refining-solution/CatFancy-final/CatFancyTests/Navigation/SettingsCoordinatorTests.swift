// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

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
