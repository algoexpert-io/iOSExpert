// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

import UIKit

class BrowseBreedsDeleSource: NSObject, UITableViewDelegate, UITableViewDataSource {
  var breeds: [Breed] = []
  weak var browseBreedsDelegate: BrowseBreedsDelegate?

  init(browseBreedsDelegate: BrowseBreedsDelegate) {
    self.browseBreedsDelegate = browseBreedsDelegate
  }

  func sortBreeds() {
    breeds.sort { breed1, breed2 in
      return Current.settings.sortOrder.compare(breed1: breed1, breed2: breed2)
    }
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return breeds.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "\(BreedCell.self)") as? BreedCell ?? BreedCell()
    let breed = breeds[indexPath.row]
    cell.configure(breed: breed)

    Task {
      let image: UIImage?
      await image = ImageCacheLoader.requestImage(url: breed.photoUrl)
      if
        let image = image,
        let updateCell = tableView.cellForRow(at: indexPath) as? BreedCell
      {
        updateCell.photo.image = image
      }
    }

    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    browseBreedsDelegate?.showDetails(breed: breeds[indexPath.row])
  }
}
