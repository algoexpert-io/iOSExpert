// Created by Josh Adams, who holds the copyright and reserves all rights, on 2/1/23.

import UIKit

class BrowseSymbolsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
  @IBOutlet weak var tableView: UITableView!
  private var symbols: [Symbol] = []
  private let rowHeight: CGFloat = 120.0

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(UINib(nibName: "\(SymbolCell.self)", bundle: nil), forCellReuseIdentifier: "\(SymbolCell.self)")
    tableView.delegate = self
    tableView.dataSource = self
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    let previousSymbols = symbols
    symbols = Symbol.allSymbolsSorted
    if symbols != previousSymbols {
      tableView.reloadData()
      tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
    }
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    symbols.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: "\(SymbolCell.self)", for: indexPath) as? SymbolCell {
      cell.configure(symbol: symbols[indexPath.row])
      return cell
    } else {
      fatalError("Could not initialize \(SymbolCell.self).")
    }
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    rowHeight
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    tableView.deselectRow(at: indexPath, animated: false)
    guard let detailVC = storyboard.instantiateViewController(withIdentifier: "\(SymbolDetailVC.self)") as? SymbolDetailVC else {
      fatalError("Could not initialize \(SymbolDetailVC.self).")
    }
    detailVC.symbol = symbols[indexPath.row]
    navigationController?.pushViewController(detailVC, animated: true)
  }
}
