// Created by Josh Adams, who holds the copyright and reserves all rights, on 4/18/23.

@testable import RomanNumerals
import XCTest

final class PersistentStorageRealTests: XCTestCase {
  private var savedArray: [String] = []
  private let persistentStorage = PersistentStorageReal()

  override func setUp() {
    savedArray = persistentStorage.loadStringArray()
  }

  func testLoadAndPersistStringArray() {
    print("testLoadAndPersistStringArray")
    persistentStorage.persistStringArray([])
    XCTAssert(persistentStorage.loadStringArray().isEmpty)
    let arrayToPersist = ["🎉", "🐋", "🍕", "🥥", "🌴"]
    persistentStorage.persistStringArray(arrayToPersist)
    XCTAssertEqual(arrayToPersist, persistentStorage.loadStringArray())
  }

  override func tearDown() {
    print("???")
    persistentStorage.persistStringArray(savedArray)
  }
}
