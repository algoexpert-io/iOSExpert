// Created by Josh Adams, who holds the copyright and reserves all rights, on 1/6/23.

import Foundation

@MainActor
class BrowseBreedsViewModel: ObservableObject {
  enum State: Equatable {
    case loading
    case loaded(breeds: [Breed])
    case error
  }

  @Published var state = State.loading
  @Published var breeds: [Breed] = []

  func loadBreeds(mockedState: State? = nil) async {
    if let mockedState {
      self.state = mockedState
    } else {
      state = .loading
      do {
        breeds = try await BreedsLoader.loadBreeds()
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

  func getState() -> State {
    state
  }
}
