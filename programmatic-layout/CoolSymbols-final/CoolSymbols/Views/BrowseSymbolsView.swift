// Created by Josh Adams, who holds the copyright and reserves all rights, on 5/21/23.

import UIKit

class BrowseSymbolsView: UIView {
  static let rowHeight: CGFloat = 120.0

  private(set) var tableView: UITableView = {
    let tableView = UITableView()
    tableView.rowHeight = BrowseSymbolsView.rowHeight
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()

  @UsesAutoLayout
  private var iosExpertLabel = UILabel.iosExpertLabel()

  required init(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .systemBackground

    [tableView, iosExpertLabel].forEach {
      addSubview($0)
    }

    tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Layout.standardSpacing).activate()
    tableView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
    tableView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()
    tableView.bottomAnchor.constraint(equalTo: iosExpertLabel.topAnchor, constant: Layout.standardSpacing * -1.0).activate()

    iosExpertLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
    iosExpertLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()
    iosExpertLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: Layout.standardSpacing * -1.0).activate()
  }

  func setupTable(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
    tableView.dataSource = dataSource
    tableView.delegate = delegate
    tableView.register(SymbolCell.self, forCellReuseIdentifier: "\(SymbolCell.self)")
  }
}
