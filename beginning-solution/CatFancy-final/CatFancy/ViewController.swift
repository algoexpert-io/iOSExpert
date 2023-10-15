// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import UIKit

class ViewController: UIViewController {
  override func viewDidLoad() {
    Task {
      do {
        let breeds = try await BreedsLoader.loadBreeds()
        print("BreedsLoader retrieved \(breeds.count) breed(s).")
      } catch {
        print("An error happened during breed loading.")
      }
    }
  }
}
