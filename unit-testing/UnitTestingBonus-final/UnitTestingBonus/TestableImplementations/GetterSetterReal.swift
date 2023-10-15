// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import Foundation

class GetterSetterReal: GetterSetter {
  private let userDefaults = UserDefaults.standard

  func get(key: String) -> String? {
    return userDefaults.string(forKey: key)
  }

  func set(key: String, value: String) {
    userDefaults.set(value, forKey: key)
  }
}
