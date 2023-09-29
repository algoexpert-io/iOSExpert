// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/29/23.

@testable import KatFancy
import XCTest

final class SoundPlayerRealTests: XCTestCase {
  func testPlay() {
    let soundPlayer = SoundPlayerReal()
    soundPlayer.play(.chime)
    soundPlayer.play(.sadTrombone)
  }
}
