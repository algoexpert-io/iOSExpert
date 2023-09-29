// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/26/23.

@testable import RomanNumerals
import XCTest

class URLSessionExtensionTests: XCTestCase {
  func testStubData() {
    let session = URLSession.stub
    XCTAssert(session.configuration.protocolClasses?[0] is URLProtocolStub.Type)
    let expectedTestURLCount = 1
    XCTAssertEqual(expectedTestURLCount, URLSession.urlDataDict.count)
  }
}
