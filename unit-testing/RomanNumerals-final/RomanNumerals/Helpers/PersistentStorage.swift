// Copyright © 2023 AlgoExpert LLC. All rights reserved.

protocol PersistentStorage {
  func loadStringArray() -> [String]
  func persistStringArray(_ array: [String])
}
