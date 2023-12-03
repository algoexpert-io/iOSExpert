// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import Foundation

actor HistorySC {
  private var cities: [String]

  init() {
    cities = []
  }

  func addCity(_ city: String) {
    self.cities.append(city)
  }

  func cityAtIndex(_ index: Int) -> String {
    cities[index]
  }
}
