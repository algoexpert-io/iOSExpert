// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import Foundation

enum BreedsLoader {
  static func loadBreeds() async throws -> [Breed] {
    let urlString = "https://assets.algoexpert.io/course-assets/iosexpert/breeds.json"
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
