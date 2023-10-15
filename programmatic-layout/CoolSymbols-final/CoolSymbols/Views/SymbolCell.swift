// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import UIKit

class SymbolCell: UITableViewCell {
  @UsesAutoLayout
  private var nameLabel: UILabel = {
    let nameLabel = UILabel()
    nameLabel.adjustsFontSizeToFitWidth = true
    nameLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
    return nameLabel
  }()

  @UsesAutoLayout
  private var categoryLabel: UILabel = {
    let categoryLabel = UILabel()
    categoryLabel.font = UIFont.systemFont(ofSize: 15.0)
    categoryLabel.textColor = .secondaryLabel
    return categoryLabel
  }()

  @UsesAutoLayout
  private var representationImageView = UIImageView()

  required init?(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = UIColor.systemBackground

    [nameLabel, categoryLabel, representationImageView].forEach {
      addSubview($0)
    }

    nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: Layout.standard).activate()
    nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.standard).activate()
    nameLabel.trailingAnchor.constraint(equalTo: representationImageView.leadingAnchor, constant: Layout.standard * -1.0).activate()

    categoryLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Layout.standard).activate()
    categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.standard).activate()
    categoryLabel.trailingAnchor.constraint(equalTo: representationImageView.leadingAnchor, constant: Layout.standard * -1.0).activate()

    representationImageView.topAnchor.constraint(equalTo: topAnchor, constant: Layout.standard).activate()
    representationImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Layout.standard * -1.0).activate()
    let representationHeightWidth: CGFloat = 104
    representationImageView.heightAnchor.constraint(equalToConstant: representationHeightWidth).activate()
    representationImageView.widthAnchor.constraint(equalToConstant: representationHeightWidth).activate()
  }

  func configure(symbol: Symbol) {
    nameLabel.text = symbol.name
    categoryLabel.text = symbol.category
    representationImageView.image = UIImage(systemName: symbol.name)
  }
}
