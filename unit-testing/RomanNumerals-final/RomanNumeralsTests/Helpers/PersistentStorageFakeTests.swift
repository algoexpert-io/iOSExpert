// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/26/23.

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
