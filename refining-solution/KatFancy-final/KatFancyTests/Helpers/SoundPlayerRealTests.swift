// Created by Josh Adams, who holds the copyright and reserves all rights, on 7/8/23.

@testable import KatFancy
import XCTest

final class SoundPlayerRealTests: XCTestCase {
  func testPlay() {
    let soundPlayer = SoundPlayerReal()
    soundPlayer.play(.chime)
    soundPlayer.play(.sadTrombone)
  }
}
