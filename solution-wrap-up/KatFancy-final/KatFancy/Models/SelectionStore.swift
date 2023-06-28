// Created by Josh Adams, who holds the copyright and reserves all rights, on 1/6/23.

import Foundation

final class SelectionStore: ObservableObject {
  var current: World

  init(current: World) {
    self.current = current
    breedsURL = current.settings.breedsURL
    sessionType = current.settings.sessionType
    sortOrder = current.settings.sortOrder
  }

  @Published var breedsURL: BreedsURL {
    didSet {
      current.settings.breedsURL = breedsURL
    }
  }

  @Published var sessionType: SessionType {
    didSet {
      current.settings.sessionType = sessionType
    }
  }

  @Published var sortOrder: SortOrder {
    didSet {
      current.settings.sortOrder = sortOrder
    }
  }
}
