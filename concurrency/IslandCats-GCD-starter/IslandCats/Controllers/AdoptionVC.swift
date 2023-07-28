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
        self.adoptionView.updateCatStatus(catStatus)
      },
      updateClosure: { update in
        self.adoptionView.appendUpdate(update)
      }
    )
  }

  @objc
  func requestFourCats() {
    DispatchQueue.concurrentPerform(iterations: 4) { _ in
      catShelter?.requestCat(breed: AdoptableBreed.randomBreed, adopter: Adopter.randomAdopter)
    }
  }
}
