// Created by Josh Adams, who holds the copyright and reserves all rights, on 5/22/23.

import UIKit

extension UILabel {
  static func iosExpertLabel() -> UILabel {
    let iosExpertLabel = UILabel()
    iosExpertLabel.text = "iOSExpert"
    iosExpertLabel.font = UIFont.systemFont(ofSize: 12.0)
    iosExpertLabel.textAlignment = .right
    iosExpertLabel.textColor = .secondaryLabel
    return iosExpertLabel
  }
}
