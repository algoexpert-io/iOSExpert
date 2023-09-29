// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/25/23.

import UIKit

class ConverterDataSource: NSObject, UITableViewDataSource {
  var results: [String]

  init(results: [String]) {
    self.results = results
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    results.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: "\(ResultCell.self)") as? ResultCell {
      cell.configure(result: results[indexPath.row])
      return cell
    } else {
      fatalError("Could not initialize \(ResultCell.self).")
    }
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    ConverterView.rowHeight
  }
}
