// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import Foundation

enum MockData {
  static let photoUrlPrefix = "https://assets.algoexpert.io/course-assets/iosexpert/CatImages/"
  static let mockPhotoName = "Abyssinian"
  static let mockPhotoExtension = ".jpg"

  static var photoURL: URL {
    let urlString = photoUrlPrefix + mockPhotoName + mockPhotoExtension
    if let url = URL(string: urlString) {
      return url
    } else {
      fatalError(URL.couldNotInit(urlString: urlString))
    }
  }

  static let breedNames: [String] = [
    "Abyssinian",
    "Balinese",
    "Bengal",
    "Burmese",
    "CloudedLeopard",
    "DevonRex",
    "EuropeanWildcat",
    "MaineCoon",
    "Manx",
    "Ragdoll",
    "RussianBlue",
    "Sand",
    "Savannah",
    "Serval",
    "Siamese",
    "Smilodon",
    "Tonkinese",
    "TurkishAngora",
    "Van"
  ]
}
