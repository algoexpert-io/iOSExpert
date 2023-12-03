// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import UIKit

extension NSLayoutConstraint {
  @discardableResult func activate() -> NSLayoutConstraint {
    isActive = true
    return self
  }
}
