// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import Foundation

class GetterSetterFake: GetterSetter {
  var dictionary: [String: String]

  init(dictionary: [String: String] = [:]) {
    self.dictionary = dictionary
  }

  func get(key: String) -> String? {
    return dictionary[key]
  }

  func set(key: String, value: String) {
    dictionary[key] = value
  }
}
