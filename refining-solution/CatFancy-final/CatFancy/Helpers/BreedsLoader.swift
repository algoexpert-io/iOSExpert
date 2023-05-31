// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

import Foundation

enum BreedsLoader {
  static func loadBreeds() async throws -> [Breed] {
    let (data, _) = try await Current.settings.sessionType.session.data(from: Current.settings.breedsURL.url)
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    let breeds = try decoder.decode(Breeds.self, from: data)
    return breeds.breeds
  }
}
