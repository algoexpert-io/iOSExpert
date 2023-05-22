// Created by Josh Adams, who holds the copyright and reserves all rights, on 2/1/23.

import Foundation

enum SortOrder {
  case name
  case category

  static var current = SortOrder.name {
    didSet {
      Symbol.sort()
    }
  }

  var segmentIndex: Int {
    switch self {
    case .name:
      return 0
    case .category:
      return 1
    }
  }

  static func sortOrderForIndex(_ index: Int) -> SortOrder {
    if index == 0 {
      return .name
    } else /* index == 1 */ {
      return .category
    }
  }
}
