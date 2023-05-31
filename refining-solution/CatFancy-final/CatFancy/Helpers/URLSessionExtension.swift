// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

import Foundation

extension URLSession {
  static var urlDataDict: [URL: Data] = [:]
  static var didProcessURLs = false

  static var stubSession: URLSession {
    if !didProcessURLs {
      didProcessURLs = true
      BreedsURL.allCases.forEach {
        if let path = Bundle.main.path(forResource: $0.url.lastPathComponent, ofType: nil) {
          do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            URLSession.urlDataDict[$0.url] = data
          } catch {
            fatalError("Unable to load mock JSON data for URL \($0.url).")
          }
        }
      }

      for catName in MockData.catNames {
        if
          let bundleUrl = Bundle.main.url(forResource: catName, withExtension: MockData.mockPhotoExtension),
          let actualUrl = URL(string: "\(MockData.photoUrlPrefix)\(catName)\(MockData.mockPhotoExtension)")
        {
          do {
            let data = try Data(contentsOf: bundleUrl)
            URLSession.urlDataDict[actualUrl] = data
          } catch {
            fatalError("Unable to initialize Data.")
          }
        } else {
          fatalError("Unable to construct path to \(catName).\(MockData.mockPhotoExtension).")
        }
      }
    }

    let config = URLSessionConfiguration.ephemeral
    config.protocolClasses = [URLProtocolStub.self]
    return URLSession(configuration: config)
  }
}
