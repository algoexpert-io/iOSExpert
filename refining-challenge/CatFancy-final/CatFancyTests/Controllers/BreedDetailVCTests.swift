// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

@testable import CatFancy
import XCTest

class BreedDetailVCTests: XCTestCase {
  func testButtons() {
    var url: URL?

    let testBreedDelegate = TestBreedDelegate(
      onShowWebpage: { actualURL in
        url = actualURL
      }
    )

    let 🙀 = "🙀"
    let fortyTwo = 42
    let infoURLString = "https://racecondition.software"
    guard let infoURL = URL(string: infoURLString) else {
      XCTFail(URL.couldNotInit(urlString: infoURLString))
      return
    }
    let sampleBreed = Breed(name: 🙀, knownFor: 🙀, popularity: fortyTwo, photoUrl: infoURL, infoUrl: infoURL, credit: 🙀, license: .publicDomain, description: 🙀)
    let bdvc = BreedDetailVC(breed: sampleBreed, breedDelegate: testBreedDelegate)

    bdvc.beginAppearanceTransition(true, animated: false)
    bdvc.viewInWikipedia()
    guard let tappedURL = url else {
      XCTFail("View-in-Wikipedia button tap did not set URL.")
      return
    }
    XCTAssertEqual(sampleBreed.infoUrl, tappedURL)

    url = nil
    bdvc.showLicense()
    guard let tappedURL = url else {
      XCTFail("Show-license button tap did not set URL.")
      return
    }
    XCTAssertEqual(sampleBreed.license.url, tappedURL)
  }
}

private class TestBreedDelegate: BreedDelegate {
  private let onShowWebpage: (URL) -> ()

  init(onShowWebpage: @escaping (URL) -> ()) {
    self.onShowWebpage = onShowWebpage
  }

  func showWebpage(url: URL, didSucceed: ((Bool) -> ())?) {
    onShowWebpage(url)
  }
}
