// Created by Josh Adams, who holds the copyright and reserves all rights, on 7/18/23.

import UIKit

class CensusVC: UIViewController, UICollectionViewDataSource {
  private var breeds: [Breed] = []
  private var photos: [String: UIImage] = [:]
  private var photos3: [UIImage] = []
  private let imageLoaderAsync = ImageLoaderAsync()
  private let imageLoaderCompletion = ImageLoaderCompletion()
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
    censusView.serialGCDButton.addTarget(self, action: #selector(loadPhotosSeriallyGCD), for: .touchUpInside)
    censusView.parallelGCDButton.addTarget(self, action: #selector(loadPhotosInParallelGCD), for: .touchUpInside)
    censusView.serialSCButton.addTarget(self, action: #selector(loadPhotosSeriallySC), for: .touchUpInside)
    censusView.parallelSCButton.addTarget(self, action: #selector(loadPhotosInParallelSC), for: .touchUpInside)

    Task {
      breeds = (try? await BreedsLoader.loadBreeds()) ?? []
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
      for: indexPath) as? BreedCell
    else {
      fatalError("Could not dequeue \(BreedCell.self).")
    }
    cell.photoImageView.image = photos[breeds[indexPath.row].name]
    cell.breedLabel.text = Localizations.localizationForBreed(breeds[indexPath.row].name)
    return cell
  }

  @objc
  func loadPhotosSeriallyGCD() {
    startTiming()
    loadPhotoUsingCompletion(index: 0)
  }

  private func loadPhotoUsingCompletion(index: Int) {
    if index < breeds.count {
      imageLoaderCompletion.fetch(url: breeds[index].photoUrl) { photo in
        self.photos[self.breeds[index].name] = photo
        self.loadPhotoUsingCompletion(index: index + 1)
      }
    } else {
      DispatchQueue.main.async {
        self.endTiming()
      }
    }
  }

  @objc
  func loadPhotosInParallelGCD() {
    startTiming()
    let dispatchGroup = DispatchGroup()
    for breed in breeds {
      dispatchGroup.enter()
      imageLoaderCompletion.fetch(url: breed.photoUrl) { photo in
        self.photos[breed.name] = photo
        dispatchGroup.leave()
      }
    }

    dispatchGroup.notify(queue: .main) {
      self.endTiming()
    }
  }

  @objc
  func loadPhotosSeriallySC() {
    Task {
      startTiming()
      for breed in breeds {
        let photo = await self.imageLoaderAsync.fetch(breed.photoUrl)
        photos[breed.name] = photo
      }
      endTiming()
    }
  }

  @objc
  func loadPhotosInParallelSC() {
    Task {
      startTiming()
      photos = await withTaskGroup(of: (String, UIImage).self, returning: [String: UIImage].self) { taskGroup in
        for breed in breeds {
          taskGroup.addTask {
            let photo = await self.imageLoaderAsync.fetch(breed.photoUrl)
            return (breed.name, photo)
          }
        }

        var photos2: [String: UIImage] = [:]
        for await result in taskGroup {
          photos2[result.0] = result.1
        }
        return photos2
      }
      endTiming()
    }
  }

  private func startTiming() {
    photos = [:]
    censusView.showPhotoLoadingState()
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
