// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import UIKit

class ConverterVC: UIViewController {
  private var converterTextFieldDelegate: ConverterTextFieldDelegate?
  let converterDataSource: ConverterDataSource
  private let converter: Converter

  var converterView: ConverterView {
    if let castedView = view as? ConverterView {
      return castedView
    } else {
      fatalError(fatalCastMessage(view: ConverterView.self))
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
