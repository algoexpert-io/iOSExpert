// Copyright © 2023 AlgoExpert LLC. All rights reserved.

@testable import CatFancy
import XCTest

class AppDelegateTests: XCTestCase {
  func testDidFinishLaunching() {
    let appDelegate = AppDelegate()
    XCTAssert(appDelegate.application(UIApplication.shared, didFinishLaunchingWithOptions: nil))
  }
}
