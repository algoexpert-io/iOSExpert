// Created by Josh Adams, who holds the copyright and reserves all rights, on 3/1/23.

// TOD0: Make PersistentStorage code a protocol. Real uses FileManager. Fake uses an array.
// TOD0: Make a SoundPlayer protocol and allow use of RealSoundPlayer or TestSoundPlayer.
// TOD0: Convert AnalyticsService to a protocol. Make AnalyticsServiceReal and AnalyticsServiceSpy.
// TOD0: Dependency inject Device.
// TOD0: Dependency inject URLSession and add mock JSON to bundle.
// TOD0: Ensure that key in Config.swift doesn't go to GitHub.

import UIKit

class ConverterVC: UIViewController {
  private let converter: Converter
  let converterDataSource: ConverterDataSource
  private var converterTextFieldDelegate: ConverterTextFieldDelegate?

  var converterView: ConverterView {
    if let castedView = view as? ConverterView {
      return castedView
    } else {
      fatalError("Could not cast \(self).view to \(ConverterView.self).")
    }
  }

  required init?(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  init() {
    converter = Converter()
    converterDataSource = ConverterDataSource(results: Current.persistentStorage.loadStringArray())
    super.init(nibName: nil, bundle: nil)
  }

  override func loadView() {
    view = ConverterView(frame: UIScreen.main.bounds)

    converterTextFieldDelegate = ConverterTextFieldDelegate(
      converterView: converterView,
      decimalInputFinished: { self.convertAndUpdateUIDecimalToRoman() },
      romanInputFinished: { self.convertAndUpdateUIRomanToDecimal() }
    )

    converterView.setupTextViews(delegate: converterTextFieldDelegate)
    converterView.setupTable(dataSource: converterDataSource)

    converterView.decimalToRomanButton.addTarget(
      self,
      action: #selector(convertAndUpdateUIDecimalToRoman),
      for: .touchUpInside
    )

    converterView.romanToDecimalButton.addTarget(
      self,
      action: #selector(convertAndUpdateUIRomanToDecimal),
      for: .touchUpInside
    )

    converterView.clearButton.addTarget(
      self,
      action: #selector(clearResults),
      for: .touchUpInside
    )

    converterView.scrollTableAndSetClearButtonVisibility(lastRow: converterDataSource.results.count - 1)
    converterView.deviceLabel.text = Current.device.userFacingMessage
    fetchConditions()
    Current.analyticsService.sendAnalyticsEvent(.converterViewLoaded)
  }

  private func fetchConditions() {
    Task {
      if let conditions = await WeatherRequester.getCurrentConditionsInRome() {
        converterView.weatherLabel.text = conditions
      }
    }
  }

  @objc
  func convertAndUpdateUIDecimalToRoman() {
    convertAndUpdateUI(
      textField: converterView.decimalToRomanTextField,
      button: converterView.decimalToRomanButton,
      converter: { input in converter.convertFromDecimalToRoman(input) },
      outputType: "Roman"
    )
  }

  @objc
  func convertAndUpdateUIRomanToDecimal() {
    convertAndUpdateUI(
      textField: converterView.romanToDecimalTextField,
      button: converterView.romanToDecimalButton,
      converter: { input in converter.convertFromRomanToDecimal(input) },
      outputType: "Decimal"
    )
  }

  private func convertAndUpdateUI(
    textField: UITextField,
    button: UIButton,
    converter: (String) -> String?,
    outputType: String
  ) {
    textField.resignFirstResponder()
    button.isHidden = true
    let inputText = (textField.text ?? "").uppercased()
    if let output = converter(inputText) {
      converterDataSource.results.append("\(inputText) ➡️ \(output)")
    } else {
      converterDataSource.results.append("❌ \(inputText) ➡️ \(outputType)")
    }
    textField.text = ""
    converterView.scrollTableAndSetClearButtonVisibility(lastRow: converterDataSource.results.count - 1)
    Current.persistentStorage.persistStringArray(converterDataSource.results)
  }

  @objc
  func clearResults() {
    converterDataSource.results = []
    Current.persistentStorage.persistStringArray(converterDataSource.results)
    converterView.scrollTableAndSetClearButtonVisibility(lastRow: converterDataSource.results.count - 1)
  }
}
