// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

@testable import CatFancy
import XCTest

class ImageCacheLoaderTests: XCTestCase {
  func testImageNotAvailable() async {
    let badURLString = "https://racecondition.software"
    guard let badURL = URL(string: badURLString) else {
      XCTFail("Could not initialize URL for \(badURLString).")
      return
    }

    let image = await ImageCacheLoader.requestImage(url: badURL)
    XCTAssertNil(image)
  }

  func testRequestImageFromEndpointAndCache() async {
    ImageCacheLoader.clearCache()
    var image = await ImageCacheLoader.requestImage(url: MockData.photoURL) // endpoint
    XCTAssertNotNil(image)
    image = await ImageCacheLoader.requestImage(url: MockData.photoURL) // cache
    XCTAssertNotNil(image)
  }
}
