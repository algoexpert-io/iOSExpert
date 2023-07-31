// Created by Josh Adams, who holds the copyright and reserves all rights, on 7/18/23.

import UIKit

class CensusVC: UIViewController, UICollectionViewDataSource {
  private var breeds: [Breed] = []
  private var photos: [String: UIImage] = [:]
  private let imageLoaderSC = ImageLoaderSC()
  private var startTime: CFAbsoluteTime = 0.0
  private var endTime: CFAbsoluteTime = 0.0

  var censusView: CensusView {
    if let castedView = view as? CensusView {
      return castedView
    } else {
      fatalError(fatalCastMessage(view: CensusView.self))
    }
  }

  override func loadView() {
    view = CensusView(frame: UIScreen.main.bounds)

    censusView.setupCollection(dataSource: self)
    censusView.serialSCButton.addTarget(self, action: #selector(loadPhotosSeriallySC), for: .touchUpInside)
    censusView.parallelSCButton.addTarget(self, action: #selector(loadPhotosInParallelSC), for: .touchUpInside)

    Task {
      if let breeds = try? await BreedsLoaderSC.loadBreeds() {
        self.breeds = breeds
        censusView.setButtonVisibility(true)
      }
    }
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if !photos.isEmpty {
      return breeds.count
    } else {
      return 0
    }
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: "\(BreedCell.self)",
      for: indexPath
    ) as? BreedCell else {
      fatalError("Could not dequeue \(BreedCell.self).")
    }

    let breed = breeds[indexPath.row]
    cell.configure(photo: photos[breed.name] ?? UIImage(), breed: Localization.forBreed(breed.name))

    return cell
  }

  @objc
  func loadPhotosSeriallySC() {
    Task {
      startTiming()
      for breed in breeds {
        let photo = await self.imageLoaderSC.fetch(breed.photoUrl)
        photos[breed.name] = photo
      }
      endTiming()
    }
  }

  @objc
  func loadPhotosInParallelSC() {
    // TODO: implement
  }

  private func startTiming() {
    photos = [:]
    censusView.showPhotosLoadingState()
    startTime = CFAbsoluteTimeGetCurrent()
  }

  private func endTiming() {
    endTime = CFAbsoluteTimeGetCurrent()
    let elapsedTime = endTime - startTime
    let rounder = 1000.0
    let roundedElapsedTime = round(elapsedTime * rounder) / rounder
    censusView.showPhotosLoadedState(elapsedTime: roundedElapsedTime)
  }
}
