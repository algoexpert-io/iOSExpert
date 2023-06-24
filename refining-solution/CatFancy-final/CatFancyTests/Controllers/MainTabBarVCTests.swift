// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

@testable import CatFancy
import XCTest

class MainTabBarVCTests: XCTestCase {
  func testInitialization() {
    let mtbvc = MainTabBarVC()
    mtbvc.viewDidLoad()

    guard let viewControllers = mtbvc.viewControllers else {
      XCTFail("Failed to set tabs' view controllers.")
      return
    }

    let expectedTabCount = 2
    XCTAssertEqual(expectedTabCount, viewControllers.count)

    if ((viewControllers[0] as? UINavigationController)?.topViewController) as? BrowseBreedsVC == nil {
      XCTFail("viewControllers[0] does not have a \(BrowseBreedsVC.self).")
    }

    if ((viewControllers[1] as? UINavigationController)?.topViewController) as? SettingsVC == nil {
      XCTFail("viewControllers[1] does not have a \(SettingsVC.self).")
    }
  }
}
