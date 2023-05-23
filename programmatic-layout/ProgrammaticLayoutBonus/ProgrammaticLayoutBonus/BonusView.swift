// Created by Josh Adams, who holds the copyright and reserves all rights, on 5/22/23.

import UIKit

class BonusView: UIView {
  @UsesAutoLayout
  private var bonusLabel: UILabel = {
    let bonusLabel = UILabel()
    bonusLabel.text = "Bonus"
    return bonusLabel
  }()

  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented.")
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .systemBackground

    addSubview(bonusLabel)

    bonusLabel.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
    bonusLabel.centerYAnchor.constraint(equalTo: centerYAnchor).activate()
  }
}
