// Created by Josh Adams, who holds the copyright and reserves all rights, on 7/18/23.

import UIKit

class CensusVC: UIViewController, UICollectionViewDataSource {
  private var breeds: [Breed] = []
  private var photos: [String: UIImage] = [:]
  private var startTime: CFAbsoluteTime = 0.0
  private var endTime: CFAbsoluteTime = 0.0
  private let imageLoaderGCD = ImageLoaderGCD()

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
    censusView.serialGCDButton.addTarget(self, action: #selector(loadPhotosSeriallyGCD), for: .touchUpInside)
    censusView.parallelGCDButton.addTarget(self, action: #selector(loadPhotosInParallelGCD), for: .touchUpInside)

    BreedsLoaderGCD.loadBreeds { breeds in
      self.breeds = breeds
      self.censusView.setButtonVisibility(true)
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
  func loadPhotosSeriallyGCD() {
    startTiming()
    loadPhotoGCD(index: 0)
  }

  private func loadPhotoGCD(index: Int) {
    if index < breeds.count {
      imageLoaderGCD.fetch(url: breeds[index].photoUrl) { photo in
        self.photos[self.breeds[index].name] = photo
        self.loadPhotoGCD(index: index + 1)
      }
    } else {
        endTiming()
    }
  }

  @objc
  func loadPhotosInParallelGCD() {
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
