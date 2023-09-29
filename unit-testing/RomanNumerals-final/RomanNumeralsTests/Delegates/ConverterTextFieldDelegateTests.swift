// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/25/23.

@testable import RomanNumerals
import XCTest

final class ConverterTextFieldDelegateTests: XCTestCase {
  private var decimalInputDidFinish = false
  private var romanInputDidFinish = false

  func testShouldChangeCharactersIn() {
    let converterView = ConverterView()
    let delegate = ConverterTextFieldDelegate(
      converterView: converterView,
      decimalInputFinished: {},
      romanInputFinished: {}
    )

    privateTestShouldChangeCharactersIn(
      converterView: converterView,
      delegate: delegate,
      textField: converterView.decimalToRomanTextField,
      button: converterView.decimalToRomanButton
    )

    privateTestShouldChangeCharactersIn(
      converterView: converterView,
      delegate: delegate,
      textField: converterView.romanToDecimalTextField,
      button: converterView.romanToDecimalButton
    )
  }

  private func privateTestShouldChangeCharactersIn(
    converterView: ConverterView,
    delegate: ConverterTextFieldDelegate,
    textField: UITextField,
    button: UIButton
  ) {
    XCTAssert(button.isHidden)

    let range = NSRange(location: 0, length: 0)
    var shouldChangeCharacters = delegate.textField(
      textField,
      shouldChangeCharactersIn: range,
      replacementString: "🥥"
    )

    XCTAssert(shouldChangeCharacters)
    XCTAssertFalse(button.isHidden)

    shouldChangeCharacters = delegate.textField(
      textField,
      shouldChangeCharactersIn: range,
      replacementString: ""
    )

    XCTAssert(shouldChangeCharacters)
    XCTAssert(button.isHidden)
  }

  func testTextFieldShouldReturn() {
    let converterView = ConverterView()

    privateTestTextFieldShouldReturn(
      converterView: converterView,
      textField: converterView.decimalToRomanTextField,
      inputDidFinish: { self.decimalInputDidFinish = true },
      assertFinishedInput: { XCTAssert(decimalInputDidFinish) }
    )

    privateTestTextFieldShouldReturn(
      converterView: converterView,
      textField: converterView.romanToDecimalTextField,
      inputDidFinish: { self.romanInputDidFinish = true },
      assertFinishedInput: { XCTAssert(romanInputDidFinish) }
    )
  }

  private func privateTestTextFieldShouldReturn(
    converterView: ConverterView,
    textField: UITextField,
    inputDidFinish: @escaping () -> Void,
    assertFinishedInput: () -> Void
  ) {
    let delegate = ConverterTextFieldDelegate(
      converterView: converterView,
      decimalInputFinished: inputDidFinish,
      romanInputFinished: inputDidFinish
    )

    let textFieldShouldReturn = delegate.textFieldShouldReturn(textField)

    XCTAssert(textFieldShouldReturn)
    assertFinishedInput()
  }
}
