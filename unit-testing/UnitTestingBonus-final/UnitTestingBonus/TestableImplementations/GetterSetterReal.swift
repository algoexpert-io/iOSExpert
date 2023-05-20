// Created by Josh Adams, who holds the copyright and reserves all rights, on 5/6/23.

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
