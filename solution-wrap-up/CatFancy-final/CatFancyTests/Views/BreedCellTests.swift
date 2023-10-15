// Copyright © 2023 AlgoExpert LLC. All rights reserved.

@testable import CatFancy
import XCTest

class BreedCellTests: XCTestCase {
  func testBreedCell() {
    let cell = BreedCell(style: .default, reuseIdentifier: "\(BreedCell.self)")

    let breed = Breed(name: "", knownFor: "", popularity: 42, photoUrl: MockData.photoURL, infoUrl: MockData.photoURL, credit: "", license: .publicDomain, description: "")

    cell.configure(breed: breed)

    XCTAssertEqual(breed.name, cell.nameLabel.text)
    XCTAssertEqual("Popularity: \(breed.popularity)", cell.popularityLabel.text)
    XCTAssertEqual(Symbols.pawPrint, cell.photoImageView.image)
  }
}
