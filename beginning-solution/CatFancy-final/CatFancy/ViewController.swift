// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/27/23.

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
