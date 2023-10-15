// Copyright © 2023 AlgoExpert LLC. All rights reserved.

protocol BrowseBreedsDelegate: AnyObject {
  func showDetails(breed: Breed, animated: Bool)
}

extension BrowseBreedsDelegate {
  func showDetails(breed: Breed) {
    showDetails(breed: breed, animated: true)
  }
}
