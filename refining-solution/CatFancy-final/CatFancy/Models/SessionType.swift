// Created by Josh Adams, who holds the copyright and reserves all rights, on 5/24/23.

import Foundation

enum SessionType: String, CaseIterable {
  case shared
  case stub

  var session: URLSession {
    switch self {
    case .shared:
      return URLSession.shared
    case .stub:
      return URLSession.stubSession
    }
  }

  var displayName: String {
    switch self {
    case .shared:
      return "Shared"
    case .stub:
      return "Stub"
    }
  }
}
