// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import Foundation

class HistoryGCD {
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
