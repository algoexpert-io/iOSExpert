// Copyright © 2023 AlgoExpert LLC. All rights reserved.

@testable import KatFancy
import XCTest

class URLProtocolStubTests: XCTestCase {
  private static var backupURLDataDict = [URL: Data]()

  override class func setUp() {
    backupURLDataDict = URLSession.urlDataDict
  }

  override class func tearDown() {
    URLSession.urlDataDict = backupURLDataDict
  }

  private var url: URL {
    let urlString = "https://racecondition.software"
    if let url = URL(string: urlString) {
      return url
    } else {
      fatalError(URL.couldNotInit(urlString: urlString))
    }
  }

  private var request: URLRequest {
    URLRequest(url: url)
  }

  func testCanInit() {
    XCTAssert(URLProtocolStub.canInit(with: request))
  }

  func testCanonicalRequest() {
    XCTAssertEqual(request, URLProtocolStub.canonicalRequest(for: request))
  }

  func testStartLoading() {
    let bundleData = Data()
    URLSession.urlDataDict = [url: bundleData]
    let exp = expectation(description: "Waiting for load.")
    let protocolClientStub = ProtocolClientStub(didLoad: { loadedData in
      XCTAssertEqual(bundleData, loadedData)
      exp.fulfill()
    })
    let urlProtocolStub = URLProtocolStub(request: request, cachedResponse: nil, client: protocolClientStub)
    urlProtocolStub.startLoading()
    let timeout: TimeInterval = 1.0
    wait(for: [exp], timeout: timeout)
  }
}

private class ProtocolClientStub: NSObject, URLProtocolClient {
  let didLoad: (Data) -> Void

  init(didLoad: @escaping (Data) -> Void) {
    self.didLoad = didLoad
  }

  func urlProtocol(_ protocol: URLProtocol, didLoad data: Data) {
    didLoad(data)
  }

  func urlProtocolDidFinishLoading(_ protocol: URLProtocol) {}
  func urlProtocol(_ protocol: URLProtocol, wasRedirectedTo request: URLRequest, redirectResponse: URLResponse) {}
  func urlProtocol(_ protocol: URLProtocol, cachedResponseIsValid cachedResponse: CachedURLResponse) {}
  func urlProtocol(_ protocol: URLProtocol, didReceive response: URLResponse, cacheStoragePolicy policy: URLCache.StoragePolicy) {}
  func urlProtocol(_ protocol: URLProtocol, didFailWithError error: Error) {}
  func urlProtocol(_ protocol: URLProtocol, didReceive challenge: URLAuthenticationChallenge) {}
  func urlProtocol(_ protocol: URLProtocol, didCancel challenge: URLAuthenticationChallenge) {}
}
