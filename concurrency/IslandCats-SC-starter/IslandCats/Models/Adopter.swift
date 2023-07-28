// Created by Josh Adams, who holds the copyright and reserves all rights, on 7/22/23.

enum Adopter: String, CaseIterable {
  case bjarne = "Bjarne"
  case brendan = "Brendan"
  case chris = "Chris"
  case guido = "Guido"
  case grace = "Grace"
  case james = "James"
  case jános = "János"
  case roberto = "Roberto"
  case yukihiro = "行弘"

  static var shuffledAdopters: [Adopter] {
    Adopter.allCases.shuffled()
  }

  static var randomAdopter: Adopter {
    let allAdopters = Adopter.allCases
    return allAdopters[Int.random(in: 0 ..< allAdopters.count)]
  }
}
