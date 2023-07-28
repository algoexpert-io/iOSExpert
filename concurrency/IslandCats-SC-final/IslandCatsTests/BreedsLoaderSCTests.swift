// Created by Josh Adams, who holds the copyright and reserves all rights, on 7/27/23.

@testable import IslandCats
import XCTest

final class BreedsLoaderSCTests: XCTestCase {
  func testLoadBreeds() async throws {
    let breeds = try await BreedsLoaderSC.loadBreeds()
    let expectedBreedCount = 19
    XCTAssertEqual(expectedBreedCount, breeds.count)
  }
}
