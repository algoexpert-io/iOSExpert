// Created by Josh Adams, who holds the copyright and reserves all rights, on 7/20/23.

import UIKit

class ImageLoaderGCD {
  static let errorImage = UIImage(systemName: "xmark.octagon") ?? UIImage()

  func fetch(url: URL, completion: @escaping ((UIImage) -> ())) {
    let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
    URLSession.shared.dataTask(with: request) { data, _, error in
      guard
        error == nil,
        let data = data,
        let image = UIImage(data: data)
      else {
        completion(ImageLoaderGCD.errorImage)
        return
      }
      completion(image)
    }.resume()
  }
}
