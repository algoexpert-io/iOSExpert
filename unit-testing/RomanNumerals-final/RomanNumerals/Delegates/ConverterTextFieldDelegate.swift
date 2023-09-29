// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/25/23.

import UIKit

class ConverterTextFieldDelegate: NSObject, UITextFieldDelegate {
  private let converterView: ConverterView
  private let decimalInputFinished: () -> Void
  private let romanInputFinished: () -> Void

  init(
    converterView: ConverterView,
    decimalInputFinished: @escaping () -> Void,
    romanInputFinished: @escaping () -> Void
  ) {
    self.converterView = converterView
    self.decimalInputFinished = decimalInputFinished
    self.romanInputFinished = romanInputFinished
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
      decimalInputFinished()
    } else /* if textField == converterView.romanToDecimalTextField */ {
      romanInputFinished()
    }
    return true
  }
}
