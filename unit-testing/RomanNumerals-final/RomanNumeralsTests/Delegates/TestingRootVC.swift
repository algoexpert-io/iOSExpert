// Created by Josh Adams, who holds the copyright and reserves all rights, on 4/11/23.

import UIKit

class TestingRootVC: UIViewController {
  override func loadView() {
    let label = UILabel()
    label.text = "Running unit tests..."
    label.textAlignment = .center
    label.textColor = .white
    label.backgroundColor = .black
    view = label
  }
}
