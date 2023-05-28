// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

import UIKit

class BrowseBreedsView: UIView {
  static let rowHeight: CGFloat = 128.0

  @UsesAutoLayout
  private var activityIndicator: UIActivityIndicatorView = {
    let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    return activityIndicator
  }()

  @UsesAutoLayout
  private(set) var table: UITableView = {
    let table = UITableView()
    table.rowHeight = BrowseBreedsView.rowHeight
    return table
  }()

  let refresh = UIRefreshControl()

  @UsesAutoLayout
  private var statusLabel: UILabel = {
    let statusLabel = UILabel()
    statusLabel.text = "Status"
    statusLabel.font = Fonts.heading
    return statusLabel
  }()

  @UsesAutoLayout
  private var statusDescription: UILabel = {
    let statusDescription = UILabel()
    statusDescription.numberOfLines = 0
    statusDescription.lineBreakMode = .byWordWrapping
    statusDescription.font = Fonts.smallBody
    statusDescription.textAlignment = .center
    return statusDescription
  }()

  @UsesAutoLayout
  private(set) var retry: UIButton = {
    let retry = UIButton()
    retry.setTitle("Retry", for: .normal)
    retry.titleLabel?.font = Fonts.buttonLarge
    retry.setTitleColor(.systemPurple, for: .normal)
    return retry
  }()

  required init(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .secondarySystemBackground

    [table, activityIndicator, statusLabel, statusDescription, retry].forEach {
      addSubview($0)
    }

    table.refreshControl = refresh

    table.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Layout.defaultSpacing).activate()
    table.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
    table.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()
    table.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).activate()

    activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
    activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).activate()

    statusDescription.centerYAnchor.constraint(equalTo: centerYAnchor).activate()
    statusDescription.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Layout.defaultHorizontalMargin).activate()
    statusDescription.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Layout.defaultHorizontalMargin * -1.0).activate()

    statusLabel.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
    statusLabel.bottomAnchor.constraint(equalTo: statusDescription.topAnchor, constant: Layout.defaultSpacing * -1.0).activate()

    retry.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
    retry.topAnchor.constraint(equalTo: statusDescription.bottomAnchor, constant: Layout.defaultSpacing).activate()
  }

  func setupTable(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
    table.dataSource = dataSource
    table.delegate = delegate
    table.register(BreedCell.self, forCellReuseIdentifier: "\(BreedCell.self)")
  }

  func showLoadingState(_ loadingState: LoadingState) {
    switch loadingState {
    case .notStarted:
      table.isHidden = true
      activityIndicator.stopAnimating()
      activityIndicator.isHidden = true
      statusLabel.isHidden = true
      statusDescription.isHidden = true
      retry.isHidden = true
    case .loading:
      table.isHidden = true
      activityIndicator.startAnimating()
      activityIndicator.isHidden = false
      statusLabel.isHidden = true
      statusDescription.isHidden = true
      retry.isHidden = true
    case .succeededWithBreeds:
      activityIndicator.stopAnimating()
      activityIndicator.isHidden = true
      table.reloadData()
      table.isHidden = false
      statusLabel.isHidden = true
      statusDescription.isHidden = true
      retry.isHidden = true
    case .succeededWithNoBreeds:
      activityIndicator.stopAnimating()
      activityIndicator.isHidden = true
      table.reloadData()
      table.isHidden = true
      statusLabel.isHidden = false
      statusDescription.isHidden = false
      let status = "No breeds are available. Please check again later."
      statusDescription.text = status
      retry.isHidden = false
    case .failed:
      table.isHidden = true
      activityIndicator.stopAnimating()
      activityIndicator.isHidden = true
      statusLabel.isHidden = false
      statusDescription.isHidden = false
      let status = "Breed fetch failed."
      statusDescription.text = status
      retry.isHidden = false
    }
  }
}
