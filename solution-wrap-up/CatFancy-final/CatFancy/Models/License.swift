// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

import Foundation

enum License: String, Decodable {
  case cc1
  case cc2
  case cc3
  case cc4
  case ccnd2
  case pinterest
  case publicDomain = "public_domain"

  var url: URL {
    let urlString: String
    switch self {
    case .cc1:
      urlString = "https://creativecommons.org/licenses/by-sa/1.0/"
    case .cc2:
      urlString = "https://creativecommons.org/licenses/by-sa/2.0/"
    case .cc3:
      urlString = "https://creativecommons.org/licenses/by-sa/3.0/"
    case .cc4:
      urlString = "https://creativecommons.org/licenses/by-sa/4.0/"
    case .ccnd2:
      urlString = "https://creativecommons.org/licenses/by-nd/2.0/"
    case .pinterest:
      urlString = "https://policy.pinterest.com/en/terms-of-service"
    case .publicDomain:
      urlString = "https://creativecommons.org/share-your-work/public-domain/"
    }

    guard let url = URL(string: urlString) else {
      fatalError(URL.couldNotInit(urlString: urlString))
    }

    return url
  }
}
