// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

@testable import CatFancy
import XCTest

class BrowseBreedsDeleSourceTests: XCTestCase {
  private var breeds: [Breed] = []
  private var a = "A"
  private var b = "B"

  override func setUp() {
    let urlString = "https://racecondition.software"
    guard let url = URL(string: urlString) else {
      XCTFail(URL.couldNotInit(urlString: urlString))
      return
    }

    [
      (a, 42),
      (b, 21)
    ].forEach {
      breeds.append(Breed(name: $0.0, knownFor: "", popularity: $0.1, photoUrl: url, infoUrl: url, credit: "", license: .publicDomain, description: ""))
    }
  }

  func testSort() {
    let testDelegate = TestBrowseBreedsDelegate(onTap: { _ in })
    let deleSource = BrowseBreedsDeleSource(browseBreedsDelegate: testDelegate)
    deleSource.breeds = breeds
    XCTAssertEqual(a, deleSource.breeds[0].name)

    Current.settings.sortOrder = .name
    deleSource.sortBreeds()
    XCTAssertEqual(a, deleSource.breeds[0].name)

    Current.settings.sortOrder = .popularity
    deleSource.sortBreeds()
    XCTAssertEqual(b, deleSource.breeds[0].name)
  }

  func testRowCount() {
    let testDelegate = TestBrowseBreedsDelegate(onTap: { _ in })
    let deleSource = BrowseBreedsDeleSource(browseBreedsDelegate: testDelegate)
    deleSource.breeds = breeds

    XCTAssertEqual(breeds.count, deleSource.tableView(UITableView(), numberOfRowsInSection: 0))
  }

  func testCellForRow() {
    let testDelegate = TestBrowseBreedsDelegate(onTap: { _ in })
    let deleSource = BrowseBreedsDeleSource(browseBreedsDelegate: testDelegate)
    deleSource.breeds = breeds
    guard let cell = deleSource.tableView(UITableView(), cellForRowAt: IndexPath(row: 0, section: 0)) as? BreedCell else {
      XCTFail("Could not get first \(BreedCell.self).")
      return
    }
    XCTAssertEqual(a, cell.name.text)
  }

  func testDidSelectRow() {
    let testDelegate = TestBrowseBreedsDelegate(onTap: { breed in
      XCTAssertEqual(self.a, breed.name)
    })
    let deleSource = BrowseBreedsDeleSource(browseBreedsDelegate: testDelegate)
    deleSource.breeds = breeds
    deleSource.tableView(UITableView(), didSelectRowAt: IndexPath(row: 0, section: 0))
  }
}

private class TestBrowseBreedsDelegate: BrowseBreedsDelegate {
  private let onTap: (Breed) -> ()

  init(onTap: @escaping (Breed) -> ()) {
    self.onTap = onTap
  }

  func showDetails(breed: Breed, animated: Bool) {
    onTap(breed)
  }
}
