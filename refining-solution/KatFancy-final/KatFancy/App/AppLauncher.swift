// Created by Josh Adams, who holds the copyright and reserves all rights, on 1/6/23.
// https://mokacoding.com/blog/prevent-swiftui-app-loading-in-unit-tests/

import SwiftUI

@main
struct AppLauncher {
  static func main() throws {
    if NSClassFromString("XCTestCase") == nil {
      KatFancyApp.main()
    } else {
      KatFancyTestApp.main()
    }
  }
}
