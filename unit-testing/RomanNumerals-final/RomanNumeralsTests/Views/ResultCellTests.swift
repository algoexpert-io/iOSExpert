// Copyright © 2023 AlgoExpert LLC. All rights reserved.

@testable import RomanNumerals
import XCTest

class ResultCellTests: XCTestCase {
  func testResultCell() {
    let cell = ResultCell(style: .default, reuseIdentifier: "\(ResultCell.self)")
    let 🥥 = "🥥"
    cell.configure(result: 🥥)
    XCTAssertEqual(🥥, cell.resultLabel.text)
  }
}
