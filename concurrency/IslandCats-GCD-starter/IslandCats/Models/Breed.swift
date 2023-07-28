// Created by Josh Adams, who holds the copyright and reserves all rights, on 7/16/23.

import Foundation

struct Breed: Decodable {
  let name: String
  let knownFor: String
  let popularity: Int
  let photoUrl: URL
  let infoUrl: URL
  let credit: String
  let license: License
  let description: String
}
