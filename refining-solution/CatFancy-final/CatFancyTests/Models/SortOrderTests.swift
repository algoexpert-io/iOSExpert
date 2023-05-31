// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

@testable import CatFancy
import XCTest

class SortOrderTests: XCTestCase {
  func testCompareTo() {
    let a = "A"
    let b = "B"

    let urlString = "https://racecondition.software"
    guard let url = URL(string: urlString) else {
      XCTFail(URL.couldNotInit(urlString: urlString))
      return
    }

    let breed1 = Breed(name: a, knownFor: "", popularity: 42, photoUrl: url, infoUrl: url, credit: "", license: .publicDomain, description: "")
    let breed2 = Breed(name: b, knownFor: "", popularity: 21, photoUrl: url, infoUrl: url, credit: "", license: .publicDomain, description: "")

    var sortOrder = SortOrder.name
    XCTAssert(sortOrder.compare(breed1: breed1, breed2: breed2))
    sortOrder = .popularity
    XCTAssertFalse(sortOrder.compare(breed1: breed1, breed2: breed2))
  }
}
