// Copyright © 2023 AlgoExpert LLC. All rights reserved.

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

  static var randomAdopter: Adopter {
    let allAdopters = Adopter.allCases
    return allAdopters[Int.random(in: 0 ..< allAdopters.count)]
  }
}
