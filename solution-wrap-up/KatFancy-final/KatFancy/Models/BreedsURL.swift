// Created by Josh Adams, who holds the copyright and reserves all rights, on 1/6/23.

import Foundation

enum BreedsURL: String, CaseIterable {
  case standard
  case empty
  case malformed
  case withMore

  var url: URL {
    let standardURLString = "https://assets.algoexpert.io/course-assets/iosexpert/breeds.json"
    let emptyURLString = "https://assets.algoexpert.io/course-assets/iosexpert/breeds_empty.json"
    let malformedURLString = "https://assets.algoexpert.io/course-assets/iosexpert/breeds_malformed.json"
    let withMoreURLString = "https://assets.algoexpert.io/course-assets/iosexpert/breeds_with_more.json"

    let urlString: String

    switch self {
    case .standard:
      urlString = standardURLString
    case .empty:
      urlString = emptyURLString
    case .malformed:
      urlString = malformedURLString
    case .withMore:
      urlString = withMoreURLString
    }

    if let url = URL(string: urlString) {
      return url
    } else {
      fatalError(URL.couldNotInit(urlString: urlString))
    }
  }

  var displayName: String {
    switch self {
    case .standard:
      return "Standard"
    case .empty:
      return "Empty"
    case .malformed:
      return "Malformed"
    case .withMore:
      return "With More"
    }
  }
}
