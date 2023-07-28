// Created by Josh Adams, who holds the copyright and reserves all rights, on 7/27/23.

@testable import IslandCats
import XCTest

final class BreedsLoaderTests: XCTestCase {
  func testLoadBreedsGCD() {
    let exp = expectation(description: "loading breeds")

    BreedsLoaderGCD.loadBreeds { breeds in
      let expectedBreedCount = 19
      XCTAssertEqual(expectedBreedCount, breeds.count)
      exp.fulfill()
    }

    let loadBreedsTimeout: TimeInterval = 2.0
    waitForExpectations(timeout: loadBreedsTimeout)
  }
}
