// Created by Josh Adams, who holds the copyright and reserves all rights, on 7/27/23.

@testable import IslandCats
import XCTest

final class ImageLoaderGCDTests: XCTestCase {
  func testFetch() {
    let goodURLString = "https://assets.algoexpert.io/course-assets/iosexpert/CatImages/CloudedLeopard.jpg"
    privateTestFetch(urlString: goodURLString, shouldSucceed: true)

    let badURLString = "https://🙀.jpg"
    privateTestFetch(urlString: badURLString, shouldSucceed: false)
  }

  private func privateTestFetch(urlString: String, shouldSucceed: Bool) {
    guard let url = URL(string: urlString) else {
      XCTFail("Could not initialize URL for \(urlString).")
      return
    }

    let exp = expectation(description: "loading photo")
    ImageLoaderGCD().fetch(url: url) { image in
      if shouldSucceed {
        XCTAssertNotEqual(ImageLoaderGCD.errorImage.pngData(), image.pngData())
      } else {
        XCTAssertEqual(ImageLoaderGCD.errorImage.pngData(), image.pngData())
      }
      exp.fulfill()
    }

    let loadImageTimeout: TimeInterval = 2.0
    waitForExpectations(timeout: loadImageTimeout)
  }
}
