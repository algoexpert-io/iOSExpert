// Created by Josh Adams, who holds the copyright and reserves all rights, on 3/1/23.

import UIKit

class ConverterVC: UIViewController, UITableViewDataSource, UITextFieldDelegate {
  private var results: [String] = []
  private let persistentStorage = PersistentStorage()
  private let converter = Converter()

  private var converterView: ConverterView {
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
    results = persistentStorage.loadStringArray()
    super.init(nibName: nil, bundle: nil)
  }

  override func loadView() {
    view = ConverterView(frame: UIScreen.main.bounds)

    converterView.setupTextViews(delegate: self)
    converterView.setupTable(dataSource: self)

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

    converterView.scrollTableAndSetClearButtonVisibility(lastRow: results.count - 1)
    converterView.deviceLabel.text = Device().userFacingMessage
    fetchConditions()
    AnalyticsService.sendAnalyticsEvent(.converterViewLoaded)
  }

  private func fetchConditions() {
    Task {
      if let conditions = await WeatherRequester.getCurrentConditionsInRome() {
        converterView.weatherLabel.text = conditions
      }
    }
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    results.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: "\(ResultCell.self)") as? ResultCell {
      cell.configure(result: results[indexPath.row])
      return cell
    } else {
      fatalError("Could not initialize \(ResultCell.self).")
    }
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    ConverterView.rowHeight
  }

  func textField(
    _ textField: UITextField,
    shouldChangeCharactersIn range: NSRange,
    replacementString string: String
  ) -> Bool {
    let convertButton: UIButton
    if textField == converterView.decimalToRomanTextField {
      convertButton = converterView.decimalToRomanButton
    } else /* if textField == converterView.romanToDecimalTextField */ {
      convertButton = converterView.romanToDecimalButton
    }

    if range.location == 0 && string == "" {
      convertButton.isHidden = true
    } else {
      convertButton.isHidden = false
    }

    return true
  }

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField == converterView.decimalToRomanTextField {
      convertAndUpdateUIDecimalToRoman()
    } else /* if textField == converterView.romanToDecimalTextField */ {
      convertAndUpdateUIRomanToDecimal()
    }
    return true
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
      results.append("\(inputText) ➡️ \(output)")
    } else {
      results.append("❌ \(inputText) ➡️ \(outputType)")
    }
    textField.text = ""
    converterView.scrollTableAndSetClearButtonVisibility(lastRow: results.count - 1)
    persistentStorage.persistStringArray(results)
  }

  @objc
  func clearResults() {
    results = []
    persistentStorage.persistStringArray(results)
    converterView.scrollTableAndSetClearButtonVisibility(lastRow: results.count - 1)
  }
}
