// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/28/23.

import SwiftUI

struct MainTabView: View {
  var body: some View {
    TabView {
      BrowseBreedsView()
        .tabItem {
          Image(systemName: "pawprint.fill")
          Text("Browse")
        }

      SettingsView()
        .tabItem {
          Image(systemName: "gearshape.2.fill")
          Text("Settings")
        }
    }
  }
}
