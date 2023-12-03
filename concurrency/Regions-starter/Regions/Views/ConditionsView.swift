// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import UIKit

class ConditionsView: UIView {
  static let rowHeight: CGFloat = 60.0

  @UsesAutoLayout
  private(set) var tableView: UITableView = {
    let tableView = UITableView()
    tableView.rowHeight = ConditionsView.rowHeight
    return tableView
  }()

  @UsesAutoLayout
  private var statusLabel: UILabel = {
    let statusLabel = UILabel()
    statusLabel.text = "Tap a button to get conditions."
    statusLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
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
  private(set) var seriallyGCDButton = ConditionsView.createRequestButton(title: "Serially GCD")

  @UsesAutoLayout
  private(set) var inParallelGCDButton = ConditionsView.createRequestButton(title: "In Parallel GCD")

  @UsesAutoLayout
  private(set) var seriallySCButton = ConditionsView.createRequestButton(title: "Serially SC")

  @UsesAutoLayout
  private(set) var inParallelSCButton = ConditionsView.createRequestButton(title: "In Parallel SC")

  required init(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .systemBackground

    [
      tableView,
      statusLabel,
      seriallyGCDButton,
      inParallelGCDButton,
      seriallySCButton,
      inParallelSCButton,
      activityIndicator
    ].forEach {
      addSubview($0)
    }

    let standard = Layout.standard

    tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: standard).activate()
    tableView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
    tableView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()
    tableView.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: standard * -1.0).activate()

    statusLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
    statusLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()
    statusLabel.bottomAnchor.constraint(equalTo: seriallyGCDButton.topAnchor, constant: standard * -1.0).activate()

    activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
    activityIndicator.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: standard).activate()

    seriallyGCDButton.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
    seriallyGCDButton.bottomAnchor.constraint(equalTo: seriallySCButton.topAnchor, constant: standard * -1.0).activate()

    inParallelGCDButton.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()
    inParallelGCDButton.topAnchor.constraint(equalTo: seriallyGCDButton.topAnchor).activate()

    seriallySCButton.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
    seriallySCButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: standard * -1.0).activate()

    inParallelSCButton.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()
    inParallelSCButton.topAnchor.constraint(equalTo: seriallySCButton.topAnchor).activate()
  }

  func setupTable(dataSource: UITableViewDataSource) {
    tableView.dataSource = dataSource
    tableView.register(ConditionsCell.self, forCellReuseIdentifier: "\(ConditionsCell.self)")
  }

  func showRequestingConditionsState() {
    setButtonVisibility(false)
    statusLabel.text = "Requesting Conditions"
    activityIndicator.isHidden = false
    activityIndicator.startAnimating()
    tableView.reloadData()
  }

  func showConditionsReceivedState(elapsedTime: CFAbsoluteTime) {
    activityIndicator.isHidden = true
    activityIndicator.stopAnimating()
    statusLabel.text = "Elapsed Time: \(elapsedTime)"
    setButtonVisibility(true)
    tableView.reloadData()
  }

  func setButtonVisibility(_ isVisible: Bool) {
    [seriallyGCDButton, inParallelGCDButton, seriallySCButton, inParallelSCButton].forEach {
      $0.isHidden = !isVisible
    }
  }

  private static func createRequestButton(title: String) -> UIButton {
    let button = UIButton()
    button.setTitle(title, for: .normal)
    button.setTitleColor(.blue, for: .normal)
    return button
  }
}
