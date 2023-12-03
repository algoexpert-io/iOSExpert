// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import UIKit

class ConditionsCell: UITableViewCell {
  @UsesAutoLayout
  private var label: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 15.0)
    label.numberOfLines = 0
    return label
  }()

  required init?(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = UIColor.systemBackground

    addSubview(label)

    label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.standard).activate()
    label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Layout.standard * -1.0).activate()
    label.centerYAnchor.constraint(equalTo: centerYAnchor).activate()
  }

  func configure(region: Region, conditions: String? = nil) {
    var text = region.capital + ", " + region.name
    if let conditions {
      text += ": \(conditions)"
    }
    label.text = text
  }
}
