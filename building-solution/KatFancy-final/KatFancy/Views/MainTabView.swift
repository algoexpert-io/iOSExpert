// Copyright © 2023 AlgoExpert LLC. All rights reserved.

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
