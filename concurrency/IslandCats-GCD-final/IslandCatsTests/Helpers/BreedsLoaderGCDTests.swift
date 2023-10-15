// Copyright © 2023 AlgoExpert LLC. All rights reserved.

@testable import IslandCats
import XCTest

final class BreedsLoaderGCDTests: XCTestCase {
  func testLoadBreeds() {
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
