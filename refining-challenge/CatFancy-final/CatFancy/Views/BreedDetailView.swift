// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

import UIKit

class BreedDetailView: UIView {
  @UsesAutoLayout
  var photoImageView: UIImageView = {
    let photoImageView = UIImageView()
    photoImageView.contentMode = .scaleAspectFit
    return photoImageView
  } ()

  @UsesAutoLayout
  var descriptionTextView: UITextView = {
    let descriptionTextView = UITextView()
    descriptionTextView.font = Fonts.smallBody
    descriptionTextView.bounces = false
    return descriptionTextView
  } ()

  @UsesAutoLayout
  private(set) var creditLabel: UILabel = {
    let creditLabel = UILabel()
    creditLabel.font = Fonts.labelBold
    return creditLabel
  }()

  @UsesAutoLayout
  private(set) var licenseButton: UIButton = {
    let licenseButton = UIButton()
    licenseButton.titleLabel?.font = Fonts.buttonSmall
    licenseButton.setTitle("Show License", for: .normal)
    licenseButton.setTitleColor(.systemPurple, for: .normal)
    return licenseButton
  }()

  @UsesAutoLayout
  private(set) var wikipediaButton: UIButton = {
    let wikipediaButton = UIButton()
    wikipediaButton.titleLabel?.font = Fonts.buttonSmall
    wikipediaButton.setTitle("View in Wikipedia", for: .normal)
    wikipediaButton.setTitleColor(.systemPurple, for: .normal)
    return wikipediaButton
  }()

  static let initialPhotoHeightWidth: CGFloat = 180.0
  private var photoHeight: NSLayoutConstraint?
  private var photoWidth: NSLayoutConstraint?

  required init(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .secondarySystemBackground
    [photoImageView, descriptionTextView, creditLabel, licenseButton, wikipediaButton].forEach {
      addSubview($0)
    }

    photoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).activate()
    photoImageView.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
    photoHeight = photoImageView.heightAnchor.constraint(equalToConstant: BreedDetailView.initialPhotoHeightWidth)
    photoHeight?.activate()
    photoWidth = photoImageView.widthAnchor.constraint(equalToConstant: BreedDetailView.initialPhotoHeightWidth)
    photoWidth?.activate()

    descriptionTextView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: Layout.defaultSpacing).activate()
    descriptionTextView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
    descriptionTextView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()

    creditLabel.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: Layout.defaultSpacing).activate()
    creditLabel.centerXAnchor.constraint(equalTo: centerXAnchor).activate()

    licenseButton.topAnchor.constraint(equalTo: creditLabel.bottomAnchor).activate()
    licenseButton.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: Layout.defaultSpacing).activate()
    licenseButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).activate()

    wikipediaButton.topAnchor.constraint(equalTo: creditLabel.bottomAnchor).activate()
    wikipediaButton.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: Layout.defaultSpacing * -1.0).activate()
    wikipediaButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).activate()
  }

  internal func updatePhotoSize(heightWidth: CGFloat) {
    photoWidth?.constant = heightWidth
    photoHeight?.constant = heightWidth
  }
}
