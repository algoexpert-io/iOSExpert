// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import UIKit

class SymbolDetailVC: UIViewController {
  private let symbol: Symbol

  private var symbolDetailView: SymbolDetailView {
    if let castedView = view as? SymbolDetailView {
      return castedView
    } else {
      fatalError(fatalCastMessage(view: SymbolDetailView.self))
    }
  }

  required init?(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  init(symbol: Symbol) {
    self.symbol = symbol
    super.init(nibName: nil, bundle: nil)
  }

  override func loadView() {
    view = SymbolDetailView(frame: UIScreen.main.bounds)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    symbolDetailView.configure(symbol: symbol)
  }
}
