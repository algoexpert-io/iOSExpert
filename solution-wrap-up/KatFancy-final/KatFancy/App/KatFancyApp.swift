// Created by Josh Adams, who holds the copyright and reserves all rights, on 1/6/23.

import SwiftUI

struct KatFancyApp: App {
  init() {
    Task {
      await Current.imageLoader.setSession(Current.settings.sessionType.session)
    }
  }

  var body: some Scene {
    WindowGroup {
      MainTabView()
    }
  }
}
