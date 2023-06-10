// Created by Josh Adams, who holds the copyright and reserves all rights, on 6/1/23.

import UIKit

class BreedDetailVC: UIViewController, UITextViewDelegate {
  private let breed: Breed

  private var breedDetailView: BreedDetailView {
    if let castedView = view as? BreedDetailView {
      return castedView
    } else {
      fatalError(fatalCastMessage(view: BreedDetailView.self))
    }
  }

  init(breed: Breed) {
    self.breed = breed
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  override func loadView() {
    view = BreedDetailView(frame: UIScreen.main.bounds)
    title = breed.name
    breedDetailView.descriptionTextView.delegate = self
    breedDetailView.descriptionTextView.text = breed.description
    breedDetailView.creditLabel.text = "Photo Credit: \(breed.credit)"

    Task {
      await breedDetailView.photoImageView.image = ImageCacheLoader.requestImage(url: breed.photoUrl)
    }

    breedDetailView.wikipediaButton.addTarget(self, action: #selector(viewInWikipedia), for: .touchUpInside)
    breedDetailView.licenseButton.addTarget(self, action: #selector(showLicense), for: .touchUpInside)
  }

  @objc func viewInWikipedia() {
    UIApplication.shared.open(breed.infoUrl)
  }

  @objc func showLicense() {
    UIApplication.shared.open(breed.license.url)
  }

  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let y = breedDetailView.descriptionTextView.contentOffset.y
    if y < BreedDetailView.initialPhotoHeightWidth {
      breedDetailView.updatePhotoSize(heightWidth: BreedDetailView.initialPhotoHeightWidth - y)
    } else {
      breedDetailView.updatePhotoSize(heightWidth: 0.0)
    }
  }
}
