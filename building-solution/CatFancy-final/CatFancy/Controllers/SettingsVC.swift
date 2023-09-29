// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/27/23.

import UIKit

class SettingsVC: UIViewController {
  var settingsView: SettingsView {
    if let castedView = view as? SettingsView {
      return castedView
    } else {
      fatalError(fatalCastMessage(view: SettingsView.self))
    }
  }

  override func loadView() {
    view = SettingsView(frame: UIScreen.main.bounds)
    title = "Settings"

    settingsView.sortOrderControl.addTarget(
      self,
      action: #selector(sortOrderChanged(_:)),
      for: .valueChanged
    )
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    updateControl()
  }

  private func updateControl() {
    switch SortOrder.current {
    case .name:
      settingsView.sortOrderControl.selectedSegmentIndex = 0
    case .popularity:
      settingsView.sortOrderControl.selectedSegmentIndex = 1
    }
  }

  @objc func sortOrderChanged(_ sender: UISegmentedControl) {
    let index = settingsView.sortOrderControl.selectedSegmentIndex
    if index == 0 {
      SortOrder.current = .name
    } else if index == 1 {
      SortOrder.current = .popularity
    }
  }
}
