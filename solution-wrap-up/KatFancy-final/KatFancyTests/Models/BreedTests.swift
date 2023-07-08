// Created by Josh Adams, who holds the copyright and reserves all rights, on 1/6/23.

@testable import KatFancy
import XCTest

final class BreedTests: XCTestCase {
  func testEquality() async throws {
    let mockLeopard = MockData.breed
    let networkLeopard = try await BreedsLoader.loadBreeds()[0]
    XCTAssertEqual(mockLeopard, networkLeopard)
  }
}
