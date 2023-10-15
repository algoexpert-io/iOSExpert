// Copyright © 2023 AlgoExpert LLC. All rights reserved.

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
