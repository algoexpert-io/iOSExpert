// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

@testable import CatFancy
import XCTest

class BreedCoordinatorTests: XCTestCase {
  private let breed = Breed(name: "", knownFor: "", popularity: 42, photoUrl: MockData.photoURL, infoUrl: MockData.photoURL, credit: "", license: .publicDomain, description: "")

  func testStart() {
    let nc = UINavigationController()
    let coordinator = BreedCoordinator(navigationController: nc)
    XCTAssertNil(coordinator.navigationController.topViewController)
    coordinator.start()
    XCTAssert(coordinator.navigationController.topViewController is BrowseBreedsVC)
  }

  func testShowDetails() {
    let nc = UINavigationController()
    let coordinator = BreedCoordinator(navigationController: nc)
    XCTAssertNil(coordinator.navigationController.topViewController)
    coordinator.start()
    XCTAssert(coordinator.navigationController.topViewController is BrowseBreedsVC)
    coordinator.showDetails(breed: breed, animated: false)
    XCTAssert(coordinator.navigationController.topViewController is BreedDetailVC)
  }

  func testShowWebpage() {
    let nc = UINavigationController()
    let coordinator = BreedCoordinator(navigationController: nc)
    XCTAssertNil(coordinator.navigationController.topViewController)
    coordinator.start()
    XCTAssert(coordinator.navigationController.topViewController is BrowseBreedsVC)
    coordinator.showDetails(breed: breed, animated: false)
    XCTAssert(coordinator.navigationController.topViewController is BreedDetailVC)
    coordinator.showWebpage(url: breed.infoUrl, didSucceed: { didSucceed in
      XCTAssert(didSucceed)
    })
  }
}
