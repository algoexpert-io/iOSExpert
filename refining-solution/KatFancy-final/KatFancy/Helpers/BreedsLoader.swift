// Created by Josh Adams, who holds the copyright and reserves all rights, on 6/29/23.

import Foundation

enum BreedsLoader {
  static func loadBreeds() async throws -> [Breed] {
    print(Current.settings.sessionType.displayName)
    let (data, _) = try await Current.settings.sessionType.session.data(from: Current.settings.breedsURL.url)
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    let breeds = try decoder.decode(Breeds.self, from: data)
    return breeds.breeds
  }
}
