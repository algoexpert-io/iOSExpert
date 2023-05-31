// Created by Josh Adams, who holds the copyright and reserves all rights, on 1/6/23.

class GetterSetterFake: GetterSetter {
  var dictionary: [String: String] = [:]

  init() {}

  init(dictionary: [String: String]) {
    self.dictionary = dictionary
  }

  func get(key: String) -> String? {
    return dictionary[key]
  }

  func set(key: String, value: String) {
    dictionary[key] = value
  }
}
