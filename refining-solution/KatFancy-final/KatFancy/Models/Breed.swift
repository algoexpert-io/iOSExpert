// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/27/23.

import Foundation

struct Breed: Decodable, Identifiable, Equatable {
  var id: String { name }
  let name: String
  let knownFor: String
  let popularity: Int
  let photoUrl: URL
  let infoUrl: URL
  let credit: String
  let license: License
  let description: String

  static func == (lhs: Breed, rhs: Breed) -> Bool {
    lhs.name == rhs.name
  }
}
