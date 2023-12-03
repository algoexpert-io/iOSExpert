// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import Foundation

// TODO: Use this code in starter app.

//class HistoryGCD {
//  var cities: [String]
//
//  init() {
//    cities = []
//  }
//
//  func addCity(_ city: String) {
//    cities.append(city)
//  }
//
//  func cityAtIndex(_ index: Int) -> String {
//    cities[index]
//  }
//}

class HistoryGCD {
  private var cities: [String]
  private let queue = DispatchQueue(label: "cities queue", attributes: .concurrent)

  init() {
    cities = []
  }

  func addCity(_ city: String) {
    queue.async(flags: .barrier) {
      self.cities.append(city)
    }
  }

  func cityAtIndex(_ index: Int) -> String {
    var city = ""
    queue.sync {
      city = cities[index]
    }
    return city
  }

  var cityCount: Int {
    cities.count
  }
}
