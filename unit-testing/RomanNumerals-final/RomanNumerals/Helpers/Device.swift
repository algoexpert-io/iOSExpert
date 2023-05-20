// Created by Josh Adams, who holds the copyright and reserves all rights, on 3/23/23.

protocol Device {
  var userFacingMessage: String { get }
}

extension Device {
  var placeholder: String {
    "PLACEHOLDER"
  }

  var messageWithoutDevice: String {
    "RomanNumerals is running on \(placeholder)."
  }
}
