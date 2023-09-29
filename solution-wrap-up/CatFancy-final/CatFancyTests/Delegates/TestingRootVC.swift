// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/28/23.

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
