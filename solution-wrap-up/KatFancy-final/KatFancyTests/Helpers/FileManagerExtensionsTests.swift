// Created by Josh Adams, who holds the copyright and reserves all rights, on 1/6/23.

@testable import KatFancy
import XCTest

final class FileManagerExtensionsTests: XCTestCase {
  override func setUpWithError() throws {
    FileManager.clearTempDirectory()
  }

  override func tearDownWithError() throws {
    FileManager.clearTempDirectory()
  }

  func testClearTemporaryDirectory() {
    XCTAssert(FileManager.isTempDirectoryEmpty())
    FileManagerExtensionsTests.writeFileToFilesystem()
    XCTAssertFalse(FileManager.isTempDirectoryEmpty())
    FileManager.clearTempDirectory()
    XCTAssert(FileManager.isTempDirectoryEmpty())
  }

  func testIsTemporaryDirectoryEmpty() {
    XCTAssert(FileManager.isTempDirectoryEmpty())
    FileManagerExtensionsTests.writeFileToFilesystem()
    XCTAssertFalse(FileManager.isTempDirectoryEmpty())
  }

  static func writeFileToFilesystem() {
    let contents = "🥥"
    let filename = "\(contents).txt"
    let fullPath = FileManager.default.temporaryDirectory.appendingPathComponent(filename)

    do {
      try contents.write(to: fullPath, atomically: true, encoding: String.Encoding.utf8)
    } catch {
      XCTFail("Failed to write \(fullPath) to filesystem.")
    }
  }
}
