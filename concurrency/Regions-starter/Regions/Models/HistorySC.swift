// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import Foundation

class HistorySC {
  var cities: [String]

  init() {
    cities = []
  }

  func addCity(_ city: String) {
    cities.append(city)
  }

  func cityAtIndex(_ index: Int) -> String {
    cities[index]
  }

  var cityCount: Int {
    cities.count
  }
}
