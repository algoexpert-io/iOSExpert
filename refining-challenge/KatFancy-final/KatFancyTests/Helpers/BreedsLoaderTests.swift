// Created by Josh Adams, who holds the copyright and reserves all rights, on 1/6/23.

@testable import KatFancy
import XCTest

class BreedsLoaderTests: XCTestCase {
  func testLoadBreeds() async throws {
    Current.settings.breedsURL = .withMore
    let breeds = try await BreedsLoader.loadBreeds()
    let expectedCount = MockData.catNames.count
    XCTAssertEqual(expectedCount, breeds.count)
  }
}
