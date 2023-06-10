// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

import UIKit

class BreedDetailVC: UIViewController {
  private let breed: Breed
  private weak var breedDelegate: BreedDelegate?

  private var breedDetailView: BreedDetailView {
    if let castedView = view as? BreedDetailView {
      return castedView
    } else {
      fatalError(fatalCastMessage(view: BreedDetailView.self))
    }
  }

  init(breed: Breed, breedDelegate: BreedDelegate) {
    self.breed = breed
    self.breedDelegate = breedDelegate
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  override func loadView() {
    view = BreedDetailView(frame: UIScreen.main.bounds)
    title = breed.name
    breedDetailView.descriptionTextView.text = breed.description
    breedDetailView.creditLabel.text = "Photo Credit: \(breed.credit)"

    Task {
      await breedDetailView.photoImageView.image = ImageCacheLoader.requestImage(url: breed.photoUrl)
    }

    breedDetailView.wikipediaButton.addTarget(self, action: #selector(showWikipediaArticle), for: .touchUpInside)
    breedDetailView.licenseButton.addTarget(self, action: #selector(showLicense), for: .touchUpInside)
  }

  @objc func showWikipediaArticle() {
    breedDelegate?.showWebpage(url: breed.infoUrl, didSucceed: nil)
  }

  @objc func showLicense() {
    breedDelegate?.showWebpage(url: breed.license.url, didSucceed: nil)
  }
}
