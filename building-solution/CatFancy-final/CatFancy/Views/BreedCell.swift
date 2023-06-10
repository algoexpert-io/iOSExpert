// Created by Josh Adams, who holds the copyright and reserves all rights, on 6/3/23.

import UIKit

class BreedCell: UITableViewCell {
  @UsesAutoLayout
  private(set) var nameLabel: UILabel = {
    let nameLabel = UILabel()
    nameLabel.adjustsFontSizeToFitWidth = true
    nameLabel.font = Fonts.labelBold
    return nameLabel
  }()

  @UsesAutoLayout
  private(set) var knownForLabel: UILabel = {
    let knownForLabel = UILabel()
    knownForLabel.font = Fonts.label
    knownForLabel.numberOfLines = 0
    return knownForLabel
  }()

  @UsesAutoLayout
  private(set) var popularityLabel: UILabel = {
    let popularityLabel = UILabel()
    popularityLabel.font = Fonts.label
    return popularityLabel
  }()

  @UsesAutoLayout
  private(set) var photoImageView: UIImageView = {
    let photoImageView = UIImageView()
    photoImageView.contentMode = .scaleAspectFit
    photoImageView.image = Symbols.pawPrint
    return photoImageView
  }()

  required init?(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = UIColor.systemBackground

    [nameLabel, knownForLabel, popularityLabel, photoImageView].forEach {
      addSubview($0)
    }

    nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: Layout.defaultSpacing).activate()
    nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.defaultSpacing).activate()
    nameLabel.trailingAnchor.constraint(equalTo: photoImageView.leadingAnchor, constant: Layout.defaultSpacing * -1.0).activate()

    knownForLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Layout.defaultSpacing).activate()
    knownForLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.defaultSpacing).activate()
    knownForLabel.trailingAnchor.constraint(equalTo: photoImageView.leadingAnchor, constant: Layout.defaultSpacing * -1.0).activate()

    popularityLabel.topAnchor.constraint(equalTo: knownForLabel.bottomAnchor, constant: Layout.defaultSpacing).activate()
    popularityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.defaultSpacing).activate()
    popularityLabel.trailingAnchor.constraint(equalTo: photoImageView.leadingAnchor, constant: Layout.defaultSpacing * -1.0).activate()

    let photoPadding: CGFloat = 4.0
    photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Layout.defaultSpacing * -1.0 + photoPadding).activate()
    photoImageView.centerYAnchor.constraint(equalTo: centerYAnchor).activate()
    photoImageView.heightAnchor.constraint(equalToConstant: BrowseBreedsView.rowHeight - photoPadding).activate()
    photoImageView.widthAnchor.constraint(equalToConstant: BrowseBreedsView.rowHeight - photoPadding).activate()
  }

  func configure(breed: Breed) {
    nameLabel.text = breed.name
    knownForLabel.text = breed.knownFor
    popularityLabel.text = "Popularity: \(breed.popularity)"
  }
}

