// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

import UIKit

class BreedCoordinator: Coordinator, BrowseBreedsDelegate, BreedDetailDelegate {
  var navigationController: UINavigationController

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    let vc = BrowseBreedsVC(browseBreedsDelegate: self)
    vc.tabBarItem = UITabBarItem(title: "Browse", image: Symbols.pawPrint, selectedImage: nil)
    navigationController.pushViewController(vc, animated: false)
  }

  func showDetails(breed: Breed, animated: Bool) {
    let breedDetailVC = BreedDetailVC(breed: breed, breedDetailDelegate: self)
    navigationController.pushViewController(breedDetailVC, animated: animated)
  }

  func showWebpage(url: URL, didSucceed: ((Bool) -> ())?) {
    if UIApplication.shared.canOpenURL(url) {
      UIApplication.shared.open(url)
      didSucceed?(true)
    } else {
      didSucceed?(false)
    }
  }
}
