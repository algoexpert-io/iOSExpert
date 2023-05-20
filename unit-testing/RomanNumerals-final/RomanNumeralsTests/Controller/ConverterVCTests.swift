// Created by Josh Adams, who holds the copyright and reserves all rights, on 4/26/23.

@testable import RomanNumerals
import XCTest

final class ConverterVCTests: XCTestCase {
  private var converterVC: ConverterVC!

  override func setUp() {
    converterVC = ConverterVC()
    Current.persistentStorage.persistStringArray([])
  }

  func testConvertAndUpdateUIDecimalToRoman() {
    XCTAssert(converterVC.converterDataSource.results.isEmpty)
    converterVC.converterView.decimalToRomanTextField.text = "42"
    converterVC.convertAndUpdateUIDecimalToRoman()
    XCTAssertEqual("42 ➡️ XLII", converterVC.converterDataSource.results[0])
  }

  func testConvertAndUpdateUIRomanToDecimal() {
    XCTAssert(converterVC.converterDataSource.results.isEmpty)
    converterVC.converterView.romanToDecimalTextField.text = "XLII"
    converterVC.convertAndUpdateUIRomanToDecimal()
    XCTAssertEqual("XLII ➡️ 42", converterVC.converterDataSource.results[0])
  }

  func testClearResults() {
    XCTAssert(converterVC.converterDataSource.results.isEmpty)
    converterVC.converterDataSource.results = ["🎉 ➡️ 🌴"]
    XCTAssertFalse(converterVC.converterDataSource.results.isEmpty)
    converterVC.clearResults()
    XCTAssert(converterVC.converterDataSource.results.isEmpty)
  }

  override func tearDown() {
    Current.persistentStorage.persistStringArray([])
  }
}
