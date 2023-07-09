// Created by Josh Adams, who holds the copyright and reserves all rights, on 7/8/23.

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
