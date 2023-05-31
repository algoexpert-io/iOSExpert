// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

import UIKit

struct Fonts {
  private static let avenirNext = "AvenirNext-"
  private static let demibold = "Demibold"
  private static let bold = "Bold"
  private static let safeFont = UIFont.systemFont(ofSize: 18.0)
  static let label = UIFont(name: avenirNext + demibold, size: 18.0) ?? safeFont
  static let labelBold = UIFont(name: avenirNext + bold, size: 18.0) ?? safeFont
  static let heading = UIFont(name: avenirNext + bold, size: 24.0) ?? safeFont
  static let smallBody = UIFont(name: avenirNext + demibold, size: 12.0) ?? safeFont
  static let buttonSmall = UIFont(name: avenirNext + demibold, size: 18.0) ?? safeFont
  static let buttonLarge = UIFont(name: avenirNext + demibold, size: 24.0) ?? safeFont
}
