// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/29/23.

@testable import KatFancy
import XCTest

final class ImageLoaderTests: XCTestCase {
  func testFetch() async throws {
    guard let goodUrl = URL(string: MockData.photoUrlPrefix + MockData.breedNames[0] + MockData.mockPhotoExtension) else {
      XCTFail("Unable to initialize good photo URL.")
      return
    }

    let imageLoader = ImageLoader()
    var goodImage = await imageLoader.fetch(goodUrl)
    XCTAssertNotNil(goodImage)
    goodImage = await imageLoader.fetch(goodUrl)
    XCTAssertNotNil(goodImage)

    let expectedErrorImage = UIImage(resource: .error)

    guard let badUrl = URL(string: "https://racecondition.software") else {
      XCTFail("Unable to initialize bad photo URL.")
      return
    }

    let errorImage = await imageLoader.fetch(badUrl)
    XCTAssertNotNil(errorImage)

    XCTAssertEqual(errorImage.pngData(), expectedErrorImage.pngData())
  }

  func testSetSession() async {
    Current.settings.sessionType = .shared
    XCTAssertEqual(Current.settings.sessionType, .shared)
    Current.settings.sessionType = .stub
    XCTAssertEqual(Current.settings.sessionType, .stub)
  }
}
