// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/28/23.

@testable import CatFancy
import XCTest

final class SoundPlayerDummyTests: XCTestCase {
  func testPlay() {
    let soundPlayer = SoundPlayerDummy()
    soundPlayer.play(.chime)
    soundPlayer.play(.sadTrombone)
  }
}
