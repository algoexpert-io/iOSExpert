// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/21/23.

import UIKit

extension NSLayoutConstraint {
  @discardableResult func activate() -> NSLayoutConstraint {
    isActive = true
    return self
  }
}
