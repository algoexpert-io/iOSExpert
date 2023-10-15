// Copyright © 2023 AlgoExpert LLC. All rights reserved.

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
