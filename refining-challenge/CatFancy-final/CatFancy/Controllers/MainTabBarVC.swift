// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

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
