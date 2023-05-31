// Created by Josh Adams, who holds the copyright and reserves all rights, on 1/6/23.

@testable import KatFancy
import XCTest

class URLSessionExtensionTests: XCTestCase {
  override class func setUp() {
    URLSession.didProcessURLs = false
  }

  override class func tearDown() {
    URLSession.didProcessURLs = false
  }

  func testStubData() {
    Current.settings.breedsURL = .withMore
    let session = URLSession.stubSession
    XCTAssert(session.configuration.protocolClasses?[0] is URLProtocolStub.Type)
    let expectedTestURLCount = MockData.catNames.count + BreedsURL.allCases.count
    XCTAssertEqual(expectedTestURLCount, URLSession.urlDataDict.count)
  }
}
