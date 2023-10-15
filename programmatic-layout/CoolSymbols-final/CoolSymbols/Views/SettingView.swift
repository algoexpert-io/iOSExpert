// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import UIKit

class SettingView: UIView {
  @UsesAutoLayout
  private var sortByLabel: UILabel = {
    let sortByLabel = UILabel()
    sortByLabel.text = "Sort By"
    sortByLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
    return sortByLabel
  }()

  @UsesAutoLayout
  private(set) var sortSegmentedControl: UISegmentedControl = {
    let sortSegmentedControl = UISegmentedControl(items: ["Name", "Category"])
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
    sortByLabel.bottomAnchor.constraint(equalTo: sortSegmentedControl.topAnchor, constant: Layout.standard * -1.0).activate()

    sortSegmentedControl.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
    sortSegmentedControl.centerYAnchor.constraint(equalTo: centerYAnchor).activate()

    iosExpertLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
    iosExpertLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()
    iosExpertLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: Layout.standard * -1.0).activate()
  }
}
