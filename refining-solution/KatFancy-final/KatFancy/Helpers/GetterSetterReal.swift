// Created by Josh Adams, who holds the copyright and reserves all rights, on 7/6/23.

import Foundation

class GetterSetterReal: GetterSetter {
  func get(key: String) -> String? {
    return UserDefaults.standard.string(forKey: key)
  }

  func set(key: String, value: String) {
    UserDefaults.standard.set(value, forKey: key)
  }
}
