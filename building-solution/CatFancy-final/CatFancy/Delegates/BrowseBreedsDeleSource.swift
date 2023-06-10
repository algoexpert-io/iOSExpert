// Created by Josh Adams, who holds the copyright and reserves all rights, on 6/4/23.

import UIKit

class BrowseBreedsDeleSource: NSObject, UITableViewDelegate, UITableViewDataSource {
  var breeds: [Breed] = []
  var navigationController: UINavigationController?

  func sortBreeds() {
    breeds.sort { breed1, breed2 in
      SortOrder.current.compare(breed1: breed1, breed2: breed2)
    }
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    breeds.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "\(BreedCell.self)") as? BreedCell ?? BreedCell()
    let breed = breeds[indexPath.row]
    cell.configure(breed: breed)

    Task {
      let image = await ImageCacheLoader.requestImage(url: breed.photoUrl)
      if
        let image,
        let updateCell = tableView.cellForRow(at: indexPath) as? BreedCell
      {
        updateCell.photoImageView.image = image
      }
    }

    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let breedDetailVC = BreedDetailVC(breed: breeds[indexPath.row])
    navigationController?.pushViewController(breedDetailVC, animated: true)
  }
}
