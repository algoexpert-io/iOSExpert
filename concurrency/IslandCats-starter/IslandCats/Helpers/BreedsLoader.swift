// Created by Josh Adams, who holds the copyright and reserves all rights, on 7/16/23.

import Foundation

enum BreedsLoader {
  static func loadBreeds() async throws -> [Breed] {
    let urlString = "https://assets.algoexpert.io/course-assets/iosexpert/breeds_with_more.json"
    guard let url = URL(string: urlString) else {
      fatalError(URL.couldNotInit(urlString: urlString))
    }

    let (data, _) = try await URLSession.shared.data(from: url)
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    let breeds = try decoder.decode(Breeds.self, from: data)
    return breeds.breeds
  }
}
