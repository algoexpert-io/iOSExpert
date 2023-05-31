// Created by Josh Adams, who holds the copyright and reserves all rights, on 1/6/23.

@testable import KatFancy
import XCTest

class BreedsURLTests: XCTestCase {
  func testURL() {
    guard
      let expectedStandardURL = URL(string: "https://assets.algoexpert.io/course-assets/iosexpert/breeds.json"),
      let expectedEmptyURL = URL(string: "https://assets.algoexpert.io/course-assets/iosexpert/breeds_empty.json"),
      let expectedMalformedURL = URL(string: "https://assets.algoexpert.io/course-assets/iosexpert/breeds_malformed.json"),
      let expectedWithMoreURL = URL(string: "https://assets.algoexpert.io/course-assets/iosexpert/breeds_with_more.json")
    else {
      XCTFail("Failed to initialize expected URL.")
      return
    }

    XCTAssertEqual(expectedStandardURL, BreedsURL.standard.url)
    XCTAssertEqual(expectedEmptyURL, BreedsURL.empty.url)
    XCTAssertEqual(expectedMalformedURL, BreedsURL.malformed.url)
    XCTAssertEqual(expectedWithMoreURL, BreedsURL.withMore.url)
  }

  func testDisplayName() {
    let expectedStandardDisplayName = "Production"
    let expectedEmptyDisplayName = "Empty"
    let expectedMalformedDisplayName = "Malformed"
    let expectedWithMoreDisplayName = "With More"

    XCTAssertEqual(expectedStandardDisplayName, BreedsURL.standard.displayName)
    XCTAssertEqual(expectedEmptyDisplayName, BreedsURL.empty.displayName)
    XCTAssertEqual(expectedMalformedDisplayName, BreedsURL.malformed.displayName)
    XCTAssertEqual(expectedWithMoreDisplayName, BreedsURL.withMore.displayName)
  }
}
