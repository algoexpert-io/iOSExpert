// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import Foundation

struct FormatterWithInjection {
  static func formatCurrency(currencyHundredths: Int, locale: Locale = .current) -> String {
    let normalizedCurrency = Double(currencyHundredths) / 100.0
    let formatter = NumberFormatter()
    formatter.locale = locale
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
// print(Formatter.formatCurrency(currencyHundredths: 4200, locale: Locale(identifier: "fr_FR"))
//
// OUTPUT
// $42.00
// 42,00 €
