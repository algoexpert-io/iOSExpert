// Created by Josh Adams, who holds the copyright and reserves all rights, on 5/22/23.

import UIKit

class SettingView: UIView {
  private var sortByLabel: UILabel = {
    let sortByLabel = UILabel()
    sortByLabel.text = "Sort By"
    sortByLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
    sortByLabel.translatesAutoresizingMaskIntoConstraints = false
    return sortByLabel
  }()

  private(set) var sortSegmentedControl: UISegmentedControl = {
    let sortSegmentedControl = UISegmentedControl(items: ["Name", "Category"])
    sortSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
    return sortSegmentedControl
  }()

  @UsesAutoLayout
  private var iosExpertLabel = UILabel.iosExpertLabel()

  required init(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .systemBackground

    [sortByLabel, sortSegmentedControl, iosExpertLabel].forEach {
      addSubview($0)
    }

    sortByLabel.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
    sortByLabel.bottomAnchor.constraint(equalTo: sortSegmentedControl.topAnchor, constant: Layout.standardSpacing * -1.0).activate()

    sortSegmentedControl.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
    sortSegmentedControl.centerYAnchor.constraint(equalTo: centerYAnchor).activate()

    iosExpertLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
    iosExpertLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()
    iosExpertLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: Layout.standardSpacing * -1.0).activate()
  }
}
