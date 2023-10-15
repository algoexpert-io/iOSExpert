// Copyright © 2023 AlgoExpert LLC. All rights reserved.

@testable import KatFancy
import XCTest

final class BreedTests: XCTestCase {
  func testEquality() async throws {
    let mockLeopard = MockData.breed
    let networkLeopard = try await BreedsLoader.loadBreeds()[0]
    XCTAssertEqual(mockLeopard, networkLeopard)
  }
}
