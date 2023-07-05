// Created by Josh Adams, who holds the copyright and reserves all rights, on 6/30/23.

import SwiftUI

struct SettingsView: View {
  @Bindable private var boundSettings = settings

  var body: some View {
    VStack {
      Text("Settings")
        .font(.largeTitle)

      Spacer()
        .frame(height: Layout.tripleDefaultSpacing)

      Group {
        Text("Sort Order")
          .font(.title)

        Picker("", selection: $boundSettings.sortOrder) {
          ForEach(SortOrder.allCases, id: \.self) { sortOrder in
            Text(sortOrder.displayName).tag(sortOrder)
          }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding(.horizontal, Layout.doubleDefaultSpacing)

        Text("This setting controls the sort order of breeds on KatFancy's breed-browsing screen.")
          .padding()
      }

      Spacer()
    }
  }
}
