// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import Foundation

enum Formatter {
  static func formatCurrency(currencyHundredths: Int) -> String {
    let normalizedCurrency = Double(currencyHundredths) / 100.0
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    if let formattedCurrency = formatter.string(from: normalizedCurrency as NSNumber) {
      return formattedCurrency
    } else {
      fatalError("Conversion unexpectedly failed.")
    }
  }
}

// USE
// print(Formatter.formatCurrency(currencyHundredths: 4200))
//
// OUTPUT
// $42.00
