// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import UIKit

class SettingsView: UIView {
  @UsesAutoLayout
  private var sortOrderLabel: UILabel = {
    let sortOrderLabel = UILabel()
    sortOrderLabel.text = "SortOrder"
    sortOrderLabel.font = Fonts.heading
    return sortOrderLabel
  }()

  @UsesAutoLayout
  private(set) var sortOrderControl: UISegmentedControl = {
    var items: [String] = []
    SortOrder.allCases.forEach {
      items.append($0.displayName)
    }
    return UISegmentedControl(items: items)
  }()

  @UsesAutoLayout
  private var sortOrderDescription: UILabel = {
    let sortOrderDescription = UILabel()
    sortOrderDescription.text = "This setting controls the sort order of breeds: by name or by popularity."
    sortOrderDescription.numberOfLines = 0
    sortOrderDescription.lineBreakMode = .byWordWrapping
    sortOrderDescription.font = Fonts.smallBody
    return sortOrderDescription
  }()

  required init(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .secondarySystemBackground

    [sortOrderLabel, sortOrderControl, sortOrderDescription].forEach {
      addSubview($0)
    }

    sortOrderLabel.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
    sortOrderLabel.bottomAnchor.constraint(equalTo: sortOrderControl.topAnchor, constant: Layout.standard * -1.0).activate()

    sortOrderControl.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Layout.defaultHorizontalMargin).activate()
    sortOrderControl.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Layout.defaultHorizontalMargin * -1.0).activate()
    sortOrderControl.centerYAnchor.constraint(equalTo: centerYAnchor).activate()

    sortOrderDescription.topAnchor.constraint(equalTo: sortOrderControl.bottomAnchor, constant: Layout.standard).activate()
    sortOrderDescription.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Layout.defaultHorizontalMargin).activate()
    sortOrderDescription.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Layout.defaultHorizontalMargin * -1.0).activate()
  }
}
