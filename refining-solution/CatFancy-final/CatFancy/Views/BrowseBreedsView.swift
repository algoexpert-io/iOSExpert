// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

import UIKit

class BrowseBreedsView: UIView {
  static let rowHeight: CGFloat = 128.0

  @UsesAutoLayout
  private var activityIndicatorView: UIActivityIndicatorView = {
    let activityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    return activityIndicatorView
  }()

  @UsesAutoLayout
  private(set) var tableView: UITableView = {
    let tableView = UITableView()
    tableView.rowHeight = BrowseBreedsView.rowHeight
    return tableView
  }()

  let refreshControl = UIRefreshControl()

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
  private(set) var retryButton: UIButton = {
    let retryButton = UIButton()
    retryButton.setTitle("Retry", for: .normal)
    retryButton.titleLabel?.font = Fonts.buttonLarge
    retryButton.setTitleColor(.systemPurple, for: .normal)
    return retryButton
  }()

  required init(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .secondarySystemBackground

    [tableView, activityIndicatorView, statusLabel, statusDescription, retryButton].forEach {
      addSubview($0)
    }

    tableView.refreshControl = refreshControl

    tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Layout.defaultSpacing).activate()
    tableView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
    tableView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()
    tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).activate()

    activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
    activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor).activate()

    statusDescription.centerYAnchor.constraint(equalTo: centerYAnchor).activate()
    statusDescription.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Layout.defaultHorizontalMargin).activate()
    statusDescription.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Layout.defaultHorizontalMargin * -1.0).activate()

    statusLabel.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
    statusLabel.bottomAnchor.constraint(equalTo: statusDescription.topAnchor, constant: Layout.defaultSpacing * -1.0).activate()

    retryButton.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
    retryButton.topAnchor.constraint(equalTo: statusDescription.bottomAnchor, constant: Layout.defaultSpacing).activate()
  }

  func setupTable(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
    tableView.dataSource = dataSource
    tableView.delegate = delegate
    tableView.register(BreedCell.self, forCellReuseIdentifier: "\(BreedCell.self)")
  }

  func showLoadingState(_ loadingState: LoadingState) {
    switch loadingState {
    case .notStarted:
      tableView.isHidden = true
      activityIndicatorView.stopAnimating()
      activityIndicatorView.isHidden = true
      statusLabel.isHidden = true
      statusDescription.isHidden = true
      retryButton.isHidden = true
    case .loading:
      tableView.isHidden = true
      activityIndicatorView.startAnimating()
      activityIndicatorView.isHidden = false
      statusLabel.isHidden = true
      statusDescription.isHidden = true
      retryButton.isHidden = true
    case .succeededWithBreeds:
      activityIndicatorView.stopAnimating()
      activityIndicatorView.isHidden = true
      tableView.reloadData()
      tableView.isHidden = false
      statusLabel.isHidden = true
      statusDescription.isHidden = true
      retryButton.isHidden = true
    case .succeededWithNoBreeds:
      activityIndicatorView.stopAnimating()
      activityIndicatorView.isHidden = true
      tableView.reloadData()
      tableView.isHidden = true
      statusLabel.isHidden = false
      statusDescription.isHidden = false
      let status = "No breeds are available. Please check again later."
      statusDescription.text = status
      retryButton.isHidden = false
    case .failed:
      tableView.isHidden = true
      activityIndicatorView.stopAnimating()
      activityIndicatorView.isHidden = true
      statusLabel.isHidden = false
      statusDescription.isHidden = false
      let status = "Breed fetch failed."
      statusDescription.text = status
      retryButton.isHidden = false
    }
  }
}
