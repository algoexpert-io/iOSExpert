// Created by Josh Adams, who holds the copyright and reserves all rights, on 1/6/23.

import Foundation

@MainActor
class SettingsViewModel: ObservableObject {
  @Published var store = SelectionStore(current: Current)
  @Published var isTempDirectoryEmpty = true

  func configure() {
    isTempDirectoryEmpty = FileManager.isTempDirectoryEmpty()
    store.current = Current
    store.breedsURL = Current.settings.breedsURL
    store.sessionType = Current.settings.sessionType
    store.sortOrder = Current.settings.sortOrder
  }

  func clearTempDirectory() {
    FileManager.clearTempDirectory()
    isTempDirectoryEmpty = true
  }

  func getIsTempDirectoryEmpty() async -> Bool {
    isTempDirectoryEmpty
  }
}
