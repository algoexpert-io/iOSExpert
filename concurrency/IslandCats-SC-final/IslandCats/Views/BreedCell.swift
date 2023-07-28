// Created by Josh Adams, who holds the copyright and reserves all rights, on 7/18/23.

import UIKit

class BreedCell: UICollectionViewCell {
  @UsesAutoLayout
  private(set) var breedLabel: UILabel = {
    let breedLabel = UILabel()
    breedLabel.font = UIFont(name: "AvenirNext-Regular", size: 12.0)
    breedLabel.textColor = .white
    breedLabel.textAlignment = .center
    breedLabel.numberOfLines = 0
    return breedLabel
  }()

  @UsesAutoLayout
  private var backingView: UIView = {
    let backingView = UIView()
    backingView.backgroundColor = .black
    backingView.alpha = 0.5
    return backingView
  }()

  @UsesAutoLayout
  private(set) var photoImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(systemName: "pawprint.fill")
    return imageView
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    [photoImageView, backingView, breedLabel].forEach {
      addSubview($0)
    }

    photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor).activate()
    photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor).activate()
    photoImageView.topAnchor.constraint(equalTo: topAnchor).activate()
    photoImageView.bottomAnchor.constraint(equalTo: bottomAnchor).activate()

    backingView.topAnchor.constraint(equalTo: breedLabel.topAnchor).activate()
    backingView.leadingAnchor.constraint(equalTo: leadingAnchor).activate()
    backingView.trailingAnchor.constraint(equalTo: trailingAnchor).activate()
    backingView.bottomAnchor.constraint(equalTo: bottomAnchor).activate()

    breedLabel.leadingAnchor.constraint(equalTo: leadingAnchor).activate()
    breedLabel.trailingAnchor.constraint(equalTo: trailingAnchor).activate()
    breedLabel.bottomAnchor.constraint(equalTo: bottomAnchor).activate()
  }

  required init?(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  func configure(photo: UIImage, breed: String) {
    photoImageView.image = photo
    breedLabel.text = breed
  }
}
