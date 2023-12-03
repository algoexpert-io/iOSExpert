// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import UIKit

class HistoryView: UIView {
  static let rowHeight: CGFloat = 40.0

  @UsesAutoLayout
  private(set) var tableView: UITableView = {
    let tableView = UITableView()
    tableView.rowHeight = HistoryView.rowHeight
    return tableView
  }()

  @UsesAutoLayout
  private(set) var visitButton: UIButton = {
    let button = UIButton()
    button.setTitle("Visit Four Random Cities at Once", for: .normal)
    button.setTitleColor(.blue, for: .normal)
    return button
  }()

  required init(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .systemBackground

    [tableView, visitButton].forEach {
      addSubview($0)
    }

    let standard = Layout.standard

    tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: standard).activate()
    tableView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
    tableView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()
    tableView.bottomAnchor.constraint(equalTo: visitButton.topAnchor, constant: standard * -1.0).activate()

    visitButton.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
    visitButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: standard * -1.0).activate()
  }

  func setupTable(dataSource: UITableViewDataSource) {
    tableView.dataSource = dataSource
    tableView.register(CityCell.self, forCellReuseIdentifier: "\(CityCell.self)")
  }

  func scrollToBottom(lastIndex: Int) {
    tableView.scrollToRow(at: IndexPath(row: lastIndex, section: 0), at: .bottom, animated: true)
  }
}
