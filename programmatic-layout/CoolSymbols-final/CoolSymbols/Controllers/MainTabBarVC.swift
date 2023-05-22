// Created by Josh Adams, who holds the copyright and reserves all rights, on 5/21/23.

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
