// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

@testable import CatFancy
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
    URLSession.urlDataDict = [url: Data()]
    let exp = expectation(description: "Waiting for load.")
    let protocolClientStub = ProtocolClientStub(didFinishLoading: { urlProtocol in
      XCTAssert(urlProtocol is URLProtocolStub)
      exp.fulfill()
    })
    let urlProtocolStub = URLProtocolStub(request: request, cachedResponse: nil, client: protocolClientStub)
    urlProtocolStub.startLoading()
    let timeout: TimeInterval = 1.0
    wait(for: [exp], timeout: timeout)
  }
}

private class ProtocolClientStub: NSObject, URLProtocolClient {
  let didFinishLoading: (URLProtocol) -> Void

  init(didFinishLoading: @escaping (URLProtocol) -> Void) {
    self.didFinishLoading = didFinishLoading
  }

  func urlProtocolDidFinishLoading(_ protocol: URLProtocol) {
    didFinishLoading(`protocol`)
  }

  func urlProtocol(_ protocol: URLProtocol, wasRedirectedTo request: URLRequest, redirectResponse: URLResponse) {}
  func urlProtocol(_ protocol: URLProtocol, cachedResponseIsValid cachedResponse: CachedURLResponse) {}
  func urlProtocol(_ protocol: URLProtocol, didReceive response: URLResponse, cacheStoragePolicy policy: URLCache.StoragePolicy) {}
  func urlProtocol(_ protocol: URLProtocol, didLoad data: Data) {}
  func urlProtocol(_ protocol: URLProtocol, didFailWithError error: Error) {}
  func urlProtocol(_ protocol: URLProtocol, didReceive challenge: URLAuthenticationChallenge) {}
  func urlProtocol(_ protocol: URLProtocol, didCancel challenge: URLAuthenticationChallenge) {}
}
