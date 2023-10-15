// Copyright © 2023 AlgoExpert LLC. All rights reserved.

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
