// Created by Josh Adams, who holds the copyright and reserves all rights, on 7/18/23.

import UIKit

class MainTabBarVC: UITabBarController {
  convenience init() {
    self.init(nibName: nil, bundle: nil)

    let censusVC = CensusVC()
    censusVC.tabBarItem = UITabBarItem(
      title: "Census",
      image: UIImage(systemName: "pawprint.fill"),
      selectedImage: nil
    )

    let adoptionVC = AdoptionVC()
    adoptionVC.tabBarItem = UITabBarItem(
      title: "Adoption",
      image: UIImage(systemName: "house.fill"),
      selectedImage: nil
    )

    viewControllers = [censusVC, adoptionVC]
  }
}
