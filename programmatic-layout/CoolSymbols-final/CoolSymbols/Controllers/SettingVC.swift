// Created by Josh Adams, who holds the copyright and reserves all rights, on 2/1/23.

import UIKit

class SettingVC: UIViewController {
  var settingView: SettingView {
    if let castedView = view as? SettingView {
      return castedView
    } else {
      fatalError(fatalCastMessage(view: SettingView.self))
    }
  }

  override func loadView() {
    view = SettingView(frame: UIScreen.main.bounds)
    settingView.sortSegmentedControl.addTarget(self, action: #selector(SettingVC.sortOrderChanged(_:)), for: .valueChanged)
    settingView.sortSegmentedControl.selectedSegmentIndex = SortOrder.current.segmentIndex
  }

  @objc func sortOrderChanged(_ sender: UISegmentedControl) {
    SortOrder.current = SortOrder.sortOrderForIndex(settingView.sortSegmentedControl.selectedSegmentIndex)
  }
}
