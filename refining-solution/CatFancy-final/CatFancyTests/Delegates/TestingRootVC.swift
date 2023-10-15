// Copyright © 2023 AlgoExpert LLC. All rights reserved.

@testable import CatFancy
import UIKit

class TestingRootVC: UIViewController {
  override func loadView() {
    let label = UILabel()
    label.text = "Running unit tests..."
    label.textAlignment = .center
    label.textColor = .white
    label.font = Fonts.heading
    view = label
  }
}
