// Created by Josh Adams, who holds the copyright and reserves all rights, on 4/14/23.

@testable import RomanNumerals
import XCTest

final class ConverterDataSourceTests: XCTestCase {
  private let dataSource = ConverterDataSource(results: ["🥥", "🍕", "🐋"])
  private let indexPathZero = IndexPath(row: 0, section: 0)

  func testNumberOfRowsInSection() {
    let numberOfRows = dataSource.tableView(UITableView(), numberOfRowsInSection: 0)
    XCTAssertEqual(dataSource.results.count, numberOfRows)
  }

  func testCellForRowAt() {
    let tableView = UITableView()
    tableView.register(ResultCell.self, forCellReuseIdentifier: "\(ResultCell.self)")

    guard let cell = dataSource.tableView(tableView, cellForRowAt: indexPathZero) as? ResultCell else {
      XCTFail("Could not get first \(ResultCell.self).")
      return
    }

    XCTAssertEqual(dataSource.results[0], cell.resultLabel.text)
  }

  func testHeightForRowAt() {
    let height = dataSource.tableView(UITableView(), heightForRowAt: indexPathZero)
    XCTAssertEqual(ConverterView.rowHeight, height)
  }
}
