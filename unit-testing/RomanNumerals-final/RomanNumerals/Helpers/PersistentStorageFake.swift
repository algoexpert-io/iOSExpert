// Created by Josh Adams, who holds the copyright and reserves all rights, on 4/18/23.

class PersistentStorageFake: PersistentStorage {
  private var persistedArray: [String] = []

  func loadStringArray() -> [String] {
    persistedArray
  }

  func persistStringArray(_ array: [String]) {
    persistedArray = array
  }
}
