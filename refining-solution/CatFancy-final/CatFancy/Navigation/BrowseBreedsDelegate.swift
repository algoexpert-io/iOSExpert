// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

import Foundation

protocol BrowseBreedsDelegate: AnyObject {
  func showDetails(breed: Breed, animated: Bool)
}

extension BrowseBreedsDelegate {
  func showDetails(breed: Breed) {
    showDetails(breed: breed, animated: true)
  }
}
