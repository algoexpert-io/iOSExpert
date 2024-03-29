// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import UIKit

class BonusVC: UIViewController {
  var bonusView: BonusView {
    if let castedView = view as? BonusView {
      return castedView
    } else {
      fatalError("Could not cast \(BonusVC.self).view to \(BonusView.self).")
    }
  }

  override func loadView() {
    view = BonusView(frame: UIScreen.main.bounds)
    bonusView.tapButton.addTarget(self, action: #selector(BonusVC.buttonTapped(_:)), for: .touchUpInside)
  }

  @objc func buttonTapped(_ sender: UIButton) {
    print("tap")
  }
}
