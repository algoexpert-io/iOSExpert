// Created by Josh Adams, who holds the copyright and reserves all rights, on 3/18/23.

import Foundation

struct PersistentStorageReal: PersistentStorage {
  private let separator = "***"
  private let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    .appendingPathComponent("results.txt")

  func loadStringArray() -> [String] {
    let stringRepresentation = try? String(contentsOf: fileURL, encoding: .utf8)
    return stringRepresentation?.components(separatedBy: separator) ?? []
  }

  func persistStringArray(_ array: [String]) {
    if array.isEmpty {
      if FileManager.default.fileExists(atPath: fileURL.path) {
        try? FileManager.default.removeItem(atPath: fileURL.path)
      }
    } else {
      let stringRepresentation = array.joined(separator: separator)
      try? stringRepresentation.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
    }
  }
}
