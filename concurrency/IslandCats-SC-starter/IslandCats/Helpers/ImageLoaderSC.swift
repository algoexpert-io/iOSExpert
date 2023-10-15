// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import UIKit

class ImageLoaderSC {
  private let session: URLSession
  static let errorImage = UIImage(systemName: "xmark.octagon") ?? UIImage()

  init() {
    let configuration = URLSessionConfiguration.default
    configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
    session = URLSession(configuration: configuration)
  }

  func fetch(_ url: URL) async -> UIImage {
    do {
      let (imageData, _) = try await session.data(from: url)
      return UIImage(data: imageData) ?? ImageLoaderSC.errorImage
    } catch {
      return ImageLoaderSC.errorImage
    }
  }
}
