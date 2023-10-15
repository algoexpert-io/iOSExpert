// Copyright © 2023 AlgoExpert LLC. All rights reserved.

@testable import RomanNumerals
import XCTest

final class ConverterViewTests: XCTestCase {
  private let converterView = ConverterView(frame: .zero)

  func testSetupTable() {
    XCTAssertNil(converterView.tableView.value(forKey: "_cellClassDict") as? [String: Any])
    XCTAssertNil(converterView.tableView.dataSource)

    let dataSource = ConverterDataSource(results: ["🥥", "🍕", "🐋"])
    converterView.setupTable(dataSource: dataSource)
    guard let castedDataSource = converterView.tableView.dataSource as? ConverterDataSource else {
      XCTFail("Could not cast dataSource to \(ConverterDataSource.self).")
      return
    }
    XCTAssertEqual(dataSource, castedDataSource)

    guard let registeredCellClasses = converterView.tableView.value(forKey: "_cellClassDict") as? [String: Any] else {
      XCTFail("Could not get registered cell classes.")
      return
    }
    XCTAssertEqual("\(ResultCell.self)", registeredCellClasses.first?.key)
  }

  func testSetupTextViews() {
    XCTAssertNil(converterView.romanToDecimalTextField.delegate)
    XCTAssertNil(converterView.decimalToRomanTextField.delegate)

    let delegate = ConverterTextFieldDelegate(
      converterView: converterView,
      decimalInputFinished: {},
      romanInputFinished: {}
    )
    converterView.setupTextViews(delegate: delegate)

    guard let castedRomanDelegate = converterView.romanToDecimalTextField.delegate as? ConverterTextFieldDelegate else {
      XCTFail("Could not cast delegate to \(ConverterTextFieldDelegate.self).")
      return
    }
    XCTAssertEqual(delegate, castedRomanDelegate)

    guard let castedDecimalDelegate = converterView.decimalToRomanTextField.delegate as? ConverterTextFieldDelegate else {
      XCTFail("Could not cast delegate to \(ConverterTextFieldDelegate.self).")
      return
    }
    XCTAssertEqual(delegate, castedDecimalDelegate)
  }

  func testScrollTableAndSetClearButtonVisibility() {
    let dataSource = ConverterDataSource(results: ["🥥", "🍕", "🐋"])
    converterView.setupTable(dataSource: dataSource)

    XCTAssert(converterView.clearButton.isHidden)
    converterView.scrollTableAndSetClearButtonVisibility(lastRow: 0)
    XCTAssertFalse(converterView.clearButton.isHidden)
    converterView.scrollTableAndSetClearButtonVisibility(lastRow: 1)
    XCTAssertFalse(converterView.clearButton.isHidden)
  }
}
