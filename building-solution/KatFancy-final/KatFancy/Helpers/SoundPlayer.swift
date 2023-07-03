// Created by Josh Adams, who holds the copyright and reserves all rights, on 7/2/23.

import AVFoundation

class SoundPlayer {
  private var sounds: [String: AVAudioPlayer]
  private let soundExtension = "mp3"

  init () {
    sounds = [:]
  }

  func play(_ sound: Sound) {
    if sounds[sound.rawValue] == nil {
      if let audioURL = Bundle.main.url(forResource: sound.rawValue, withExtension: soundExtension) {
        try? sounds[sound.rawValue] = AVAudioPlayer.init(contentsOf: audioURL)
      }
    }

    if let retrievedSound = sounds[sound.rawValue] {
      retrievedSound.play()
    }
  }
}
