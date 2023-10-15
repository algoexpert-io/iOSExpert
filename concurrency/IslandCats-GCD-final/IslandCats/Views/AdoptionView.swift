// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import UIKit

class AdoptionView: UIView {
  @UsesAutoLayout
  private var abyssinianPopulationLabel = AdoptionView.statusLabel
  @UsesAutoLayout
  private var abyssinianWaitingListLabel = AdoptionView.statusLabel

  @UsesAutoLayout
  private var burmesePopulationLabel = AdoptionView.statusLabel
  @UsesAutoLayout
  private var burmeseWaitingListLabel = AdoptionView.statusLabel

  @UsesAutoLayout
  private var smilodonPopulationLabel = AdoptionView.statusLabel
  @UsesAutoLayout
  private var smilodonWaitingListLabel = AdoptionView.statusLabel

  @UsesAutoLayout
  private var tonkinesePopulationLabel = AdoptionView.statusLabel
  @UsesAutoLayout
  private var tonkineseWaitingListLabel = AdoptionView.statusLabel

  @UsesAutoLayout
  private(set) var requestFourCatsButton: UIButton = {
    let requestFourCatsButton = UIButton()
    requestFourCatsButton.setTitle("Simulate Four Adoption Requests", for: .normal)
    requestFourCatsButton.setTitleColor(.systemPurple, for: .normal)
    requestFourCatsButton.titleLabel?.font = UIFont(name: "AvenirNext-Demibold", size: 15.0)
    return requestFourCatsButton
  }()

  @UsesAutoLayout
  private(set) var historyTextView: UITextView = {
    let historyTextView = UITextView()
    historyTextView.isEditable = false
    historyTextView.font = UIFont(name: "AvenirNext-Demibold", size: 15.0)
    historyTextView.text = ""
    return historyTextView
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .systemBackground

    [
      abyssinianPopulationLabel, abyssinianWaitingListLabel,
      burmesePopulationLabel, burmeseWaitingListLabel,
      smilodonPopulationLabel, smilodonWaitingListLabel,
      tonkinesePopulationLabel, tonkineseWaitingListLabel,
      historyTextView,
      requestFourCatsButton
    ].forEach {
      addSubview($0)
    }

    let standard = Layout.standard

    abyssinianPopulationLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: standard).activate()
    abyssinianPopulationLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
    abyssinianWaitingListLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: standard).activate()
    abyssinianWaitingListLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()

    burmesePopulationLabel.topAnchor.constraint(equalTo: abyssinianPopulationLabel.bottomAnchor, constant: standard).activate()
    burmesePopulationLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
    burmeseWaitingListLabel.topAnchor.constraint(equalTo: abyssinianWaitingListLabel.bottomAnchor, constant: standard).activate()
    burmeseWaitingListLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()

    smilodonPopulationLabel.topAnchor.constraint(equalTo: burmesePopulationLabel.bottomAnchor, constant: standard).activate()
    smilodonPopulationLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
    smilodonWaitingListLabel.topAnchor.constraint(equalTo: burmeseWaitingListLabel.bottomAnchor, constant: standard).activate()
    smilodonWaitingListLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()

    tonkinesePopulationLabel.topAnchor.constraint(equalTo: smilodonPopulationLabel.bottomAnchor, constant: standard).activate()
    tonkinesePopulationLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
    tonkineseWaitingListLabel.topAnchor.constraint(equalTo: smilodonWaitingListLabel.bottomAnchor, constant: standard).activate()
    tonkineseWaitingListLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()

    historyTextView.topAnchor.constraint(equalTo: tonkinesePopulationLabel.bottomAnchor, constant: standard).activate()
    historyTextView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
    historyTextView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()
    historyTextView.bottomAnchor.constraint(equalTo: requestFourCatsButton.topAnchor, constant: standard * -1.0).activate()

    requestFourCatsButton.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
    requestFourCatsButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).activate()
  }

  required init(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  func updateCatStatus(_ status: CatStatus) {
    [
      ("Abyssinian", abyssinianPopulationLabel, status.abyssinianPopulation, abyssinianWaitingListLabel,
        status.abyssinianWaitingList),
      ("Burmese", burmesePopulationLabel, status.burmesePopulation, burmeseWaitingListLabel, status.burmeseWaitingList),
      ("Smilodon", smilodonPopulationLabel, status.smilodonPopulation, smilodonWaitingListLabel, status.smilodonWaitingList),
      ("Tonkinese", tonkinesePopulationLabel, status.tonkinesePopulation, tonkineseWaitingListLabel, status.tonkineseWaitingList)
    ].forEach {
      $0.1.text = "\($0.0) Population: \($0.2)"

      if $0.4 > 0 {
        $0.3.text = "Waiting List: \($0.4)"
      } else {
        $0.3.text = "No Waiting List"
      }
    }
  }

  func appendUpdate(_ update: String) {
    let currentHistory = historyTextView.text ?? ""
    historyTextView.text = currentHistory + update + "\n"

    let textCount = historyTextView.text.count
    if textCount >= 1 {
      historyTextView.scrollRangeToVisible(NSRange(location: textCount - 1, length: 1))
    }
  }

  private static var statusLabel: UILabel {
    let statusLabel = UILabel()
    statusLabel.font = UIFont(name: "AvenirNext-Demibold", size: 15.0)
    return statusLabel
  }
}
