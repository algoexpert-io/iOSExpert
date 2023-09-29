// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/28/23.

import Observation

@Observable
class BrowseBreedsViewModel {
  enum State {
    case loading
    case loaded(breeds: [Breed])
    case error
  }

  var state = State.loading
  private static let soundPlayer = SoundPlayer()

  func loadBreeds() async {
    state = .loading
    do {
      var breeds = try await BreedsLoader.loadBreeds()
      breeds.sort { breed1, breed2 in
        settings.sortOrder.compare(breed1: breed1, breed2: breed2)
      }
      state = .loaded(breeds: breeds)
    } catch {
      state = .error
    }

    switch state {
    case .loading:
      break
    case .loaded(breeds: let breeds):
      if breeds.isEmpty {
        BrowseBreedsViewModel.soundPlayer.play(.sadTrombone)
      } else {
        BrowseBreedsViewModel.soundPlayer.play(.chime)
      }
    case .error:
      BrowseBreedsViewModel.soundPlayer.play(.sadTrombone)
    }
  }
}
