// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/22/23.

import UIKit

class BonusView: UIView {
  @UsesAutoLayout
  private var bonusLabel: UILabel = {
    let bonusLabel = UILabel()
    bonusLabel.text = "Bonus"
    return bonusLabel
  }()

  @UsesAutoLayout
  private(set) var tapButton: UIButton = {
    let tapButton = UIButton()
    tapButton.setTitle("Tap", for: .normal)
    tapButton.setTitleColor(.systemPurple, for: .normal)
    return tapButton
  }()

  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented.")
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .systemBackground

    [bonusLabel, tapButton].forEach {
      addSubview($0)
    }

    bonusLabel.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
    bonusLabel.centerYAnchor.constraint(equalTo: centerYAnchor).activate()

    tapButton.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
    tapButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).activate()
  }
}
