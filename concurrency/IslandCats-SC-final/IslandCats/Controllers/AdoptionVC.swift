// Created by Josh Adams, who holds the copyright and reserves all rights, on 7/18/23.

import UIKit

class AdoptionVC: UIViewController {
  var catShelter: CatShelter?

  var adoptionView: AdoptionView {
    if let castedView = view as? AdoptionView {
      return castedView
    } else {
      fatalError(fatalCastMessage(view: AdoptionView.self))
    }
  }

  override func loadView() {
    view = AdoptionView(frame: UIScreen.main.bounds)
    adoptionView.requestFourCatsButton.addTarget(self, action: #selector(requestFourCats), for: .touchUpInside)
    catShelter = CatShelter(
      statusClosure: { catStatus in
        Task {
          await MainActor.run {
            self.adoptionView.updateCatStatus(catStatus)
          }
        }
      },
      updateClosure: { update in
        Task {
          await MainActor.run {
            self.adoptionView.appendUpdate(update)
          }
        }
      }
    )
  }

  @objc
  func requestFourCats() {
    Task {
      async let _ = catShelter?.requestCat(breed: AdoptableBreed.randomBreed, adopter: Adopter.randomAdopter)
      async let _ = catShelter?.requestCat(breed: AdoptableBreed.randomBreed, adopter: Adopter.randomAdopter)
      async let _ = catShelter?.requestCat(breed: AdoptableBreed.randomBreed, adopter: Adopter.randomAdopter)
      async let _ = catShelter?.requestCat(breed: AdoptableBreed.randomBreed, adopter: Adopter.randomAdopter)
    }
  }
}
