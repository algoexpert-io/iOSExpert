// Copyright © 2023 AlgoExpert LLC. All rights reserved.

@testable import IslandCats
import XCTest

final class ImageLoaderSCTests: XCTestCase {
  func testFetch() async {
    let goodURLString = "https://assets.algoexpert.io/course-assets/iosexpert/CatImages/CloudedLeopard.jpg"
    await privateTestFetch(urlString: goodURLString, shouldSucceed: true)

    let badURLString = "https://🙀.jpg"
    await privateTestFetch(urlString: badURLString, shouldSucceed: false)
  }

  private func privateTestFetch(urlString: String, shouldSucceed: Bool) async {
    guard let url = URL(string: urlString) else {
      XCTFail("Could not initialize URL for \(urlString).")
      return
    }

    let image = await ImageLoaderSC().fetch(url)
    if shouldSucceed {
      XCTAssertNotEqual(ImageLoaderSC.errorImage.pngData(), image.pngData())
    } else {
      XCTAssertEqual(ImageLoaderSC.errorImage.pngData(), image.pngData())
    }
  }
}
