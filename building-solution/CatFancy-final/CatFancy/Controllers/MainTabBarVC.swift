// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/27/23.

import UIKit

class MainTabBarVC: UITabBarController {
  convenience init() {
    self.init(nibName: nil, bundle: nil)

    let browseBreedsNavC = UINavigationController(rootViewController: BrowseBreedsVC())
    browseBreedsNavC.tabBarItem = UITabBarItem(
      title: "Browse",
      image: Symbols.pawPrint,
      selectedImage: nil
    )

    let settingsVC = SettingsVC()
    settingsVC.tabBarItem = UITabBarItem(
      title: "Settings",
      image: Symbols.gear,
      selectedImage: nil
    )

    viewControllers = [browseBreedsNavC, settingsVC]
  }
}
