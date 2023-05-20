// Created by Josh Adams, who holds the copyright and reserves all rights, on 4/26/23.

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
