// Created by Josh Adams, who holds the copyright and reserves all rights, on 2/1/23.

import UIKit

class SymbolDetailVC: UIViewController {
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var representationImageView: UIImageView!
  @IBOutlet weak var categoryLabel: UILabel!
  var symbol: Symbol?

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    guard let symbol = symbol else {
      return
    }
    nameLabel.text = symbol.name
    representationImageView.image = UIImage(systemName: symbol.name)
    categoryLabel.text = "Category: \(symbol.category)"
  }
}
