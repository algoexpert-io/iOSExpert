// Created by Josh Adams, who holds the copyright and reserves all rights, on 2/1/23.

import UIKit

class SymbolCell: UITableViewCell {
  private var nameLabel: UILabel = {
    let nameLabel = UILabel()
    nameLabel.adjustsFontSizeToFitWidth = true
    nameLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    return nameLabel
  }()

  private var categoryLabel: UILabel = {
    let categoryLabel = UILabel()
    categoryLabel.font = UIFont.systemFont(ofSize: 15.0)
    categoryLabel.textColor = .secondaryLabel
    categoryLabel.translatesAutoresizingMaskIntoConstraints = false
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

    nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: Layout.standardSpacing).activate()
    nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.standardSpacing).activate()
    nameLabel.trailingAnchor.constraint(equalTo: representationImageView.leadingAnchor, constant: Layout.standardSpacing * -1.0).activate()

    categoryLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Layout.standardSpacing).activate()
    categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.standardSpacing).activate()
    categoryLabel.trailingAnchor.constraint(equalTo: representationImageView.leadingAnchor, constant: Layout.standardSpacing * -1.0).activate()

    representationImageView.topAnchor.constraint(equalTo: topAnchor, constant: Layout.standardSpacing).activate()
    representationImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Layout.standardSpacing * -1.0).activate()
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
