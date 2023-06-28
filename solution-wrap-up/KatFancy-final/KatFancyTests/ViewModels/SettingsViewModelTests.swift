// Created by Josh Adams, who holds the copyright and reserves all rights, on 1/6/23.

@testable import KatFancy
import XCTest

final class SettingsViewModelTests: XCTestCase {
  func testConfigureAndClear() async {
    let vm = await SettingsViewModel()
    FileManagerExtensionsTests.writeFileToFilesystem()
    var isTempDirectoryEmpty = await vm.getIsTempDirectoryEmpty()
    XCTAssert(isTempDirectoryEmpty)
    await vm.configure()
    isTempDirectoryEmpty = await vm.getIsTempDirectoryEmpty()
    XCTAssertFalse(isTempDirectoryEmpty)
    await vm.clearTempDirectory()
    isTempDirectoryEmpty = await vm.getIsTempDirectoryEmpty()
    XCTAssert(isTempDirectoryEmpty)
  }
}
