// Copyright © 2023 AlgoExpert LLC. All rights reserved.

@testable import IslandCats
import XCTest

final class BreedsLoaderSCTests: XCTestCase {
  func testLoadBreeds() async throws {
    let breeds = try await BreedsLoaderSC.loadBreeds()
    let expectedBreedCount = 19
    XCTAssertEqual(expectedBreedCount, breeds.count)
  }
}
