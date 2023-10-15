// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import Foundation

extension NSCoder {
  static func fatalErrorNotImplemented() -> Never {
    fatalError("init(coder:) has not been implemented.")
  }
}
