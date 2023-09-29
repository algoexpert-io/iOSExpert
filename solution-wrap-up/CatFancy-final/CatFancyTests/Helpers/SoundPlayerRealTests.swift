// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/28/23.

@testable import CatFancy
import XCTest

final class SoundPlayerRealTests: XCTestCase {
  func testPlay() {
    let soundPlayer = SoundPlayerReal()
    soundPlayer.play(.chime)
    soundPlayer.play(.sadTrombone)
  }
}
