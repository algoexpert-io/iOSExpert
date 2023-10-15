// Copyright © 2023 AlgoExpert LLC. All rights reserved.

@testable import CatFancy
import XCTest

class BreedsLoaderTests: XCTestCase {
  func testLoadBreeds() async throws {
    Current.settings.breedsURL = .withMore
    let breeds = try await BreedsLoader.loadBreeds()
    let expectedCount = MockData.breedNames.count
    XCTAssertEqual(expectedCount, breeds.count)
  }
}
