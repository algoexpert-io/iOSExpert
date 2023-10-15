// Copyright © 2023 AlgoExpert LLC. All rights reserved.

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
