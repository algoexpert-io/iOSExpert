// Created by Josh Adams, who holds the copyright and reserves all rights, on 1/6/23.

enum Sound: String {
  case chime
  case sadTrombone
  // The following case does not correspond to a sound in the bundle but rather exists to facilitate testing playback failure.
  case missingSound
}
