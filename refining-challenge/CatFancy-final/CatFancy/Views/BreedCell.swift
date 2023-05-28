// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

import UIKit

class BreedCell: UITableViewCell {
  @UsesAutoLayout
  private(set) var name: UILabel = {
    let name = UILabel()
    name.adjustsFontSizeToFitWidth = true
    name.font = Fonts.labelBold
    return name
  }()

  @UsesAutoLayout
  private(set) var knownFor: UILabel = {
    let knownFor = UILabel()
    knownFor.font = Fonts.label
    knownFor.numberOfLines = 0
    return knownFor
  }()

  @UsesAutoLayout
  private(set) var popularity: UILabel = {
    let popularity = UILabel()
    popularity.font = Fonts.label
    return popularity
  }()

  @UsesAutoLayout
  private(set) var photo: UIImageView = {
    let photo = UIImageView()
    photo.contentMode = .scaleAspectFit
    photo.image = Symbols.pawPrint
    return photo
  }()

  required init?(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = UIColor.systemBackground

    [name, knownFor, popularity, photo].forEach {
      addSubview($0)
    }

    name.topAnchor.constraint(equalTo: topAnchor, constant: Layout.defaultSpacing).activate()
    name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.defaultSpacing).activate()
    name.trailingAnchor.constraint(equalTo: photo.leadingAnchor, constant: Layout.defaultSpacing * -1.0).activate()

    knownFor.topAnchor.constraint(equalTo: name.bottomAnchor, constant: Layout.defaultSpacing).activate()
    knownFor.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.defaultSpacing).activate()
    knownFor.trailingAnchor.constraint(equalTo: photo.leadingAnchor, constant: Layout.defaultSpacing * -1.0).activate()

    popularity.topAnchor.constraint(equalTo: knownFor.bottomAnchor, constant: Layout.defaultSpacing).activate()
    popularity.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.defaultSpacing).activate()
    popularity.trailingAnchor.constraint(equalTo: photo.leadingAnchor, constant: Layout.defaultSpacing * -1.0).activate()

    let photoPadding: CGFloat = 4.0
    photo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Layout.defaultSpacing * -1.0 + photoPadding).activate()
    photo.centerYAnchor.constraint(equalTo: centerYAnchor).activate()
    photo.heightAnchor.constraint(equalToConstant: BrowseBreedsView.rowHeight - photoPadding).activate()
    photo.widthAnchor.constraint(equalToConstant: BrowseBreedsView.rowHeight - photoPadding).activate()
  }

  func configure(breed: Breed) {
    name.text = breed.name
    knownFor.text = breed.knownFor
    popularity.text = "Popularity: \(breed.popularity)"
  }
}
