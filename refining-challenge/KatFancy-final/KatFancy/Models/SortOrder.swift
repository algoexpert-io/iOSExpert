// Created by Josh Adams, who holds the copyright and reserves all rights, on 1/6/23.

enum SortOrder: String, CaseIterable {
  case name
  case popularity

  var displayName: String {
    switch self {
    case .name:
      return "Name"
    case .popularity:
      return "Popularity"
    }
  }

  func compare(breed1: Breed, breed2: Breed) -> Bool {
    switch self {
    case .name:
      return breed1.name.caseInsensitiveCompare(breed2.name) == .orderedAscending
    case .popularity:
      return breed1.popularity < breed2.popularity
    }
  }
}
