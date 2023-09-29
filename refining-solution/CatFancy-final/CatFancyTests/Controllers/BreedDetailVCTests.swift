// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/28/23.

@testable import CatFancy
import XCTest

class BreedDetailVCTests: XCTestCase {
  func testButtons() {
    var url: URL?

    let testBreedDetailDelegateSpy = TestBreedDetailDelegateSpy(
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
    let sampleBreed = Breed(
      name: 🙀,
      knownFor: 🙀,
      popularity: fortyTwo,
      photoUrl: infoURL,
      infoUrl: infoURL,
      credit: 🙀,
      license: .publicDomain,
      description: 🙀
    )
    let bdvc = BreedDetailVC(breed: sampleBreed, breedDetailDelegate: testBreedDetailDelegateSpy)

    bdvc.beginAppearanceTransition(true, animated: false)
    bdvc.showWikipediaArticle()
    guard let tappedURL = url else {
      XCTFail("Show-Wikipedia-article button tap did not set URL.")
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

private class TestBreedDetailDelegateSpy: BreedDetailDelegate {
  private let onShowWebpage: (URL) -> ()

  init(onShowWebpage: @escaping (URL) -> ()) {
    self.onShowWebpage = onShowWebpage
  }

  func showWebpage(url: URL, didSucceed: ((Bool) -> ())?) {
    onShowWebpage(url)
  }
}
