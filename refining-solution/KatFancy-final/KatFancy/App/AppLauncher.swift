// Copyright © 2023 AlgoExpert LLC. All rights reserved.

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
