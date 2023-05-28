// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

import UIKit

class ImageCacheLoader {
  private static let shared = ImageCacheLoader()
  private var cache: NSCache<NSString, UIImage>

  private init() {
    cache = NSCache()
  }

  static func requestImage(url: URL) async -> UIImage? {
    if let image = requestImageFromCache(url: url) {
      return image
    } else {
      do {
        let (data, _) = try await Current.settings.sessionType.session.data(from: url)
        let image = UIImage(data: data)
        if let image {
          shared.cache.setObject(image, forKey: url.absoluteString as NSString)
        }
        return image
      } catch {
        return nil
      }
    }
  }

  static func requestImageFromCache(url: URL) -> UIImage? {
    return shared.cache.object(forKey: url.absoluteString as NSString)
  }

  static func clearCache() {
    shared.cache.removeAllObjects()
  }
}
