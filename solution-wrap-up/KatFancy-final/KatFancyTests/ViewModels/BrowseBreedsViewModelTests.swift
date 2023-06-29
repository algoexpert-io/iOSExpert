// Created by Josh Adams, who holds the copyright and reserves all rights, on 1/6/23.

@testable import KatFancy
import XCTest

final class BrowseBreedsViewModelTests: XCTestCase {
  func testLoadBreeds() async {
    let vm = BrowseBreedsViewModel()

    let loadingState = vm.getState()
    XCTAssertEqual(loadingState, .loading)

    await vm.loadBreeds()
    let actualLoadedState = vm.getState()
    switch actualLoadedState {
    case .loading, .error:
      XCTFail("Unexpected state: \(actualLoadedState)")
      return
    case .loaded(let breeds):
      XCTAssertEqual(breeds.count, 19)
    }

    Current.settings.breedsURL = .malformed
    await vm.loadBreeds()
    let errorState = vm.getState()
    switch errorState {
    case .loading, .loaded:
      XCTFail("Unexpected state: \(errorState)")
      return
    case .error:
      break
    }

    Current.settings.breedsURL = .empty
    await vm.loadBreeds()
    let emptyLoadedState = vm.getState()
    switch emptyLoadedState {
    case .loading, .error:
      XCTFail("Unexpected state: \(emptyLoadedState)")
      return
    case .loaded(let breeds):
      XCTAssertEqual(breeds.count, 0)
    }

    Current.settings.breedsURL = .withMore
  }
}
