// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

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

    settingsView.breedsURLControl.addTarget(
      self,
      action: #selector(SettingsVC.breedsURLChanged(_:)),
      for: .valueChanged
    )

    settingsView.sessionTypeControl.addTarget(
      self,
      action: #selector(SettingsVC.sessionTypeChanged(_:)),
      for: .valueChanged
    )

    settingsView.sortOrderControl.addTarget(
      self,
      action: #selector(SettingsVC.sortOrderChanged(_:)),
      for: .valueChanged
    )
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    updateControls()
  }

  private func updateControls() {
    switch Current.settings.breedsURL {
    case .standard:
      settingsView.breedsURLControl.selectedSegmentIndex = 0
    case .empty:
      settingsView.breedsURLControl.selectedSegmentIndex = 1
    case .malformed:
      settingsView.breedsURLControl.selectedSegmentIndex = 2
    case .withMore:
      settingsView.breedsURLControl.selectedSegmentIndex = 3
    }

    switch Current.settings.sessionType {
    case .shared:
      settingsView.sessionTypeControl.selectedSegmentIndex = 0
    case .stub:
      settingsView.sessionTypeControl.selectedSegmentIndex = 1
    }

    switch Current.settings.sortOrder {
    case .name:
      settingsView.sortOrderControl.selectedSegmentIndex = 0
    case .popularity:
      settingsView.sortOrderControl.selectedSegmentIndex = 1
    }
  }

  @objc func breedsURLChanged(_ sender: UISegmentedControl) {
    let index = settingsView.breedsURLControl.selectedSegmentIndex
    if index == 0 {
      Current.settings.breedsURL = .standard
    } else if index == 1 {
      Current.settings.breedsURL = .empty
    } else if index == 2 {
      Current.settings.breedsURL = .malformed
    } else if index == 3 {
      Current.settings.breedsURL = .withMore
    }
  }

  @objc func sessionTypeChanged(_ sender: UISegmentedControl) {
    let index = settingsView.sessionTypeControl.selectedSegmentIndex
    if index == 0 {
      Current.settings.sessionType = .shared
    } else if index == 1 {
      Current.settings.sessionType = .stub
    }
  }

  @objc func sortOrderChanged(_ sender: UISegmentedControl) {
    let index = settingsView.sortOrderControl.selectedSegmentIndex
    if index == 0 {
      Current.settings.sortOrder = .name
    } else if index == 1 {
      Current.settings.sortOrder = .popularity
    }
  }
}
