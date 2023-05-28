// Created by Josh Adams, who holds the copyright and reserves all rights, on 1/6/23.

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
