// Created by Josh Adams, who holds the copyright and reserves all rights, on 5/6/23.

import Foundation

class GetterSetter {
  private let userDefaults = UserDefaults.standard

  func get(key: String) -> String? {
    return userDefaults.string(forKey: key)
  }

  func set(key: String, value: String) {
    userDefaults.set(value, forKey: key)
  }
}

// USE
// let getterSetter = GetterSetter()
// getterSetter.set(key: "FOO_KEY", value: "foo")
// print(getterSetter.get(key: "FOO_KEY")!)
//
// OUTPUT
// "foo"
