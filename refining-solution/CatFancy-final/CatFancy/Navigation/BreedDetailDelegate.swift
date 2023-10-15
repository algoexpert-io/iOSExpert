// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import Foundation

protocol BreedDetailDelegate: AnyObject {
  func showWebpage(url: URL, didSucceed: ((Bool) -> ())?)
}
