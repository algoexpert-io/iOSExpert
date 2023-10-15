// Copyright © 2023 AlgoExpert LLC. All rights reserved.

enum AdoptableBreed: String, CaseIterable {
  case abyssinian = "Abyssinian"
  case burmese = "Burmese"
  case smilodon = "Smilodon"
  case tonkinese = "Tonkinese"

  func article(shouldCapitalize: Bool) -> String {
    switch self {
    case .abyssinian:
      return shouldCapitalize ? "An" : "an"
    case .burmese, .smilodon, .tonkinese:
      return shouldCapitalize ? "A" : "a"
    }
  }

  static var randomBreed: AdoptableBreed {
    let allBreeds = AdoptableBreed.allCases
    return allBreeds[Int.random(in: 0 ..< allBreeds.count)]
  }
}
