// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/28/23.

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
