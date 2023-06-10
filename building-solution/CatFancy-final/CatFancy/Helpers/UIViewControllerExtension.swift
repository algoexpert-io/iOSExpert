// Created by Josh Adams, who holds the copyright and reserves all rights, on 6/3/23.

import UIKit

extension UIViewController {
  func fatalCastMessage(view: Any) -> String {
    return "Could not cast \(self).view to \(view)."
  }
}
