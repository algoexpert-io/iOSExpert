// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import UIKit

class MainTabBarVC: UITabBarController {
 override func viewDidLoad() {
   let browseSymbolsVC = BrowseSymbolsVC()
   browseSymbolsVC.tabBarItem = UITabBarItem(title: "Browse", image: UIImage(systemName: "eye.fill"), selectedImage: nil)
   let browseSymbolsNC = UINavigationController()
   browseSymbolsNC.pushViewController(browseSymbolsVC, animated: false)

   let settingVC = SettingVC()
   settingVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear.circle.fill"), selectedImage: nil)

   viewControllers = [browseSymbolsNC, settingVC]
 }
}
