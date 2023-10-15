// Copyright © 2023 AlgoExpert LLC. All rights reserved.

@testable import RomanNumerals
import XCTest

class URLProtocolStubTests: XCTestCase {
  private var request: URLRequest {
    URLRequest(url: URLSession.remoteURL)
  }

  func testCanInit() {
    XCTAssert(URLProtocolStub.canInit(with: request))
  }

  func testCanonicalRequest() {
    XCTAssertEqual(request, URLProtocolStub.canonicalRequest(for: request))
  }

  func testStartLoading() {
    _ = URLSession.stub
    let exp = expectation(description: "Waiting for load.")
    let protocolClientSpy = ProtocolClientSpy(didLoad: { data in
      XCTAssertEqual(URLSession.conditionsDataFromBundle, data)
      exp.fulfill()
    })
    let urlProtocolStub = URLProtocolStub(request: request, cachedResponse: nil, client: protocolClientSpy)
    urlProtocolStub.startLoading()
    let timeout: TimeInterval = 1.0
    wait(for: [exp], timeout: timeout)
  }
}

private class ProtocolClientSpy: NSObject, URLProtocolClient {
  let didLoad: (Data) -> Void

  init(didLoad: @escaping (Data) -> Void) {
    self.didLoad = didLoad
  }

  func urlProtocol(_ protocol: URLProtocol, didLoad data: Data) { didLoad(data) }

  func urlProtocolDidFinishLoading(_ protocol: URLProtocol) {}
  func urlProtocol(_ protocol: URLProtocol, wasRedirectedTo request: URLRequest, redirectResponse: URLResponse) {}
  func urlProtocol(_ protocol: URLProtocol, cachedResponseIsValid cachedResponse: CachedURLResponse) {}
  func urlProtocol(_ protocol: URLProtocol, didReceive response: URLResponse, cacheStoragePolicy policy: URLCache.StoragePolicy) {}
  func urlProtocol(_ protocol: URLProtocol, didFailWithError error: Error) {}
  func urlProtocol(_ protocol: URLProtocol, didReceive challenge: URLAuthenticationChallenge) {}
  func urlProtocol(_ protocol: URLProtocol, didCancel challenge: URLAuthenticationChallenge) {}
}
