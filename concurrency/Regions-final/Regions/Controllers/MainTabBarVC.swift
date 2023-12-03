// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import UIKit

class MainTabBarVC: UITabBarController {
  convenience init() {
    self.init(nibName: nil, bundle: nil)

    let conditionsVC = ConditionsVC()
    conditionsVC.tabBarItem = UITabBarItem(
      title: "Conditions",
      image: UIImage(systemName: "cloud.fill"),
      selectedImage: nil
    )

    let historyGCDVC = HistoryGCDVC()
    historyGCDVC.tabBarItem = UITabBarItem(
      title: "History GCD",
      image: UIImage(systemName: "book.fill"),
      selectedImage: nil
    )

    let historySCVC = HistorySCVC()
    historySCVC.tabBarItem = UITabBarItem(
      title: "History SC",
      image: UIImage(systemName: "books.vertical.fill"),
      selectedImage: nil
    )

    viewControllers = [conditionsVC, historyGCDVC, historySCVC]
  }
}
