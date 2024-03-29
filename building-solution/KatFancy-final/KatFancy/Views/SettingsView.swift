// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import SwiftUI

struct SettingsView: View {
  @Bindable private var boundSettings = settings

  var body: some View {
    VStack {
      Text("Settings")
        .font(.largeTitle)

      Spacer()
        .frame(height: Layout.tripleStandard)

      Group {
        Text("Sort Order")
          .font(.title)

        Picker("", selection: $boundSettings.sortOrder) {
          ForEach(SortOrder.allCases, id: \.self) { sortOrder in
            Text(sortOrder.displayName).tag(sortOrder)
          }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding(.horizontal, Layout.doubleStandard)

        Text("This setting controls the sort order of breeds on KatFancy's breed-browsing screen.")
          .padding()
      }

      Spacer()
    }
  }
}
