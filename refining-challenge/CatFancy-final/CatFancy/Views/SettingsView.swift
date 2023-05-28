// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

import UIKit

class SettingsView: UIView {
  @UsesAutoLayout
  private var breedsURLLabel = SettingsView.createLabel(text: "Breeds URL")

  @UsesAutoLayout
  private(set) var breedsURLControl = SettingsView.createControl(displayNames: BreedsURL.allCases.map { $0.displayName })

  @UsesAutoLayout
  private var breedsURLDescription = SettingsView.createDescription(text: "This setting controls the URL of the JSON file that the breeds-browsing screen retrieves. If you change this setting, pull down the breeds table to refresh it or, if the error or no-breeds state is showing, tap Retry.")

  @UsesAutoLayout
  private var sessionTypeLabel = SettingsView.createLabel(text: "URLSession Type")

  @UsesAutoLayout
  private(set) var sessionTypeControl = SettingsView.createControl(displayNames: SessionType.allCases.map { $0.displayName })

  @UsesAutoLayout
  private var sessionTypeDescription = SettingsView.createDescription(text: "This setting controls which URLSession to use for JSON retrieval and image fetching: shared or stubSession.")

  @UsesAutoLayout
  private var sortOrderLabel = SettingsView.createLabel(text: "Sort Order")

  @UsesAutoLayout
  private(set) var sortOrderControl = SettingsView.createControl(displayNames: SortOrder.allCases.map { $0.displayName })

  @UsesAutoLayout
  private var sortOrderDescription = SettingsView.createDescription(text: "This setting controls the sort order of breeds: by name or by popularity.")

  required init(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .secondarySystemBackground

    [
      breedsURLLabel, breedsURLControl, breedsURLDescription,
      sessionTypeLabel, sessionTypeControl, sessionTypeDescription,
      sortOrderLabel, sortOrderControl, sortOrderDescription
    ].forEach {
      addSubview($0)
    }

    breedsURLLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Layout.defaultSpacing).activate()
    breedsURLLabel.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
    breedsURLLabel.bottomAnchor.constraint(equalTo: breedsURLControl.topAnchor, constant: Layout.defaultSpacing * -1.0).activate()

    breedsURLControl.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Layout.defaultHorizontalMargin).activate()
    breedsURLControl.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Layout.defaultHorizontalMargin * -1.0).activate()

    breedsURLDescription.topAnchor.constraint(equalTo: breedsURLControl.bottomAnchor, constant: Layout.defaultSpacing).activate()
    breedsURLDescription.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Layout.defaultHorizontalMargin).activate()
    breedsURLDescription.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Layout.defaultHorizontalMargin * -1.0).activate()

    sessionTypeLabel.topAnchor.constraint(equalTo: breedsURLDescription.bottomAnchor, constant: Layout.doubleDefaultSpacing).activate()
    sessionTypeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
    sessionTypeLabel.bottomAnchor.constraint(equalTo: sessionTypeControl.topAnchor, constant: Layout.defaultSpacing * -1.0).activate()

    sessionTypeControl.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Layout.defaultHorizontalMargin).activate()
    sessionTypeControl.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Layout.defaultHorizontalMargin * -1.0).activate()

    sessionTypeDescription.topAnchor.constraint(equalTo: sessionTypeControl.bottomAnchor, constant: Layout.defaultSpacing).activate()
    sessionTypeDescription.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Layout.defaultHorizontalMargin).activate()
    sessionTypeDescription.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Layout.defaultHorizontalMargin * -1.0).activate()

    sortOrderLabel.topAnchor.constraint(equalTo: sessionTypeDescription.bottomAnchor, constant: Layout.doubleDefaultSpacing).activate()
    sortOrderLabel.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
    sortOrderLabel.bottomAnchor.constraint(equalTo: sortOrderControl.topAnchor, constant: Layout.defaultSpacing * -1.0).activate()

    sortOrderControl.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Layout.defaultHorizontalMargin).activate()
    sortOrderControl.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Layout.defaultHorizontalMargin * -1.0).activate()

    sortOrderDescription.topAnchor.constraint(equalTo: sortOrderControl.bottomAnchor, constant: Layout.defaultSpacing).activate()
    sortOrderDescription.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Layout.defaultHorizontalMargin).activate()
    sortOrderDescription.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Layout.defaultHorizontalMargin * -1.0).activate()
  }

  private static func createLabel(text: String) -> UILabel {
    let label = UILabel()
    label.text = text
    label.font = Fonts.heading
    return label
  }

  private static func createControl(displayNames: [String]) -> UISegmentedControl {
    var items: [String] = []
    displayNames.forEach {
      items.append($0)
    }
    return UISegmentedControl(items: items)
  }

  private static func createDescription(text: String) -> UILabel {
    let description = UILabel()
    description.text = text
    description.numberOfLines = 0
    description.lineBreakMode = .byWordWrapping
    description.font = Fonts.smallBody
    return description
  }
}
