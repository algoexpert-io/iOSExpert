// Created by Josh Adams, who holds the copyright and reserves all rights, on 4/19/23.

import Foundation

extension URLSession {
  static var urlDataDict: [URL: Data] = [:]
  static var didProcessURL = false

  static var stubSession: URLSession {
    if !didProcessURL {
      didProcessURL = true

      guard let conditionsDataFromBundle else {
        fatalError("Unable to load mock JSON data for URL \(remoteURL).")
      }

      urlDataDict[remoteURL] = conditionsDataFromBundle
    }

    let config = URLSessionConfiguration.ephemeral
    config.protocolClasses = [URLProtocolStub.self]
    return URLSession(configuration: config)
  }

  static var remoteURL: URL {
    if let remoteURL = URL(string: WeatherRequester.urlString) {
      return remoteURL
    } else {
      fatalError(URL.couldNotInit(urlString: WeatherRequester.urlString))
    }
  }

  static var conditionsDataFromBundle: Data? {
    if
      let path = Bundle.main.path(forResource: "currentConditions.json", ofType: nil),
      let conditionsDataFromBundle = try? Data(contentsOf: URL(fileURLWithPath: path))
    {
      return conditionsDataFromBundle
    } else {
      return nil
    }
  }
}
