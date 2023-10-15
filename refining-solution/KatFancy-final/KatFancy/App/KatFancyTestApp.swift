// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import SwiftUI

struct KatFancyTestApp: App {
  var body: some Scene {
    WindowGroup {
      VStack {
        Text("Running Unit Tests")
          .font(.largeTitle)
        ProgressView()
      }
    }
  }
}
