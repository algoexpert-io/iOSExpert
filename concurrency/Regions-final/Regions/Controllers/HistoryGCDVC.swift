// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import UIKit

class HistoryGCDVC: UIViewController, UITableViewDataSource {
  private let history: HistoryGCD

  private var historyView: HistoryView {
    if let castedView = view as? HistoryView {
      return castedView
    } else {
      fatalError(fatalCastMessage(view: HistoryView.self))
    }
  }

  init() {
    history = HistoryGCD()
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  override func loadView() {
    view = HistoryView(frame: UIScreen.main.bounds)
    historyView.setupTable(dataSource: self)
    setupButton()
    let updateFrequencyInSeconds = 1.0
    Timer.scheduledTimer(withTimeInterval: updateFrequencyInSeconds, repeats: true) { _ in
      self.historyView.tableView.reloadData()
      if self.history.cityCount > 0 {
        self.historyView.scrollToBottom(lastIndex: self.history.cityCount - 1)
      }
    }
  }

  private func setupButton() {
    let action = UIAction { _ in
      self.visitFourCitiesAtOnce()
    }
    historyView.visitButton.addAction(action, for: .touchUpInside)
  }

  private func visitFourCitiesAtOnce() {
    DispatchQueue.concurrentPerform(iterations: 4) { _ in
      history.addCity(Region.randomCity)
    }
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    history.cityCount
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: "\(CityCell.self)") as? CityCell {
      cell.configure(city: history.cityAtIndex(indexPath.row))
      return cell
    } else {
      fatalError("Could not initialize \(CityCell.self).")
    }
  }
}
