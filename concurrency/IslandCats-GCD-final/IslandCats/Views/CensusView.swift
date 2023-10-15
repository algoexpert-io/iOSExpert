// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import UIKit

class CensusView: UIView {
  @UsesAutoLayout
  private var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let itemSize: CGFloat = 100.0
    layout.itemSize = CGSize(width: itemSize, height: itemSize)
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    return collectionView
  }()

  @UsesAutoLayout
  private var statusLabel: UILabel = {
    let statusLabel = UILabel()
    statusLabel.font = UIFont(name: "AvenirNext-Bold", size: 18.0)
    statusLabel.textColor = .systemPurple
    statusLabel.textAlignment = .center
    return statusLabel
  }()

  @UsesAutoLayout
  private var activityIndicator: UIActivityIndicatorView = {
    let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    activityIndicator.isHidden = true
    return activityIndicator
  }()

  @UsesAutoLayout
  private(set) var serialGCDButton: UIButton = {
    let serialGCDButton = UIButton()
    serialGCDButton.setTitle("Load Serially (GCD)", for: .normal)
    serialGCDButton.setTitleColor(.systemPurple, for: .normal)
    serialGCDButton.titleLabel?.font = UIFont(name: "AvenirNext-Demibold", size: 15.0)
    serialGCDButton.isHidden = true
    return serialGCDButton
  }()

  @UsesAutoLayout
  private(set) var parallelGCDButton: UIButton = {
    let parallelGCDButton = UIButton()
    parallelGCDButton.setTitle("Load in Parallel (GCD)", for: .normal)
    parallelGCDButton.setTitleColor(.systemPurple, for: .normal)
    parallelGCDButton.titleLabel?.font = UIFont(name: "AvenirNext-Demibold", size: 15.0)
    parallelGCDButton.isHidden = true
    return parallelGCDButton
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .systemBackground
    collectionView.frame = frame

    [collectionView, statusLabel, activityIndicator, serialGCDButton, parallelGCDButton].forEach {
      addSubview($0)
    }

    let standard = Layout.standard

    collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: standard).activate()
    collectionView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
    collectionView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()
    collectionView.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: standard * -1.0).activate()

    statusLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
    statusLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()
    statusLabel.bottomAnchor.constraint(equalTo: serialGCDButton.topAnchor, constant: standard * -1.0).activate()
    statusLabel.bottomAnchor.constraint(equalTo: parallelGCDButton.topAnchor, constant: standard * -1.0).activate()

    activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
    activityIndicator.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: standard).activate()

    serialGCDButton.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
    serialGCDButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).activate()

    parallelGCDButton.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()
    parallelGCDButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).activate()
  }

  required init(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  func setupCollection(dataSource: UICollectionViewDataSource) {
    collectionView.dataSource = dataSource
    collectionView.register(BreedCell.self, forCellWithReuseIdentifier: "\(BreedCell.self)")
  }

  func showPhotosLoadingState() {
    setButtonVisibility(false)
    statusLabel.text = "Loading Photos"
    activityIndicator.isHidden = false
    activityIndicator.startAnimating()
    collectionView.reloadData()
  }

  func showPhotosLoadedState(elapsedTime: CFAbsoluteTime) {
    activityIndicator.isHidden = true
    activityIndicator.stopAnimating()
    statusLabel.text = "Elapsed Time: \(elapsedTime)"
    setButtonVisibility(true)
    collectionView.reloadData()
  }

  func setButtonVisibility(_ isVisible: Bool) {
    [serialGCDButton, parallelGCDButton].forEach {
      $0.isHidden = !isVisible
    }
  }
}
