// Created by Josh Adams, who holds the copyright and reserves all rights, on 1/6/23.

import SwiftUI

struct SettingsView: View {
  @Bindable private var current = Current

  var body: some View {
    ScrollView(.vertical) {
      Text("Settings")
        .font(.largeTitle)

      Spacer()
        .frame(height: Layout.tripleStandard)

      Group {
        Text("Breeds URL")
          .font(.title)

        Picker("", selection: $current.settings.breedsURL) {
          ForEach(BreedsURL.allCases, id: \.self) { breedsURL in
            Text(breedsURL.displayName).tag(breedsURL)
          }
        }
        .segmentedPicker()

        Text("This setting controls the URL of the JSON file that the breeds-browsing screen retrieves. Revisit that screen after changing this setting to initiate another API call.")
          .padding()
      }

      Group {
        Text("URLSession Type")
          .font(.title)

        Picker("", selection: $current.settings.sessionType) {
          ForEach(SessionType.allCases, id: \.self) { sessionType in
            Text(sessionType.displayName).tag(sessionType)
          }
        }
        .segmentedPicker()

        Text("This setting controls which URLSession to use for JSON retrieval and image fetching: shared or stub.")
          .padding()
      }

      Group {
        Text("Sort Order")
          .font(.title)

        Picker("", selection: $current.settings.sortOrder) {
          ForEach(SortOrder.allCases, id: \.self) { sortOrder in
            Text(sortOrder.displayName).tag(sortOrder)
          }
        }
        .segmentedPicker()

        Text("This setting controls the sort order of breeds on KatFancy's breed-browsing screen.")
          .padding()
      }

      Spacer()
    }
  }
}

#Preview {
  SettingsView()
}
