// Created by Josh Adams, who holds the copyright and reserves all rights, on 7/2/23.

import Observation

@Observable
class BrowseBreedsViewModel {
  enum State: Equatable {
    case loading
    case loaded(breeds: [Breed])
    case error
  }

  var state = State.loading

  func loadBreeds(mockedState: State? = nil) async {
    if let mockedState {
      self.state = mockedState
    } else {
      state = .loading
      do {
        var breeds = try await BreedsLoader.loadBreeds()
        breeds.sort { breed1, breed2 in
          Current.settings.sortOrder.compare(breed1: breed1, breed2: breed2)
        }
        state = .loaded(breeds: breeds)
      } catch {
        state = .error
      }
    }

    switch state {
    case .loading:
      break
    case .loaded(breeds: let breeds):
      if breeds.isEmpty {
        Current.soundPlayer.play(.sadTrombone)
      } else {
        Current.soundPlayer.play(.chime)
      }
    case .error:
      Current.soundPlayer.play(.sadTrombone)
    }
  }
}
