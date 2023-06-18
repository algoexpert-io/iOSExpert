// Created by Josh Adams, who holds the copyright and reserves all rights, on 4/19/23.

@testable import RomanNumerals
import XCTest

class URLSessionExtensionTests: XCTestCase {
  override func setUp() {
    URLSession.didProcessURL = false
  }

  override func tearDown() {
    URLSession.didProcessURL = false
  }

  func testStubData() {
    let session = URLSession.stub
    XCTAssert(session.configuration.protocolClasses?[0] is URLProtocolStub.Type)
    let expectedTestURLCount = 1
    XCTAssertEqual(expectedTestURLCount, URLSession.urlDataDict.count)
  }
}
