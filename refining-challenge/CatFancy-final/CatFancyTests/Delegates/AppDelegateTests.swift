// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

@testable import CatFancy
import XCTest

class AppDelegateTests: XCTestCase {
  func testDidFinishLaunching() {
    let appDelegate = AppDelegate()
    XCTAssert(appDelegate.application(UIApplication.shared, didFinishLaunchingWithOptions: nil))
  }
}
