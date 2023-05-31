// Created by Josh Adams, who holds the copyright and reserves all rights, on 1/6/23.

import UIKit

actor ImageLoader {
  var session = URLSession.shared
  private var loaderStatuses: [URL: LoaderStatus] = [:]

  private enum LoaderStatus {
    case inProgress(Task<UIImage, Error>)
    case fetched(UIImage)
  }

  func fetch(_ url: URL) async -> UIImage {
    let errorImage = UIImage(named: "error")!

    if let status = loaderStatuses[url] {
      switch status {
      case .fetched(let image):
        return image
      case .inProgress(let task):
        return (try? await task.value) ?? errorImage
      }
    }

    let task: Task<UIImage, Error> = Task {
      let image: UIImage

      do {
        let (imageData, _) = try await session.data(from: url)
        let imageFromNetwork = UIImage(data: imageData)
        image = imageFromNetwork ?? errorImage
      } catch {
        image = errorImage
      }

      return image
    }

    loaderStatuses[url] = .inProgress(task)

    do {
      let image = try await task.value
      loaderStatuses[url] = .fetched(image)
      return image
    } catch {
      loaderStatuses[url] = .fetched(errorImage)
      return errorImage
    }
  }

  func configure(session: URLSession) async {
    self.session = session
  }

  func setSession(_ session: URLSession) async {
    self.session = session
  }

  func getSession() -> URLSession {
    session
  }
}
