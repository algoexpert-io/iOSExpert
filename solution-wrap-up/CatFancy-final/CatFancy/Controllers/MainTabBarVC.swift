// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import UIKit

class MainTabBarVC: UITabBarController {
  private let breedCoordinator = BreedCoordinator(navigationController: UINavigationController())
  private let settingsCoordinator = SettingsCoordinator(navigationController: UINavigationController())

  override func viewDidLoad() {
    breedCoordinator.start()
    settingsCoordinator.start()
    viewControllers = [breedCoordinator.navigationController, settingsCoordinator.navigationController]
  }
}
