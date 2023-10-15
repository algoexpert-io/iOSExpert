// Copyright © 2023 AlgoExpert LLC. All rights reserved.

class PersistentStorageFake: PersistentStorage {
  private var persistedArray: [String] = []

  func loadStringArray() -> [String] {
    persistedArray
  }

  func persistStringArray(_ array: [String]) {
    persistedArray = array
  }
}
