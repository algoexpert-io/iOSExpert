// Created by Josh Adams, who holds the copyright and reserves all rights, on 2/1/23.

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
