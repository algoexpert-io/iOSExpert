// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

@testable import CatFancy
import XCTest

class BrowseBreedsVCTests: XCTestCase {
  override func setUp() {
    Current.settings.sortOrder = .name
  }

  func testStandardScenario() {
    let expectedBreedCount = 14
    let expectedFirstName = "Abyssinian"
    testScenario(breedsURL: .standard, expectedBreedCount: expectedBreedCount, expectedFirstName: expectedFirstName)
  }

  func testWithMoreScenario() {
    let expectedBreedCount = 19
    let expectedFirstName = "Abyssinian"
    testScenario(breedsURL: .withMore, expectedBreedCount: expectedBreedCount, expectedFirstName: expectedFirstName)
  }

  func testEmptyScenario() {
    let expectedBreedCount = 0
    testScenario(breedsURL: .empty, expectedBreedCount: expectedBreedCount)
  }

  func testMalformedScenario() {
    let expectedBreedCount = 0
    testScenario(breedsURL: .malformed, expectedBreedCount: expectedBreedCount)
  }

  func testScenario(breedsURL: BreedsURL, expectedBreedCount: Int, expectedFirstName: String? = nil) {
    Current.settings.breedsURL = breedsURL
    var breeds: [Breed] = []
    var selectedBreed: Breed?
    let testBrowseBreedsDelegate = TestBrowseBreedsDelegate(onShowDetails: { breed in
      selectedBreed = breed
    })

    let exp = expectation(description: "loading breeds from \(breedsURL.url.absoluteString)")
    let bbvc = BrowseBreedsVC(browseBreedsDelegate: testBrowseBreedsDelegate, onRequestFinished: { result in
      breeds = result
      exp.fulfill()
    })

    bbvc.beginAppearanceTransition(true, animated: false)

    let timeout: TimeInterval = 5.0
    waitForExpectations(timeout: timeout)

    XCTAssertEqual(expectedBreedCount, breeds.count)

    if !breeds.isEmpty {
      bbvc.deleSource.tableView(UITableView(), didSelectRowAt: IndexPath(row: 0, section: 0))

      guard let selectedBreed else {
        XCTFail("Unexpectedly, no breed was selected.")
        return
      }

      XCTAssertEqual(expectedFirstName, selectedBreed.name)
    }
  }
}

private class TestBrowseBreedsDelegate: BrowseBreedsDelegate {
  private let onShowDetails: (Breed) -> ()

  init(onShowDetails: @escaping (Breed) -> ()) {
    self.onShowDetails = onShowDetails
  }

  func showDetails(breed: Breed, animated: Bool) {
    onShowDetails(breed)
  }
}
