// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

import Foundation

protocol GetterSetter {
  func get(key: String) -> String?
  func set(key: String, value: String)
}
