// Created by Josh Adams, who holds the copyright and reserves all rights, on 7/8/23.

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
