// Copyright © 2023 AlgoExpert LLC. All rights reserved.

@testable import RomanNumerals
import XCTest

final class PersistentStorageFakeTests: XCTestCase {
  func testLoadAndPersistStringArray() {
    let persistentStorage = PersistentStorageFake()
    XCTAssert(persistentStorage.loadStringArray().isEmpty)
    let arrayToPersist = ["🐋", "🍕", "🥥"]
    persistentStorage.persistStringArray(arrayToPersist)
    XCTAssertEqual(arrayToPersist, persistentStorage.loadStringArray())
  }
}
