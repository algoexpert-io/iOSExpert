// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/27/23.

import Foundation

class ThreadSafeDictionary<Key, Value> where Key: Hashable {
  private let queue = DispatchQueue(label: "ThreadSafeDictionary.queue", attributes: .concurrent)
  private var dictionary: [Key: Value] = [:]

  subscript(key: Key) -> Value? {
    get {
      var safeDictionary: [Key: Value] = [:]
      queue.sync {
        safeDictionary = dictionary
      }
      return safeDictionary[key]
    }

    set {
      queue.async(flags: .barrier) {
        self.dictionary[key] = newValue
      }
    }
  }
}
