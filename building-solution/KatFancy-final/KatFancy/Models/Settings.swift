// Created by Josh Adams, who holds the copyright and reserves all rights, on 7/5/23.

import Observation

@Observable
class Settings {
  var sortOrder = SortOrder.name
}

let settings = Settings()