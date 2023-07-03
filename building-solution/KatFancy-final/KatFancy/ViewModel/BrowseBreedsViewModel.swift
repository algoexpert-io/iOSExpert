// Created by Josh Adams, who holds the copyright and reserves all rights, on 7/2/23.

import Observation

@Observable
class BrowseBreedsViewModel {
  enum State {
    case loading
    case loaded(breeds: [Breed])
    case error
  }

  var state = State.loading
  private let soundPlayer = SoundPlayer()

  func loadBreeds() async {
    state = .loading
    do {
      let breeds = try await BreedsLoader.loadBreeds()
      state = .loaded(breeds: breeds)
    } catch {
      state = .error
    }

    switch state {
    case .loading:
      break
    case .loaded(breeds: let breeds):
      if breeds.isEmpty {
        soundPlayer.play(.sadTrombone)
      } else {
        soundPlayer.play(.chime)
      }
    case .error:
      soundPlayer.play(.sadTrombone)
    }
  }
}
