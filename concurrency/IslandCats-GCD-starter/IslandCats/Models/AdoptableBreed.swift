// Created by Josh Adams, who holds the copyright and reserves all rights, on 7/22/23.

enum AdoptableBreed: String, CaseIterable {
  case abyssinian = "Abyssinian"
  case burmese = "Burmese"
  case smilodon = "Smilodon"
  case tonkinese = "Tonkinese"

  static var shuffledAdoptableBreeds: [AdoptableBreed] {
    AdoptableBreed.allCases.shuffled()
  }

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
