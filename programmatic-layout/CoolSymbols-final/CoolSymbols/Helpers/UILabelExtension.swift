// Copyright © 2023 AlgoExpert LLC. All rights reserved.

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
