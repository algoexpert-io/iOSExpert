// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/25/23.

@testable import RomanNumerals
import XCTest

final class SoundPlayerRealTests: XCTestCase {
  func testPlay() {
    let soundPlayer = SoundPlayerReal()
    soundPlayer.play(.chime)
    soundPlayer.play(.sadTrombone)
  }
}
