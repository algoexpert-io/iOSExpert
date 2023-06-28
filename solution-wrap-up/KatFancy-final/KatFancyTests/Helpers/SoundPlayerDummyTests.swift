// Created by Josh Adams, who holds the copyright and reserves all rights, on 1/6/23.

@testable import KatFancy
import XCTest

final class SoundPlayerDummyTests: XCTestCase {
  func testPlay() {
    let soundPlayer = SoundPlayerDummy()
    soundPlayer.play(.chime)
    soundPlayer.play(.sadTrombone)
  }
}
