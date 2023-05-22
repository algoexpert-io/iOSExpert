// Created by Josh Adams, who holds the copyright and reserves all rights, on 2/1/23.

import UIKit

class SymbolCell: UITableViewCell {
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var categoryLabel: UILabel!
  @IBOutlet weak var representationImageView: UIImageView!

  func configure(symbol: Symbol) {
    nameLabel.text = symbol.name
    representationImageView.image = UIImage(systemName: symbol.name)
    categoryLabel.text = symbol.category
  }
}
