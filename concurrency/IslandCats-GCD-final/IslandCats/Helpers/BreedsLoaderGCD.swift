// Created by Josh Adams, who holds the copyright and reserves all rights, on 7/16/23.

import Foundation

enum BreedsLoaderGCD {
  static func loadBreeds(completion: @escaping ([Breed]) -> ()) {
    let urlString = "https://assets.algoexpert.io/course-assets/iosexpert/breeds_with_more.json"
    guard let url = URL(string: urlString) else {
      fatalError(URL.couldNotInit(urlString: urlString))
    }

    let request = URLRequest(url: url)
    URLSession.shared.dataTask(with: request) { data, _, error in
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase

      guard
        error == nil,
        let data = data,
        let breeds = try? decoder.decode(Breeds.self, from: data)
      else {
        completion([])
        return
      }
      completion(breeds.breeds)
    }.resume()
  }
}
